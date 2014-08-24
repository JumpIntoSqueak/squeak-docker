service nginx start &
Xvfb -screen 0 1024x768x16 -ac &
sleep 5
x11vnc -forever -usepw -display :0 &
websockify -D 8080 :5900  &
DISPLAY=:0 $IMAGEROOT/Contents/Linux-i686/bin/squeak -vm-sound-null $RESOURCES/Squeak*.image /run.st
