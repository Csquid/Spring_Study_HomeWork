<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content row" style="height: 100%;" style="">
	<%@include file='side.jsp'%>
	<div class="col-lg-10 row">
		<div class="">
			<div style="margin-top: 30px; margin-bottom: 30px;">
				<h3 style="display: inline">User Table</h3>
			</div>

			<!-- TODO: role로 검색하여 테이블 뜨게 만들기. -->
			<form action="/admin/user_table/search" method="get">
				<div class="input-group col-6"
					style="margin-bottom: 30px; padding-left: 0px;">
					<div class="input-group-prepend">
						<label class="input-group-text">Role</label>
					</div>
					<select name="keyword" class="custom-select"
						id="admin-table-select-role">
						<option value="all" selected>All</option>
						<option value="iron">Iron</option>
						<option value="bronze">Bronze</option>
						<option value="sliver">Sliver</option>
						<option value="gold">Gold</option>
						<option value="platinum">Platinum</option>
						<option value="diamond">Diamond</option>
						<option value="staff">Staff</option>
						<option value="admin">Admin</option>
					</select>
					<div class="input-group-append">
						<button id="admin-table-search-role-button"
							class="btn btn-outline-secondary" type="submit">Search</button>
					</div>
				</div>
			</form>
			<form action="/admin/user_table/search" method="get">
				<div class="input-group col-6"
					style="margin-bottom: 30px; padding-left: 0px;">
					<div class="input-group-prepend">
						<label class="input-group-text">Role</label>
					</div>
					<select name="keyword" class="custom-select"
						id="admin-table-select-role">
						<option value="all" selected>All</option>
						<option value="iron">Iron</option>
						<option value="bronze">Bronze</option>
						<option value="sliver">Sliver</option>
						<option value="gold">Gold</option>
						<option value="platinum">Platinum</option>
						<option value="diamond">Diamond</option>
						<option value="staff">Staff</option>
						<option value="admin">Admin</option>
					</select>
					<div class="input-group-append">
						<button id="admin-table-search-role-button"
							class="btn btn-outline-secondary" type="submit">Search</button>
					</div>
				</div>
			</form>

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
					<%@include file='table.jsp'%>
				</tbody>
			</table>
			<script type="text/javascript">
				console.log("uri: " + "${uri}");
			</script>
		</div>
	</div>
</div>