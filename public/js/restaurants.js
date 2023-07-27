//This function is to call the restaurants api and get all the restaurants
function getAllRestaurantData() {
	var request = new XMLHttpRequest();
	request.open("GET", restaurant_url, true);

	//This function will be called when data returns from the web api
	request.onload = function () {
		//get all the restaurants records into our restaurant array
		restaurant_array = JSON.parse(request.responseText);
		//call the function so as to display all restaurants
		displayRestaurants();
		fetchReviews();
	};
	//This command starts the calling of the restaurantss web api
	request.send();
}

//This function display all the restaurants
function displayRestaurants() {
	var table = document.getElementById("restaurantsTable");
	var restaurantCount = 0;

	table.innerHTML = "";
	totalRestaurants = restaurant_array.length;
	for (var count = 0; count < totalRestaurants; count++) {
		var name = restaurant_array[count].name;
		var cover_pic = restaurant_array[count].cover_pic;
		var rating = restaurant_array[count].rating;
		//This fucntion prints the number of star for the restaurant
		function star() {
			var star = "";
			for (var i = 0; i < rating - 1; i++) {
				star += "<img  class='star' src='res/items/star.png' />";
			}
			if (rating % 1 != 0) {
				star += "<img  class='star' src='res/items/halfstar.png' />";
			}
			return star;
		}
		var cell =
			'<div class="col-lg-4 col-md-6 rest">' +
			"<div class='button'>" +
			'<button style="padding:0; width:auto; height:auto" href="#" data-toggle="modal" data-target="#restaurantModal" item="' +
			count +
			'" type="button" class="btn btn-sm" onClick="showRestaurantDetails(this)" >' +
			"<img class='restImage' style='margin:0; padding:0' src=" +
			cover_pic.replaceAll(" ", "%20") +
			" />" +
			"</button>" +
			"<div class='info'>" +
			"<h2>" +
			name +
			"</h2>" +
			"<div class='allStar'>" +
			star() +
			"<b style='padding-left:20px; font-size:15px'>" +
			rating +
			"<b>" +
			"</div>" +
			"</a>" +
			"<div class='button'>" +
			'<button href="#" data-toggle="modal" data-target="#restaurantModal" item="' +
			count +
			'" type="button" class="btn btn-sm" onClick="showRestaurantDetails(this)" >See More</button> ' +
			'<button href="#" data-toggle="modal" data-target="#reviewModal" item="' +
			count +
			'" type="button" class="btn btn-sm" onClick="showRestaurantReviews(this)" >Reviews</button>' +
			"</div>" +
			"</div>" +
			"</div>" +
			"</div>";
		table.insertAdjacentHTML("beforeend", cell);
		restaurantCount++;
	}
}

//This function is to call the restaurants api and get restaurants from category
function getRestaurantCategoryData() {
	var request = new XMLHttpRequest();
	var category = sessionStorage.getItem("category");
	request.open("GET", category_url + category, true);

	//This function will be called when data returns from the web api
	request.onload = function () {
		//get all the restaurants records into our restaurant array
		restaurant_array = JSON.parse(request.responseText);
		//call the function so as to display all restaurants
		displayRestaurantCategory(category);
		fetchReviews();
	};
	//This command starts the calling of the restaurantss web api
	request.send();
}

