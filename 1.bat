REM ffmpeg.exe -i 1.avi -c:v libx264 Test1.mkv

ffmpeg.exe -i "movie.mka" -af adelay=10 -a:c "movie-audio.mka"
pause