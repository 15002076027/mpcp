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
<title>Mobile-phone Compare - Compare</title>

<!-- Bootstrap CSS -->
<link href="/mpcp/css/bootstrap.css" rel="stylesheet">
<!-- user-defined CSS -->
<link href="/mpcp/css/pdcomparestyle.css" rel="stylesheet">
<!-- jQuery -->
<script src="/mpcp/js/jquery-3.3.1.js"></script>
<!-- Bootstrap JavaScript -->
<script src="/mpcp/js/bootstrap.js"></script>
</head>
<body>
	<!-- nav导航栏（LOGO，搜索框，下拉菜单） -->
	<nav class=" container navbar navbar-default" role="navigation">
		<div class="row">
			<div class="col-xs-3 navbar-header">
				<a class="navbar-brand" href="/mpcp/page/index.jsp">MPCP</a>
			</div>
			<div class="col-xs-7">
				<form class="navbar-form" role="search" action="/mpcp/PdlistServlet">
					<input name="product" class="form-control" type="text"
						placeholder="手机型号/品牌">
					<button class="btn btn-primary" type="submit">S</button>
				</form>
			</div>
			<div class="col-xs-2 dropdown">
				<img id="dropdownMenu1" class="dropdown-toggle"
					data-toggle="dropdown" src="/mpcp/img/option.png" width="100%">
				<ul class="dropdown-menu pull-right" role="menu"
					aria-labelledby="dropdownMenu1">
					<li role="presentation"><a href="/mpcp/page/adminlogin.jsp"
						role="menuitem" tabindex="-1">adminLogin</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
		List<ProductBean> pList = (List<ProductBean>) session.getAttribute("pList");
		List<String> cpList = (List<String>) session.getAttribute("cpList");
		String pName1 = cpList.get(0);
		String pName2 = cpList.get(1);

		int i1 = 0;
		int i2 = 0;
		for (int i = 0; i < pList.size(); i++) {
			if (pList.get(i).getpName().equals(pName1)) {
				i1 = i;
			}
			if (pList.get(i).getpName().equals(pName2)) {
				i2 = i;
			}
		}
	%>
	<!-- content比较内容（详细参数的折叠面板） -->
	<div id="ctn-content" class="container">
		<div class="row">
			<div class="col-xs-6">
				<img src="/mpcp/img/product/<%=pList.get(i1).getpImg()%>"
					width="100%">
				<h4><%=pList.get(i1).getpBrand() + pList.get(i1).getpName()%></h4>
				<h4>
					¥<%=pList.get(i1).getpPrice()%></h4>
			</div>
			<div class="col-xs-6">
				<img src="/mpcp/img/product/<%=pList.get(i2).getpImg()%>"
					width="100%">
				<h4><%=pList.get(i2).getpBrand() + pList.get(i2).getpName()%></h4>
				<h4>
					¥<%=pList.get(i2).getpPrice()%></h4>
			</div>
		</div>
		<div id="content-detail" class="row panel-group">
			<div class="panel panel-default">
				<div class="panel-heading" data-toggle="collapse"
					data-parent="#content-detail" data-target="#detail-main">
					<h4 class="panel-title">主要参数</h4>
				</div>
				<div id="detail-main" class="panel-collapse collapse in">
					<div class="panel-body">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td style="width: 90px;">CPU型号</td>
									<td><%=pList.get(i1).getpCpu()%></td>
									<td><%=pList.get(i2).getpCpu()%></td>
								</tr>
								<tr>
									<td style="width: 90px;">RAM+ROM</td>
									<td><%=pList.get(i1).getpRamrom()%></td>
									<td><%=pList.get(i2).getpRamrom()%></td>
								</tr>
								<tr>
									<td style="width: 90px;">主屏尺寸</td>
									<td><%=pList.get(i1).getpSize()%></td>
									<td><%=pList.get(i2).getpSize()%></td>
								</tr>
								<tr>
									<td style="width: 90px;">摄像头</td>
									<td><%=pList.get(i1).getpCamera()%></td>
									<td><%=pList.get(i2).getpCamera()%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading" data-toggle="collapse"
					data-parent="#content-detail" data-target="#detail-other">
					<h4 class="panel-title">其它参数</h4>
				</div>
				<div id="detail-other" class="panel-collapse collapse in">
					<div class="panel-body">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td style="width: 90px;">上市时间</td>
									<td><%=pList.get(i1).getpTime()%></td>
									<td><%=pList.get(i2).getpTime()%></td>
								</tr>
								<tr>
									<td style="width: 90px;">电池容量</td>
									<td><%=pList.get(i1).getpBattery()%></td>
									<td><%=pList.get(i2).getpBattery()%></td>
								</tr>
								<tr>
									<td style="width: 90px;">SIM卡类型</td>
									<td><%=pList.get(i1).getpSim()%></td>
									<td><%=pList.get(i2).getpSim()%></td>
								</tr>
								<tr>
									<td style="width: 90px;">机身接口</td>
									<td><%=pList.get(i1).getpInterface()%></td>
									<td><%=pList.get(i2).getpInterface()%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- user-defined JavaScript -->
	<script src="/mpcp/js/pdcomparejs.js"></script>
</body>
</html>