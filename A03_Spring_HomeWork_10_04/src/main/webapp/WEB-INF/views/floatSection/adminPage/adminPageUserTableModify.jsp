<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.HashMap"%>
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
						<c:forEach var="tableMap" items="${tableColumnData}">
							<th>${tableMap.key}
								<!-- TODO: <a href> 태그를 통한 get 방식 값 전달 ♪ 포스팅 하기 ♪  -->
								<a href="?toSort=${tableMap.key}"> 
									${ tableMap.value == 'asc' ? img_sort.desc : img_sort.asc } 
								</a>
							</th>
						</c:forEach>
						<th>Modify</th>
					</tr>
				</thead>
				<tbody>
					<%@include file='table.jsp'%>
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
						<th>
							<form>
								
								<a href="?toSort=id" >
									<img src="/images/sort_asc.svg" class="monkey-image-sort">
								</a>
							</form>
						</th>
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