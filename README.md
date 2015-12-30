# addwpa
Add a pair of wpa key & SSID from /boot/addwpa.txt file, good for Raspberry Pi because this file can be edit by ordinaly PC.

# What does this script do?
This script read a pair of setting value of ssid & wpa key from /boot/addwpa.txt file, and add these by wpa_cli. Typically, intended to be called from rc.local.
/boot/addwpa.txt will be deleted after set by this script.

# Require
nkf: Convert CRLF(Windows), CR(Mac) to LF(Linux).

# Installing
1. sudo apt-get install nkf
2. Download addwpa.sh anywhare, fx: /home/pi
3. edit /etc/rc.local as follows:

```bash:
sudo nano /etc/rc.local
```

add following line before "exit 0"

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
