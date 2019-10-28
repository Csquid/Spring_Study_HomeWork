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
				<th scope="col" style="text-align: center;">추천수</th>
				<th scope="col" style="text-align: center;">조회수</th>
				<th scope="col">날짜</th>
				<th scope="col" style="text-align: center;">삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${boardTable.size() != 0}">
				<c:forEach var="i" begin="0" end="${boardTable.size() - 1}">
					<tr>
						<th scope="row">${boardTable[i].board_idx}</th>
						<td style="cursor:pointer;" 
						onclick="location.href='/board/view?idx=${boardTable[i].board_idx}'">
						${boardTable[i].title}</td>
						<td>${boardTable[i].writer}</td>
						<td style="text-align: center;">${boardTable[i].recommend_count}</td>
						<td style="text-align: center;">${boardTable[i].history_count}</td>
						<td>${boardTable[i].creation_date}</td>
						<td style="text-align: center;">
						<c:if test="${userHavePostArray.contains(boardTable[i].board_idx)}">
							<span style="cursor:pointer;" class="delClass">X</span>
							<p style="display: none;">${boardTable[i].board_idx}</p>
						</c:if>
						</td>
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
				<td></td>
			</tr>
		</tbody>
	</table>
	<a href="/board/create">
		<button class="btn btn-outline-dark" style="float: left;"
			type="submit" value="쓰기">쓰기</button>
	</a>
</div>
