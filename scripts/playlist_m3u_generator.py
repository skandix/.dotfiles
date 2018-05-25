import os

for root, dirs, files in  os.walk('/mnt/Media/Music'):
    for name in files:
        if ".mp3" in name or ".wav" in name:
            with open('playlist.m3u','a+') as file:
                file.write(os.path.join(root,name))
                file.write("\n")
        else:
            pass
