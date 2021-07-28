# TempleOSPNGPlayer
This is a program made by Alec Murphy that lets you play PNGs in sequence like a movie.
The audio driver doesn't work but I decided to keep it anyways in case anyone knew how to fix it.
The install path is hardcoded so when you CopyTree("T:/","C:/Wherever"); and you want to run it,
make sure you go into Run.HC and change line 23 where it's C:/Home/BadApple/video/%06d.PNG to
the path that you chose.
Whatever video you want to play, make sure it's a sequence of pngs AND that you have the right amount of frames.
In line 10, it has #define FRAME_COUNT 5373, this is what I used to play Numa Numa for example. 
You'll have to change this to whatever it is your video ends up being.
All lines related to audio are commented out because if you include them it's gonna mess things up.

Also, if it hasn't been made cler to yet... this project was not made by me! All credit goes to Alec Murphy!
https://git.checksum.fail/alec

Go here if you want to see more of his stuff!
He hasn't uploaded this on a repo I know of yet so I'm reuploading it here.
