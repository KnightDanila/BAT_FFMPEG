REM �� �� ���� �� ����� �����, ��� ��� �������� :)
ffmpeg -i "Ed Sheeran - Thinking Out Loud Official Video.mkv" -q 1 -vf subtitles=subtitles.srt myout.avi

REM ��� ������ �� �������� :)
REM ffmpeg -i "Ed Sheeran - Thinking Out Loud Official Video.mkv" -i subtitles.srt -scodec mov_text myout.mp4
REM ffmpeg -i m.mp4 -i mysrt.srt -scodec copy myout.mp4
REM ffmpeg -i m.mp4 -i mysrt.srt -scodec mov_text myout.mp4

pause