const buttonLogin = $("#button_login");
const buttonLogout = $("#button_logout");
const monkeyUserCard = $("#monkey-user-card");
const userID = $("#sessionID");

const l_id = $('#monkey-login-id');
const l_pw = $('#monkey-login-pw');
const l_object = {
	id : l_id,
	pw : l_pw
}

const r_id = $('#monkey-register-id');
const r_pw = $('#monkey-register-pw');
const r_name = $('#monkey-register-name');
const r_object = {
	id : r_id,
	pw : r_pw,
	r_name : r_name
};

const r_al_id = $("#register-alert-overlap-id");
const r_al_name = $("#register-alert-overlap-name");
const r_alert_object = {
	id: r_al_id,
	name: r_al_name
}

const r_object_overlap = {
	id : r_id,
	r_name : r_name
};

/*
 * 기본 셋팅을 중복인 true로 셋팅을 하고 시작함.
 */
const checkOverlapObject = {
	id : true,
	name : true
}

account_init();

function account_init() {
	// el 태그를 사용하여 세션 정보 불러오기
	// 세션 정보가 있으면 유저 카드 [display: none] 해제

	// 만약 세션에 값이 없으면 checkUserInfo 값은 ''
	// 만약 checkUserInfo값이 '' 이라면 null 데이터값을 넣는다.
	if (checkUserInfo === '') {
		console.log("checkUserInfo is null");
		checkUserInfo = null;
	}

	// 만약 checkUserInfo 값이 null 이라면 즉 세션값이 없다면,
	// 유저 카드(프로필)을 닫아주고 로그아웃 버튼을 지우고 로그인 버튼을 띄운다.
	if (checkUserInfo == null) {
		monkeyUserCard.css("display", "none");

		buttonLogin.css('display', 'block');
		buttonLogout.css('display', 'none');
	} else {
		// 만약 checkUserInfo 값이 존재한다면, 유저카드를 보여주며 로그인 창을 지우고 로그아웃 창을 보여준다.
		console.log("checkUserInfo isn't null")
		monkeyUserCard.css("display", "block");

		buttonLogin.css('display', 'none');
		buttonLogout.css('display', 'block');
	}

}

function login_default_init(err) {

	for ( let n in l_object ) {
		l_object[n].text("");
		l_object[n].removeClass("is-valid");
		l_object[n].removeClass("is-invalid");
	}

	// if ($("#login-alert").css(""))

	$("#login-alert-input-null").css("display", "none");

	if (err == "Wrong ID or Empty Account") {
		$("#login-alert-wrong-pw").css("display", "none");
		$("#login-alert-wrong-id").css("display", "block");
	} else if (err == "Wrong Password") {
		$("#login-alert-wrong-id").css("display", "none");
		$("#login-alert-wrong-pw").css("display", "block");
	} else {

	}
}

