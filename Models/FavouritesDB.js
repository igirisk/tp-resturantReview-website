"use strict";
var db = require("../db-connection");

class FavouriteDB {
	getFavouriteRest(user_id, callback) {
		var sql =
			"SELECT restaurant.rest_id, restaurant.name, restaurant.cover_pic, restaurant.rating FROM favourite INNER JOIN restaurant ON favourite.rest_id = restaurant.rest_id where user_id = ?;";
		db.query(sql, [user_id], callback);
	}

	addFavourite(favourite, callback) {
		var sql =
			"INSERT INTO restaurant_review.favourite (user_id, rest_id) VALUES (?, ?);";
		db.query(sql, [favourite.getUser_id(), favourite.getRest_id()], callback);
	}

	deleteFavourite(fav_id, callback) {
		var sql = "DELETE from restaurant_review.favourite WHERE fav_id = ?;";
		return db.query(sql, [fav_id], callback);
	}
}

module.exports = FavouriteDB;
