<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>

<body>
	<div class="header">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="/" tabindex="-1" aria-disabled="true">CodeMonkey</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div
				class="collapse navbar-collapse justify-content-start ml-md-auto "
				id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-item nav-link" id="sub1_Tab" href="/sub1_Tab">Sub1</a>
					<a class="nav-item nav-link" id="sub2_Tab" href="/sub2_Tab">Sub2</a>
					<a class="nav-item nav-link" id="sub3_Tab" href="/sub3_Tab">Sub3</a>
					<a class="nav-item nav-link" id="parallax" href="/move/parallax">parallax</a>
				</div>
			</div>

			<div class="collapse navbar-collapse justify-content-end ml-md-auto"
				id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<div class="navar-nav">
						<a class="nav-item nav-link" id="button_login" data-toggle="modal"
							data-target="#modal_login" style="align: right; display: none"
							href="#">Login</a> <a class="nav-item nav-link"
							id="button_logout" onclick="location.href='/user/logout'"
							style="align: right; display: none" href="#">Logout</a>
					</div>
				</div>
			</div>
		</nav>
	</div>
</body>
</html>