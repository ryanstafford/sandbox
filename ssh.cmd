@echo off
cd tools
echo y | klink.exe -load vagrant.ktx exit
start kitty.exe -load "vagrant.ktx"
cd ..