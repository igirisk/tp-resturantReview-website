function registerMe() {
	var $ = jQuery.noConflict();
	var registerUser = new XMLHttpRequest();

	registerUser.open("Post", "http://127.0.0.1:8080/users", true);
	registerUser.setRequestHeader("Content-Type", "application/json");
	registerUser.onload = function () {
		$("#registerModal").modal("hide");
		$("#successModal").modal("show");
	};
	var username = document.getElementById("registerUsername").value;
	var password = document.getElementById("registerPassword").value;
	var payload = { username: username, password: password };
	registerUser.send(JSON.stringify(payload));
}
