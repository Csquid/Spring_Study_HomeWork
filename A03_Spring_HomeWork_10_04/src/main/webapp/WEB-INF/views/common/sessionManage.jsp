<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Session Control -->
<script>
	var checkUserInfo = null;
	let thisLiEliment;
	if("${page}" != "") {
		thisLiEliment = $("#" + "${page}");
		thisLiEliment.addClass("active");
	}
	
	if("${error}" != "") {
		window.alert("${error}");
	}
	
	checkUserInfo = '${sessionScope.userInfo}';
	
	if(checkUserInfo != '') {
		let userRole = null;
		userRole = '${sessionScope.userInfo.getRole()}';
		if(window.location.href.indexOf("/admin") == -1 && userRole == "admin") {
			console.log("break - true");
			$("#user-card-admin-page").css("display", "block");
		} else {
			console.log("break - false");
			$("#user-card-admin-page").css("display", "none");
		}
	}
 		
	const nURI = "${uri}";
    
	console.log("uri_index: " + nURI.indexOf("/admin/user_table"));
	
    if (nURI.indexOf("admin/user_table") >= 0) {
        $(".link-black").css("color", "black");
    }
    console.log("uri: " + "${uri}");
</script>
