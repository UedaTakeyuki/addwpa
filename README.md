# addwpa
Set WPA key & SSID from /boot/addwpa.txt file. Espesially good for Raspberry Pi.

# What does this script do?
This script read a pair of setting value of ssid & wpa key from /boot/addwpa.txt file, and add these by wpa_cli. Typically, intended to be called from rc.local.
/boot/addwpa.txt will be deleted after set by this script.

# Installing
1. Download addwpa.sh anywhare, fx: /home/pi
2. edit /etc/rc.local as follows:

```bash:
sudo nano /etc/rc.local
```

add following line before "end."

```bash:rc.local
/home/pi/addwpa.sh
```

then, this script is called at boot time.

# format of addwpa.txt file
- 1st line is the ssid.
- 2nd line is the wpa key.

for example:

```bash:addwpa.txt
SSID-FOR-EXAMPLE
WPAKEY1234
```
# Raspberry PI /boot folder can be access by PC.
You can write /boot/addwpa.txt directory by PC seeting Raspbian SD card on. So, before network setting, you can prepare /boot/addwpa.txt by PC.

