<%@page import="bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Mobile-phone Compare - Detail</title>

<!-- Bootstrap CSS -->
<link href="/mpcp/css/bootstrap.css" rel="stylesheet">
<!-- user-defined CSS -->
<link href="/mpcp/css/pddetailstyle.css" rel="stylesheet">
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
				<form class="navbar-form" action="/mpcp/PdlistServlet" role="search">
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
					<li role="presentation" class="divider"></li>
					<li role="presentation"><a id="showCP" role="menuitem"
						tabindex="-1">readyCP</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<%
		List<ProductBean> pList = (List<ProductBean>) session.getAttribute("pList");
		String pName = URLDecoder.decode(request.getParameter("pName"), "UTF-8");

		for (ProductBean product : pList) {
			if (product.getpName().equals(pName)) {
	%>
	<!-- 手机 -->
	<div id="ctn-mp" class="container">
		<ul class="list-group">
			<li class="row list-group-item">
				<div class="col-xs-5">
					<img src="/mpcp/img/product/<%=product.getpImg()%>" width="100%">
				</div>
				<div class="col-xs-7">
					<h4><%=product.getpBrand()%><span><%=product.getpName()%></span>
					</h4>
					<h4>
						¥<%=product.getpPrice()%></h4>
					<button class="addCP btn btn-primary" type="button">add CP</button>
				</div>
			</li>
		</ul>
	</div>
	<!-- 详细参数，用折叠面板 -->
	<div id="ctn-detail" class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading" data-toggle="collapse"
				data-parent="#ctn-detail" data-target="#detail-main">
				<h4 class="panel-title">主要参数</h4>
			</div>
			<div id="detail-main" class="panel-collapse collapse in">
				<div class="panel-body">
					<table class="table table-bordered table-hover">
						<tbody>
							<tr>
								<td>CPU型号</td>
								<td><%=product.getpCpu()%></td>
							</tr>
							<tr>
								<td>RAM+ROM</td>
								<td><%=product.getpRamrom()%></td>
							</tr>
							<tr>
								<td>主屏尺寸</td>
								<td><%=product.getpSize()%></td>
							</tr>
							<tr>
								<td>摄像头</td>
								<td><%=product.getpCamera()%></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading" data-toggle="collapse"
				data-parent="#ctn-detail" data-target="#detail-other">
				<h4 class="panel-title">其它参数</h4>
			</div>
			<div id="detail-other" class="panel-collapse collapse">
				<div class="panel-body">
					<table class="table table-bordered table-hover">
						<tbody>
							<tr>
								<td>上市时间</td>
								<td><%=product.getpTime()%></td>
							</tr>
							<tr>
								<td>电池容量</td>
								<td><%=product.getpBattery()%></td>
							</tr>
							<tr>
								<td>SIM卡类型</td>
								<td><%=product.getpSim()%></td>
							</tr>
							<tr>
								<td>机身接口</td>
								<td><%=product.getpInterface()%></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%
		}
		}
	%>

	<!-- 默认隐藏的readyCP -->
	<div id="ctn-cp" class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">Ready To CP</h3>
			</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<tbody>
						<%
							if (session.getAttribute("cpList") != null) {
								List<String> cpList = (List<String>) session.getAttribute("cpList");
								for (String cp : cpList) {
						%>
						<tr>
							<td><%=cp%></td>
							<td><a class="removeCP">remove</a></td>
						</tr>
						<%
							}
							}
						%>
					</tbody>
				</table>
			</div>
			<div class="panel-footer">
				<button class="goCP btn btn-primary" type="button">goCP</button>
				<button id="hideCP" class="btn btn-default" type="button">cancel</button>
			</div>
		</div>
	</div>
	<!-- add CP的成功提示 -->
	<div id="ctn-alert" class="alert alert-success">
		<strong>Got It! :)</strong>
	</div>

	<!-- user-defined JavaScript -->
	<script>
		$('.addCP').click(function (e) {
			e.preventDefault();
			$.ajax({
				type: "GET",
				url: "/mpcp/PdcompareServlet?aor=add",
				data: {
					pName: $(this).prev().prev().find('span').text()
				},
				dataType: "text",
				success: function (response) {
					$('#ctn-cp').find('tbody').append(response);
					$('#ctn-alert').fadeToggle();
					setTimeout(() => {
						$('#ctn-alert').fadeToggle();
					}, 1000);
					$('.removeCP').click(function (e) {
						e.preventDefault();
						$(this).parent().parent().remove();
						$.ajax({
							type: "GET",
							url: "/mpcp/PdcompareServlet?aor=remove",
							data: {
								pName: $(this).parent().prev().text()
							}
						});
						if ($('#ctn-cp tbody').children().length != 2) {
							$('.goCP').attr("disabled", "disabled");
						} else {
							$('.goCP').removeAttr("disabled");
						}
					});
					if ($('#ctn-cp tbody').children().length != 2) {
						$('.goCP').attr("disabled", "disabled");
					} else {
						$('.goCP').removeAttr("disabled");
					}
				}
			});
		});

		$('.removeCP').click(function (e) {
			e.preventDefault();
			$(this).parent().parent().remove();
			$.ajax({
				type: "GET",
				url: "/mpcp/PdcompareServlet?aor=remove",
				data: {
					pName: $(this).parent().prev().text()
				}
			});
			if ($('#ctn-cp tbody').children().length != 2) {
				$('.goCP').attr("disabled", "disabled");
			} else {
				$('.goCP').removeAttr("disabled");
			}
		});
	</script>
	<script src="/mpcp/js/pddetailjs.js"></script>
</body>
</html>