//This function display all the restaurants
function displayRestaurantCategory(category) {
	var header = document.getElementById("outer");
	var head =
		'<div class="up">' +
		'<img src="res/category_pic/' +
		category +
		'.jpg" class="headerpic" />' +
		"</div>" +
		'<div class="up"><img src="res/items/side.png" class="side" />' +
		"</div>" +
		'<div class="up headerback">' +
		'<h1 class="header">' +
		category +
		"</h1>" +
		"</div>";
	header.insertAdjacentHTML("beforeend", head);

	var table = document.getElementById("restaurantsTable");
	var restaurantCount = 0;

	table.innerHTML = "";
	totalRestaurants = restaurant_array.length;
	for (var count = 0; count < totalRestaurants; count++) {
		if (restaurant_array[count].category == category) {
			var name = restaurant_array[count].name;
			var cover_pic = restaurant_array[count].cover_pic;
			var rating = restaurant_array[count].rating;
			//This fucntion prints the number of star for the restaurant
			function star() {
				var star = "";
				for (var i = 0; i < rating - 1; i++) {
					star += "<img  class='star' src='res/items/star.png' />";
				}
				if (rating % 1 != 0) {
					star += "<img  class='star' src='res/items/halfstar.png' />";
				}
				return star;
			}
			var cell =
				'<div class="col-lg-4 col-md-6 rest">' +
				"<div class='button'>" +
				'<button style="padding:0; width:auto; height:auto" href="#" data-toggle="modal" data-target="#restaurantModal" item="' +
				count +
				'" type="button" class="btn btn-sm" onClick="showRestaurantDetails(this)" >' +
				"<img class='restImage' style='margin:0; padding:0' src=" +
				cover_pic.replaceAll(" ", "%20") +
				" />" +
				"</button>" +
				"<div class='info'>" +
				"<h2 class='restaurantName'>" +
				name +
				"</h2>" +
				"<div class='allStar'>" +
				star() +
				"<b style='padding-left:20px; font-size:15px'>" +
				rating +
				"<b>" +
				"</div>" +
				"</a>" +
				"<div class='button'>" +
				'<button href="#" data-toggle="modal" data-target="#restaurantModal" item="' +
				count +
				'" type="button" class="btn btn-sm" onClick="showRestaurantDetails(this)" >See More</button> ' +
				'<button href="#" data-toggle="modal" data-target="#reviewModal" item="' +
				count +
				'" type="button" class="btn btn-sm" onClick="showRestaurantReviews(this)" >Reviews</button>' +
				"</div>" +
				"</div>" +
				"</div>" +
				"</div>";
			table.insertAdjacentHTML("beforeend", cell);
			restaurantCount++;
		}
	}
}

function buffet() {
	category = "buffet";
	sessionStorage.setItem("category", category);
}
function chinese() {
	category = "chinese";
	sessionStorage.setItem("category", category);
}
function dessert() {
	category = "dessert";
	sessionStorage.setItem("category", category);
}
function fastFood() {
	category = "fast food";
	sessionStorage.setItem("category", category);
}
function fineDinning() {
	category = "fine dinning";
	sessionStorage.setItem("category", category);
}
function halal() {
	category = "halal";
	sessionStorage.setItem("category", category);
}
function hotpot() {
	category = "hotpot";
	sessionStorage.setItem("category", category);
}
function indian() {
	category = "indian";
	sessionStorage.setItem("category", category);
}
function japanese() {
	category = "japanese";
	sessionStorage.setItem("category", category);
}
function korean() {
	category = "korean";
	sessionStorage.setItem("category", category);
}
function singaporean() {
	category = "singaporean";
	sessionStorage.setItem("category", category);
}
function thai() {
	category = "thai";
	sessionStorage.setItem("category", category);
}
function vegetarian() {
	category = "vegetarian";
	sessionStorage.setItem("category", category);
}
function western() {
	category = "western";
	sessionStorage.setItem("category", category);
}

//This function is to display the individual restaurants details
//whenever the user clicks on "See More"
function showRestaurantDetails(element) {
	var item = element.getAttribute("item");
	currentIndex = item;

	document.getElementById("name").textContent = restaurant_array[item].name;
	document.getElementById("cover_pic").src = restaurant_array[item].cover_pic;
	document.getElementById("rating").textContent = restaurant_array[item].rating;
	document.getElementById("description").textContent =
		restaurant_array[item].description;
	document.getElementById("price").textContent = restaurant_array[item].price;
	document.getElementById("opening_hour").textContent =
		restaurant_array[item].opening_hour;
	document.getElementById("phone").textContent =
		"+65 " + restaurant_array[item].phone;
	document.getElementById("region").textContent = restaurant_array[item].region;
}

//This function opens a new window/tab and loads the
//particular restauranturant in the cinema website
function goLocation() {
	window.open(restaurant_array[currentIndex].location, "_blank");
}

function goWebsite() {
	window.open(restaurant_array[currentIndex].website, "_blank");
}
