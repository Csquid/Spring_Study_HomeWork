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
	padding-top: 8px; border-top-width : 0px;
	justify-content: center;
	border-top-width: 0px;
}

.monkey-login-body {
	padding-bottom: 8px;
}

.monkey-login-footer {
	padding: 16px 16px 16px 16px;
}

.modal-content {
	margin-top: 30px;
}

</style>
</head>
<body>
	<hr>
	<h1 id="colorRed">This is Footer Area</h1>
	
	<!-- TODO: 브라우저 크기를 구하여 modal window를 중앙에 배치할수있게 만들기 -->
	<!-- TODO: 로그아웃창 Modal 만들기 -->
	<div class="modalContent">
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
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
							Login
						</button>
					</div>
					<hr width="100%" style="margin-top: 0px; margin-bottom: 0px; test-align: center;">
					<div class="monkey-login-footer"  >
						<button type="button" class="btn btn-secondary btn-lg col-6" style="margin-right: -10px;">
							sign up
						</button>
						<button type="button" class="btn btn-link col-6">Forgot Password?</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>