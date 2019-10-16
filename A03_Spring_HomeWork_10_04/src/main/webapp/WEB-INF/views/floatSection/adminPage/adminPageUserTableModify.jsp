<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content row" style="height: 100%;">
	<%@include file='side.jsp'%>
	<div class="col-lg-10 row">
		<div class="" style="min-width: 500px;">
			<div style="margin-top: 30px; margin-bottom: 30px;">
				<h3 style="display: inline">User Table</h3>
			</div>
			
			<!--
				만약 asc 버튼을 클릭하면 asc 버튼은 사라지고 desc 버튼이 나오고 
				만약 desc 버튼을 클릭하면 desc 버튼은 사라지고 asc 버튼이 나온다.	
			--> 
							
			<table class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
						<th> UID ${img_sort_asc} </th>
						 
						 <!-- asc -->
						 <!-- <img src="/images/sort_asc.svg" class="monkey-image-sort"> -->
						 <!-- desc -->
						 <!-- <img src="/images/sort_desc.svg" class="monkey-image-sort"> -->
						 
						<th> ID      ${img_sort_desc} </th>
						<th> Name    ${img_sort_desc}  <c:if test="${sort.name == ASC}"> </c:if> </th>
						<th> Gender  ${img_sort_desc} </th>
						<th> Address ${img_sort_desc} </th>
						<th> Role    ${img_sort_desc} </th>
						<th> Modify  ${img_sort_desc} </th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${userInfoTable == null}">
						null data
					</c:if>
					<c:if test="${userInfoTable != null}">
						<c:forEach var="i" begin="0" end="${userInfoTable.size() - 1}">
							<tr>
								<td id="row" style="text-align: center;">${userInfoTable[i].u_id} </td>
								<td id="table-id">${userInfoTable[i].id}</td>
								<td id="table-name">${userInfoTable[i].name}</td>
								<td id="table-gender">${userInfoTable[i].gender}</td>
								<td id="table-address">${userInfoTable[i].address}</td>
								<td id="table-role">${userInfoTable[i].role}</td>
								<td><button class="btn btn-outline-secondary" type="button"
										id="check-overlap-id" style="width: 100%">Check</button></td>
							</tr>
						</c:forEach>
					</c:if>

				</tbody>
			</table>
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
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>