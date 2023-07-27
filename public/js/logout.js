function logoutMe() {
	$("#registerMenu").show();
	$("#loginMenu").show();
	$("#editMenu").hide();

	sessionStorage.removeItem("token");
}
