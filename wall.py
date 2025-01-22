import os
import random
import time
import subprocess

def get_wallpapers(directory):
    valid_extensions = ('.jpg', '.jpeg', '.png', '.gif')
    return [os.path.join(directory, f) for f in os.listdir(directory) if f.endswith(valid_extensions)]

def main():
    wallpaper_dir = os.path.expanduser("~/Pictures/wall")
    wallpapers = get_wallpapers(wallpaper_dir)
    
    while True:
        random.shuffle(wallpapers)  # Shuffle the list of wallpapers
        for wallpaper in wallpapers:
            subprocess.run(['feh', '--bg-fill', wallpaper])
            time.sleep(3600)  # Sleep for 1 hour

if __name__ == "__main__":
    main()
