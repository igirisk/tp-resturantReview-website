$(document).ready(function () {
	if (token != null) {
		$("#registerMenu").hide();
		$("#loginMenu").hide();

		$("#editMenu").show();
	} else {
		window.location.href = "index.html";
	}
});
