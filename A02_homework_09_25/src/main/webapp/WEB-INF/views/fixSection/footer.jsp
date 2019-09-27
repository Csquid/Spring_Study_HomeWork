
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Test1</title>
<style type="text/css">
.monkey-input {
	margin-bottom: 10px;
}

.monkey-login-button {
	padding-top: 8px;
	border-top-width: 0px;
	justify-content: center;
	border-top-width: 0px;
}

.monkey-login-body {
	padding-bottom: 8px;
}

.monkey-login-footer {
	padding: 16px 8px 16px 16px;
}

.modal-content {margin
	
}

.monkey-register-id {
	margin-top: 10px;
}
.monkey-dialog-login {
	width: 350px;
	height: 300px;
}
</style>
</head>
<body>
	<hr>
	<h1 id="colorRed">This is Footer Area</h1>

	<!-- TODO: 브라우저 크기를 구하여 modal window를 중앙에 배치할수있게 만들기 -->
	<!-- TODO: 로그아웃창 Modal 만들기 -->

	<!-- Login Modal -->
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
						<div class="input-group mb-7 monkey-input">
							<input type="text" class="form-control" placeholder="ID"
								aria-label="ID" aria-describedby="basic-addon2">

						</div>

						<div class="input-group mb-7">
							<input type="text" class="form-control" placeholder="PW"
								aria-label="PW" aria-describedby="basic-addon2">
						</div>
					</div>
					<div class="modal-footer monkey-login-button">
						<button type="button" class="btn btn-secondary btn-lg btn-block">
							Login</button>
					</div>
					<hr width="100%"
						style="margin-top: 0px; margin-bottom: 0px; test-align: center;">
					<div class="monkey-login-footer">
						<button type="button" class="btn btn-secondary btn-lg col-6"
							style="margin-right: -10px;" data-toggle="modal"
							data-target="#modal_register"
							onclick="clickModalRegisterButton()">sign up</button>
						<button type="button" class="btn btn-link col-6"
							style="margin-left: 5px;">Forgot Password?</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modalContent">
		<div class="modal fade" id="modal_register" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog monkey-dialog-register">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">Register</h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
						</button>
					</div>
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
							<span class="input-group-text" id="basic-addon1">Address</span>
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


					<div class="modal-body monkey-login-body">
						<div class="input-group mb-7 monkey-input">
							<input type="text" class="form-control" placeholder="ID"
								aria-label="ID" aria-describedby="basic-addon2">

						</div>

						<div class="input-group mb-7">
							<input type="text" class="form-control" placeholder="PW"
								aria-label="PW" aria-describedby="basic-addon2">
						</div>
					</div>
					<div class="modal-footer monkey-login-button">
						<button type="button" class="btn btn-secondary btn-lg btn-block">
							Login</button>
					</div>
					<hr width="100%"
						style="margin-top: 0px; margin-bottom: 0px; test-align: center;">
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
		//TODO:	공통모듈 생성 

		let modalTestWidth = 0;
		let modalTestHeight = 0;		
		let setX = 0;
		let setY = 0; 

		const winHeight = window.innerHeight;
		const winWidth  = window.innerWidth;

		const modalLoginFrom = $("#modal_login");
		const modalLoginObject = $(".monkey-dialog-login");
		const modalRegisterObject = $(".monkey-dialog-register");
		const modalBackDrop = $(".modal-backdrop");

		/*
		const modalHeight = 350;
		const modalLoginWidth = 350;
		const modalRegisterWidth = 500;
		
	
				

		
		const setLoginX = ( winWidth - modalLoginWidth ) / 2;
		const setLoginY = ( winHeight - modalHeight ) / 2;
		const setRegisterX = ( winWidth - modalRegisterWidth) / 2;
		const setRegisterY = ( winHeight - modalHeight) / 2;


		const setCssLoginObject = { 
			"margin-top" : setLoginY, 
			"margin-bottom": setLoginY,
			"margin-left": setLoginX,
			"margin-right": setLoginX
		};	
		
		let setCssRegisterObject = { 
			"margin-top" : setRegisterY, 
			"margin-bottom": setRegisterY,
			"margin-left": setRegisterX,
			"margin-right": setRegisterX
		};	

		modalLoginObject.css(setCssLoginObject);
		modalRegisterObject.css(setCssRegisterObject);
		
		*/
		
		/*
		function clickModalLoginButton() {
			modalTestWidth = $(".monkey-dialog-login").width();
			modalTestHeight = $(".monkey-dialog-login").height();
			setX = ( winWidth - modalTestWidth ) / 2;
			setY = ( winHeight - modalTestHeight ) / 2;

			setCssLoginObject = { 
				"margin-top" : setY, 
				"margin-bottom": setY,
				"margin-left": setX,
				"margin-right": setX
			};	
			
			modalLoginObject.css(setCssLoginObject);
		}
		*/
		function clickModalRegisterButton() {
			modalLoginFrom.removeClass("show");
			$(".modal-backdrop").remove("")
		}
	</script>

</body>
</html>