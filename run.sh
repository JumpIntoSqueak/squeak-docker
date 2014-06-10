Xvfb -screen 0 1024x768x16 -ac &
sleep 5
websockify -D 5900 -- x11vnc -forever -usepw -display :0 &
DISPLAY=:0 ./Squeak-$VERSION-All-in-One.app/Contents/Linux-i686/bin/squeak -vm-sound-null ./Squeak-$VERSION-All-in-One.app/Contents/Resources/Squeak*.image /run.st
