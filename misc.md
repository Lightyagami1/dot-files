

Better use autorandr
https://linuxconfig.org/how-to-automatically-change-x11-displays-setup-with-autorandr-on-linux

Before plugging external monitor, save base
autorandr --save laptop_only


# turn off internal monitor now
to see monitors currently being used.
xrandr

to disable one ( ideally would be eDP-1 )
xrandr --output eDP-1 --off


now save this profile as
autorandr --save laptop_external_only



