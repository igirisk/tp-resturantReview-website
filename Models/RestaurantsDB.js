"use strict";
var db = require("../db-connection");

class RestaurantsDB {
	getAllRestaurants(callback) {
		var sql = "SELECT * FROM restaurant_review.restaurant;";
		db.query(sql, callback);
	}

	getRegionRest(region, callback) {
		var sql =
			"SELECT restaurant.name, restaurant.cover_pic, restaurant.rating, restaurant.region FROM restaurant_review.restaurant WHERE region = ?;";
		db.query(sql, [region], callback);
	}
}

module.exports = RestaurantsDB;
