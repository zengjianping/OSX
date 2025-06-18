import os, glob
import argparse, shutil
from multiprocessing import Pool

def findAllFile(base):
    file_path = []
    for root, ds, fs in os.walk(base):
        for f in fs:
            fullname = os.path.join(root, f)
            file_path.append(fullname)
    return file_path

def extract(video_path, image_path, sample_interval=10):
    os.makedirs(image_path, exist_ok=True)
    os.system(f'ffmpeg -i {video_path} -f image2 -r 30 -b:v 5626k {image_path}/%06d.png')
    file_paths = sorted(glob.glob(f'{image_path}/*.png'))
    for file_path in file_paths:
        image_idx = int(os.path.splitext(os.path.basename(file_path))[0])
        if image_idx % sample_interval != 0:
            if os.path.exists(file_path):
                os.remove(file_path)

def convert(video_path):
    video_name = video_path.split('/')[-1]
    image_path = video_path.replace(video_name, video_name.split('.')[0])
    image_path = image_path.replace('/videos/', '/images/')
    extract(video_path, image_path)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--video_folder', type=str, default='../../dataset/UBody/videos')
    args = parser.parse_args()
    video_paths = findAllFile(args.video_folder)
    pool = Pool(processes=8)
    pool.map(convert, video_paths)
    pool.close()
    pool.join()