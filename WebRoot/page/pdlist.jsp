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
<title>Mobile-phone Compare - List</title>

<!-- Bootstrap CSS -->
<link href="/mpcp/css/bootstrap.css" rel="stylesheet">
<!-- user-defined CSS -->
<link href="/mpcp/css/pdliststyle.css" rel="stylesheet">
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
					<li role="presentation" class="divider"></li>
					<li role="presentation"><a id="showCP" role="menuitem"
						tabindex="-1">readyCP</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- list列表 -->
	<div id="ctn-list" class="container">
		<ul class="list-group">
			<%
				List<ProductBean> pList = (List<ProductBean>) session.getAttribute("pList");
				List<String> nameList = (List<String>) session.getAttribute("nameList");

				for (String name : nameList) {
					for (ProductBean product : pList) {
						if (product.getpName().equals(name)) {
			%>
			<li class="row list-group-item">
				<div class="col-xs-5">
					<img src="/mpcp/img/product/<%=product.getpImg()%>" width="100%">
				</div>
				<div class="col-xs-7">
					<h4>
						<a
							href="/mpcp/page/pddetail.jsp?pName=<%=URLEncoder.encode(product.getpName(), "UTF-8")%>">
							<%=product.getpBrand()%><span><%=product.getpName()%></span>
						</a>
					</h4>
					<h4>
						¥
						<%=product.getpPrice()%>
					</h4>
					<button class="addCP btn btn-primary" type="button">add CP</button>
				</div>
			</li>
			<%
				}
					}
				}
			%>
		</ul>
	</div>
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
				<button class="goCP btn btn-primary" type="button">go CP</button>
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
	<script src="/mpcp/js/pdlistjs.js"></script>
</body>

</html>