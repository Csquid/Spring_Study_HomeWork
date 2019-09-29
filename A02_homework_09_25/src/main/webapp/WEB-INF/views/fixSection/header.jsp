<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<%@ include file="../common/tools.jsp"%>
	
<title>Insert title here</title>

<!-- header.jsp list Font -->
<style type="text/css">
.liText {
	font-size: 30px;
}
</style>

<!-- modal -->
<style type="text/css">
.monkey-input {
	margin-bottom: 10px;
}

.monkey-login-button {
	padding-top: 8px;
	border-top-width: 0px;
	justify-content: center;
	border-top-width: 0px;
}

.monkey-login-body {
	padding-bottom: 8px;
}

.monkey-login-footer {
	padding: 16px 8px 16px 16px;
}

.monkey-register-id {
	margin-top: 10px;
}

.monkey-dialog-login {
	width: 350px;
	height: 400px;
}

.monkey-dialog-register {
	width: 500px;
	height: 600px;
}
</style>

</head>

<body>
	<div class="header">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item" id="sub1_Tab"><a class="nav-link liText"
						href="sub1_Tab" onclick=""> Sub1 Page </a></li>
					<li class="nav-item" id="sub2_Tab"><a class="nav-link liText"
						href="sub2_Tab" onclick=""> Sub2 Page </a></li>
					<li class="nav-item" id="sub3_Tab"><a class="nav-link liText "
						href="sub3_Tab" onclick=""> Sub3 Page </a></li>
				</ul>
			</div>
			<button type="button" class="btn btn-secondary btn-lg"
				data-toggle="modal" data-target="#modal_login" onclick="">
				Login</button>

		</nav>


	</div>
	<hr>
</body>

</html>