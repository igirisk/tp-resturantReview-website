const search = document.getElementById("search");
search.addEventListener("keyup", (e) => {
	let currentValue = e.target.value.toLowerCase();
	let restaurants = document.querySelectorAll("h2");
	restaurants.forEach((restaurant) => {
		if (restaurant.textContent.toLowerCase().includes(currentValue)) {
			restaurant.parentNode.parentNode.parentNode.style.display = "block";
		} else {
			restaurant.parentNode.parentNode.parentNode.style.display = "none";
		}
	});
});
