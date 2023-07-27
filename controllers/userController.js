"use strict";
const UsersDB = require("../models/UsersDB");
const User = require("../models/User");
const bcrypt = require("bcrypt");
var jwt = require("jsonwebtoken");
var secret = "secretKey";

var usersDB = new UsersDB();

function getAllUser(request, respond) {
	usersDB.getAllUser(function (error, result) {
		if (error) {
			respond.json(error);
		} else {
			respond.json(result);
		}
	});
}

function getUser(request, respond) {
	var token = request.body.token;
	try {
		var decoded = jwt.verify(token, secret);
		usersDB.getUser(decoded, function (error, result) {
			if (error) {
				respond.json(error);
			} else {
				respond.json(result);
			}
		});
	} catch (error) {
		respond.json({ result: "invaild token" });
	}
}

function loginUser(request, respond) {
	var username = request.body.username;
	var password = request.body.password;
	usersDB.loginUser(username, function (error, result) {
		if (error) {
			respond.json(error);
		} else {
			const hash = result[0].password;
			var flag = bcrypt.compareSync(password, hash);
			if (flag) {
				var token = jwt.sign(username, secret);
				respond.json({ result: token });
			} else {
				respond.json({ result: "invaild" });
			}
		}
	});
}

function addUser(request, respond) {
	var username = request.body.username;
	var password = request.body.password;
	password = bcrypt.hashSync(password, 10);
	usersDB.addUser(username, password, function (error, result) {
		if (error) {
			respond.json(error);
		} else {
			respond.json(result);
		}
	});
}

function updateUser(request, respond) {
	var profile_pic = request.body.profile_pic;
	var bio = request.body.bio;
	var token = request.body.token;
	try {
		var decoded = jwt.verify(token, secret);
		usersDB.updateUser(decoded, profile_pic, bio, function (error, result) {
			if (error) {
				respond.json(error);
			} else {
				respond.json(result);
			}
		});
	} catch (error) {
		respond.json({ result: "invaild token" });
	}
}

function deleteUser(request, respond) {
	var token = request.body.token;
	try {
		var decoded = jwt.verify(token, secret);
		usersDB.deleteUser(decoded, function (error, result) {
			if (error) {
				respond.json(error);
			} else {
				respond.json(result);
			}
		});
	} catch (error) {
		respond.json({ result: "invaild token" });
	}
}

module.exports = {
	getAllUser,
	getUser,
	addUser,
	updateUser,
	deleteUser,
	loginUser,
};
