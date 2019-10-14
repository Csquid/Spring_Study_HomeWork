<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content row" style="height: 100%;" style="">
	<div class="col-lg-3" id="admin-page-side" style="margin-top: 30px;">
		<a href="/admin" style="color: #6c757d; text-decoration: none;">
			<h1>Admin Page</h1>
		</a>
		<ul style="list-style: none;">
			<li><a href="/admin/user_table" style="color: black;">
					<h2>User Table</h2>
			</a></li>
			<li><a href="/admin/user_table/search" style="color: black;">
					<h2>User Table Role</h2>
			</a></li>
		</ul>
	</div>
	<div class="col-lg-9 row">
		<div class="container">
			<div style="margin-top: 30px;">
				<h3 style="display: inline">User Table</h3>
			</div>

			<table class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Gender</th>
						<th>Address</th>
						<th>Role</th>
						<th>Modify</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" begin="0" end="${userInfoTable.size() - 1}">
						<tr>
							<th scope="row">${userInfoTable[i].id}</th>
							<td id="table-name">${userInfoTable[i].name}</td>
							<td id="table-gender">${userInfoTable[i].gender}</td>
							<td id="table-address">${userInfoTable[i].address}</td>
							<!-- <td id="table-role">${userInfoTable[i].role}</td> -->
							<td><select class="custom-select" id="table-role">
									<option value="admin" selected>admin</option>
									<option value="staff">staff</option>
									<option value="silver">silver</option>
									<option value="bronze">bronze</option>
									<option value="iron">iron</option>
							</select></td>
							<td><button class="btn btn-outline-secondary" type="button"
									id="check-overlap-id" style="width: 100%">Check</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>