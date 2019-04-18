<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Mobile-phone Compare</title>

<!-- Bootstrap CSS -->
<link href="/mpcp/css/bootstrap.css" rel="stylesheet">
<!-- user-defined CSS -->
<link href="/mpcp/css/indexstyle.css" rel="stylesheet">
<!-- jQuery -->
<script src="/mpcp/js/jquery-3.3.1.js"></script>
<!-- Bootstrap JavaScript -->
<script src="/mpcp/js/bootstrap.js"></script>
</head>
<body>
	<!-- header头部（LOGO，搜索栏，热搜关键词） -->
	<div id="ctn-header" class="container">
		<h1>MPCP</h1>
		<form role="form" action="/mpcp/PdlistServlet">
			<div class="input-group">
				<input name="product" class="form-control" type="text"
					placeholder="手机型号/品牌"> <span class="input-group-btn">
					<button class="btn btn-primary" type="submit">Search!</button>
				</span>
			</div>
		</form>
	</div>
	<!-- content内容（几个常用功能按钮） -->
	<div id="ctn-content" class="container">
		<div class="row">
			<div class="col-xs-3">
				<img id="showCP" class="img-circle" src="/mpcp/img/comfunc.png"
					width="100%"> <span>readyCP</span>
			</div>
			<div class="col-xs-3">
				<img class="img-circle" src="/mpcp/img/comfunc.png" width="100%">
				<span>func-2</span>
			</div>
			<div class="col-xs-3">
				<img class="img-circle" src="/mpcp/img/comfunc.png" width="100%">
				<span>func-3</span>
			</div>
			<div class="col-xs-3">
				<img class="img-circle" src="/mpcp/img/comfunc.png" width="100%"
					onclick="window.location.href='/mpcp/page/adminlogin.jsp'"> <span>任意门</span>
			</div>
		</div>
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
				<button class="goCP btn btn-primary" type="button">goCP</button>
				<button id="hideCP" class="btn btn-default" type="button">cancel</button>
			</div>
		</div>
	</div>

	<!-- user-defined JavaScript -->
	<script>
		$('.removeCP').click(function(e) {
			e.preventDefault();
			$(this).parent().parent().remove();
			$.ajax({
				type : "GET",
				url : "/mpcp/PdcompareServlet?aor=remove",
				data : {
					pName : $(this).parent().prev().text()
				}
			});
			if ($('#ctn-cp tbody').children().length != 2) {
				$('.goCP').attr("disabled", "disabled");
			} else {
				$('.goCP').removeAttr("disabled");
			}
		});
	</script>
	<script src="/mpcp/js/indexjs.js"></script>
</body>
</html>