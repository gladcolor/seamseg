import os
import csv
import re
from PIL import Image
import numpy as np
import multiprocessing

# Paths
# input_folder = 'H:\\Richland_jsons_clipped_segmented'
# output_folder = 'H:\\Richland_jsons_clipped_segmented_one_band'
input_folder  =  '/bigdata/s0/hmn5304/Richland_DOMs_2/Richland_jsons_DOMs'
output_folder = r'/bigdata/s0/hmn5304/Richland_land_cover'

csv_file = r'mapillary_class_index.csv'  # Ensure this CSV file exists

# Read the CSV file and build mappings
rgb_to_index = {}
index_to_palette = {}

with open(csv_file, 'r') as f:
    reader = csv.DictReader(f)
    for row in reader:
        index = int(row['index'])
        # Extract RGB values from the palette string
        palette_str = row['palette']
        palette_numbers = re.findall(r'\d+', palette_str)
        palette = [int(n) for n in palette_numbers]
        if len(palette) != 3:
            continue  # Skip invalid entries
        rgb = tuple(palette)
        rgb_to_index[rgb] = index
        index_to_palette[index] = palette

# Ensure the palette has 256 colors
palette_list = [[0, 0, 0]] * 256
for idx, pal in index_to_palette.items():
    palette_list[idx] = pal

# Build the mapping array (lookup table)
mapping_array = np.zeros(256**3, dtype=np.uint8)
for rgb, index in rgb_to_index.items():
    R, G, B = rgb
    unique_value = (R << 16) + (G << 8) + B
    mapping_array[unique_value] = index

# Prepare the flat palette
flat_palette = [value for pal in palette_list for value in pal]

# Create the output directory if it doesn't exist
if not os.path.exists(output_folder):
    os.makedirs(output_folder)

# Global variables to be accessible in each process
global_mapping_array = None
global_flat_palette = None
global_counter = None
global_lock = None

def initializer(mapping_array_local, flat_palette_local, counter_local, lock_local):
    global global_mapping_array
    global global_flat_palette
    global global_counter
    global global_lock
    global_mapping_array = mapping_array_local
    global_flat_palette = flat_palette_local
    global_counter = counter_local
    global_lock = lock_local

def process_image(filename):
    if filename.endswith('.png'):
        input_path = os.path.join(input_folder, filename)
        output_path = os.path.join(output_folder, filename)

        # Open the image and convert it to RGB
        img = Image.open(input_path).convert('RGB')
        img_array = np.array(img)
        height, width, _ = img_array.shape
        img_array_flat = img_array.reshape(-1, 3)

        # Compute unique values for each pixel
        unique_values = (
            (img_array_flat[:, 0].astype(np.uint32) << 16) +
            (img_array_flat[:, 1].astype(np.uint32) << 8) +
            img_array_flat[:, 2].astype(np.uint32)
        )

        # Map unique_values to indices using the mapping_array
        output_array_flat = global_mapping_array[unique_values]
        # Reshape output_array_flat back to (height, width)
        output_array = output_array_flat.reshape(height, width)

        # Create the output image with mode 'P' and set the palette
        output_img = Image.fromarray(output_array, mode='P')
        output_img.putpalette(global_flat_palette)

        # Save the output image
        output_img.save(output_path)

        # Update the global counter safely
        with global_lock:
            global_counter.value += 1
            print(f"Processed files: {global_counter.value}")

if __name__ == '__main__':
    # Since mapping_array and flat_palette are read-only, we can pass them as arguments to the initializer.
    # The overhead of copying them to each process is acceptable given their size.

    # Get the list of filenames
    filenames = [f for f in os.listdir(input_folder) if f.endswith('.png')]

    # Set up the multiprocessing Pool
    num_processes = multiprocessing.cpu_count()

    # Create a Manager for shared variables
    manager = multiprocessing.Manager()
    counter = manager.Value('i', 0)
    lock = manager.Lock()

    with multiprocessing.Pool(processes=num_processes, initializer=initializer, initargs=(mapping_array, flat_palette, counter, lock)) as pool:
        pool.map(process_image, filenames)
