# BAT_FFMPEG :movie_camera:
## About
Batch script files for FFMPEG (Microsoft Windows and DOS, OS/2 <img src=https://emojipedia-us.s3.amazonaws.com/thumbs/120/emojione/151/unicorn-face_1f984.png width="50px" style="margin-top:-50px">)

My collection of scripts :)\
For converting (audio, video, ...) files using FFMPEG :)

## ToDo and Future
add https://github.com/nagadomi/waifu2x  
add boomerang GIFs https://superuser.com/questions/1608327/ffmpeg-boomerang-effect-to-gif  
add image2pipe and video pipe2image https://stackoverflow.com/questions/46397240/ffmpeg-image2pipe-producing-broken-video  
add slow-down or speed-up gifs: http://blog.floriancargoet.com/slow-down-or-speed-up-a-gif-with-imagemagick/
add feature to download video by timestamp https://youtu.be/lFKw9zlA2fw?t=16
## How to use:
1. Edit the batch script to your liking. For example, where to trim the video.
2. Just drag a video or audio file onto the batch file. :)

### Logic
All files have MAIN Code - where you can find main command(s) for ffmpeg.exe\
This main command has comment mark:  
```REM //////////////////// MAIN \\\\\\\\\\\\\\\\\\\\\\\\\```\
Than main code-command(s) for ffmpeg.exe (Video-ToMP4_FPS-24-25-30-60.bat for example):
```
 ffmpeg -i %%x -r 30 -vcodec libx264 -acodec copy -map_metadata 0 -map 0 -threads 1 "%%~nx_output_FPS30.mp4"
```
## Scripts

### Audio-AudioGain.bat
Gain (Increase) the sound volume of a file on 50%
MAIN Code:
```
ffmpeg -i %%x -filter:a "volume=1.5" -ar 44100 -ac 2 -q:a 0 -map_metadata 0 -id3v2_version 3 "%%~nx_output_GAIN%%~xx"
```

### Audio-ToMP3_RemoveSideData.bat
#### useful for: remove ReplayGain
This bat file doesn't reconvert the original mp3 - because it is the fastest way.\
In the same way, it doesn't change the original quality.\
But on the other hand, it removes all sidedata from metadata (but save all metadata)\
Read this about sidedata and lameinfo (xing) "The ‘lame’ (or xing) header is not officially part of the mp3 specification"\
https://eyed3.readthedocs.io/en/latest/plugins/lameinfo_plugin.html

### Video-ToMP4_FPS-24-25-30-60.bat (How to change frame rate of video, fps of video by ffmpeg.exe?)
Can change frame rate or FPS of video and recode it to container `.mp4` & video codec `x264`.\
By default it is `-r 30` - 30 FPS. Choose what you want in MAIN Code:
```
REM ffmpeg -i %%x -r 24 -vcodec libx264 -acodec copy -map_metadata 0 -map 0 -threads 1 "%%~nx_output_FPS24.mp4"
REM ffmpeg -r "25" -i %%x -vcodec libx264 -acodec copy -map_metadata 0 -map 0 -threads 1 "%%~nx_output_FPS25.mp4"
ffmpeg -i %%x -r 30 -vcodec libx264 -acodec copy -map_metadata 0 -map 0 -threads 1 "%%~nx_output_FPS30.mp4"
REM ffmpeg -r "60" -i %%x -vcodec copy -acodec copy -map_metadata 0 -map 0 -threads 1 "%%~nx_output_FPS60.mp4"
```
### Video-ToGIF (ffmpeg video to GIF)
Convert video to GIF files.\
By different styles:\
`Video-ToGIF_16Bit-Style.bat` - 16 Bit-Style\
`Video-ToGIF_32ColorsStyle.bat` - 32 Colors Style\
`Video-ToGIF_Fast.bat` - fast&quality\
`Video-ToGIF_HD.bat` - max quality\
### Video-Cut (ffmpeg cut video)
-ss - start\
ffmpeg -ss 00:01:00.000  ... - cut video from 1 minute to the end of video\
-t - duration\
ffmpeg -ss 00:01:00.000 -i %%x -t 00:01:00.000 ... - cut video from 1 minute to 00:02:00.000\
-to - end\
ffmpeg -ss 00:01:00.000 -i %%x -to 00:01:10.000 ... - cut video from 1 minute to 00:01:10.000\
Write time in MAIN: ```ffmpeg ...```
By different styles:  
`Video-CutFast.bat` - Fast  
`Video-CutAccurateBeta.bat` - Fast&Accurate  
`Video-CutAccurateAndRecode.bat` - Accurate&Recode  
Read more about Cut&Seeking here: https://trac.ffmpeg.org/wiki/Seeking  
### Video-ToWebM
Convert video file to WebM\
You can change -crf 0..51 - where 0 is lossless, 23 is the default, and 51 is worst quality possible.\
MAIN:
```ffmpeg.exe -i %%x -vcodec libvpx -crf 30 -b:v 0 -acodec libvorbis "%%~nx_output_WEBM.webm"```
### Youtube-dl
youtube-dl-* - the ready-made presets for youtube-dl (it uses yt-dlp, now)  
youtube-dl-ThumbNail.bat - it downloads only thumbnail from youtube video  
youtube-dl-MP3-192Kbps.bat - it downloads mp3 file - 192Kbps it is the maximum quality of audio file in youtube audio stream  

## FFMPEG About :movie_camera:
FFMPEG WebPages: 
> https://www.ffmpeg.org/  
> FFMPEG About:  
> Official: https://www.ffmpeg.org/about.html  
> Wiki: https://en.wikipedia.org/wiki/FFmpeg

## YouTube-DL About :movie_camera:
YouTube-DL WebPages: 
> http://rg3.github.io/youtube-dl/  
> YouTube-DL About:  
> Official: http://rg3.github.io/youtube-dl/  
> GitHub: https://github.com/rg3/youtube-dl 

## yt-dlp About :movie_camera:
yt-dlp About WebPages:
> GitHub: https://github.com/yt-dlp/yt-dlp

## AtomicParsley About :movie_camera:
AtomicParsley WebPages: 
> http://atomicparsley.sourceforge.net/  
> AtomicParsley About:  
> Official: https://sourceforge.net/projects/atomicparsley/  
> GitHub: https://github.com/wez/atomicparsley  

## ImageMagick About :mage_man:
ImageMagick WebPages:  
> https://imagemagick.org  
> ImageMagick About:  
> GitHub: https://github.com/ImageMagick/ImageMagick  

## These links for me (and maybe for you too =) ):
srt - [https://trac.ffmpeg.org/ticket/7356]\
srt EOF -  sub.ass - CRLF and sub.srt - LF - [https://trac.ffmpeg.org/ticket/7362]
