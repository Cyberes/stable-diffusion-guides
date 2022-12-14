#!/bin/bash

git submodule deinit .
git submodule | cut -c43- | while read -r line; do (git rm "$line"); done
git config --local -l | grep submodule | sed -e 's/^\(submodule\.[^.]*\)\(.*\)/\1/g' | while read -r line; do (git config --local --remove-section "$line"); done
rm .gitmodules
rm -rf .git/modules

# Don't install with apt. It segfaults
# wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb
# sudo apt install xfonts-75dpi
# sudo dpkg -i wkhtmltox_0.12.6-1.focal_amd64.deb

download() {
	for i in {1...10}; do
		TMP="$(mktemp -d)/$2"
		mkdir -p $(dirname $TMP)
		wget -T 60 "$1" -O "$TMP" && break
		sleep 10
	done
	CK_1=($(md5sum "$TMP"))
	CK_2=($(md5sum "$2"))
	echo "Checksums: $CK_1 -> changed to -> $CK_2"
	if [[ ! -f "$2" ]]; then
		mv "$TMP" "$2"
	elif [[ $CK_1 != $CK_2 ]]; then
		mv "$TMP" "$2"
	else
		echo "$2 file unchanged"
	fi
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
download "https://rentry.org/sdmodels/pdf" "archives/Stable Diffusion Models.pdf"
download "https://rentry.org/sdg_FAQ/pdf" "archives/sdg FAQ.pdf"
download "https://rentry.org/sdupdates/pdf" "archives/sdupdates.pdf"
download "https://rentry.org/sdupdates2/pdf" "archives/sdupdates2.pdf"
download "https://rentry.org/artists_sd-v1-4/pdf" "archives/list of artists for SD v1.4.pdf"
download "https://rentry.org/hypernetwork4dumdums/pdf" "archives/hypernetwork4dumdums.pdf"
download "https://rentry.org/LFTBL/pdf" "archives/Model Mixes.pdf"
download "https://rentry.org/sdupdates3/pdf" "archives/SD Updates 3.pdf"
download "https://rentry.org/sdg-link/pdf" "archives/More sdg links.pdf" 
download "https://rentry.org/hdgrecipes/pdf" "archives/hd/ Stable Diffusion Models Cookbook.pdf"
download "https://rentry.org/LFTBL/pdf" "archives/STABLE DIFFUSION MIXING EMPORIUM.pdf"
download "https://rentry.org/embeddings/pdf" "archives/List of Textual Inversion embeddings.pdf"
download "https://rentry.org/dummySD2/pdf" "archives/SDv2.0 Guide.pdf"
download "https://rentry.org/AnimAnon/pdf" "archives/FizzleDorf's Animation Guide.pdf"
download "https://rentry.org/sdgoldmine/pdf" "archives/SD RESOURCE GOLDMINE.pdf"
download "https://rentry.org/safetensorsguide/pdf" "archives/Guide to convert .ckpt models to .safetensors.pdf"
download "https://rentry.org/54d9o/pdf" "archives/sdg example prompts 1.pdf"
download "https://rentry.org/9dn5g/pdf" "archives/sdg example prompts 2.pdf"
download "https://rentry.org/u9ehi/pdf" "archives/sdg example prompts 3.pdf"
download "https://rentry.org/p9yoo/pdf" "archives/sdg example prompts 4.pdf"

wkhtmltopdf --encoding "UTF-8" "https://wiki.installgentoo.com/index.php?title=Stable_Diffusion&printable=yes" "archives/wiki.installgentoo.com Stable Diffusion Guide.pdf"
#wkhtmltopdf --encoding "UTF-8" "https://stablediffusion.cdcruz.com/" "archives/CDcruz Stable Diffusion Guide.pdf"

rm -rf sd-akashic
git clone https://github.com/Maks-s/sd-akashic.git /tmp/sd-akashic
find /tmp/sd-akashic -name ".git*" -exec rm -rfv "{}" +;
mv /tmp/sd-akashic .

download_cdcruz () {
	wget -r -H -l 1 "https://stablediffusion.cdcruz.com/$1" --convert-links --page-requisites -D stablediffusion.cdcruz.com --reject ckpt,exe -np -e robots=off -U "Mozilla/5.0 (iPhone; CPU iPhone OS 12_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 Mobile/15E148 Safari/604.1"
}

#mkdir -p stablediffusion.cdcruz.com
#cd stablediffusion.cdcruz.com

#rm -rf tmp
#mkdir -p tmp
#cd tmp

rm -rf stablediffusion.cdcruz.com

download_cdcruz index.html
download_cdcruz embeddings.html
download_cdcruz models.html
download_cdcruz automatic1111.html
download_cdcruz embeddings_training.html
download_cdcruz install.html
download_cdcruz methods.html
download_cdcruz prompts_list.html

#mv stablediffusion.cdcruz.com/* ../..
#cd ../..
#rm -rf tmp

#for file in *.html; do
#	perl -pi -e 's/"\.\.\//"/g' "$file"
#	perl -pi -e 's/href="\//href="/g' "$file"
#	perl -pi -e 's/src="\//href="/g' "$file"
#done

#perl -pi -e "s/url\('\//url\('/g" "assets/css/stable_diffusion.css"

cd stablediffusion.cdcruz.com

perl -pi -e 's/<list1><a href="https:\/\/stablediffusion\.cdcruz\.com\/\${id}">\${item\.innerHTML}<\/a><\/list1>/<list1><a href="\${window\.location\.href}\/\${id}">\${item\.innerHTML}<\/a><\/list1>/g' index.html
perl -pi -e 's/<list2><a href="https:\/\/stablediffusion\.cdcruz\.com\/\${id}">\${item\.innerHTML}<\/a><\/list2>/<list2><a href="\${window\.location\.href}\/\${id}">\${item\.innerHTML}<\/a><\/list2>/g' index.html
