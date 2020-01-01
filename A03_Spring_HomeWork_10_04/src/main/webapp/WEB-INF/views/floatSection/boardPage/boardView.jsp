<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.monkey-file {
	margin-bottom: 10px;
	padding-left: 5px;
	padding-right: 5px;
}
</style>
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
				<c:if test="${files != null}">
					<div class="col-12 row"
						style="margin-bottom: 10px; margin-left: 0px; margin-right: 0px; height: auto; border: solid #C1C1C1 1px; padding-top: 10px; background-color: white;">

						<c:forEach var="i" begin="0" end="${files.size() - 1}">
							<img class="col-2 monkey-file"
								src="/resources/${files[i].file_path}" width="100%"
								height="250px">
								<!-- /resources//image/2019/11/04/fd9ece29-adfe-4bf9-9b53-690127a57d29_KakaoTalk_20191102_152024757.jpg -->
						</c:forEach>
					</div>
				</c:if>

				<!-- 유저 댓글들 -->
				<c:if test="${comments != null}">
					<c:forEach var="i" begin="0" end="${comments.size() -1}">
						<div class="row"
							style="margin-right: 0px; margin-left: 0px; margin-bottom: 10px;">
							<p class="col-1"
								style="display: inline; padding: 5px; text-align: center; margin-bottom: 0px;"></p>
							<p class="col-11"
								style="display: inline-block; padding: 5px; margin-bottom: 0px; border: solid #C1C1C1 1px; background-color: whitesmoke; border-bottom: none;">
								┖ ${comments[i].writer}
								<!-- 본인 아니면 나오지가 않음. -->
								<c:if test="${userInfo != null}">
									<c:if test="${comments[i].writer == userInfo.id}">
										<a href="#" class="badge badge-secondary"
											style="float: right; margin-right: 10px; font-size: 100%"
											onclick="deleteComment('${comments[i].comment_idx}', '${comments[i].writer}')">삭제</a>
										<a href="#" id="${comments[i].comment_idx}_modify_button"
											class="badge badge-secondary"
											style="float: right; margin-right: 10px; font-size: 100%"
											onclick="modify('${comments[i].comment_idx}_modify')">수정</a>
									</c:if>
								</c:if>
							</p>
							<p class="col-1"></p>
							<!-- 만약 본인이며, 수정버튼을 누르면 커서가 안을 가리키며 수정을 할수있고 완료 버튼이 나온다. -->
							<textarea class="col-11" disabled
								id="${comments[i].comment_idx}_modify"
								style="height: 100%; resize: none; border: solid #C1C1C1 1px; padding: 15px; background-color: white;">${comments[i].content}</textarea>
							<p class="col-1" style="display: inline; padding: 5px; text-align: center; margin-bottom: 0px;"></p>
							<!-- 완료 버튼, 본인이 아니면 수정 요청 자체가 불가능. -->
							<div style="display: none; padding: 0px;" class="col-11" id="${comments[i].comment_idx}_modify_submit_form">
								<p class="col-12"
									style="display: inline-block; padding: 5px; margin-bottom: 0px; border: solid #C1C1C1 1px; background-color: whitesmoke; border-top: none;">
									<a href="#"
										onclick="modifyComment(${comments[i].comment_idx}, '${comments[i].writer}', $('#' + '${comments[i].comment_idx}_modify'))"
										class="badge badge-secondary"
										style="float: left; margin-right: 10px; font-size: 100%">완료</a>
									<a href="#" class="badge badge-secondary"
										style="font-size: 100%;"
										onclick="location.href = '/board/view?idx=${boardContent.board_idx}'">취소</a>
								</p>
							</div>

						</div>
					</c:forEach>
				</c:if>
				<!-- history.back(); -->
				<!-- 로그인을 하면 댓글 달수있다. -->
				<p
					style="padding: 5px; margin-bottom: 0px; border: solid #C1C1C1 1px; background-color: whitesmoke; border-bottom: none;">댓글쓰기</p>
				<textarea class="col-12" id="comment-textarea"
					style="height: 150px; resize: none; border: solid #C1C1C1 1px; padding: 15px; background-color: white;"
					${userInfo == null ? 'disabled placeholder="로그인이 필요합니다."' : null}></textarea>
				<button class="btn btn-outline-dark" style="margin-top: 10px;"
					id="create-comment-submit" type="submit" value="register"
					${userInfo == null ? 'disabled' : null}>등록</button>


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

	(function($) {
		$.fn.setCursorToTextEnd = function() {
			$initialVal = this.val();
			this.val($initialVal + ' ');
			this.val($initialVal);
		};
	})(jQuery);

	function modify(e) {
		$("#" + e).removeAttr("disabled");
		$("#" + e).focus();
		$("#" + e).setCursorToTextEnd();
		$("#" + e + "_submit_form").css("display", "inline");
		$("#" + e + "_button").css("display", "none");
	}
	
	function modifyComment(idx, getWriter, getContent) {
		console.log("idx: " + idx + ", writer: " + getWriter, ", content: " + getContent.val());
		if(getWriter == '${userInfo.id}') {
			const setData = JSON.stringify({
				writer : getWriter,
				content: getContent.val(),
				comment_idx: idx,
				board_idx: '${boardContent.board_idx}'
			});
			$.ajax({
				type: "POST",
				url: "/board/commnet/modify/db",
				data: setData,
				dataType: "json",
				contentType : "application/json",
				success: function(data) {
					
					if(data.signal == "success") {
						location.href = "/board/view?idx=" + (data.seqNum);
					} else if(data.signal == "fail") {
						alert("업데이트에 실패했습니다.");
					}
				}
			});
		}	
	}
	
	function deleteComment(idx, getWrite) {
		console.log("[deleteComment] idx: " + idx + ", writer: " + getWrite);
		
		//세션을 이용하여 주인 인지 확인
		if(getWrite == '${userInfo.id}') {
			const setData = JSON.stringify({
				comment_idx: idx,
				board_idx: '${boardContent.board_idx}'
			});
			
			$.ajax({
				type: "POST",
				url: "/board/comment/delete/db",
				data: setData,
				dataType: "json",
				contentType : "application/json",
				success: function(data) {
					if(data.signal == "success") {
						location.href = "/board/view?idx=" + (data.seqNum);
					} else if(data.signal == "fail") {
						alert("삭제에 실패했습니다.");
					}
				}
			})
		}
	}
	
	console.log('${sessionScope.board_cnt}')
</script>