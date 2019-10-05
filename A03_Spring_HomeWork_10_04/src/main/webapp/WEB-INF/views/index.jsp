<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<%@ include file="common/tools.jsp"%>
<%@ include file="common/cssManage.jsp" %>
<%@ include file="fixSection/header.jsp"%>
<%@ include file="fixSection/usercard.jsp" %>

<c:if test="${page == 'sub1_Tab' || page == null}" >
	<%@include file='floatSection/sub1_Tab.jsp'%>
</c:if>
<c:if test="${page == 'sub2_Tab'}" >
	<%@include file='floatSection/sub2_Tab.jsp'%>
</c:if>
<c:if test="${page == 'sub3_Tab'}" >
	<%@include file='floatSection/sub3_Tab.jsp'%>
</c:if>

<%@ include file="fixSection/modal.jsp"%>
<%@ include file="fixSection/footer.jsp"%>
<%@ include file="common/jsManage.jsp"%>
<%@ include file="common/sessionManage.jsp"%>