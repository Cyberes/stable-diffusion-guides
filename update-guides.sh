#!/bin/bash

# Don't install with apt. It segfaults
# wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb
# sudo apt install xfonts-75dpi
# sudo dpkg -i wkhtmltox_0.12.6-1.focal_amd64.deb

wget "https://rentry.org/voldy/pdf" -O "archives/VOLDY RETARD GUIDE.pdf"
wget "https://rentry.org/drfar/pdf" -O "archives/Inpainging and Outpainting.pdf"
wget "https://rentry.org/textard/pdf" -O "archives/RETARD'S GUIDE TO TEXTUAL INVERSION.pdf"
wget "https://rentry.org/anime_and_titties/pdf" -O "archives/big titty anon's list of artists.pdf"
wget "https://rentry.org/informal-training-guide/pdf" -O "archives/Informal Training Guide.pdf"
wget "https://rentry.org/865dy/pdf" -O "archives/Getting Started on Paperspace.pdf"
wget "https://rentry.org/cputard/pdf" -O "archives/CPU RETARD GUIDE.pdf"
wget "https://rentry.org/sd-nativeisekai/pdf" -O "archives/Stable Diffusion Native Isekai.pdf"
wget "https://rentry.org/ayymd-stable-diffustion-v1_4-guide/pdf" -O "archives/AyyMD Stable Diffuse v1.4 for Wangblows 10.pdf"
wget "https://rentry.org/sdamd/pdf" -O "archives/Stable Diffusion AMD.pdf"
wget "https://rentry.org/yrpvv/pdf" -O "archives/Stable Diffusion Models.pdf"
wget "https://rentry.org/sdupscale/pdf" -O "archives/Larger resolutions with Stable Diffusion.pdf"
wget "https://rentry.org/male-to-anime-girl/pdf" -O "archives/How to Turn Yourself Into a Cute Anime Girl.pdf"
wget "https://rentry.org/sdmodels/pdf" -O "archives/Stable Diffusion Models.pdf"
wkhtmltopdf "https://wiki.installgentoo.com/wiki/Stable_Diffusion" "archives/wiki.installgentoo.com Stable Diffusion Guide.pdf"
wkhtmltopdf "https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Run-with-Custom-Parameters" "archives/Run with Custom Parameters - stable-diffusion-webui wiki.pdf"
# wkhtmltopdf "https://proximacentaurib.notion.site/A-guide-to-getting-started-with-the-paperspace-port-of-AUTOMATIC1111-s-web-UI-for-ppl-who-get-nervou-b83c2213f17e452e8b0e37ba64fe9758" "Getting started with the paperspace port of AUTOMATIC1111s web UI for ppl who get nervous.pdf"
