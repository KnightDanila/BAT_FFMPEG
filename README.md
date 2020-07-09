# BAT_FFMPEG :movie_camera:
## About
Batch script files for FFMPEG (Microsoft Windows and DOS, OS/2 <img src=https://emojipedia-us.s3.amazonaws.com/thumbs/120/emojione/151/unicorn-face_1f984.png width="50px" style="margin-top:-50px">)

My collection of scripts :)\
For converting (audio, video, ...) files using FFMPEG :)

## How to use:
All these .bat files drag and drop like.\
Just drag and drop some files in these bat files :)

### Logic
All files have MAIN Code - where you can find main command(s) for ffmpeg.exe\
This main command has comment mark:  
```REM //////////////////// MAIN \\\\\\\\\\\\\\\\\\\\\\\\\```\
Than main code-command(s) for ffmpeg.exe (Video-ToMP4_FPS-24-25-30-60.bat for example):
```
 ffmpeg -i %%x -r 30 -vcodec libx264 -acodec copy -map_metadata 0 -map 0 -threads 1 "%%~nx_output_FPS30.mp4"
```
## Scripts

### Audio-ToMP3_RemoveSideData.bat
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
By different styles:\
`Video-CutFast.bat` - Fast\
`Video-CutAccurateBeta.bat` - Fast&Accurate\
`Video-CutAccurateAndRecode.bat` - Accurate&Recode\
Read more about Cut&Seeking here: https://trac.ffmpeg.org/wiki/Seeking\
### Video-ToWebM
Convert video file to WebM\
You can change -crf 0..51 - where 0 is lossless, 23 is the default, and 51 is worst quality possible.\
MAIN:
```ffmpeg.exe -i %%x -vcodec libvpx -crf 30 -b:v 0 -acodec libvorbis "%%~nx_output_WEBM.webm"```
### Youtube-dl
youtube-dl-* - the ready-made presets for youtube-dl

## FFMPEG About :movie_camera:
FFMPEG WebPage: 
> https://www.ffmpeg.org/  
> FFMPEG About:  
> Official: https://www.ffmpeg.org/about.html  
> Wiki: https://en.wikipedia.org/wiki/FFmpeg

## YouTube-DL About :movie_camera:
YouTube-DL WebPage: 
> http://rg3.github.io/youtube-dl/  
> YouTube-DL About:  
> Official: http://rg3.github.io/youtube-dl/  
> GitHub: https://github.com/rg3/youtube-dl 

## AtomicParsley About :movie_camera:
AtomicParsley WebPage: 
> http://atomicparsley.sourceforge.net/  
> AtomicParsley About:  
> Official: https://sourceforge.net/projects/atomicparsley/  
> GitHub: https://github.com/wez/atomicparsley  

\
\
\
\\

## These links for me:
srt - [https://trac.ffmpeg.org/ticket/7356]\
srt EOF -  sub.ass - CRLF and sub.srt - LF - [https://trac.ffmpeg.org/ticket/7362]
