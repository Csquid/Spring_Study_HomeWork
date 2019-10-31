/**
 * Create Board
 */
const delObjects = $(".delClass");

$(function() {
	$("#create-board-submit").click(function() {
		const boardFormData = JSON.stringify({
			title : $("#board-title").val(),
			content : $("#board-textarea").val(),
			writer : getSessionUserID(),
		});

		console.log("boardFormData: " + boardFormData);
		
		$.ajax({
			type : "POST",
			url : "/board/create/db",
			data : boardFormData,
			dataType : "json",
			contentType : "application/json",
			success : function(data) {
				console.log(data);
				location.href = "/board/view?idx=" + (data.seqNum);
			}
		});
	});
	
	$("#create-comment-submit").click(function() {
		const commentFormData = JSON.stringify({
			board_idx : $("#hiddenData")[0].innerText,
			content : $("#comment-textarea").val(),
			writer : getSessionUserID(),
		});
		
		$.ajax({
			type : "POST",
			url : "/board/comment/create/db",
			data : commentFormData,
			dataType : "json",
			contentType : "application/json",
			success : function(data) {
				console.log(data);
				location.href = "/board/view?idx=" + (data.seqNum);
			}
		});
	});
	
	$("#modify-board-submit").click(function() {
		const boardFormData = JSON.stringify({
			title : $("#board-title").val(),
			content : $("#board-textarea").val(),
			writer : getSessionUserID(),
			board_idx: $("#board-idx").val()
		});

		$.ajax({
			type : "POST",
			url : "/board/modify/db",
			data : boardFormData,
			dataType : "json",
			contentType : "application/json",
			success : function(data) {
				console.log(data);
				location.href = "/board/view?idx=" + (data.seqNum);
				
				if(data.signal == "success") {
					alert("수정이 완료 되었습니다.");
				} else if(data.signal == "fail" && data.detail == "permission") {
					alert("권한이 없습니다.");
				}
			}
		});
	});
	
	$("#delViewForm").click(function() {
		const setData = JSON.stringify({
			writer : getSessionUserID(),
			board_idx: $("#hiddenData")[0].innerText
		});
		
		$.ajax({
			type: "POST",
			url: "/board/delete/db",
			data: setData,
			dataType: "json",
			contentType : "application/json",
			success: function(data) {
				
				if(data.signal == "success") {
					alert(data.seqNum + "번째 index 게시글이 삭제가 완료 되었습니다.");
					location.href = "/board/";
				} else if(data.signal == "fail") {
					alert("삭제에 실패했습니다.");
					
					if(data.detail == "permission") {
						alert("권한이 없습니다.");
					}
					
				}
			}
		})
	})
	
	//삭제버튼 누르면 해당 라인의 idx를 가져온뒤 post로 ajax 통신
	delObjects.click(function(e) {
		const setData = JSON.stringify({
			writer : getSessionUserID(),
			board_idx: this.parentNode.lastChild.previousSibling.innerText
		});
		
		$.ajax({
			type: "POST",
			url: "/board/delete/db",
			data: setData,
			dataType: "json",
			contentType : "application/json",
			success: function(data) {
				
				if(data.signal == "success") {
					alert(data.seqNum + "번째 index 게시글이 삭제가 완료 되었습니다.");
					location.href = "/board/";
				} else if(data.signal == "fail") {
					alert("삭제에 실패했습니다.");
					
					if(data.detail == "permission") {
						alert("권한이 없습니다.");
					}
					
				}
			}
		})
	})
})