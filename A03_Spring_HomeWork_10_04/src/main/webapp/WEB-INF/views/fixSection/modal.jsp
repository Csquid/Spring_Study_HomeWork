<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script crossorigin="anonymous" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<!-- Modal: Login -->
	<div class="modalContent">
		<div class="modal fade" id="modal_login" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog monkey-dialog-login">
				<div class="modal-content">

					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">Login</h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
						</button>
					</div>

					<div class="modal-body monkey-login-body">
						<!-- Input: ID -->
						<div class="input-group mb-7 monkey-input">
							<input type="text" class="form-control" id="monkey-id" placeholder="ID"
								aria-label="ID" aria-describedby="basic-addon2">
						</div>
						<!-- Input: PW -->
						<div class="input-group mb-7">
							<input type="password" class="form-control" id="monkey-pw" placeholder="PW"
								aria-label="PW" aria-describedby="basic-addon2">
						</div>
					</div>
					<!-- Button: Login -->
					<div class="modal-footer monkey-login-button">
						<button type="button" class="btn btn-secondary btn-lg btn-block" id="login-submit">
							Login</button>
					</div>

					<hr width="100%">

					<div class="monkey-login-footer">
						<!-- Button: move Register -->
						<button type="button" class="btn btn-secondary btn-lg col-6"
							style="margin-right: -10px;" data-toggle="modal"
							data-target="#modal_register"
							onclick="clickModalRegisterButton()">sign up</button>
						<!-- Button: forgotAccess -->
						<button type="button" class="btn btn-link col-6"
							style="margin-left: 5px;">Forgot Password?</button>
					</div>

				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal: Register -->
	<div class="modalContent">
		<div class="modal fade" id="modal_register" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog monkey-dialog-register">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">Register</h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
						</button>
					</div>

					<!-- Modal Body -->
					<div class="modal-body monkey-login-body">
						<div class="input-group col-sm-12 monkey-register-id">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">ID </span>
							</div>
							<input type="text" class="form-control"
								aria-describedby="basic-addon1">
						</div>

						<div class="input-group col-sm-12 monkey-register-id">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">PW</span>
							</div>
							<input type="text" class="form-control"
								aria-describedby="basic-addon1">
						</div>

						<div class="input-group col-sm-12 monkey-register-id">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">Name</span>
							</div>
							<input type="text" class="form-control"
								aria-describedby="basic-addon1">
						</div>

						<div class="input-group col-sm-12 monkey-register-id">
							<div class="input-group-prepend">
								<label class="input-group-text" for="inputGroupSelect01">Gender</label>
							</div>
							<select class="custom-select" id="inputGroupSelect01">
								<option value="man" selected>Man</option>
								<option value="woman">Woman</option>
							</select>
						</div>

						<div class="input-group col-sm-12 monkey-register-id">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">Address</span>
							</div>
							<input type="text" class="form-control"
								aria-describedby="basic-addon1">
						</div>
					</div>

					<!-- Modal: Footer -->
					<div class="modal-footer monkey-login-button">
						<button type="button" class="btn btn-secondary btn-lg btn-block">
							sign up</button>
					</div>
					<hr width="100%">
					<div class="monkey-login-footer">
						<button type="button" class="btn btn-secondary btn-lg col-6"
							style="margin-right: -10px;" data-toggle="modal"
							data-target="#modal_register">sign up</button>
						<button type="button" class="btn btn-link col-6"
							style="margin-left: 5px;">Forgot Password?</button>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<script type="">
		let setX = 0;
		let setY = 0; 

		let winHeight = 0;
		let winWidth  = 0;

		let setLoginX    = 0;
		let setLoginY    = 0;
		let setRegisterX = 0;
		let setRegisterY = 0;

        const modalBackDrop = $(".modal-backdrop");
		const modalLoginFrom = $("#modal_login");
		const modalLoginObject = $(".monkey-dialog-login");
		const modalRegisterObject = $(".monkey-dialog-register");
        
        init();

		function clickModalRegisterButton() {
			modalLoginFrom.removeClass("show");
			$(".modal-backdrop").remove("")
		}
		
		$(window).resize(function (){
			console.log("resize");
  		    init();
		})

        function init() {
            const modalSize = {
			    login: {
			    	width: modalLoginObject.width(),
			    	height: modalLoginObject.height()
			    },
			    register: {
			    	width: modalRegisterObject.width(),
			    	height: modalRegisterObject.height()
		    	}
		    }
			
			winHeight = window.innerHeight;
			winWidth  = window.innerWidth;

		    setLoginX    = ( winWidth - modalSize.login.width ) / 2;
		    setLoginY    = ( winHeight - modalSize.login.height ) / 2;
		    setRegisterX = ( winWidth - modalSize.register.width) / 2;
		    setRegisterY = ( winHeight - modalSize.register.height) / 2;

		    const setCssLoginObject = { 
			    "margin-top" : setLoginY,
			    "margin-left": setLoginX
		    };	

		    const setCssRegisterObject = { 
			    "margin-top" : setRegisterY,
			    "margin-left": setRegisterX
		    };	

		    modalLoginObject.css(setCssLoginObject);
		    modalRegisterObject.css(setCssRegisterObject);
        }

        $(function() {
            $("#login-submit").click(function() {
            	console.log("########################  login click button ########################");
                var data = JSON.stringify({
                    id: $('#monkey-id').val(),
                    pw: $('#monkey-pw').val()
                });

                $.ajax({
                    type: "POST",
                    url: "/user/id",
                    data: data,
                    dataType: "json",
                    contentType: "application/json",
                    success: function(data) {
                        console.log(data);
                        if (data.signal == "success") {
                            window.alert("로그인에 성공했습니다.");
							
							//만약 로그인에 성공한다면 로그인창을 닫아준다.
							modalLoginFrom.removeClass("show");
							$(".modal-backdrop").remove("")
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
	</script>
</body>
</html>