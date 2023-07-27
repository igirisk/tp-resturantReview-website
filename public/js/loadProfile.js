$(document).ready(function () {
	var getProfile = new XMLHttpRequest();

	getProfile.open("POST", "http://127.0.0.1:8080/getUser", true);
	getProfile.setRequestHeader("COntent-Type", "application/json");
	getProfile.onload = function () {
		var profile = JSON.parse(getProfile.responseText);
		bio = profile[0].bio;
		profile_pic = profile[0].profile_pic;
		username = profile[0].username;
		document.getElementById("username").value = username;
		document.getElementById("bio").value = bio;
		document.getElementById("target").src = profile_pic;
	};
	var payload = { token: token };
	getProfile.send(JSON.stringify(payload));
});
