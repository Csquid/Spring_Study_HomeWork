<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="fixSection/header.jsp"%>


<c:choose>

	<c:when test="${empty page }">
		<div id="content">
			<jsp:include page="floatSection/main.jsp" />
		</div>
	</c:when>
	<c:when test="${page eq 'movieBoard' }">
		<div id="content">
			<jsp:include page="floatSection/board.jsp" />
		</div>

	</c:when>
</c:choose>

<%@ include file="fixSection/footer.jsp"%>


