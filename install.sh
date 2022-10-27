#!/bin/bash

# Don't install with apt. It segfaults
TMP=$(mktemp)
wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb -O "$TMP"
sudo apt install xfonts-75dpi
sudo dpkg -i "$TMP"
