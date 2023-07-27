"use strict";

class User {
	constructor(user_id, username, password, profile_pic, bio) {
		this.user_id = user_id;
		this.username = username;
		this.password = password;
		this.profile_pic = profile_pic;
		this.bio = bio;
	}

	getUser_id() {
		return this.user_id;
	}

	getUsername() {
		return this.username;
	}

	getPassword() {
		return this.password;
	}

	getProfile_pic() {
		return this.profile_pic;
	}

	getBio() {
		return this.bio;
	}
}

module.exports = User;
