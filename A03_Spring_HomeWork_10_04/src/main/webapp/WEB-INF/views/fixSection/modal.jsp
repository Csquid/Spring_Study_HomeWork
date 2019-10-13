<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<!-- Modal: Login -->
	<div class="modalContent">
		<div class="modal fade" id="modal_login" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog monkey-dialog-login">
				<div class="modal-content">

					<div class="modal-header row" style="border-bottom: 0px;">
						<h4 class="modal-title col-10" id="myModalLabel">Login</h4>
						<button type="button" class="close col-2" data-dismiss="modal">
							<span aria-hidden="true">×</span>
						</button>
						<div class="alert alert-danger col-12" role="alert"
							id="login-alert-input-null"
							style="margin-top: 10px; margin-bottom: 0px; display: none">ID,
							PW는 필수로 적어야합니다.</div>
						<div class="alert alert-danger col-12" role="alert"
							id="login-alert-wrong-id"
							style="margin-top: 10px; margin-bottom: 0px; display: none">
							존재하지 않는 아이디입니다.</div>
						<div class="alert alert-danger col-12" role="alert"
							id="login-alert-wrong-pw"
							style="margin-top: 10px; margin-bottom: 0px; display: none">
							패스워드가 일치하지 않습니다.</div>
					</div>
					<hr width="100%" style="margin-top: 5px; margin-bottom: 5px;">

					<!-- Modal Body :: CSS_monkey-modal-body -->
					<div class="modal-body monkey-modal-body">
						<!-- Input: Login_ID -->
						<div class="input-group mb-7 monkey-input">
							<input type="text" class="form-control" id="monkey-login-id"
								placeholder="ID" aria-label="ID" aria-describedby="basic-addon2">

						</div>
						<!-- Input: Login_PW -->
						<div class="input-group mb-7">
							<input type="password" class="form-control" id="monkey-login-pw"
								placeholder="PW" aria-label="PW" aria-describedby="basic-addon2">
						</div>
					</div>
					<!-- Button: Login -->
					<!-- 버튼을 누르면 ajax 통신 시작 { UserLoginController }-->
					<div class="modal-footer monkey-modal-submit-button">
						<button type="button" class="btn btn-secondary btn-lg btn-block"
							id="login-submit">Login</button>
					</div>

					<hr width="100%">

					<!-- Modal Footer :: CSS_monkey-modal-body-->
					<div class="monkey-modal-footer">
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
					<div class="modal-header row" style="border-bottom: 0px;">
						<h4 class="modal-title col-10" id="myModalLabel">Register</h4>
						<button type="button" class="close col-2" data-dismiss="modal">
							<span aria-hidden="true">×</span> <span class="sr-only">Close</span>
						</button>
						<div class="alert alert-danger col-12" role="alert"
							id="register-alert-input-null"
							style="margin-top: 15px; margin-bottom: 0px; display: none">
							아이디, 패스워드, 이름은 필수로 적어야합니다.</div>
					</div>

					<hr width="100%" style="margin-top: 5px; margin-bottom: 5px;">

					<!-- Modal Body -->
					<div class="modal-body monkey-modal-body row">

						<!-- Input: Register_ID -->
						<div class="input-group col-sm-12 monkey-register-id">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">ID </span>
							</div>
							<input type="text" class="form-control" id="monkey-register-id"
								aria-describedby="basic-addon1">
							<!-- check overlap -->
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button"
									id="check-overlap-id">Check</button>
							</div>
						</div>

						<!-- Input: Register_PW -->
						<div class="input-group col-sm-12 monkey-register-id">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">PW</span>
							</div>
							<input type="password" class="form-control"
								id="monkey-register-pw" aria-describedby="basic-addon1">

						</div>

						<!-- Input: Register_Name -->
						<div class="input-group col-sm-12 monkey-register-id">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">Name</span>
							</div>
							<input type="text" class="form-control" id="monkey-register-name"
								aria-describedby="basic-addon1">
							<!-- check overlap -->
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button"
									id="check-overlap-name">Check</button>
							</div>
						</div>

						<!-- Input: Register_Gender -->
						<div class="input-group col-sm-12 monkey-register-id">
							<div class="input-group-prepend">
								<label class="input-group-text" for="inputGroupSelect01">Gender</label>
							</div>
							<select class="custom-select" id="monkey-register-gender">
								<option value="man" selected>Man</option>
								<option value="woman">Woman</option>
							</select>
						</div>

						<!-- Input: Register_Address -->
						<div class="input-group col-sm-12 monkey-register-id">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">Address</span>
							</div>
							<input type="text" class="form-control"
								id="monkey-register-address" aria-describedby="basic-addon1">
						</div>
					</div>

					<!-- Button: Register -->
					<!-- 버튼을 누르면 ajax 통신 시작 { UserLoginController }-->
					<div class="modal-footer monkey-modal-submit-button">
						<button type="button" class="btn btn-secondary btn-lg btn-block"
							id="register-submit" disabled >Create Account</button>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>