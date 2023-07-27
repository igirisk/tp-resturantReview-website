"use strict";

class Restaurant {
	constructor(
		rest_id,
		name,
		cover_pic,
		rating,
		description,
		price,
		opening_hour,
		phone,
		location,
		website,
		region
	) {
		this.rest_id = rest_id;
		this.name = name;
		this.cover_pic = cover_pic;
		this.rating = rating;
		this.description = description;
		this.price = price;
		this.opening_hour = opening_hour;
		this.phone = phone;
		this.location = location;
		this.website = website;
		this.region = region;
	}

	getRest_id() {
		return this.rest_id;
	}

	getName() {
		return this.name;
	}

	getCover_pic() {
		return this.cover_pic;
	}

	getRating() {
		return this.rating;
	}

	getDescription() {
		return this.description;
	}

	getPrice() {
		return this.price;
	}

	getOpening_hour() {
		return this.opening_hour;
	}

	getPhone() {
		return this.phone;
	}

	getLocation() {
		return this.location;
	}

	getWebiste() {
		return this.website;
	}

	getRegion() {
		return this.region;
	}
}

module.exports = Restaurant;
