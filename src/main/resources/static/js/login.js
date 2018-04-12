$(function() {
	//将页面body的高度设为window的高度
	$("body").height($(window).height());

	// 页面高度超过设备可见高度时，阻止掉touchmove事件。
	//移动Web滚动性能优化: Passive event listeners
	//https://segmentfault.com/a/1190000007913386
	document.addEventListener('touchmove', function(event) {
		event.preventDefault();
	}, {
		passive: false
	});

	//手机号输入框默认获得焦点
	$("#account").focus();
	//表单验证
	validate_form();
	//登录
	do_login();
});

//帮助中心
function show_help(obj) {
	var d = dialog({
		align: 'left',
		content: '这里是帮助中心',
		quickClose: true
	});
	d.show(obj);
	//showTopContentWindow("show_help", "http://www.baidu.com", "帮助中心", 375 / 2, 667 / 2);
}

//表单验证  
function validate_form() {
	//表单验证
	$("#loginForm").validate({
		rules: {
			account: {
				required: true,
				minlength: 11,
				maxlength: 11,
				mobile: true //,
				//					remote: {
				//						url: '/Account/Login/ValidateAccount/',
				//						data: {
				//							type: function() {
				//								return "normal";
				//							},
				//							accountType: get_account_type(userName)
				//						}
				//					}
			},
			password: {
				required: true,
				rangelength: [8, 20] //,
				//					remote: {
				//						url: '/Account/Login/ValidateAPassword/',
				//						data: {
				//							userName: function() {
				//								return $.trim($("#userName").val());
				//							},
				//							type: function() {
				//								return "normal";
				//							},
				//							accountType: get_account_type(userName)
				//						}
				//					}
			}
		},
		messages: {
			account: {
				required: "请输入手机号",
				minlength: "手机号必须为11位",
				maxlength: "手机号必须为11位",
				mobile: "手机号不合法" //,
				//				remote: "该手机号尚未注册"
			},
			password: {
				required: "请输入密码" //,
				//				remote: "密码错误"
			}
		},
		focusInvalid: true,
		errorPlacement: function(error, element) {
			var errorMsg = error[0].innerHTML;
			var elementName = element[0].name;
			$("#" + elementName).formtip(errorMsg);
		},
		success: function(element) {
			var elem = $(element)[0].htmlFor;
			$("#" + elem).poshytip('disable');
			$("#" + elem).poshytip('destroy');
		}
	});
}

//登录提交
function do_login() {
	$("#btnSubmit").click(function() {
		//集成jquery validate
		if(!$("#loginForm").valid()) {
			return false;
		} else {
			var account = $.trim($("#account").val());
			var password = $.trim($("#password").val());
			login_ajax(account, password);
			return false;
		}
	});
}

function login_ajax(account, password) {
	alert("form valid ok,login ing...");
	var url = "/Account/Login/DoLogin";
	var type = "normal";
	//accountType = "username";
	var accountType = get_account_type(account);
	//	//var userName = "admin@11524760"; 
	//	//var userName = "cyutyw@126.com"; 
	//	//var userName = "15225062328"; 
	//	//var userPassword = "123456"; 
	//	var clientIp = "";
	//	//var clientIp = get_client_ip();
	//	var clientPlace = "";
	//	//var clientPlace = encodeURI(get_client_place());
	//	var clientTime = get_client_time();
	//	//var remember = $.trim($("#remember").prop("checked"));
	//	var remember = false;
	//	//alert(remember);
	//	//alert("ok");
	//	$.ajax({
	//		type: "post",
	//		url: url,
	//		data: {
	//			type: type,
	//			accountType: accountType,
	//			userName: userName,
	//			userPassword: userPassword,
	//			remember: remember,
	//			clientIp: clientIp,
	//			clientPlace: clientPlace,
	//			clientTime: clientTime
	//		},
	//		dataType: "json",
	//		beforeSend: function() {
	//			showTopContentDialog("login_loding", "<div class='dialog_loading'>正在登录中，请稍后...</div>", "登陆提示", 400, 75);
	//		},
	//		complete: function() {},
	//		success: function(data) {
	//			//console.log(data.Status);                   
	//			if(data.Status) { //登录成功
	//				top.dialog.list["login_loding"].close().remove();
	//				//showMsg("登陆失败,请联系管理员！", "Error");
	//				//showTopContentDialog("login_loding_error", "<div class='dialog_ok'>登陆成功,正在跳转中...</div>", "登陆成功", 400, 75);
	//				showTopDialog("show_loading", "<div class='dialog_loading'>登陆成功,页面加载中，请稍后...</div>", "温馨提示", 400, 95);
	//				setTimeout(function() {
	//					top.dialog.list["login_loding_error"].close().remove();
	//				}, 1000);
	//				tiaozhuan();
	//			} else {
	//				top.dialog.list["login_loding"].close().remove();
	//				//showMsg("登陆失败,请联系管理员！", "Error");
	//				//showTopContentDialog("login_loding_error", "<div class='dialog_error'>登陆失败,用户名或密码错误！</div>", "登陆出错", 400, 75, false);
	//				showTopContentDialog("login_loding_error", "<div class='dialog_error'>" + data.Msg + "</div>", "登录出错", 400, 75, false);
	//				setTimeout(function() {
	//					top.dialog.list["login_loding_error"].close().remove();
	//				}, 1000);
	//			}
	//		},
	//		error: function() {
	//			top.dialog.list["login_loding"].close().remove();
	//			//showMsg("登陆失败,请联系管理员！", "Error");
	//			showTopContentDialog("login_loding_error", "<div class='dialog_error'>网络连接错误！</div>", "登录出错", 400, 75);
	//			setTimeout(function() {
	//				top.dialog.list["login_loding_error"].close().remove();
	//			}, 1000);
	//		}
	//	});
	//必须有这个组织表单提交
	return false;
}

//根据用户名判断账号类型(username,email,phone)
//var userName = "cyutyw@126.com";
//var userName = "15225062328";
function get_account_type(userName) {
	var reg_email = /^\w+@@[a-z0-9]+\.[a-z]+$/i;
	var reg_phone = /^[1]+[3,5]+\d{9}$/;
	if(reg_email.test(userName)) {
		return "email";
	} else if(reg_phone.test(userName)) {
		return "phone";
	} else {
		return "username";
	}
}