
# Load Xmodmap
if [ -s ~/.Xmodmap ]; then
	xmodmap ~/.Xmodmap
fi

# Swap ctrl to capslock
#setxkbmap -layout us -option ctrl:swapcaps

# Start autofs
#systemctl start autofs.service

exec i3