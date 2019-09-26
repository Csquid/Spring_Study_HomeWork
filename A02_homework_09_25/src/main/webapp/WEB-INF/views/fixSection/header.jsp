<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<!-- BootStrap Include -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
<!-- jQuery Include -->
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<style type="text/css">
	.liText {
		font-size: 30px;
	}
</style>
</head>

<body>
	<div class="header">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
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
						<a class="nav-link liText" href="sub3_Tab" onclick="">
							Pricing
						</a>
					</li>
				</ul>
			</div>
		</nav>
		<!-- src: floatSection/sub{?} -->
		<!--
		<button type="button" class="btn-primary col" onclick="location.href='floatSection/sub1_Tab'">
			sub1
		</button>
		<button type="button" class="btn-primary col" onclick="location.href='floatSection/sub2_Tab'">
			sub2
		</button>
		<button type="button" class="btn-primary col" onclick="location.href='floatSection/sub3_Tab'">
			sub3
		</button>
	-->

		<!-- 
		<button type="button" class="btn-primary col" onclick="location.href='sub1_Tab'">
			sub1
		</button>
		<button type="button" class="btn-primary col" onclick="location.href='sub2_Tab'">
			sub2
		</button>
		<button type="button" class="btn-primary col" onclick="location.href='sub3_Tab'">
			sub3
		</button>
	-->
		
		<script type="">
			const thisLiEliment = $("#" + "${page}");
		
			thisLiEliment.addClass("active");
		</script>
	</div>
	<hr>
</body>

</html>