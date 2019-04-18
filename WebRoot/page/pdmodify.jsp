<%@page import="java.net.URLDecoder"%>
<%@page import="bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Mobile-phone Compare - AdminIndex</title>

<!-- Bootstrap CSS -->
<link href="/mpcp/css/bootstrap.css" rel="stylesheet">
<!-- user-defined CSS -->
<link href="/mpcp/css/pdaddstyle.css" rel="stylesheet">
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
				<a class="navbar-brand" href="/mpcp/AdminindexServlet">后台管理神经中枢</a>
			</div>
			<div class="col-xs-2 dropdown">
				<img id="dropdownMenu1" class="dropdown-toggle"
					data-toggle="dropdown" src="/mpcp/img/option.png" width="100%">
				<ul class="dropdown-menu pull-right" role="menu"
					aria-labelledby="dropdownMenu1">
					<li role="presentation"><a href="/mpcp/page/adminlogin.jsp"
						role="menuitem" tabindex="-1">logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 要modify的pd参数 -->
	<div id="ctn-content" class="container">
		<form action="/mpcp/PdmodifyServlet">
			<%
				List<ProductBean> pList = (List<ProductBean>) session.getAttribute("pList");
				String pName = URLDecoder.decode(request.getParameter("pName"), "UTF-8");

				for (ProductBean product : pList) {
					if (product.getpName().equals(pName)) {
			%>
			<div class="form-group input-group has-error">
				<span class="input-group-addon">型号</span> <input name="pName"
					class="form-control" type="text" value="<%=product.getpName()%>"
					readonly="readonly" />
			</div>
			<div class="form-group input-group has-error">
				<span class="input-group-addon">价格</span> <input name="pPrice"
					class="form-control" type="text" value="<%=product.getpPrice()%>"
					required="required" />
			</div>
			<hr>
			<div class="form-group input-group">
				<span class="input-group-addon">CPU型号</span> <input name="pCpu"
					class="form-control" type="text" value="<%=product.getpCpu()%>" />
			</div>
			<div class="form-group input-group">
				<span class="input-group-addon">RAM+ROM</span> <input name="pRamrom"
					class="form-control" type="text" value="<%=product.getpRamrom()%>" />
			</div>
			<div class="form-group input-group">
				<span class="input-group-addon">主屏尺寸</span> <input name="pSize"
					class="form-control" type="text" value="<%=product.getpSize()%>" />
			</div>
			<div class="form-group input-group">
				<span class="input-group-addon">摄像头</span> <input name="pCamera"
					class="form-control" type="text" value="<%=product.getpCamera()%>" />
			</div>
			<hr>
			<div class="form-group input-group">
				<span class="input-group-addon">上市时间</span> <input name="pTime"
					class="form-control" type="text" value="<%=product.getpTime()%>" />
			</div>
			<div class="form-group input-group">
				<span class="input-group-addon">电池容量</span> <input name="pBattery"
					class="form-control" type="text" value="<%=product.getpBattery()%>" />
			</div>
			<div class="form-group input-group">
				<span class="input-group-addon">SIM卡类型</span> <input name="pSim"
					class="form-control" type="text" value="<%=product.getpSim()%>" />
			</div>
			<div class="form-group input-group">
				<span class="input-group-addon">机身接口</span> <input name="pInterface"
					class="form-control" type="text"
					value="<%=product.getpInterface()%>" />
			</div>
			<hr>
			<div class="row">
				<div class="col-xs-6">
					<button class="btn btn-primary" type="submit">就这样</button>
				</div>
				<div class="col-xs-6">
					<button class="btn btn-danger" type="button"
						onclick="window.location.href='/mpcp/AdminindexServlet'">不要了</button>
				</div>
			</div>
			<%
				}
				}
			%>
		</form>
	</div>

	<!-- user-defined JavaScript -->
	<script src="/mpcp/js/pdaddjs.js"></script>
</body>
</html>