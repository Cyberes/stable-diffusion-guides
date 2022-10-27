#!/bin/bash

# Don't install with apt. It segfaults
TMP=$(mktemp)
wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb -O "$TMP"
sudo apt install -y xfonts-base xfonts-75dpi fonts-baekmuk fonts-dejima-mincho fonts-nanum-coding fonts-takao fonts-takao-pgothic fonts-takao-gothic fonts-takao-mincho
sudo dpkg -i "$TMP"
