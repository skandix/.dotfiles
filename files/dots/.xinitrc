
#!/bin/sh

xrdb ~/.Xresources
compton &
nm-applet &
feh --bg-scale $HOME/.dotfiles/files/misc/wall.jpg &
exec awesome
