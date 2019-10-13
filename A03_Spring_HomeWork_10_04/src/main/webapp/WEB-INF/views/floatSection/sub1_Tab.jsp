<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content row">
	<div class="col-lg-2" style="margin-top: 30px;">
		<h1 style="color: #6c757d">Sub1 Page</h1>
	</div>
	<div class="images col-12 col-sm-12 col-md-12 col-lg-10 row"
		style="margin-top: 30px;">
		<c:forEach var="i" begin="1" end="16">
			<div class="card col-12 col-sm-12 col-md-6 col-lg-3"
				style="width: 15rem; display: inline-block">
				<img src="/resources/images/card_1.jpg" class="card-img-top"
					alt="...">
				<div class="card-body">
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
				</div>
			</div>
		</c:forEach>
	</div>


</div>
