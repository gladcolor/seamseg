import os
import shutil
import glob


def move_files():

    from_dir = r'/media/huan/Huan1/DC_panoramas'
    sub_dirs_cnt = 10
    new_dirs = []
    for i in range(10):
        new_dir = from_dir + str(i)

        new_dirs.append(new_dir)
        if not os.path.exists(new_dir):
            os.mkdir(new_dir)
            print("created new_dir:", new_dir)

    files = glob.glob(os.path.join(from_dir, "*.jpg"))
    file_cnt = len(files)

    for idx, file in enumerate(files):
        dir_idx = int(idx / file_cnt)
        new_dir = new_dir = from_dir + str(dir_idx)
        basename = os.path.basename(file)
        new_file = os.path.join(new_dir, basename)
        shutil.move(file, new_file)

    print("file count: ", file_cnt)



if __name__ == "__main__":
    print("start...")
    move_files()