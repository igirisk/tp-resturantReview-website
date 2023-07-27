function encode() {
	var selectedfile = document.getElementById("myInput").files;
	if (selectedfile.length > 0) {
		var imageFile = selectedfile[0];
		var fileReader = new FileReader();
		fileReader.onload = function (fileLoadedEvent) {
			profile_pic = fileLoadedEvent.target.result;
			document.getElementById("target").src = profile_pic;
		};
		fileReader.readAsDataURL(imageFile);
	}
}

function update() {
	var updateUser = new XMLHttpRequest();

	updateUser.open("PUT", "http://127.0.0.1:8080/users", true);
	updateUser.setRequestHeader("Content-Type", "application/json");
	updateUser.onload = function () {
		$("#successModal").modal("show");
	};

	bio = document.getElementById("bio").value;

	var payload = { token: token, profile_pic: profile_pic, bio: bio };
	updateUser.send(JSON.stringify(payload));
}
