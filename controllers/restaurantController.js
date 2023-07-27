"use strict";
const RestaurantsDB = require("../models/RestaurantsDB");
const Restaurant = require("../Models/Restaurant");

var restaurantsDB = new RestaurantsDB();

function getAllRestaurants(request, respond) {
	restaurantsDB.getAllRestaurants(function (error, result) {
		if (error) {
			respond.json(error);
		} else {
			respond.json(result);
		}
	});
}

function getRegionRest(request, respond) {
	var region = request.params.region;
	restaurantsDB.getRegionRest(region, function (error, result) {
		if (error) {
			respond.json(error);
		} else {
			respond.json(result);
		}
	});
}

module.exports = { getAllRestaurants, getRegionRest };
