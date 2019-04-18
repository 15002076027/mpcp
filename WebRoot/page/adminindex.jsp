<%@page import="java.net.URLEncoder"%>
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
<link href="/mpcp/css/adminindexstyle.css" rel="stylesheet">
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
				<span class="navbar-brand">后台管理神经中枢</span>
			</div>
			<div class="col-xs-2 dropdown">
				<img id="dropdownMenu1" class="dropdown-toggle"
					data-toggle="dropdown" src="/mpcp/img/option.png" width="100%">
				<ul class="dropdown-menu pull-right" role="menu"
					aria-labelledby="dropdownMenu1">
					<li role="presentation"><a href="/mpcp/page/pdadd.jsp"
						role="menuitem" tabindex="-1">addPD</a></li>
					<li role="presentation" class="divider"></li>
					<li role="presentation"><a href="/mpcp/page/adminlogin.jsp"
						role="menuitem" tabindex="-1">logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 手机品牌列表 -->
	<div id="ctn-content" class="panel-group">
		<%
			List<ProductBean> pList = (List<ProductBean>) session.getAttribute("pList");
			List<String> brandList = (List<String>) session.getAttribute("brandList");

			for (int i = 0; i < brandList.size(); i++) {
		%>
		<div class="panel panel-default">
			<div class="panel-heading" data-toggle="collapse"
				data-parent="#ctn-content" data-target="#content-<%=i%>">
				<h4 class="panel-title"><%=brandList.get(i)%></h4>
			</div>
			<div id="content-<%=i%>" class="panel-collapse collapse">
				<div class="panel-body">
					<table class="table table-bordered table-hover">
						<tbody>
							<%
								for (ProductBean product : pList) {
										if (product.getpBrand().equals(brandList.get(i))) {
							%>
							<tr>
								<td><%=product.getpName()%></td>
								<td><a
									href="/mpcp/page/pdmodify.jsp?pName=<%=URLEncoder.encode(product.getpName(), "UTF-8")%>">update</a></td>
								<td><a class="isDelete"
									href="/mpcp/PddeleteServlet?pName=<%=URLEncoder.encode(product.getpName(), "UTF-8")%>">delete</a></td>
							</tr>
							<%
								}
									}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<%
			}
		%>
	</div>

	<!-- user-defined JavaScript -->
	<script src="/mpcp/js/adminindexjs.js"></script>
</body>
</html>