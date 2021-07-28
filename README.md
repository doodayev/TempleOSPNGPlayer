# TempleOSPNGPlayer
This is a program made by Alec Murphy that lets you play PNGs in sequence like a movie.
The audio driver doesn't work but I decided to keep it anyways in case anyone knew how to fix it.
The install path is hardcoded so when you you want to run it,
make sure you go into Run.HC and change line 23 where it's C:/Home/BadApple/video/%06d.PNG to
the path that you chose to place this in.
Whatever video you want to play, make sure it's a sequence of pngs AND that you have the right amount of frames.
In line 10, it has #define FRAME_COUNT 5373, this is what I used to play Numa Numa for example. 
Right now though I've got it set to 96 because that's how many PNGs I've included here since github also 
doesn't like me uploading too many files at a time.
You'll have to change this to whatever it is your video ends up being.
All lines related to audio are commented out because if you include them it's gonna mess things up.

To install, use this https://sourceforge.net/projects/imdisk-toolkit/ to mount TempleOS vmdk files 
(both VirtualBox and Vmware support vmdk) and then transfer this source code and pictures to whatever
directory you want.

Also, if it hasn't been made cler to yet... this project was not made by me! All credit goes to Alec Murphy!
https://git.checksum.fail/alec

Go here if you want to see more of his stuff!
He hasn't uploaded this on a repo I know of yet so I'm reuploading it here.
