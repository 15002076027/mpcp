// 默认隐藏addCP
// 判断goCP
$(document).ready(function() {
	$('#ctn-alert').hide();

	if ($('#ctn-cp tbody').children().length != 2) {
		$('.goCP').attr("disabled", "disabled");
	}
});

// 显示/隐藏 readyCP
$('#showCP').click(function(e) {
	e.preventDefault();
	$('#ctn-cp').show();
});

$('#hideCP').click(function(e) {
	e.preventDefault();
	$('#ctn-cp').hide();
});

// 点击goCP跳转
$('.goCP').click(function(e) {
	e.preventDefault();
	if (typeof ($(this).attr("disabled")) == "undefined") {
		window.location.href = "/mpcp/page/pdcompare.jsp";
	}
});