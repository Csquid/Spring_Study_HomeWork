<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/resources/js/dropzone.js"></script>
<link href="/resources/css/dropzone.css" rel="stylesheet">
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
			<form action="/board/create/db" id="board_form" method="post"
				role="form">
				<h3>Title</h3>

				<div class="input-group mb-3">
					<input aria-describedby="basic-addon1" aria-label=""
						class="form-control col-12" id="board-title" name="board-title"
						placeholder="제목" style="border: solid #C1C1C1 1px" type="text">
				</div>

				<h3>Content</h3>

				<textarea class="col-12" id="board-textarea" name="board-textarea"
					style="height: 500px; resize: none; border: solid #C1C1C1 1px; padding: 15px; margin-bottom: 10px;"></textarea>

				<div class="outerDorpzone">
					<br />
					<div class="dropzone" id="dZUpload">
						<div class="dz-default dz-message">Drop files here or click to upload.</div>
					</div>
				</div>
				<!-- 파일 업로드 부분 프로미스로 먼저 실행뒤 submit -->
				<div class="hiddenAppend" style="display: none;"></div>
			</form>
			<!-- 잠시대기 -->
			<!-- 	<button id="write">파일업로드 테스트</button> -->

			<div class="form-group">
				<label>작성자</label> <input class="form-control" name='id'
					type="hidden" value="${sessionScope.userInfo.id}" />
			</div>

			<!-- board.js ajax call -->
			<button class="btn btn-outline-dark" id="create-board-submit"
				type="submit" value="register">등록</button>
			<!-- move page /board -->
			<a href="/board">
				<button class="btn btn-outline-dark" type="submit" value="cancle">취소</button>
			</a>
		</div>
	</div>
</div>
<script>
    Dropzone.autoDiscover = false;
    var formData = new FormData();
    var file_name;
	
    $(document).ready(function () {

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
				file_name = data;
				console.log(data[0]);
				console.log(data.length);
				var li="";
				for(var i = 0; i < data.length; i++){
					li += "<input name='fileUploadVO["+i+"].file_path' value='"+data[i].file_path+"'/> <br>";
					li += "<input name='fileUploadVO["+i+"].file_name_original' value='"+data[i].file_name_original+"'/> <br>";
					li += "<input name='fileUploadVO["+i+"].file_name_stored' value='"+data[i].file_name_stored+"'/> <br>";
					alert(data[i].file_name_original);
					$('#hiddenAppend').append(li);
				}
				sendData = data;
				form.append(li);
				//$("#board_form").append(str);
				/* $("#board_form").append('<input type="submit" id="submit"/>');
				$("#submit").trigger("click"); */
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