<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="content"
	style="width: 100%; padding: 50px; background-color: white;">
	<div class="col-12" style="background-color: whitesmoke;">
		<div class="board-header" style="padding: 10px;">
			<h5 style="display: inline;">
				<input id="board-idx" value="${boardContent.board_idx}" style="display: none;">
				<b>Modify</b>
			</h5>
		</div>
		<hr style="margin: 0px; margin-bottom: 5px;">

		<div class="board-body" style="padding: 10px;">
			<img alt="" src="/images/user2.png" style="margin-bottom: 10px;"
				width="35px;">
			<h3 style="display: inline;">${boardContent.writer}</h3>
			<div class="input-group mb-3">
				<input class="form-control" id="board-title"
					style="border: solid #C1C1C1 1px; display: inline;" type="text" value="${boardContent.title}">
			</div>

			<hr style="margin: 0px; margin-bottom: 5px;">
			<h3>Content</h3>
			<textarea class="col-12" id="board-textarea"
				style="height: 500px; resize: none; border: solid #C1C1C1 1px; padding: 15px;">${boardContent.content}</textarea>
			<div style="margin-top: 10px;"></div>
			<button class="btn btn-outline-dark" style="margin-top: 10px;"
				id="modify-board-submit" type="submit" value="register">수정하기</button>
			<button class="btn btn-outline-dark" style="margin-top: 10px;"
				type="submit" value="mvMenu" onclick="history.back();">취소하기</button>
		</div>
	</div>
</div>
