var checkUserInfo = null;

const buttonLogin = $("#button_login");
const buttonLogout = $("#button_logout");
const monkeyUserCard = $("#monkey-user-card");

init();

function init(checkUserInfo) {
	// el 태그를 사용하여 세션 정보 불러오기
	// 세션 정보가 있으면 유저 카드 [display: none] 해제
	//var checkUserInfo = '${sessionScope.userInfo}';

	if (checkUserInfo === '') {
		console.log("checkUserInfo is null");
		checkUserInfo = null;
	}

	if (checkUserInfo == null) {
		monkeyUserCard.css("display", "none");

		buttonLogin.css('display', 'block');
		buttonLogout.css('display', 'none');
	} else {
		monkeyUserCard.css("display", "block");

		buttonLogin.css('display', 'none');
		buttonLogout.css('display', 'block');
	}
}

$(function() {
	$("#login-submit")
			.click(
					function() {
						console
								.log("########################  login click button ########################");
						var data = JSON.stringify({
							id : $('#monkey-id').val(),
							pw : $('#monkey-pw').val()
						});

						$.ajax({
							type : "POST",
							url : "/user/login",
							data : data,
							dataType : "json",
							contentType : "application/json",
							success : function(data) {
								console.log(data);
								if (data.signal == "success") {

									// 만약 로그인에 성공한다면 로그인창을 닫아준다.
									modalLoginFrom.removeClass("show");
									$(".modal-backdrop").remove("")

									// 로그인 버튼 삭제
									buttonLogin.css('display', 'none');

									// 로그아웃 버튼 생성
									buttonLogout.css('display', 'block');

									// 유저 카드 생성
									monkeyUserCard.css("display", "block");

								} else {
									window.alert("로그인에 실패했습니다.");
								}
							}
						})

					})
	$('#logout').click(function() {
		window.location.href = "/member/logout";
	})
})