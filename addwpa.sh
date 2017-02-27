#!/bin/sh -eu 
# http://qiita.com/youcune/items/fcfb4ad3d7c1edf9dc96
#trap 'echo NG' ERR

addwpafile=/boot/addwpa.txt # path of addwpa.txt.
wpaconf=/etc/wpa_supplicant/wpa_supplicant.conf
if [ -e $addwpafile ]; then # exist addwpa.txt file then:
  nkf -Lu --overwrite $addwpafile # convert CRLF or CR to LF.
  echo hello
  ssid=`head -n 1 $addwpafile`
  psk=`head -n 2 $addwpafile | tail -n 1`
  echo $ssid
  echo $psk
  if [ -n "$ssid" -a -n "$psk" ]; then # confirm ssid and psk 
    # add network statement to the end of wpa_supplicant.conf
    nn=`wpa_cli add_network | tail -n 1` # added network number
    wpa_cli set_network $nn ssid \"$ssid\"
    wpa_cli set_network $nn psk \"$psk\"
    wpa_cli enable_network $nn
    wpa_cli save_config
    # remove addwpa.txt
    rm $addwpafile
    reboot
  fi
fi
