<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${userInfoTable == null}">
	null data
</c:if>
<c:if test="${userInfoTable != null}">
	<c:forEach var="i" begin="0" end="${userInfoTable.size() - 1}">
		<tr>
			<th id="row">${userInfoTable[i].u_id}</th>
			<th id="table-id">${userInfoTable[i].id}</th>
			<td id="table-name">${userInfoTable[i].name}</td>
			<td id="table-gender">${userInfoTable[i].gender}</td>
			<td id="table-address">${userInfoTable[i].address}</td>
			<td id="table-role">${userInfoTable[i].role}</td>
			<td><button class="btn btn-outline-secondary" type="button"
					id="check-overlap-id" style="width: 100%">Check</button></td>
		</tr>
	</c:forEach>
</c:if>
