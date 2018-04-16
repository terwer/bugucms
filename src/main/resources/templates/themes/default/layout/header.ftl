            <header id="masthead" class="site-header">
                <nav id="top-header">
                    <div class="top-nav">
                        <div id="user-profile">
                            <span id="sayHello">早上好，</span>
                            <span id="localtime">现在是：<i id="nowTime">2018年4月1日 06:44:47 星期日</i></span>
                        </div>
                        <div class="menu-container">
                            <ul id="menu" class="top-menu">
                                            <#if userDTO??>
                                                <li>欢迎您：${userDTO.nickName}，<a id="logout" href="javascript:void(0);" title="退出">退出</a></li>
                                            <#else>
                                                <li id="menu-item-01" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2196">
                                                    <a target="_blank" href="${siteConfigDTO.weburl}/reg"><i class="iconfont"></i> 注册
                                                    </a>
                                                </li>
                                            <li id="menu-item-02" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2196">
                                                <a target="_blank" href="${siteConfigDTO.weburl}/login"><i class="iconfont"></i> 登录
                                                </a>
                                            </li>

                                            </#if>
                                <li id="menu-item-962" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-962">
                                    <a target="_blank" href="${siteConfigDTO.weburl}/shuoshuo.html"><i class="iconfont"></i> 说说
                                    </a>
                                </li>
                                <li id="menu-item-2458" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2458">
                                    <a target="_blank" href="${siteConfigDTO.weburl}/music.html"><i class="iconfont icon-yinle"></i> 音乐</a>
                                </li>
                                <li id="menu-item-2169" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2169">
                                    <a target="_blank" href="${siteConfigDTO.weburl}/plan-thin.html"><i class="iconfont"></i> 计划薄</a>
                                </li>
                                <li id="menu-item-964" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-964">
                                    <a target="_blank" href="${siteConfigDTO.weburl}/read-people.html"><i class="iconfont"></i> 读者墙
                                    </a>
                                </li>
                                <li id="menu-item-968" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-968">
                                    <a target="_blank" href="${siteConfigDTO.weburl}/file.html"><i class="iconfont"></i> 博客归档</a>
                                </li>
                                <li id="menu-item-2689" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-2689">
                                    <a href="${siteConfigDTO.weburl}/go/luck"><i class="iconfont"></i> 试试手气</a>
                                </li>
                                <li id="menu-item-2196" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2196">
                                    <a target="_blank" href="${siteConfigDTO.weburl}/about.html"><i class="iconfont"></i> 关于本站
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- #top-header -->
                <div id="menu-box">
                    <div id="top-menu"><span class="nav-search"><i class="fa fa-search"></i></span>
                        <hgroup class="logo-site">
                            <h1 class="site-title"><a href="${siteConfigDTO.weburl}/"><img src="${request.contextPath}/themes/${siteConfigDTO.webtheme}/logo-big.png" title="${siteConfigDTO.webname}" rel="home"><span class="site-name">${siteConfigDTO.webname}</span></a></h1>
                        </hgroup>
                        <!-- .logo-site -->
                        <div id="site-nav-wrap">
                            <div id="sidr-close">
                                <a href="${siteConfigDTO.weburl}/#sidr-close" class="toggle-sidr-close">×</a>
                            </div>
                            <nav id="site-nav" class="main-nav">
                                <a href="${siteConfigDTO.weburl}/#sidr-main" id="navigation-toggle" class="bars"><i class="fa fa-bars"></i></a>
                                <div class="menu-container">
                                    <ul id="menu" class="down-menu nav-menu sf-js-enabled sf-arrows">
                                        <li id="menu-item-26" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-26">
                                            <a href="${siteConfigDTO.weburl}/"><i class="iconfont icon-shouye"></i> 网站首页</a>
                                        </li>
                                        <li id="menu-item-2917" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-2917">
                                            <a href="${siteConfigDTO.weburl}/category/coding/"><i class="iconfont"></i> 代码编程</a>
                                        </li>
                                        <li id="menu-item-2504" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-2504">
                                            <a href="${siteConfigDTO.weburl}/category/toss-more-than/"><i class="iconfont"></i> 折腾不止
                                            </a>
                                        </li>
                                        <li id="menu-item-1639" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-1639">
                                            <a href="${siteConfigDTO.weburl}/category/web/"><i class="fa fa-html5"></i> 前端技术</a>
                                        </li>
                                        <li id="menu-item-87" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-87">
                                            <a href="${siteConfigDTO.weburl}/category/resource-sharing/"><i class="iconfont"></i> 资源分享
                                            </a>
                                        </li>
                                        <li id="menu-item-34" class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-34">
                                            <a href="${siteConfigDTO.weburl}/category/talk/"><i class="iconfont icon-youxian"></i> 谈笑风生
                                            </a>
                                        </li>
                                        <li id="menu-item-288" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-288">
                                            <a href="${siteConfigDTO.weburl}/messaged.html"><i class="iconfont icon-liuyan"></i> 留言板
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                            <!-- #site-nav -->
                        </div>
                        <!-- #site-nav-wrap -->
                        <div class="clear"></div>
                    </div>
                    <!-- #top-menu -->
                </div>
                <!-- #menu-box -->
            </header>
			<!-- #masthead -->
			<div id="search-main">
                <a title="关闭" class="fancybox-close" href="javascript:;" id="search-close"><i class="fa fa-times"></i></a>
                <div id="searchbar">
                    <form method="get" id="searchform" action="${siteConfigDTO.weburl}/"><input type="text" value="" name="s" id="s" placeholder="输入搜索内容" required="">
                        <button type="submit" id="searchsubmit">搜索</button>
                    </form>
                </div>
                <div class="clear"></div>
            </div>
