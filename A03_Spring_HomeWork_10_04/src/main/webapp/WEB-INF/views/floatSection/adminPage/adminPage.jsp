<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="admin-image">
	<div class="content row" id="admin-page">
		<div class="col-lg-3" id="admin-page-side" style="margin-top: 30px;">
			<!-- Default: padding-left: 40px -->
			<li><a href="/admin" style="color: #6c757d; text-decoration:none;"><h1>Admin Page</h1></a></li>
			<ul style="list-style: none;">
				<li><a href="/admin/user_table" style="color: black;">
						<h2 style="color: white;">User Table</h2>
				</a></li>
				<li><a href="/admin/user_table/search" style="color: black;">
						<h2 style="color: white;">User Table Search</h2>
				</a></li>
			</ul>
		</div>
		<div class="col-lg-9">
			<div></div>
		</div>
	</div>
</div>