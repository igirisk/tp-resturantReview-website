"use strict";

const express = require("express");
var reviewController = require("./controllers/reviewController"); // set reviewController to the reviewController class
var restaurantController = require("./controllers/restaurantController"); // set restaurantController to the restaurantController class
var categoryController = require("./controllers/categoryController"); // set categoryController to the categoryController class
var userController = require("./controllers/userController");
var favouriteController = require("./controllers/favouriteController");

const bodyParser = require("body-parser");

var app = express();
var host = "127.0.0.1";
var port = 8080;
var startPage = "index.html";

app.use(express.static("./public"));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.route("/reviews").get(reviewController.getAllReviews); // activate the getAllreviews method if the route is GET(method) /reviews
app.route("/reviews/:rest_id").get(reviewController.getRestReviews); // activate the getRestReviews method if the route is GET(method) /reviews/:rest_id
app.route("/reviews").post(reviewController.addReview); // activate the addreviews method if the route is POST(method) /reviews
app.route("/reviews/:rev_id").put(reviewController.updateReview); // activate the updateReviews method if the route is PUT(method) /reviews/:id
app.route("/reviews/:rev_id").delete(reviewController.deleteReview); // activate the deletereview method if the route is DELETE(method) /reviews/:id

app.route("/restaurants").get(restaurantController.getAllRestaurants); // activate the getAllRestaurants method if the route is GET(method) /restaurants
app.route("/restaurants/:region").get(restaurantController.getRegionRest); // activate the getAllRestaurants method if the route is GET(method) /restaurants

app.route("/categories/:category").get(categoryController.getCategoryRest); // activate the getCategoryRest method if the route is GET(method) /:category
app
	.route("/categories/:category/:region")
	.get(categoryController.getCategoryRegionRest); // activate the getCategoryRegionRest method if the route is GET(method) /categories/:category/:region

app.route("/users").get(userController.getAllUser); // activate the getAllUser method if the route is GET(method) /users
app.route("/users").post(userController.addUser); // activate the addUser method if the route is PUT(method) /users/:user_id
app.route("/users").put(userController.updateUser); // activate the updateUsers method if the route is PUT(method) /users
app.route("/users").delete(userController.deleteUser); // activate the deleteUser method if the route is Delete(method) /users
app.route("/login").post(userController.loginUser); // activate the loginUser method if the route is post(method) /login
app.route("/getUser").post(userController.getUser); // activate the loginUser method if the route is post(method) /login

app.route("/favourites/:user_id").get(favouriteController.getFavouriteRest); // activate the getFavouriteRest method if the route is PUT(method) /users/:user_id/favourites/:user_id
app.route("/favourites").post(favouriteController.addFavourite); // activate the addUser method if the route is PUT(method) /users/:user_id
app.route("/favourites").delete(favouriteController.deleteFavourite); // activate the deleteFavourite method if the route is Delete(method) /favourites

function gotoIndex(req, res) {
	console.log(req.params);
	res.sendFile(__dirname + "/" + startPage);
}

app.get("/" + startPage, gotoIndex);

app.route("/");

var server = app.listen(port, host, function () {
	var host = server.address().address;
	var port = server.address().port;

	console.log("Example app listening at http://%s:%s", host, port);
});
