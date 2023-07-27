"use strict";

class Category {
	constructor(cat_id, rest_id, category) {
		this.cat_id = cat_id;
		this.rest_id = rest_id;
		this.category = category;
	}

	getCat_id() {
		return this.cat_id;
	}

	getRest_id() {
		return this.rest_id;
	}

	getCategory() {
		return this.category;
	}
}

module.exports = Category;
