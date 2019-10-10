const buttonLogin = $("#button_login");
const buttonLogout = $("#button_logout");
const monkeyUserCard = $("#monkey-user-card");
const userID = $("#sessionID");


init();

function init() {
	// el 태그를 사용하여 세션 정보 불러오기
    // 세션 정보가 있으면 유저 카드 [display: none] 해제
	
	//만약 세션에 값이 없으면 checkUserInfo 값은 ''
	//만약 checkUserInfo값이 '' 이라면 null 데이터값을 넣는다.
    if (checkUserInfo === '') {
        console.log("checkUserInfo is null");
        checkUserInfo = null;
    }
    
    //만약 checkUserInfo 값이 null 이라면 즉 세션값이 없다면, 
    //유저 카드(프로필)을 닫아주고 로그아웃 버튼을 지우고 로그인 버튼을 띄운다.
    if (checkUserInfo == null) {
        monkeyUserCard.css("display", "none");

        buttonLogin.css('display', 'block');
        buttonLogout.css('display', 'none');
    } //만약 checkUserInfo 값이 존재한다면, 유저카드를 보여주며 로그인 창을 지우고 로그아웃 창을 보여준다.
    else {
    	console.log("checkUserInfo isn't null")
        monkeyUserCard.css("display", "block");

        buttonLogin.css('display', 'none');
        buttonLogout.css('display', 'block');
    }
}

$(function() {
    $("#login-submit")
        .click(
            function() {
                console.log("######################## login click button ########################");
                var data = JSON.stringify({
                    id: $('#monkey-login-id').val(),
                    pw: $('#monkey-login-pw').val()
                });

                $.ajax({
                    type: "POST",
                    url: "/user/login",
                    data: data,
                    dataType: "json",
                    contentType: "application/json",
                    success: function(data) {
                        console.log(data);
                        if (data.signal == "success") {
                        	
                        	
                            // 만약 로그인에 성공한다면 로그인창을 닫아준다.
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

                        } else {
                            window.alert("로그인에 실패했습니다.");
                        }
                    }
                })

			})
	//TODO::만약 성공적으로 회원가입이 되었다면 유저 세션 추가해주기.
    $("#register-submit")
        .click(
            function() {
				console.log("######################## Register click button ########################");
				
				//데이터 받아오는 부분
                var data = JSON.stringify({
                    id: $('#monkey-register-id').val(),
					pw: $('#monkey-register-pw').val(),
					name: $('#monkey-register-name').val(),
					gender: $('#monkey-register-gender').val(),
					address: $('#monkey-register-address').val()
					
                });
				
				//ajax 통신 시작
                $.ajax({
                    type: "POST",
                    url: "/user/register",
                    data: data,
                    dataType: "json",
                    contentType: "application/json",
                    success: function(data) {
						console.log(data);
						//만약 성공했을때
                        if (data.signal == "success") {
                        	 
                            // 만약 회원가입에 성공한다면 회원가입창을 닫아준다.
                        	/*
                            modalRegisterFrom.removeClass("show");
                            $(".modal-backdrop").remove("")
                            */
                            
                            //window.alert("if ajax success test");
                        } else {
                            window.alert("회원가입에 실패했습니다.");
                        }
                    }
                })
            })
    $('#logout').click(function() {
        window.location.href = "/user/logout";
    })
})