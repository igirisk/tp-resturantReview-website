function deleteMe() {
	var deleteUser = new XMLHttpRequest();

	deleteUser.open("DELETE", "http://127.0.0.1:8080/users", true);
	deleteUser.setRequestHeader("Content-Type", "application/json");
	deleteUser.onload = function () {
		$("#successModal").modal("show");
	};

	var payload = { token: token };
	deleteUser.send(JSON.stringify(payload));
}
