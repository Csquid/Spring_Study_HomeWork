<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/resources/js/dropzone.js"></script>
<link href="/resources/css/dropzone.css" rel="stylesheet">
<div class="content"
	style="width: 100%; padding: 50px; background-color: white;">
	<div class="col-12" style="background-color: whitesmoke;">
		<div class="board-header" style="padding: 10px;">
			<h5 style="display: inline;">
				<input id="board-idx" value="${boardContent.board_idx}"
					style="display: none;"> <b>Modify</b>
			</h5>
		</div>
		<hr style="margin: 0px; margin-bottom: 5px;">

		<div class="board-body" style="padding: 10px;">
			<img alt="" src="/images/user2.png" style="margin-bottom: 10px;"
				width="35px;">
			<h3 style="display: inline;">${boardContent.writer}</h3>
			<div class="input-group mb-3">
				<input class="form-control" id="board-title"
					style="border: solid #C1C1C1 1px; display: inline;" type="text"
					value="${boardContent.title}">
			</div>

			<hr style="margin: 0px; margin-bottom: 5px;">
			<h3>Content</h3>
			<textarea class="col-12" id="board-textarea"
				style="height: 500px; resize: none; border: solid #C1C1C1 1px; padding: 15px;">${boardContent.content}</textarea>
			<div style="margin-top: 10px;"></div>
			<div class="outerDorpzone">
				<br />
				<div class="dropzone" id="dZUpload">
					<div class="dz-default dz-message">Drop files here or click
						to upload.</div>
				</div>
			</div>
			<button class="btn btn-outline-dark" style="margin-top: 10px;"
				id="modify-board-submit" type="submit" value="register">수정하기</button>
			<button class="btn btn-outline-dark" style="margin-top: 10px;"
				type="submit" value="mvMenu" onclick="history.back();">취소하기</button>
		</div>
	</div>
</div>

<script>
Dropzone.autoDiscover = false;
var formData = new FormData();
var file_name;

$(document).ready(function () {
	
	$.ajax({
		url: "/board/fileUpload",
		type: "POST",
		//contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		contentType : false,
        processData : false,
		data: formData,
		success : function(data){
			//list형식으로 files data들이 콜백으로 들어옴
			console.log(data);
		}
	})
	
    var myDropzone = new Dropzone("div#dZUpload", {
        url: "/board/board_file",
        addRemoveLinks: true,
        removedfile: function (file) {
            formData.delete(file.name);
            file.previewElement.remove();
        },
        init: function () {
            const thisDropzone = this;
            const mockFile1 = { name: 'Name Image', size: 12345, type: 'image/jpeg' };
            const mockFile2 = { name: 'Name Image', size: 12345, type: 'image/jpeg' };
           	
            $.each()
            thisDropzone.emit("success", mockFile1);
            thisDropzone.emit("addedfile", mockFile1);
            thisDropzone.emit("thumbnail", mockFile1, "http://localhost:8080/resources//image/2019/11/04/fd9ece29-adfe-4bf9-9b53-690127a57d29_KakaoTalk_20191102_152024757.jpg");
            thisDropzone.emit("complete", mockFile1);
            
            thisDropzone.emit("success", mockFile2);
            thisDropzone.emit("addedfile", mockFile2);
            thisDropzone.emit("thumbnail", mockFile2, "http://localhost:8080/resources//image/2019/11/04/ced2702b-2713-45f0-9247-734b7b6c5cef_bono_icon.jpg");
            thisDropzone.emit("complete", mockFile2);
            
            $('.dz-image').find('img').css({"width": "120px", "height": "120px"});
            //$('.dz-image').find('img').css("zoom", "0.2");
        }
    });
	
    myDropzone.on("thumbnail", function (file) {
        formData.append(file.name, dataURLtoBlob(file.dataURL), file.name);
        console.log("filename: " + file.name);
        console.log(dataURLtoBlob(file.dataURL));
        console.log("formData: " + formData);
    });

});

// **dataURL to blob**
// 파일의 size와 type을 리턴해줌.
function dataURLtoBlob(dataurl) {
    var arr = dataurl.split(','),
        mime = arr[0].match(/:(.*?);/)[1],
        bstr = atob(arr[1]),
        n = bstr.length,
        u8arr = new Uint8Array(n);
    while (n--) {
        u8arr[n] = bstr.charCodeAt(n);
    }
    return new Blob([u8arr], { type: mime });
}
let sendData;

$(document).on("click", "#create-board-submit", function(e) {
	var form = $('#board_form');
	e.preventDefault();
	$.ajax({
		url: "/board/fileUpload",
		type: "POST",
		//contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		contentType : false,
        processData : false,
		data: formData,
		success : function(data){
			//list형식으로 files data들이 콜백으로 들어옴
			sendData = data;
			console.log(sendData);
		}
	}).done(function() {
		/*
		if(($('#title').val() == '') || ($('#content').val() == '')){
			alert("제목 또는 내용을 입력해주세요 ~~");
			return false;
		} 
		alert("전송하자구");
		form.submit();
		*/
		
		const boardFormData = JSON.stringify({
			title : $("#board-title").val(),
			content : $("#board-textarea").val(),
			writer : getSessionUserID(),
			boardFileVO: sendData
		});
		
		console.log("boardFormData: " + boardFormData);
		if(boardFormData.title == '' || boardFormData.content == '') {
			alert("제목과 내용을 적어주세요.");
			
			return;
		}
		
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
});
</script>