"use strict";
var db = require("../db-connection");

class CategoryDB {
	getCategoryRest(category, callback) {
		var sql =
			"SELECT restaurant.*, category.category FROM category INNER JOIN restaurant ON category.rest_id = restaurant.rest_id where category = ?;";
		db.query(sql, [category], callback);
	}

	getCategoryRegionRest(category, region, callback) {
		var sql =
			"SELECT restaurant.name, restaurant.cover_pic, restaurant.rating, restaurant.region, category.category FROM category INNER JOIN restaurant ON category.rest_id = restaurant.rest_id WHERE category.category = ? and restaurant.region = ?;";
		db.query(sql, [category, region], callback);
	}
}

module.exports = CategoryDB;
