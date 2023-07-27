"use strict";
var db = require("../db-connection");

class ReviewsDB {
	getAllReviews(callback) {
		var sql =
			"SELECT user.username, user.profile_pic, review.rest_id, rev_id, review.text, review.rating, review.date_posted, review.upvote FROM review INNER JOIN user ON review.user_id = user.user_id;";
		db.query(sql, callback);
	}

	getRestReviews(rest_id, callback) {
		var sql =
			"SELECT user.username, user.profile_pic, review.text, review.rating, review.date_posted, review.upvote FROM review INNER JOIN user ON review.user_id = user.user_id where rest_id = ?;";
		db.query(sql, [rest_id], callback);
	}

	addReview(review, callback) {
		var sql =
			"INSERT INTO restaurant_review.review (user_id, rest_id, text, rating, date_posted, upvote) VALUES (?, ?, ?, ?, ?, ?);";
		db.query(
			sql,
			[
				review.getUser_id(),
				review.getRest_id(),
				review.getText(),
				review.getRating(),
				review.getDate_posted(),
				review.getUpvote(),
			],
			callback
		);
	}

	updateReview(review, callback) {
		var sql =
			"UPDATE restaurant_review.review SET text = ?,  rating = ?, date_posted = ? , upvote = ? WHERE rev_id = ?;";
		return db.query(
			sql,
			[
				review.getText(),
				review.getRating(),
				review.getDate_posted(),
				review.getUpvote(),
				review.getRev_id(),
			],
			callback
		);
	}

	deleteReview(rev_id, callback) {
		var sql = "DELETE from review WHERE rev_id = ?;";
		return db.query(sql, [rev_id], callback);
	}
}

module.exports = ReviewsDB;
