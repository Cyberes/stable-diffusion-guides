async function load_gallery(element, folder) {
	element = element.parentNode;
	let count = 0;
	while (true) {
	  count++;
	  let imageUrl = `assets/images/${folder}/${count}.webp`;
	  let imageData = await fetch_image_data(imageUrl);
	  if (!imageData) {
		break;
	  }
	  let imgElement = document.createElement("img");
	  imgElement.alt = folder;
	  imgElement.loading = "lazy";
	  imgElement.src = URL.createObjectURL(imageData);
	  element.appendChild(imgElement);
	}
  }
  
  
async function fetch_image_data(url) {
	try {
	  let response = await fetch(url);
	  if (response.ok) {
		return await response.blob();
	  } else {
		//console.warn("[Fetch Image Data] HTTP-Error: " + response.status);
		return false;
	  }
	} catch (error) {
	  //console.warn("[Fetch Image Data] Error: " + error.message);
	  return false;
	}
  }
  