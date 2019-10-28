<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content"
	style="width: 100%; padding: 50px; background-color: white;">
	<div class="col-12" style="background-color: whitesmoke;">
		<div class="board-header" style="padding: 10px;">
			<div class="board-body" style="padding: 10px;">
				<img alt="" src="/images/user2.png"
					style="display: inline; margin-bottom: 10px;" width="35px;">

				<p class="col-2"
					style="display: inline; padding: 0px; padding-top: 0; font-size: 20px;">
					<b>${boardContent.writer}</b>

				</p>
				<div class="col-12"
					style="padding: 10px; height: 50px; border: solid #C1C1C1 1px; border-radius: 0.25em; background-color: white">
					<p>${boardContent.title}</p>
				</div>
				<hr style="margin: 0px; margin-bottom: 5px;">
				<h3>Content</h3>
				<textarea class="col-12" disabled id=""
					style="height: 500px; resize: none; border: solid #C1C1C1 1px; padding: 15px; background-color: white;">${boardContent.content}</textarea>
				<div style="margin-top: 10px;"></div>
				
				<c:if test="${comments.size() != 0}">
					<c:forEach var="i" begin="0" end="${comments.size() -1}">
					<div class="row" style="margin-right: 0px; margin-left: 0px; margin-bottom: 10px;">
						<p class="col-1" style="display: inline; padding: 5px; text-align: center; margin-bottom: 0px;"></p>
						<p class="col-11" style="display: inline-block; padding: 5px; margin-bottom: 0px; border: solid #C1C1C1 1px; background-color: whitesmoke; border-bottom: none;">┖ ${comments[i].writer}
							<a href="#" class="badge badge-secondary" style="float: right; margin-right: 10px; font-size: 100%">x</a>
							<a href="#" class="badge badge-secondary" style="float: right; margin-right: 10px; font-size: 100%">Modify</a>
						</p>
						<p class="col-1"></p>
						<textarea class="col-11" disabled id="" style="height: 100%; resize: none; border: solid #C1C1C1 1px; padding: 15px; background-color: white;">${comments[i].content}</textarea>
					</div>
					</c:forEach>
				</c:if>
				<p style="padding: 5px; margin-bottom: 0px; border: solid #C1C1C1 1px; background-color: whitesmoke; border-bottom: none;">댓글쓰기</p>
				<textarea class="col-12" id="comment-textarea"
					style="height: 150px; resize: none; border: solid #C1C1C1 1px; padding: 15px; background-color: white;"
					${userInfo == null ? 'disabled placeholder="로그인이 필요합니다."' : null}></textarea>
				<button class="btn btn-outline-dark" style="margin-top: 10px;" id="create-comment-submit"
					type="submit" value="register" ${userInfo == null ? 'disabled' : null}>등록</button>


				<a href="/board/">
					<button class="btn btn-outline-dark" style="margin-top: 10px;"
						type="submit" value="mvMenu">메뉴가기</button>
				</a>
				<button class="btn btn-outline-dark"
					style="margin-top: 10px; float: right; display: none;"
					type="submit" id="delViewForm">삭제</button>
				<a href="/board/modify?idx=${boardContent.board_idx}">
					<button class="btn btn-outline-dark"
						style="margin-top: 10px; float: right; display: none;"
						type="submit" id="haveCheck">수정</button>
				</a>

			</div>
		</div>
	</div>
	<span style="display: none;" id="hiddenData">${boardContent.board_idx}</span>
</div>
<script>
	if ('${haveUserBoard}' == 'true') {
		console.log("haveUserBoard true");
		$("#haveCheck").css("display", "inline");
		$("#delViewForm").css("display", "inline")
	} else {
		console.log("haveUserBoard false");
		$("#haveCheck").css("display", "none");
		$("#delViewForm").css("display", "none")
	}

	console.log('${sessionScope.board_cnt}')
</script>