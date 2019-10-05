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
					<!-- 버튼을 누르면 ajax 통신 시작 { UserLoginController }-->
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
		
</body>
</html>