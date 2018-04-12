<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="${siteConfigDTO.keywords}">
    <meta name="description" content="${siteConfigDTO.description}">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>登陆 - ${siteConfigDTO.webname}</title>
    <link rel="stylesheet" href="${request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${request.contextPath}/css/login.css">








    <link href="/Themes/default/home/css/index.css" rel="stylesheet" type="text/css">
    <link href="/Themes/default/home/css/login.css" rel="stylesheet" type="text/css">
    <link href="/Themes/default/lib/artDialog/css/ui-dialog.css" rel="stylesheet" />
    <link href="/Themes/default/lib/poshytip/tip-yellow/tip-yellow.css" rel="stylesheet" />
    <script src="/Themes/default/lib/jquery/jquery-1.11.1.js"></script>
    <script src="/Themes/default/lib/artDialog/dist/dialog-plus-min.js"></script>
    <script src="/Themes/default/lib/validate/jquery.validate.min.js"></script>
    <script src="/Themes/default/lib/validate/jquery.validate.extend.js"></script>
    <script src="/Themes/default/lib/validate/messages_cn.js"></script>
    <script src="/Themes/default/lib/cookie/jquery.cookie.js"></script>
    <script src="/Themes/default/lib/poshytip/jquery.poshytip.min.js"></script>
    <script src="/Themes/default/lib/function.js"></script>
    <script type="text/javascript">
        $(function () {
            //表单验证      
            $("#loginForm").validate({
                rules: {
                    userName: {
                        rangelength: [5, 20]//,
                        //                            remote: {
                        //                                url: '/Account/Login/ValidateAccount/',
                        //                                data: {
                        //                                    type: function() { return "normal"; },
                        //                                    accountType: get_account_type(userName)
                        //                                }
                    }
                },
                userPassword: {
                    rangelength: [6, 20]//,
                    //                            remote: {
                    //                                url: '/Account/Login/ValidateAccount/',
                    //                                data: {
                    //                                    userName: function() { return $.trim($("#userName").val()); },
                    //                                    type: function() { return "normal"; },
                    //                                    accountType: get_account_type(userName)
                    //                                }
                    //                            }
                    //                      }
                },
                messages: {
                    userName: {
                        required: "用户名不能为空！",
                        rangelength: "用户名6-20位",
                        remote: "该用户名不存在！"
                    },
                    userPassword: {
                        required: "密码不能为空！",
                        rangelength: "密码长度必须在6-20之间",
                        remote: "密码错误！"
                    }
                },
                focusInvalid: true,
                errorPlacement: function (error, element) {
                    var errorMsg = error[0].innerHTML;
                    var elementName = element[0].name;
                    $("#" + elementName).formtip(errorMsg);
                },
                success: function (element) {
                    var elem = $(element)[0].htmlFor;
                    $("#" + elem).poshytip('disable');
                    $("#" + elem).poshytip('destroy');
                }
            });
            //登录
            do_login();
        });
        //登录提交
        function do_login() {
            $("#btnSubmit").click(function () {
                //集成jquery validate   
                if (!$("#loginForm").valid()) {
                    return false;
                } else {
                    var userName = $.trim($("#userName").val());
                    var userPassword = $.trim($("#userPassword").val());
                    login_ajax(userName, userPassword);
                    return false;
                }
            });
        }
        function login_ajax(userName, userPassword) {

            var url = "/Account/Login/DoLogin";
            var type = "normal";
            //accountType = "username";
            var accountType = get_account_type(userName);
            //var userName = "admin@11524760"; 
            //var userName = "cyutyw@126.com"; 
            //var userName = "15225062328"; 
            //var userPassword = "123456"; 
            var clientIp = "";
            //var clientIp = get_client_ip();
            var clientPlace = "";
            //var clientPlace = encodeURI(get_client_place());
            var clientTime = get_client_time();
            //var remember = $.trim($("#remember").prop("checked"));
            var remember = false;
            //alert(remember);
            //alert("ok");
            $.ajax({
                type: "post",
                url: url,
                data: { type: type, accountType: accountType, userName: userName, userPassword: userPassword, remember: remember, clientIp: clientIp, clientPlace: clientPlace, clientTime: clientTime },
                dataType: "json",
                beforeSend: function () {
                    showTopContentDialog("login_loding", "<div class='dialog_loading'>正在登录中，请稍后...</div>", "登陆提示", 400, 75);
                },
                complete: function () {
                },
                success: function (data) {
                    //console.log(data.Status);                   
                    if (data.Status) { //登录成功
                        top.dialog.list["login_loding"].close().remove();
                        //showMsg("登陆失败,请联系管理员！", "Error");
                        //showTopContentDialog("login_loding_error", "<div class='dialog_ok'>登陆成功,正在跳转中...</div>", "登陆成功", 400, 75);
                        showTopDialog("show_loading", "<div class='dialog_loading'>登陆成功,页面加载中，请稍后...</div>", "温馨提示", 400, 95);
                        setTimeout(function () {
                            top.dialog.list["login_loding_error"].close().remove();
                        }, 1000);
                        tiaozhuan();
                    } else {
                        top.dialog.list["login_loding"].close().remove();
                        //showMsg("登陆失败,请联系管理员！", "Error");
                        //showTopContentDialog("login_loding_error", "<div class='dialog_error'>登陆失败,用户名或密码错误！</div>", "登陆出错", 400, 75, false);
                        showTopContentDialog("login_loding_error", "<div class='dialog_error'>" + data.Msg + "</div>", "登录出错", 400, 75, false);
                        setTimeout(function () {
                            top.dialog.list["login_loding_error"].close().remove();
                        }, 1000);
                    }
                },
                error: function () {
                    top.dialog.list["login_loding"].close().remove();
                    //showMsg("登陆失败,请联系管理员！", "Error");
                    showTopContentDialog("login_loding_error", "<div class='dialog_error'>网络连接错误！</div>", "登录出错", 400, 75);
                    setTimeout(function () {
                        top.dialog.list["login_loding_error"].close().remove();
                    }, 1000);
                }
            });
            //必须有这个组织表单提交
            return false;
        }
        //根据用户名判断账号类型(username,email,phone)
        //var userName = "cyutyw@126.com"; 
        //var userName = "15225062328"; 
        function get_account_type(userName) {
            var reg_email = /^\w+@@[a-z0-9]+\.[a-z]+$/i;
            var reg_phone = /^[1]+[3,5]+\d{9}$/;
            if (reg_email.test(userName)) {
                return "email";
            } else if (reg_phone.test(userName)) {
                return "phone";
            } else {
                return "username";
            }
        }
        //忘记密码
        function show_forget() {
            showTopWindow("show_forget", "/Account/Login/ForgetPassword", "找回密码", 600, 300, function () {
                //alert("aaa");
            });
        }
    </script>
