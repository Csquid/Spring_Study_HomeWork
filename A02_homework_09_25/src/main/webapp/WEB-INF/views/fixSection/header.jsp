<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<!-- BootStrap Include -->

<!-- jQuery Include -->
<%@ include file="../common/tools.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<style type="text/css">
	.liText {
		font-size: 30px;
	}
</style>
</head>

<body>
	<div class="header">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item" id="sub1_Tab">
						<a class="nav-link liText" href="sub1_Tab" onclick="">
							Home
						</a>
					</li>
					<li class="nav-item" id="sub2_Tab">
						<a class="nav-link liText" href="sub2_Tab" onclick="">
							Features
						</a>
					</li>
					<li class="nav-item" id="sub3_Tab">
						<a class="nav-link liText " href="sub3_Tab" onclick="">
							Pricing
						</a>
					</li>	
				</ul>
			</div>
			<button type="button" class="btn btn-secondary btn-lg" 
				    data-toggle="modal" data-target="#myModal">
				Login
			</button>
			
		</nav>

		
		<script type="">
			const thisLiEliment = $("#" + "${page}");
		
			thisLiEliment.addClass("active");
		</script>
	</div>
	<hr>
</body>

</html>