var inputText = $('input[type="text"]'),
    inputPassword = $('input[type="password"]'),
    formBtn = $('button[type="submit"]');

// 监听input value的变化
inputText.on('input', function () {
    if (inputText.val() == "") {
        formBtn.attr("disabled", "disabled");
    } else if (inputPassword.val() == "") {
        formBtn.attr("disabled", "disabled");
    } else {
        formBtn.removeAttr("disabled");
    }
});
inputPassword.on('input', function () {
    if (inputPassword.val() == "") {
        formBtn.attr("disabled", "disabled");
    } else if (inputText.val() == "") {
        formBtn.attr("disabled", "disabled");
    } else {
        formBtn.removeAttr("disabled");
    }
});