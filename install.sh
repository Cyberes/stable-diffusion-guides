#!/bin/bash

# Don't install with apt. It segfaults
TMP=$(mktemp)
wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb -O "$TMP"
sudo apt install -y xfonts-base xfonts-75dpi ttf-wqy-microhei ttf-wqy-zenhei ttf-dejima-mincho ttf-umefon ttf-takao ttf-takao-gothic ttf-takao-mincho ttf-takao-pgothic ttf-kochi-gothic ttf-kochi-mincho ttf-sazanami-gothic ttf-sazanami-mincho ttf-nanum-coding fonts-nanum fonts-nanum-extra ttf-baekmuk 
sudo dpkg -i "$TMP"
