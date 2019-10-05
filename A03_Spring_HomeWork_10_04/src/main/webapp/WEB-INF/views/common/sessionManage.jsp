<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Session Control -->
<script>
	var checkUserInfo = null;
	const thisLiEliment = $("#" + "${page}");
	thisLiEliment.addClass("active");
	
	checkUserInfo = '${sessionScope.userInfo}';
</script>
