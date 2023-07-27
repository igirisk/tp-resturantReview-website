"use strict";
const ReviewsDB = require("../models/ReviewsDB");
const Review = require("../models/Review");

var reviewsDB = new ReviewsDB();

function getAllReviews(request, respond) {
	reviewsDB.getAllReviews(function (error, result) {
		if (error) {
			respond.json(error);
		} else {
			respond.json(result);
		}
	});
}

function getRestReviews(request, respond) {
	var rest_id = String(request.params.rest_id);
	reviewsDB.getRestReviews(rest_id, function (error, result) {
		if (error) {
			respond.json(error);
		} else {
			respond.json(result);
		}
	});
}

function addReview(request, respond) {
	var now = new Date();
	var review = new Review(
		null,
		request.body.user_id,
		request.body.rest_id,
		request.body.text,
		request.body.rating,
		now,
		0
	);
	reviewsDB.addReview(review, function (error, result) {
		if (error) {
			respond.json(error);
		} else {
			respond.json(result);
		}
	});
}

function updateReview(request, respond) {
	var now = new Date();
	var review = new Review(
		parseInt(request.params.rev_id),
		request.body.user_id,
		request.body.rest_id,
		request.body.text,
		request.body.rating,
		now,
		request.body.upvote
	);
	reviewsDB.updateReview(review, function (error, result) {
		if (error) {
			respond.json(error);
		} else {
			respond.json(result);
		}
	});
}

function deleteReview(request, respond) {
	var rev_id = parseInt(request.params.rev_id);
	reviewsDB.deleteReview(rev_id, function (error, result) {
		if (error) {
			respond.json(error);
		} else {
			respond.json(result);
		}
	});
}

module.exports = {
	getAllReviews,
	getRestReviews,
	addReview,
	updateReview,
	deleteReview,
};
