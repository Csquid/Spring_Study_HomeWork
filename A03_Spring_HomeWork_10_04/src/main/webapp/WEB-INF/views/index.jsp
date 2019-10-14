<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>


<%@ include file="common/tools.jsp"%>
<%@ include file="common/cssManage.jsp"%>
<%@ include file="fixSection/header.jsp"%>
<%@ include file="fixSection/usercard.jsp" %>

<c:if test="${page == 'home' || page == null}">
	<%@include file='floatSection/home.jsp'%>
</c:if>
<c:if test="${page == 'sub1_Tab'}">
	<%@include file='floatSection/subs/sub1_Tab.jsp'%>
</c:if>
<c:if test="${page == 'sub2_Tab'}">
	<%@include file='floatSection/subs/sub2_Tab.jsp'%>
</c:if>
<c:if test="${page == 'sub3_Tab'}">
	<%@include file='floatSection/subs/sub3_Tab.jsp'%>
</c:if>
<c:if test="${page == 'parallax'}">
	<%@include file='floatSection/parallax.jsp'%>
</c:if>
<c:if test="${page == 'admin'}">
	<%@include file='floatSection/adminPage/adminPage.jsp'%>
</c:if>
<c:if test="${page == 'admin_table'}">
	<%@include file='floatSection/adminPage/adminPageUserTable.jsp'%>
</c:if>
<c:if test="${page == 'admin_table_role'}">
	<%@include file='floatSection/adminPage/adminPageUserTableRole.jsp'%>
</c:if>

<%@ include file="fixSection/modal.jsp"%>
<%@ include file="fixSection/footer.jsp"%>
<%@ include file="common/sessionManage.jsp"%>
<%@ include file="common/jsManage.jsp"%>