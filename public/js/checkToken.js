$(document).ready(function () {
	var token = sessionStorage.getItem("token");
	if (token != null) {
		$("#loginMenu").hide();
		$("#registerMenu").hide();

		$("#editMenu").show();
	}
});
