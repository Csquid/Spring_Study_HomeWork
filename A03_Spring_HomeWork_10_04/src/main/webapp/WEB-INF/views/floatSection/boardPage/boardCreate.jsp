<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content "
	style="width: 100%; padding: 50px; background-color: white;">

	<div class="col-12" style="background-color: whitesmoke;">
		<div class="board-header" style="padding: 10px;">
			<h5 style="display: inline;">
				<b>쓰기</b>
			</h5>
		</div>
		<hr style="margin: 0px; margin-bottom: 5px;">
		<div class="board-body" style="padding: 10px;">
			<h3>Title</h3>

			<div class="input-group mb-3">
				<input aria-describedby="basic-addon1" aria-label=""
					class="form-control col-12" placeholder="제목" id="board-title"
					style="border: solid #C1C1C1 1px" type="text">
			</div>

			<h3>Content</h3>

			<textarea class="col-12" id="board-textarea"
				style="height: 500px; resize: none; border: solid #C1C1C1 1px; padding: 15px; margin-bottom: 10px;"></textarea>

			<!-- 만약 파일이 업로드 되었을시 p태그는 사라지고 이미지가 나온다.-->
			<div class="col-12" id="drop"
				style="border: solid #C1C1C1 1px; height: 200px; background-color: white; padding: 15px; margin-bottom: 10px;"
				type="file">
				<p
					style="text-align: center; display: block; position: relative; margin-left: 25%; margin-right: 25%;">여기에
					파일을 드랍하세요</p>
			</div>
			<button class="btn btn-outline-dark" id="board-submit"
				type="submit" value="register">등록</button>
			<a href="/board"><button class="btn btn-outline-dark" style=""
					type="submit" value="cancle">취소</button></a>

		</div>
	</div>

</div>

<script>
	$("#board-title").val()
	
	$(function() {
		$("#board-submit").click(function() {
			const boardFormData = JSON.stringify({
				title: $("#board-title").val(),
				contents: $("#board-textarea").val(),
				creation_userid: '${sessionScope.userInfo.id}',
			});
			
			$.ajax({
				type: "POST",
				url: "/board/create/db",
				data: boardFormData,
				dataType: "json",
				contentType: "application/json",
				success: function(data) {
					console.log(data);
					location.href = "/board/view?idx=" + ((data.seqNum) - 1);
				}
			});	
		});
	})
</script>