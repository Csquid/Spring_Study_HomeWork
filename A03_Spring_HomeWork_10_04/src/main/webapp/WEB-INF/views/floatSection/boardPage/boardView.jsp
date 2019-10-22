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
					style="display: inline; padding: 0px; padding-top: 0; font-size: 20px;">${boardContent.creation_userid}</p>
				<div class="col-12"
					style="padding: 5px 5px 5px 10px; margin-bottom: 10px; height: 35px; border: solid #C1C1C1 1px; border-radius: 0.25em; background-color: white">
					<p>${boardContent.title}</p>
				</div>
				<hr style="margin: 0px; margin-bottom: 5px;">
				<h3>Content</h3>
				<div id="out">
					<textarea class="col-12" disabled id=""
						style="height: 500px; resize: none; border: solid #C1C1C1 1px; padding: 15px; background-color: white;">${boardContent.contents}</textarea>
				</div>
				<div style="margin-top: 10px;"></div>
				<p style="padding: 5px; margin-bottom: 0px; border: solid #C1C1C1 1px; background-color: whitesmoke; border-bottom: none;">댓글쓰기</p>
				<textarea class="col-12" id=""
					style="height: 150px; resize: none; border: solid #C1C1C1 1px; padding: 15px; background-color: white;">안녕</textarea>
				<button class="btn btn-outline-dark" style="margin-top: 10px;"
					type="submit" value="register">등록</button>
				<a href="/board/"><button class="btn btn-outline-dark" style="margin-top: 10px;"
					type="submit" value="mvMenu">메뉴가기</button></a> 
			</div>
		</div>
	</div>
</div>