</head>
<body>
<!--固定顶部部分 开始-->
<div class="header clearfix">
    <a href="javascript:void(0);" class="current-nav" style="display: block;"><em class="menu-more-ico">
    </em><span id="g_mod_name">${siteConfigDTO.webname}</span></a>
    <div class="vh-avator-area">
        <div class="gl-lang-container">
            <span class="account-name" id="g_help_center">帮助中心</span>
        </div>
    </div>
</div>
<!--固定顶部部分 结束-->
<div class="layout-login">
    <div class="ll-book-container">
        <div class="ll-book-top">
            <div class="ll-logo-area">
                <img src="${request.contextPath}/img/logo-uc.png" alt="${siteConfigDTO.webname}">
                <p class="logo-intro" id="logo-intro">${siteConfigDTO.webslogen}</p>
            </div>
            <div class="form-container" id="form_container">
                <div class="ng-form-area show-place" id="form-area">
                    <form method="post" id="loginForm">
                        <div class="shake-area" id="shake_area" style="z-index: 30;">
                            <div class="enter-area">
                                <input type="text" class="enter-item first-enter-item required" id="userName" name="userName">
                            </div>
                            <div class="enter-area" style="z-index: 20;">
                                <input type="password" class="enter-item last-enter-item required" id="userPassword"
                                       name="userPassword">
                            </div>
                        </div>
                        <input id="btnSubmit" class="button orange" type="submit" value="立即登录">
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="other-tips">
        <a href="${request.contextPath}/findpwd" id="forget_pwd"><em class="forget-ico"></em><span>忘记密码？</span></a>
        <a href="${request.contextPath}/reg" id="cloud_register"><em class="register-ico"></em><span>注册</span></a>
    </div>
</div>
<!--主页主题部分 开始-->
</body>
</html>
