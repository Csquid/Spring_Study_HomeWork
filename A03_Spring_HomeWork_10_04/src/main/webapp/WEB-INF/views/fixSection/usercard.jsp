<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.card {
	font-size: 1em;
	overflow: hidden;
	padding: 0;
	border: none;
	border-radius: .28571429rem;
	box-shadow: 0 1px 3px 0 #d4d4d5, 0 0 0 1px #d4d4d5;
}

.card-block {
	font-size: 1em;
	position: relative;
	margin: 0;
	padding: 1em;
	border: none;
	border-top: 1px solid rgba(34, 36, 38, .1);
	box-shadow: none;
}

.card-img-top {
	display: block;
	width: 100%;
	height: auto;
}

.card-title {
	font-size: 1.28571429em;
	font-weight: 700;
	line-height: 1.2857em;
}

.card-text {
	clear: both;
	margin-top: .5em;
	color: rgba(0, 0, 0, .68);
}

.card-footer {
	font-size: 1em;
	position: static;
	top: 0;
	left: 0;
	max-width: 100%;
	padding: .75em 1em;
	color: rgba(0, 0, 0, .4);
	border-top: 1px solid rgba(0, 0, 0, .05) !important;
	background: #fff;
}

.card-inverse .btn {
	border: 1px solid rgba(0, 0, 0, .05);
}
</style>
</head>
<body>
	<div class="col-sm-2 col-md-2 col-lg-2 mt-2" style="float: right;">
		<div class="card">
			<img class="card-img-top" src="https://picsum.photos/200/150/?random">
			<div class="card-block">
				<h4 class="card-title">Tawshif Ahsan Khan</h4>
				<div class="meta">
					<a href="#">Friends</a>
				</div>
				<div class="card-text">Tawshif is a web designer living in
					Bangladesh.</div>
			</div>
			<div class="card-footer">
				<span class="float-right">Joined in 2013</span> <span><i
					class=""></i>75 Friends</span>
			</div>
		</div>
	</div>
</body>
</html>