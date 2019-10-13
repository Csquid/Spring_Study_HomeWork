<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content row" style="height: 100%;">
	<div class="col-lg-2" style="margin-top: 30px;">
		<h1 style="color: #6c757d">Admin Page</h1>
	</div>
	<div class="col-lg-10 row">
		<div class="container">
			<h3>User Table</h3>
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
					<tr>
						<!-- th: 컬럼 쪽 font를 진하기를 준다. -->
						<th scope="row">admin</th>
						<td id="table-name">user1</td>
						<td id="table-gender">man</td>
						<td id="table-address">daegu</td>
						<td id="table-role">admin</td>
					</tr>
					<tr>
						<th scope="row"></th>
						<td id="table-name"></td>
						<td id="table-gender"></td>
						<td id="table-address"></td>
						<td id="table-role"></td>
					</tr>
					<tr>
						<th scope="row"></th>
						<td id="table-name"></td>
						<td id="table-gender"></td>
						<td id="table-address"></td>
						<td id="table-role"></td>
					</tr>
					<tr>
						<th scope="row"></th>
						<td id="table-name"></td>
						<td id="table-gender"></td>
						<td id="table-address"></td>
						<td id="table-role"></td>
					</tr>
					<tr>
						<th scope="row"></th>
						<td id="table-name"></td>
						<td id="table-gender"></td>
						<td id="table-address"></td>
						<td id="table-role"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>