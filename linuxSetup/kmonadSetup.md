Use provided template
it just changes caps lock to backspace


important part is to follow guide
https://dev.to/ram535/kmonad-and-the-power-of-infinite-leader-keys-888

initial setup and system configuration changes are important.
( also provided in FAQ in case above article link goes down )
( https://github.com/david-janssen/kmonad/blob/master/doc/faq.md#linux )


then next difficulty comes in ffinding the name of inbuild keyboard
( article mentions to search for those ending with kbd,  but for asus
 laptop it wasn't  case )
 
use evtest command, it will show Asus keyboard
```
/input/by-path/ sudo evtest                                                                              x  3:35PM
[sudo] password for sroot:
No device specified, trying to scan all of /dev/input/event*
Available devices:
/dev/input/event0:      Power Button
/dev/input/event1:      Lid Switch
/dev/input/event2:      Sleep Button
/dev/input/event3:      Video Bus
/dev/input/event4:      Video Bus
/dev/input/event5:      Asus WMI hotkeys
/dev/input/event6:      ASUF1204:00 2808:0201 Mouse
/dev/input/event7:      ASUF1204:00 2808:0201 Touchpad
/dev/input/event8:      KMonad kbd
/dev/input/event10:     HD-Audio Generic HDMI/DP,pcm=3
/dev/input/event11:     HDA NVidia HDMI/DP,pcm=3
/dev/input/event12:     HD-Audio Generic HDMI/DP,pcm=7
/dev/input/event13:     HDA NVidia HDMI/DP,pcm=7
/dev/input/event21:     USB2.0 FHD UVC WebCam: USB2.0 F
/dev/input/event22:     USB2.0 FHD UVC WebCam: USB2.0 I
/dev/input/event23:     HD-Audio Generic HDMI/DP,pcm=8
/dev/input/event24:     HDA NVidia HDMI/DP,pcm=8
/dev/input/event25:     HD-Audio Generic HDMI/DP,pcm=9
/dev/input/event26:     HDA NVidia HDMI/DP,pcm=9
/dev/input/event27:     Asus Keyboard <------------------------- this is it
/dev/input/event28:     HD-Audio Generic Mic
/dev/input/event29:     HD-Audio Generic Mic
/dev/input/event30:     HD-Audio Generic Headphone
```

so we know event27 is our keyboard


next command to find the handler (identifier) related to it

```
cat /proc/bus/input/devices
```


```
I: Bus=0003 Vendor=0b05 Product=19b6 Version=0110
N: Name="Asus Keyboard"
P: Phys=usb-0000:65:00.3-3/input0
S: Sysfs=/devices/pci0000:00/0000:00:08.1/0000:65:00.3/usb1/1-3/1-3:1.0/0003:0B05:19B6.0002/input/input40
U: Uniq=
H: Handlers=sysrq rfkill kbd mouse2 event27 leds
B: PROP=0
B: EV=12001f
B: KEY=33eff 0 0 483ffff17aff32d bfd4444600000000 1f0001 1b30c730b17cc07 ffbf7bfad971dfff febeffdfffefffff ffffffffffffff
fe
B: REL=1943
B: ABS=10100000000
B: MSC=10
B: LED=1f
```

so it's there in list, but it has mouse in it's name too.
At this moment, little hit and trial helped in finding correct one.


for reason beyond my comprehension, need to run `kmonad` with sudo
`sudo /home/sroot/.local/bin/kmonad ~/.config/kmonad/config.kbd`


to start the kmonad process at startup add using cron job

`crontab -e`

add the kmonad and config file with absolute path, it'll work
tried using systemd,  but couldn't get it working

Add below content in `crontab -e` file
```
@reboot /home/sroot/.local/bin/kmonad  /home/sroot/.config/kmonad/config.kbd
```
