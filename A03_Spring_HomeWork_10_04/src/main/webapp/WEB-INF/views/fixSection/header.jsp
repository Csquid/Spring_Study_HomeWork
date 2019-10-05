<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<title>Insert title here</title>

</head>

<body>
	<div class="header">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item" id="sub1_Tab"><a class="nav-link liText"
						href="/sub1_Tab" onclick=""> Sub1 Page </a></li>
					<li class="nav-item" id="sub2_Tab"><a class="nav-link liText"
						href="/sub2_Tab" onclick=""> Sub2 Page </a></li>
					<li class="nav-item" id="sub3_Tab"><a class="nav-link liText "
						href="/sub3_Tab" onclick=""> Sub3 Page </a></li>
				</ul>
			</div>
			<button type="button" class="btn btn-secondary btn-lg" id="button_login"
				style='display: none;' data-toggle="modal" data-target="#modal_login" onclick="">
				Login</button>
			<button type="button" class="btn btn-secondary btn-lg" id="button_logout"
					style="display: none;" onclick="location.href='/user/logout'">
				Logout
			</button>
		</nav>
	</div>
	<hr>
</body>

</html>