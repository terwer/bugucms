<!--
/*
____________  _________    _____________  ___      ______      ___  _________    _____________
| __________| / ______ /   |  __________ | \ \     | | \ \     | | | / ______  |  __________ |
    |  |    | |          |    _________   \ \    | |  \ \    | || | |          |  __________
   |  |     | | ______   |  /_________ |  \ \   | |   \ \   | |   | | ______   |  /_________|
  |  |      | |______ | |  | \ \          \ \  | |    \ \  | |    | |______ | |  | \ \
 |  |       | |________ |  |  \ \_______  \ \| |      \ \ |_|     | |________ |  |  \ \_______
|__|        /_/______ | | _|   \______/   \_\_|       \_ |_|      /_/______ | | _|   \______/
*/
-->
<#-- 定义根路径 -->
<#assign basePath=request.contextPath />
<#macro htmlHead title charset="utf-8" lang="zh-CN">
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=${charset}" />
        <meta http-equiv="Content-Language" content="${lang}" />
        <!-- 禁止浏览器缓存 -->
        <meta http-equiv="Cache-Control" content="no-transform">
        <meta http-equiv="Cache-Control" content="no-siteapp">
        <meta name="renderer" content="webkit">
        <meta name="keywords" content="${siteConfigDTO.keywords}">
        <meta name="description" content="${siteConfigDTO.description}">
        <!-- viewport可以控制用户在手机上两个手指缩放的行为范围，这行代码的意思是宽度为设备宽度，初始缩放为1，最大缩放也是1倍，用户不能缩放 -->
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
        <!-- apple这行是告诉iOS这是个应用，就不会像网页一样可以滚动到顶部回弹一下的效果，就是可以看到苹果默认背景灰色部分的那个效果 -->
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <title>${title}</title>
        <link rel="shortcut icon" href="${basePath}/themes/${siteConfigDTO.webtheme}/favicon.ico">
        <link rel="apple-touch-icon" sizes="114x114" href="${basePath}/themes/${siteConfigDTO.webtheme}/favicon.ico">
        <link rel="profile" href="http://gmpg.org/xfn/11">
        <!-- jquery -->
        <script type="text/javascript" src="${basePath}/webjars/jquery/jquery.min.js"></script>
        <!-- jquery.qrcode -->
        <script type="text/javascript" src="${basePath}/themes/${siteConfigDTO.webtheme}/js/jquery.qrcode.min.js"></script>
        <!-- pace -->
        <link rel="stylesheet" type="text/css" href="${basePath}/themes/${siteConfigDTO.webtheme}/lib/pace/css/pace.css">
        <!-- 自定义页面头部开始 -->
        <#nested>
        <link rel="stylesheet" id="default-style-css" type="text/css" media="all" href="${basePath}/themes/${siteConfigDTO.webtheme}/style.css">
        <link rel="stylesheet" type="text/css" href="${basePath}/themes/${siteConfigDTO.webtheme}/default.css">
        <!-- 自定义页面头部结束 -->
    </head>
</#macro>

<#macro htmlBody>
    <body>
        <!-- 进度条开始-->
        <div class="pace  pace-inactive">
            <div class="pace-progress" data-progress-text="100%" data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
                <div class="pace-progress-inner"></div>
            </div>
            <div class="pace-activity"></div>
        </div>
        <!-- 进度条结束-->
        <div id="page" class="hfeed site">
            <!-- 头部内容开始 -->
            <#include "header.ftl">
            <!-- 头部内容结束 -->
            <!-- 自定义正文开始 -->
            <#nested>
            <!-- 自定义正文结束 -->
            <!-- 底部开始 -->
            <#include "footer.ftl">

            <!-- 底部结束 -->
        </div>
        <!-- pace -->
        <script src="${basePath}/themes/${siteConfigDTO.webtheme}/lib/pace/js/pace.min.js"></script>
    </body>
</html>
</#macro>