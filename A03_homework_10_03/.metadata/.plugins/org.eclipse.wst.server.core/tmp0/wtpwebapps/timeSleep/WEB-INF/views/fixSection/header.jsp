<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<%@ include file="../common/commonLib.jsp"%>
<link rel="stylesheet" type="text/css" href="../resources/header.css" />
<script>
	(function($) {
		"use strict";

		$(function() {
			var header = $(".start-style");
			$(window).scroll(function() {
				var scroll = $(window).scrollTop();

				if (scroll >= 10) {
					header.removeClass('start-style').addClass("scroll-on");
				} else {
					header.removeClass("scroll-on").addClass('start-style');
				}
			});
		});

		//Animation

		$(document).ready(function() {
			$('body.hero-anime').removeClass('hero-anime');
		});

		//Menu On Hover

		$('body').on('mouseenter mouseleave', '.nav-item', function(e) {
			if ($(window).width() > 750) {
				var _d = $(e.target).closest('.nav-item');
				_d.addClass('show');
				setTimeout(function() {
					_d[_d.is(':hover') ? 'addClass' : 'removeClass']('show');
				}, 1);
			}
		});

		//Switch light/dark

		$("#switch").on('click', function() {
			if ($("body").hasClass("dark")) {
				$("body").removeClass("dark");
				$("#switch").removeClass("switched");
			} else {
				$("body").addClass("dark");
				$("#switch").addClass("switched");
			}
		});

	})(jQuery);
</script>
</head>
<body class="hero-anime">

	<div class="navigation-wrap bg-light start-header start-style ">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="navbar navbar-expand-md navbar-light">

						<a class="navbar-brand"
							href="https://themeforest.net/user/ig_design/portfolio"
							target="_blank"><img
							src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1462889/logo.svg"
							alt=""></a>

						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>

						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav ml-auto py-4 py-md-0">
								<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4"><a
									class="nav-link" href="/">Home</a></li>
								<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4"><a
									class="nav-link" href="#">Portfolio</a></li>
								<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4"><a
									class="nav-link" href="#">Agency</a></li>
								<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4"><a
									class="nav-link dropdown-toggle" data-toggle="dropdown"
									href="#" role="button" aria-haspopup="true"
									aria-expanded="false">
									<!-- 여러가지 서비스 이동하기 -->
									Services</a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="/floatSection/board">영화커뮤니티</a> <a
											class="dropdown-item" href="#">Another action</a> <a
											class="dropdown-item" href="#">Something else here</a> <a
											class="dropdown-item" href="#">Another action</a>
									</div></li>
								<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4"><a
									class="nav-link" href="#">Journal</a></li>
								<li class="nav-item pl-4 pl-md-0 ml-0 ml-md-4"><a
									class="nav-link" href="/move/login">login</a></li>
							</ul>
						</div>

					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- <div class="section full-height">
		<div class="absolute-center">
		
		</div>
	</div> -->
	<div class="my-5 py-5"></div>
