"use strict";
const FavouritesDB = require("../models/FavouritesDB");
const Favourite = require("../models/Favourite");

var favouritesDB = new FavouritesDB();

function getFavouriteRest(request, respond) {
	var user_id = request.params.user_id;
	favouritesDB.getFavouriteRest(user_id, function (error, result) {
		if (error) {
			respond.json(error);
		} else {
			respond.json(result);
		}
	});
}

function addFavourite(request, respond) {
	var favourite = new Favourite(
		null,
		request.body.user_id,
		request.body.rest_id
	);
	favouritesDB.addFavourite(favourite, function (error, result) {
		if (error) {
			respond.json(error);
		} else {
			respond.json(result);
		}
	});
}

function deleteFavourite(request, respond) {
	var fav_id = request.body.fav_id;
	favouritesDB.deleteFavourite(fav_id, function (error, result) {
		if (error) {
			respond.json(error);
		} else {
			respond.json(result);
		}
	});
}

module.exports = { getFavouriteRest, addFavourite, deleteFavourite };
