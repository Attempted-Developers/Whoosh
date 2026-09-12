#!/bin/bash

echo "> Checking if you have a Whoosh repository cloned in your system..."
if [ ! -d "./GitHub/Whoosh/website" ]; then
  echo "> You don't have a Whoosh repository cloned in your system."
  echo "> Would you like to clone it now? (y/n)"
  read answer
  sleep 1
  if [ "$answer" != "${answer#[Yy]}" ]; then
    git clone https://github.com/attempted-developers/Whoosh
    echo "> Whoosh repository cloned successfully."
  fi
fi
sleep 1.5
echo "> Checking if you have a Whoosh shortcut on your desktop..."
sleep 1
if [ ! -f ~/Desktop/Whoosh.desktop ]; then
  echo "> You don't have a Whoosh shortcut on your desktop. Would you like to create one? (y/n)"
  read answer
  sleep 1.5
  if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "> Creating shortcut for Whoosh on your desktop..."
    echo "[Desktop Entry]" > ~/Desktop/Whoosh.desktop
    echo "Name=Whoosh" >> ~/Desktop/Whoosh.desktop
    echo "Comment=Whoosh Internal Development" >> ~/Desktop/Whoosh.desktop
    echo "Exec=/home/astrxbe/GitHub/Whoosh/website/whoosh.sh" >> ~/Desktop/Whoosh.desktop
    echo "Icon=/home/astrxbe/GitHub/Whoosh/website/assets/logos/bubble-logo.png" >> ~/Desktop/Whoosh.desktop
    echo "Terminal=true" >> ~/Desktop/Whoosh.desktop
    echo "Type=Application" >> ~/Desktop/Whoosh.desktop
    chmod +x ~/Desktop/Whoosh.desktop
    sleep 2
    echo "> A shortcut for Whoosh has been created on your desktop."
  fi
fi


cd /home/astrxbe/GitHub/Whoosh/website
echo "> Opening Whoosh in your default web browser..." 
sleep 1.5
xdg-open http://localhost:8000/
echo "> Checking if you already have Whoosh running..."
sleep 1
if lsof -i :8000 >/dev/null; then
  echo "> Whoosh is already running on port 8000."
  echo "> Would you like to stop it and start a new instance? (y/n)"
  read answer
  sleep 1
  if [ "$answer" != "${answer#[Yy]}" ]; then
    echo "> Stopping Whoosh..."
    fuser -k 8000/tcp
    sleep 1
    echo "> Whoosh has been stopped."
    echo "> Starting Whoosh for Internal Development..."
    sleep 1
    python3 -m http.server 8000
fi
echo "> Starting Whoosh for Internal Development..."
sleep 1
python3 -m http.server 8000






