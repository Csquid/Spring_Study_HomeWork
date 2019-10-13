<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content row" style="height: 100%;">
	<div class="col-lg-2" style="margin-top: 30px;">
		<h1 style="color: #6c757d">Admin Page</h1>
	</div>
	<div class="col-lg-10 row">
		<div class="container">
			<h3 style="margin-top: 30px;">User Table</h3>
			<table class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Gender</th>
						<th>Address</th>
						<th>Role</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" begin="0" end="${userInfoTable.size() - 1}">
						<tr>
							<th scope="row">${userInfoTable[i].id}</th>
							<td id="table-name">${userInfoTable[i].name}</td>
							<td id="table-gender">${userInfoTable[i].gender}</td>
							<td id="table-address">${userInfoTable[i].address}</td>
							<td id="table-role">${userInfoTable[i].role}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>