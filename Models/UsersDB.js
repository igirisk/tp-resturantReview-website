"use strict";
var db = require("../db-connection");

class UsersDB {
	getAllUser(callback) {
		var sql = "SELECT * FROM restaurant_review.user";
		db.query(sql, callback);
	}

	getUser(username, callback) {
		var sql =
			"SELECT distinct username, bio, profile_pic  FROM restaurant_review.user WHERE username = ?;";
		db.query(sql, [username], callback);
	}

	loginUser(username, callback) {
		var sql = "SELECT password FROM restaurant_review.user WHERE username = ?;";
		db.query(sql, [username], callback);
	}

	addUser(username, password, callback) {
		var sql =
			"INSERT INTO restaurant_review.user (username,password) VALUES (?, ?);";
		db.query(sql, [username, password], callback);
	}

	updateUser(username, profile_pic, bio, callback) {
		var sql =
			"Update restaurant_review.user set profile_pic = ?, bio = ? where username = ?";
		return db.query(sql, [profile_pic, bio, username], callback);
	}

	deleteUser(username, callback) {
		var sql = "DELETE from user WHERE username = ?;";
		return db.query(sql, [username], callback);
	}
}

module.exports = UsersDB;