$(function() {
	$("#login-submit").click(function() {
		if (l_object.id.val() == '' || l_object.pw.val() == '') {

			$.each(l_object, function(index, item) {
				if (item.val() == '')
					item.addClass('is-invalid');
			})

			$("#login-alert-input-null").css("display", "block");
			$("#login-alert-wrong-id").css("display", "none");
			$("#login-alert-wrong-pw").css("display", "none");

			return;
		}

		const loginFormData = JSON.stringify({
			id : $('#monkey-login-id').val(),
			pw : $('#monkey-login-pw').val()
		});

		$.ajax({
			type : "POST",
			url : "/user/login",
			data : loginFormData,
			dataType : "json",
			contentType : "application/json",
			success : function(data) {
				console.log(data);
				console.log("+");
				if (data.signal == "success") { // 만약 로그인에 성공한다면 로그인창을 닫아준다.
					modalLoginFrom.removeClass("show");
					$(".modal-backdrop").remove("")

					// 로그인 버튼 삭제
					buttonLogin.css('display', 'none');

					// 로그아웃 버튼 생성
					buttonLogout.css('display', 'block');

					console.log("break two");

					// 유저 카드 생성
					monkeyUserCard.css("display", "block");

					// 로그인 성공 즉시 유저 아이디 영역에 아이디 문자열 추가
					$("#sessionID").append(data.id);
					if (data.userInfo.role === 'admin')
						$("#user-card-admin-page").css("display", "block");
				} else {

					// TODO: 만약 input 폼안에 null 유효성 css style이 들어있다면, 지우는 처리를
					// 해준다.
					console.log("break");
					login_default_init(data.detail);

				}
			}
		})

	})

	$("#register-submit").click(function() {
		// 만약 아이디, 패스워드, 이름 적는 공간이 비었다면
		if (r_id.val() == '' || r_pw.val() == '' || r_name.val() == '') {
				
			console.log("$('#register-submit').click(function");
			
			
			$.each(r_object, function(index, item) {
				if (item.val() == '')
					item.addClass('is-invalid');

			})

			$("#register-alert-input-null").css("display", "block");

			return;
		}

		// 데이터 받아오는 부분
		const registerFormData = JSON.stringify({
			id : r_id.val(),
			pw : r_pw.val(),
			name : $('#monkey-register-name').val(),
			gender : $('#monkey-register-gender').val(),
			address : $('#monkey-register-address').val()
		});

		// ajax 통신 시작
		$.ajax({
			type : "POST",
			url : "/user/register",
			data : registerFormData,
			dataType : "json",
			contentType : "application/json",
			success : function(data) {
				console.log(data);
				// 만약 성공했을때
				if (data.signal == "success") { // 만약 회원가입에 성공한다면 회원가입창을 닫아준다.

					modalRegisterFrom.removeClass("show");
					$(".modal-backdrop").remove("")

				} else {		//실패했을경우.
					if(data.overlap) {		//데이터가 중복된 경우
						if(data.overlap_id) {
							//회원가입 인 경우 무조건 block 처리
							console.log("break");
							$("#register-alert-overlap-id").css("display", "block");
						} else {
							$("#register-alert-overlap-id").css("display", "none");
						}
						
						if(data.overlap_name) {
							$("#register-alert-overlap-name").css("display", "block");
						} else {
							$("#register-alert-overlap-name").css("display", "none");
						}
					}
					
					window.alert("회원가입에 실패했습니다.");
				}
			}
		})
	})

	/*
	 *  ----- ajax -----
	 * 
	 *	중복 처리 - 아이디
	 *
	 *  ----------------
	 */
	$("#check-overlap-id").click(function() {

		// 데이터 받아오는 부분
		const checkOverlapID = JSON.stringify({
			id : r_id.val()
		});

		// ajax 통신 시작
		$.ajax({
			type : "POST",
			url : "/user/register/overlap/id",
			data : checkOverlapID,
			dataType : "json",
			contentType : "application/json",
			success : function(data) {
				console.log(data);
				// 만약 성공했을때
				if (data.signal == "success") { // 만약 회원가입에 성공한다면 회원가입창을 닫아준다.
					checkOverlapObject.id = true;
					
					r_alert_object.id.css("display", "block");
				} else {
					checkOverlapObject.id = false;

					r_alert_object.id.css("display", "none");
				}
				
				checkOverlapIdName(checkOverlapObject);
			}
		})
	})
	
	/*
	 *  ----- ajax -----
	 * 
	 *	중복 처리 - 닉네임
	 *
	 *  ----------------
	 */
	$("#check-overlap-name").click(function() {

		// 데이터 받아오는 부분
		const checkOverlapName = JSON.stringify({
			name : r_name.val()
		});

		// ajax 통신 시작
		$.ajax({
			type : "POST",
			url : "/user/register/overlap/name",
			data : checkOverlapName,
			dataType : "json",
			contentType : "application/json",
			success : function(data) {
				console.log(data);
				// 만약 성공했을때
				if (data.signal == "success") { // 만약 회원가입에 성공한다면 회원가입창을 닫아준다.
					checkOverlapObject.name = true;
					
					r_alert_object.name.css("display", "block");
				} else {
					checkOverlapObject.name = false;
					
					r_alert_object.name.css("display", "none");
				}
				
				checkOverlapIdName(checkOverlapObject);
			}
		})
	})
})

function checkOverlapIdName(overlapObject) {
	console.log(overlapObject);
	if (overlapObject.id == false && overlapObject.name == false) {
		$("#register-submit").removeAttr("disabled");
	} else {
		$("#register-submit").attr("disabled", "disabled");
	}
}

$('#logout').click(function() {
	window.location.href = "/user/logout";
});

$.each(l_object, function(index, item) {
	item.on("propertychange change keyup paste input", function() {
		item.addClass("is-valid");
		item.removeClass("is-invalid");
	})
})

$.each(r_object, function(index, item) {
	item.on("propertychange change keyup paste input", function() {
		item.addClass("is-valid");
		item.removeClass("is-invalid");
	})
})

$.each(r_object_overlap, function(index, item) {
	
})
