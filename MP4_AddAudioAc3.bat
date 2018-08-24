:: http://stackoverflow.com/questions/11779490/ffmpeg-how-to-add-new-audio-not-mixing-in-video
:: get inputV.mp4 - video
:: get inputA.mp4 - audio
:: The "-shortest" option will make output.mp4 the same duration as the shortest input.
:: Omitting the "-map" option will use the default stream selection. This will work if your video input has no audio.
:: -map 0:v – From input 0 (the first input, which is video.mp4) choose the video stream(s).
:: -map 1:a – From input 1 (the second input, which is audio.m4a) choose the audio stream(s).
ffmpeg.exe -i inputV.mp4 -i inputA.mkv -map 0:v -map 1:a -c:v copy -c:a ac3 -shortest output.mp4