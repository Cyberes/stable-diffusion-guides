#!/bin/bash

# Don't install with apt. It segfaults
# wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb
# sudo apt install xfonts-75dpi
# sudo dpkg -i wkhtmltox_0.12.6-1.focal_amd64.deb

download() {
	for i in {1...10}; do
		wget -T 15 "$1" -O "$2" && break
	done
}

download "https://rentry.org/voldy/pdf" "archives/VOLDY RETARD GUIDE.pdf"
download "https://rentry.org/drfar/pdf" "archives/Inpainging and Outpainting.pdf"
download "https://rentry.org/textard/pdf" "archives/RETARD'S GUIDE TO TEXTUAL INVERSION.pdf"
download "https://rentry.org/anime_and_titties/pdf" "archives/big titty anon's list of artists.pdf"
download "https://rentry.org/informal-training-guide/pdf" "archives/Informal Training Guide.pdf"
download "https://rentry.org/865dy/pdf" "archives/Getting Started on Paperspace.pdf"
download "https://rentry.org/cputard/pdf" "archives/CPU RETARD GUIDE.pdf"
download "https://rentry.org/sd-nativeisekai/pdf" "archives/Stable Diffusion Native Isekai.pdf"
download "https://rentry.org/ayymd-stable-diffustion-v1_4-guide/pdf" "archives/AyyMD Stable Diffuse v1.4 for Wangblows 10.pdf"
download "https://rentry.org/sdamd/pdf" "archives/Stable Diffusion AMD.pdf"
download "https://rentry.org/yrpvv/pdf" "archives/Stable Diffusion Models.pdf"
download "https://rentry.org/sdupscale/pdf" "archives/Larger resolutions with Stable Diffusion.pdf"
download "https://rentry.org/male-to-anime-girl/pdf" "archives/How to Turn Yourself Into a Cute Anime Girl.pdf"
download "https://rentry.org/sdmodels/pdf" "archives/Stable Diffusion Models.pdf"
download "https://rentry.org/sdg_FAQ/pdf" "archives/sdg FAQ.pdf"

wkhtmltopdf --encoding "UTF-8" "https://wiki.installgentoo.com/wiki/Stable_Diffusion" "archives/wiki.installgentoo.com Stable Diffusion Guide.pdf"
wkhtmltopdf --encoding "UTF-8" "https://stablediffusion.cdcruz.com/" "archives/CDcruz Stable Diffusion Guide.pdf"
