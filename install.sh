#!/bin/bash
whiptail --title "Raspi2png Installer" --msgbox "This script will install raspi2png on your Raspberry Pi. You can learn more about Andrew's great project at https://github.com/AndrewFromMelbourne/raspi2png This install script is to help those unfamiliar with Git to install the application" 12 60
#whiptail --title "Licence" --msgbox "The MIT License (MIT)

#Copyright (c) 2014 Andrew Duncan for Raspi2png and Les Pounder for this menu.

#Permission is hereby granted, free of charge, to any person obtaining a
#copy of this software and associated documentation files (the Software),
#to deal in the Software without restriction, including without limitation
#the rights to use, copy, modify, merge, publish, distribute, sublicense,
#and/or sell copies of the Software, and to permit persons to whom the
#Software is furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in
#all copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#DEALINGS IN THE SOFTWARE." 40 78

if (whiptail --title "Install raspi2png" --yesno "Choose Yes to install and No to cancel." 12 60) then
    #echo "You chose Yes. Exit status was $?."
    sudo apt-get install libpng12-dev
    mkdir raspi2png
	cd raspi2png
	wget https://github.com/AndrewFromMelbourne/raspi2png/archive/master.zip
	unzip -j master.zip
	sudo cp raspi2png /usr/bin/
	sudo chmod +x /usr/bin/raspi2png
	echo "Install complete, enjoy taking screenshots"
	whiptail --title "Installation complete" --msgbox "To take a screenshot 
	Usage: raspi2png [--pngname name] [--width <width>] [--height <height>] [--compression <level>] [--delay <delay>] [--display <number>] [--stdout] [--help]

--pngname,-p - name of png file to create (default is snapshot.png)
--height,-h - image height (default is screen height)
--width,-w - image width (default is screen width)
--compression,-c - PNG compression level (0 - 9)
--delay,-d - delay in seconds (default 0)
--display,-D - Raspberry Pi display number (default 0)
--stdout,-s - write file to stdout
--help,-H - print this usage information

Example, screenshot called image1.png with 10 second delay
raspi2png -d 10 -p image1.png
	" 40 80
else
    whiptail --title "Exiting" --msgbox "You chose not to install, that's cool. Have a good day :)" 12 60
fi
