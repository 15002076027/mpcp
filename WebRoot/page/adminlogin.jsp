<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Mobile-phone Compare - AdminLoin</title>

	<!-- Bootstrap CSS -->
	<link href="/mpcp/css/bootstrap.css" rel="stylesheet">
	<!-- user-defined CSS -->
	<link href="/mpcp/css/adminloginstyle.css" rel="stylesheet">
	<!-- jQuery -->
	<script src="/mpcp/js/jquery-3.3.1.js"></script>
	<!-- Bootstrap JavaScript -->
	<script src="/mpcp/js/bootstrap.js"></script>
</head>

<body>
	<!-- nav导航栏（LOGO，下拉菜单） -->
	<nav class="container navbar navbar-default" role="navigation">
		<div class="row">
			<div class="col-xs-10 navbar-header">
				<span class="navbar-brand">后台管理任意门</span>
			</div>
			<div class="col-xs-2 dropdown">
				<img id="dropdownMenu1" class="dropdown-toggle" data-toggle="dropdown" src="/mpcp/img/option.png" width="100%">
				<ul class="dropdown-menu pull-right" role="menu" aria-labelledby="dropdownMenu1">
					<li role="presentation"><a href="/mpcp/page/index.jsp" role="menuitem" tabindex="-1">homePage</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- gif图 -->
	<div id="ctn-img" class="container">
		<img src="/mpcp/img/logingif.gif">
	</div>
	<!-- login的账号密码框 -->
	<div id="ctn-login" class="container">
		<%
			if (request.getParameter("login") != null) {
				String login = request.getParameter("login");
				if (login.equals("error")) {
		%>
		<div class="alert alert-danger">小老弟，这不是你该来的地方。</div>
		<%
			}

			}
		%>
		<form method="POST" role="form" action="/mpcp/AdminloginServlet">
			<div class="form-group input-group">
				<span class="input-group-addon">账号</span> <input name="adminName" class="form-control" type="text" pattern="[0-9A-Za-Z]+"
				 required="required">
			</div>
			<div class="form-group input-group">
				<span class="input-group-addon">密码</span> <input name="adminPassword" class="form-control" type="password" pattern="[0-9A-Za-Z]+"
				 required="required">
			</div>
			<button class="btn btn-block btn-success" type="submit" disabled="disabled">Login!</button>
		</form>

	</div>

	<!-- user-defined JavaScript -->
	<script src="/mpcp/js/adminloginjs.js"></script>
</body>

</html>