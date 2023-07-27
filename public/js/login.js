function loginMe() {
	var $ = jQuery.noConflict();
	var loginUser = new XMLHttpRequest();

	loginUser.open("Post", "http://127.0.0.1:8080/login", true);
	loginUser.setRequestHeader("Content-Type", "application/json");
	loginUser.onload = function () {
		$("#loginModal").modal("hide");
		var token = JSON.parse(loginUser.responseText);
		console.log(token);
		if (token.result != "invaild") {
			$("#successModal").modal("show");
			document.getElementById("registerMenu").style.display = "none";
			document.getElementById("loginMenu").style.display = "none";
			document.getElementById("editMenu").style.display = "block";

			sessionStorage.setItem("token", token.result);
		} else {
			$("#failModal").modal("show");
		}
	};
	var username = document.getElementById("usernameLogin").value;
	var password = "";
	password = document.getElementById("passwordLogin").value;
	var payload = { username: username, password: password };
	loginUser.send(JSON.stringify(payload));
}
