<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content" style="padding: 50px;">
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">No</th>
				<th scope="col">글 제목</th>
				<th scope="col">글쓴이</th>
				<th scope="col">추천수</th>
				<th scope="col">조회수</th>
				<th scope="col">날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${boardTable != null}">
				<c:forEach var="i" begin="0" end="${boardTable.size() - 1}">
					<tr>
						<th scope="row">${boardTable[i].idx}</th>
						<td>${boardTable[i].title}</td>
						<td>${boardTable[i].creation_userid}</td>
						<td>${boardTable[i].recommend_count}</td>
						<td>${boardTable[i].history_count}</td>
						<td>${boardTable[i].creation_date}</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<th scope="row">0</th>
				<td>TestBoard</td>
				<td>박보영</td>
				<td>1,147,000</td>
				<td>100,541,614</td>
				<td>2019/08/17</td>
			</tr>
		</tbody>
	</table>
	<a href="/board/create">
		<button class="btn btn-outline-dark" style="float: left;"
			type="submit" value="쓰기">쓰기</button>
	</a>
</div>
