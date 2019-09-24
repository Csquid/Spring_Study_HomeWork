<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file="fixSection/header.jsp"%>

<c:if test="${page == 'sub1_Tab' || page == null}" >
	<%@include file='floatSection/sub1_Tab.jsp'%>
</c:if>
<c:if test="${page == 'sub2_Tab'}" >
	<%@include file='floatSection/sub2_Tab.jsp'%>
</c:if>
<c:if test="${page == 'sub3_Tab'}" >
	<%@include file='floatSection/sub3_Tab.jsp'%>
</c:if>

<%@ include file="fixSection/footer.jsp"%>