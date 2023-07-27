"use strict";
const CategoriesDB = require("../models/CategoriesDB");
const Category = require("../models/Category");

var categoriesDB = new CategoriesDB();

function getCategoryRest(request, respond) {
	var category = String(request.params.category);
	categoriesDB.getCategoryRest(category, function (error, result) {
		if (error) {
			respond.json(error);
		} else {
			respond.json(result);
		}
	});
}

function getCategoryRegionRest(request, respond) {
	var category = String(request.params.category);
	var region = String(request.params.region);
	categoriesDB.getCategoryRegionRest(
		category,
		region,
		function (error, result) {
			if (error) {
				respond.json(error);
			} else {
				respond.json(result);
			}
		}
	);
}

module.exports = { getCategoryRest, getCategoryRegionRest };
