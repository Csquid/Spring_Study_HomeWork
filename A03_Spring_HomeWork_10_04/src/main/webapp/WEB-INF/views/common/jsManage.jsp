<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new Date(932545204L * 1000)%>" />

<!-- 
<c:set var="sysTime">
	<fmt:formatDate value="${now}" pattern="hh.mm.ss" />
</c:set>
 --> 

<script type="text/javascript" src="/resources/js/footer/modal.js"></script>
<script type="text/javascript" src="/resources/js/footer/account.js"></script>
<script type="text/javascript" src="/resources/js/footer/common.js"></script>