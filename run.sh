service nginx start &
Xvfb -screen 0 1024x768x16 -ac &
<<<<<<< HEAD
sleep 5
websockify -D 5900 -- x11vnc -forever -usepw -display :0 &
DISPLAY=:0 $IMAGEROOT/Contents/Linux-i686/bin/squeak -vm-sound-null $RESOURCES/Squeak*.image /_run.st
=======
sleep 1
x11vnc -forever -usepw -display :0 &
websockify -D 8080 :5900  &
DISPLAY=:0 $IMAGEROOT/Contents/Linux-i686/bin/squeak -vm-sound-null $RESOURCES/Squeak*.image /run.st
>>>>>>> 8aab8248addf296d7c3614486409dc792648bb19
