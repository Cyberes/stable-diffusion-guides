async function load_gallery(element, folder) {
	element = element.parentNode;
	let count = 0;
	let list = '';
	while (true) {
		count++;
		let res = await fetch_image_data(`assets/images/${folder}/${count}.webp`);
		if(!res) {
			break;
		}
		list += `<img loading="lazy" src="assets/images/${folder}/${count}.webp" alt="${folder}"/>`;

	}
	element.innerHTML = list;
	return;
}


async function fetch_image_data(url) {
	let controller = new AbortController();
	let { signal } = controller;
  let response = await fetch(url, { signal });
  if (response.ok) {
		controller.abort();
    return true;
  } else {
    //console.warn("[Fetch Image Data] HTTP-Error: " + response.status);
    return false;
  }
}
