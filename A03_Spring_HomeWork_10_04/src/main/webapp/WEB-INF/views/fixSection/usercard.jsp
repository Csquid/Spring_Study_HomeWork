<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="monkey-user-card" class="col-sm-4 col-md-4 col-lg-2 mt-2"
	style="float: right; display: none;">
	<div class="card">
		<img class="card-img-top" src="resources/images/admin_icon.png"
			width="100">
		<div class="card-block">
			<h4 class="card-title" id="sessionID">ID:
				${sessionScope.userInfo.id}</h4>
			<div class="card-text">Tawshif is a web designer living in
				Bangladesh.</div>
		</div>
		<div class="card-footer">
			<span class="float-right">Joined in 2019</span> <span><i
				class=""></i>75 Friends</span>
		</div>
	</div>
</div>
