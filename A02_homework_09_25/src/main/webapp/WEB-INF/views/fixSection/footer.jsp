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
		justify-content: center;
	}
</style>
</head>
<body>
	<hr>
	<h1 id="colorRed">This is Footer Area</h1>

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
					<div class="modal-body">
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
				</div>
			</div>
		</div>
	</div>

</body>
</html>