#!/bin/bash
echo "
Script to install linhpsdr on a Raspberry Pi 3 or 4 running Raspbian Buster.

Starting linhpsdr install.....


"
sudo apt update
sudo apt install -y libfftw3-dev libfftw3-3 libgtk-3-dev libpulse-dev libsoapysdr-dev libsoapysdr0.6 pulseaudio pavucontrol cmake ||
{ echo ' Installing dependencies failed!'; exit 1; }


echo "Starting libsoundio install....

"
cd ~
git clone https://github.com/andrewrk/libsoundio.git ||
{ echo ' Downloading libsoundio failed!'; exit 1;}

cd libsoundio
mkdir build && cd build && cmake .. && make && sudo make install ||
{ echo 'Building libsoundio failled!'; exit 1;}


echo "

Starting wdsp install...
"
cd ~
git clone https://github.com/g0orx/wdsp.git ||
{ echo ' Downloading libsoundio failed!'; exit 1;}

cd wdsp && make && sudo make install ||
{ echo ' Installing wsdp failled!'; exit 1;}

echo "

Starting linhpsdr install ....
"
cd ~
git clone https://github.com/g0orx/linhpsdr.git ||
{ echo ' Downloading libsoundio failed!'; exit 1;}

cd linhpsdr && make && sudo make install ||
{ echo ' Installing linhpsdr failled!'; exit 1;}

echo "
FINISHED!!!

Now rebooting de G4WNC ....
"
sleep 4
reboot

