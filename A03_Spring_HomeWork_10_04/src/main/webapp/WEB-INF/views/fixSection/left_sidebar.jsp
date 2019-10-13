<div class="col-lg-2" style="margin-top: 30px;">
	<h1 style="color: #6c757d">${page}Page</h1>
	<div class="row">
		<div id="monkey-user-card" class=""
			style="float: right; display: none;">
			<div class="card">
				<img class="card-img-top" src="/images/admin_icon.png" width="100">
				<div class="card-block">
					<h4 class="card-title" id="sessionID">ID:
						${sessionScope.userInfo.id}</h4>
					<div class="card-text">Tawshif is a web designer living in
						Bangladesh.</div>
					<h3>
						<a href="/admin/index"
							style="color: #dc3545; display: none; margin-top: 10px;"
							id="user-card-admin-page"> <b>Admin Page</b>
						</a>
					</h3>

					<!-- 
			<c:if test="${sessionScope.userInfo.role eq 'admin'}">
				<p>
					<a href="/admin/index" style="color: #dc3545;">
						<h4 id="user-card-admin-page-2">Admin Page</h4>
					</a>
				</p>
			</c:if>
 			-->
				</div>
				<div class="card-footer">
					<span class="float-right">Joined in 2019</span> <span><i
						class=""></i>75 Friends</span>
				</div>
			</div>
		</div>
	</div>
</div>