"use strict";

class Review {
	constructor(rev_id, user_id, rest_id, text, rating, date_posted, upvote) {
		this.rev_id = rev_id;
		this.user_id = user_id;
		this.rest_id = rest_id;
		this.text = text;
		this.rating = rating;
		this.date_posted = date_posted;
		this.upvote = upvote;
	}

	getRev_id() {
		return this.rev_id;
	}

	getUser_id() {
		return this.user_id;
	}

	getRest_id() {
		return this.rest_id;
	}

	getText() {
		return this.text;
	}

	getRating() {
		return this.rating;
	}

	getDate_posted() {
		return this.date_posted;
	}

	getUpvote() {
		return this.upvote;
	}
}

module.exports = Review;
