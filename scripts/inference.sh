python -m torch.distributed.launch --nproc_per_node=N_GPUS test_panoptic.py --meta METADATA --log_dir LOG_DIR CONFIG MODEL INPUT_DIR OUTPUT_DIR


python -m torch.distributed.launch --nproc_per_node=1 test_panoptic.py --meta /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/metadata.bin --log_dir ./LOG /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/config.ini /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/seamseg_r50_vistas.tar /media/huan/HD4T/Dataset/Vistas/10imgs /media/huan/HD4T/Dataset/Vistas/10imgs_seg


python -m torch.distributed.launch --nproc_per_node=1 test_panoptic.py --meta /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/metadata.bin --log_dir ./LOG /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/config.ini /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/seamseg_r50_vistas.tar /media/huan/HD4T/Research/Resilience/building_images2 /media/huan/HD4T/Research/Resilience/building_images2_seg


python --nproc_per_node=1 test_panoptic.py --meta ./seamseg_r50_vistas/metadata.bin --log_dir ./LOG ./seamseg_r50_vistas/config.ini /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/seamseg_r50_vistas.tar /media/huan/HD4T/Research/Resilience/building_images2 /media/huan/HD4T/Research/Resilience/building_images2_seg


python  test_panoptic.py --meta ./seamseg_r50_vistas/metadata.bin --log_dir ./LOG ./seamseg_r50_vistas/config.ini /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/seamseg_r50_vistas.tar /media/huan/HD4T/Research/Resilience/building_images2 /media/huan/HD4T/Research/Resilience/building_images2_seg


 
python  -m torch.distributed.launch --nproc_per_node=1  test_panoptic.py --meta /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/metadata.bin --log_dir ./LOG /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/config.ini /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/seamseg_r50_vistas.tar /media/huan/SSD/Datasets/ocean_city/images /media/huan/SSD/Datasets/ocean_city/images_seg_mapillary_2048

python  -m torch.distributed.launch --nproc_per_node=1    test_panoptic.py --meta /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/metadata.bin --log_dir ./LOG /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/config.ini /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/seamseg_r50_vistas.tar /media/huan/SSD/Datasets/ocean_city/images /media/huan/HD4T/mapillary_oceancity


python  test_panoptic.py --meta /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/metadata.bin --log_dir ./LOG /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/config.ini /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/seamseg_r50_vistas.tar /media/huan/HD4T/Dataset/InterCross/Sample /media/huan/HD4T/Dataset/InterCross/Sample/results


python  -m torch.distributed.launch --nproc_per_node=1    test_panoptic.py --meta /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/metadata.bin --log_dir ./LOG /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/config.ini /media/huan/HD4T/Research/seamseg/scripts/seamseg_r50_vistas/seamseg_r50_vistas.tar /media/huan/HD4T/Dataset/InterCross/sv_0128/street_view_all /media/huan/HD4T/Dataset/InterCross/sv_0128/results


python  -m torch.distributed.launch --nproc_per_node=1    test_panoptic.py --meta /media/huan/HD8T/Research/seamseg/scripts/seamseg_r50_vistas/metadata.bin --log_dir ./LOG /media/huan/HD8T/Research/seamseg/scripts/seamseg_r50_vistas/config.ini /media/huan/HD8T/Research/seamseg/scripts/seamseg_r50_vistas/seamseg_r50_vistas.tar /media/huan/SSD_H/Research/StreetView/gsv_pano/test /media/huan/SSD_H/Research/StreetView/gsv_pano/test_results

python  -m torch.distributed.launch --nproc_per_node=1    test_panoptic.py --meta /media/huan/HD8T/Research/seamseg/scripts/seamseg_r50_vistas/metadata.bin --log_dir ./LOG /media/huan/HD8T/Research/seamseg/scripts/seamseg_r50_vistas/config.ini /media/huan/HD8T/Research/seamseg/scripts/seamseg_r50_vistas/seamseg_r50_vistas.tar /media/huan/HD8T/Dataset/peng_jpg /media/huan/HD8T/Dataset/peng_jpg_seamseg


python  -m torch.distributed.launch --nproc_per_node=1    test_panoptic.py --meta /media/huan/HD8T/Research/seamseg/scripts/seamseg_r50_vistas/metadata.bin --log_dir ./LOG /media/huan/HD8T/Research/seamseg/scripts/seamseg_r50_vistas/config.ini /media/huan/HD8T/Research/seamseg/scripts/seamseg_r50_vistas/seamseg_r50_vistas.tar /media/huan/Huan/DC_panoramas /media/huan/HD8T/DC_panorama_seamsegged
