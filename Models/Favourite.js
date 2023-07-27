"use strict";

class Favourite {
	constructor(fav_id, user_id, rest_id) {
		this.fav_id = fav_id;
		this.user_id = user_id;
		this.rest_id = rest_id;
	}

	getFav_id() {
		return this.fav_id;
	}

	getUser_id() {
		return this.user_id;
	}

	getRest_id() {
		return this.rest_id;
	}
}

module.exports = Favourite;
