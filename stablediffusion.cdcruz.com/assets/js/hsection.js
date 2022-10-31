function toggleHsection(header) {
	if (header.nextElementSibling.style.maxHeight == "0px" || header.nextElementSibling.style.maxHeight == "") {
		header.nextElementSibling.style.maxHeight = "initial";
	} else {
		header.nextElementSibling.style.maxHeight = "0px";
	}
}

function openAllTabs() {
	var tabList = document.querySelectorAll('.descPara');
	tabList.forEach(function(tab) {tab.style.maxHeight = "1000px"});
}

function closeAllTabs() {
	var tabList = document.querySelectorAll('.descPara');
	tabList.forEach(function(tab) {tab.style.maxHeight = "0px"});
}