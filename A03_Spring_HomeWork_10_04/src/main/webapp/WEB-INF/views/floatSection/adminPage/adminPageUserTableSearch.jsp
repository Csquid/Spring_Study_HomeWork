<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content row" style="height: 100%;" style="">
	<%@include file='side.jsp'%>
	<div class="col-lg-10 row">
		<div class="" style="min-width: 500px;">
			<div style="margin-top: 30px; margin-bottom: 30px;">
				<h3 style="display: inline">User Table</h3>
			</div>
			<form action="/admin/user_table/search" method="get">
				<div class="input-group col-6"
					style="margin-bottom: 30px; padding-left: 0px;">
					<!-- resource/common.js 4번째 라인 searchType 변경시 href로 호출로 값을 받아와서 jquery로 처리.-->
					<!--  -->
					<select name="searchType" id="searchType" class="custom-select">
						<option value="role">role</option>
						<option value="gender">gender</option>
						<option value="address">address</option>
					</select>
					<select name="keyword" class="custom-select"
						id="admin-table-select-role">
						<option value="all" selected>All</option>
						<c:forEach var="i" begin="0" end="${fn:length(keywords) - 1}">
							<option value="${keywords[i]}">${keywords[i]}</option>
						</c:forEach>
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
						<th>UID</th>
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
				$(function() {
					$('#searchType').change(function() {
						location.href = "?searchType=" + this.value;
					})
				})
			</script>
		</div>
	</div>
</div>