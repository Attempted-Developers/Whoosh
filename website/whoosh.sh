#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
BLUE='\033[0;34m'

echo -e "${GREEN}>${NC} Checking if you have all the required dependencies installed...${NC}"
echo -ne "${GREEN}>${NC} [                      ] 0%${NC}\r"
if ! command -v git &> /dev/null; then
  sleep 2
  echo -e "${GREEN}>${NC} ${RED}Git is not installed. Please install Git and try again.${NC}"
  exit 1
fi
sleep 0.1
echo -ne "${GREEN}>${NC} [#####                 ] 25%${NC}\r"
if ! command -v python3 &> /dev/null; then
  sleep 2
  echo -e "${GREEN}>${NC} ${RED}Python3 is not installed. Please install Python3 and try again.${NC}"
  exit 1
fi
sleep 0.1
echo -ne "${GREEN}>${NC} [##########            ] 50%${NC}\r"
if ! command -v xdg-open &> /dev/null; then
  sleep 2
  echo -e "${GREEN}>${NC} ${RED}xdg-open is not installed. Please install xdg-open and try again.${NC}"
  exit 1
fi
sleep 0.1
echo -ne "${GREEN}>${NC} [###############       ] 75%${NC}\r"
if ! command -v lsof &> /dev/null; then
  sleep 2
  echo -e "${GREEN}>${NC} ${RED}lsof is not installed. Please install lsof and try again.${NC}"
  exit 1
fi
sleep 0.1
echo -ne "${GREEN}>${NC} [#######################] 100%${NC}\r"
echo -ne "\n"
echo -e "${GREEN}>${NC} All required dependencies are installed.${NC}"
sleep 2

echo -e "${GREEN}>${NC} Checking if you have a ${BLUE}Whoosh${NC} repository cloned in your system...${NC}"
if [ ! -d "./GitHub/Whoosh/website" ]; then
  echo -e "${GREEN}>${NC} You don't have a ${BLUE}Whoosh${NC} repository cloned in your system.${NC}"
  echo -e "${GREEN}> ${NC}Would you like to clone it now? (y/n)${NC}"
  read answer
  sleep 2
  if [ "$answer" != "${answer#[Yy]}" ]; then
    git clone https://github.com/attempted-developers/Whoosh
    echo -e "${GREEN}> ${BLUE}Whoosh${NC} repository cloned successfully.${NC}"
  fi
fi
sleep 1.5
echo -e "${GREEN}> ${NC}Checking if you have a ${BLUE}Whoosh${NC} shortcut on your desktop...${NC}"
sleep 1
if [ ! -f ~/Desktop/Whoosh.desktop ]; then
  echo -e "${GREEN}>${NC} You don't have a ${BLUE}Whoosh${NC} shortcut on your desktop. Would you like to create one? (y/n)${NC}"
  read answer
  sleep 1.5
  if [ "$answer" != "${answer#[Yy]}" ]; then
    echo -e "${GREEN}>${NC} Creating shortcut for ${BLUE}Whoosh${NC} on your desktop...${NC}"
    echo "[Desktop Entry]" > ~/Desktop/Whoosh.desktop
    echo "Name=Whoosh" >> ~/Desktop/Whoosh.desktop
    echo "Comment=Whoosh Internal Development" >> ~/Desktop/Whoosh.desktop
    echo "Exec=./GitHub/Whoosh/website/whoosh.sh" >> ~/Desktop/Whoosh.desktop
    echo "Icon=./GitHub/Whoosh/website/assets/logos/bubble-logo.png" >> ~/Desktop/Whoosh.desktop
    echo "Terminal=true" >> ~/Desktop/Whoosh.desktop
    echo "Type=Application" >> ~/Desktop/Whoosh.desktop
    chmod +x ~/Desktop/Whoosh.desktop
    sleep 2
    echo -e "${GREEN}> ${NC}A shortcut for ${BLUE}Whoosh${NC} has been created on your desktop.${NC}"
  fi
fi


cd ./GitHub/Whoosh/website
echo -e "${GREEN}>${NC} Checking if you already have ${BLUE}Whoosh${NC} running...${NC}"
sleep 1
if lsof -i :8000 >/dev/null; then
  echo -e "${GREEN}> ${BLUE}Whoosh${NC} is already running on port 8000.${NC}"
  echo -e "${GREEN}>${NC} Would you like to stop it and start a new instance? (y/n)${NC}"
  read answer
  if [ "$answer" != "${answer#[Yy]}" ]; then
    echo -e "${GREEN}>${NC} Stopping ${BLUE}Whoosh${NC}...${NC}"
    fuser -k 8000/tcp
    sleep 1
    echo -e "${GREEN}> ${BLUE}Whoosh${NC} has been stopped.${NC}"
    sleep 1
    echo -e "${GREEN}> ${NC}Starting ${BLUE}Whoosh for Internal Development${NC}...${NC}"
    sleep 1
    echo -e "${GREEN}>${BLUE} Opening Whoosh in your default web browser...${NC}"
    sleep 1.5
    xdg-open http://localhost:8000/
    python3 -m http.server 8000
    else
    exit 0
  fi
fi
echo -e "${GREEN}>${NC} Opening ${BLUE}Whoosh${NC} in your default web browser...${NC}"
sleep 1.5
xdg-open http://localhost:8000/
echo -e "${GREEN}> ${NC}Starting ${BLUE}Whoosh for Internal Development${NC}...${NC}"
sleep 1
python3 -m http.server 8000






