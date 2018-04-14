            <div id="footer-widget-box" class="site-footer wow fadeInUp" data-wow-delay="0.3s">
                <div class="footer-widget">
                    <aside id="nav_menu-3" class="widget widget_nav_menu wow fadeInUp" data-wow-delay="0.3s">
                        <h3 class="widget-title">
                            <div class="s-icon"></div>
                            更多推荐
                        </h3>
                        <div class="menu-container">
                            <ul id="menu" class="menu">
                                <li id="menu-item-2342" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2342">
                                    <a target="_blank" href="${siteConfigDTO.weburl}/links.html"><i class="iconfont"></i> 友情链接
                                    </a>
                                </li>
                                <li id="menu-item-2343" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2343">
                                    <a target="_blank" href="${siteConfigDTO.weburl}/history.html"><i class="iconfont"></i> 发展历史</a>
                                </li>
                                <li id="menu-item-2347" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2347">
                                    <a target="_blank" href="${siteConfigDTO.weburl}/sitemap.html"><i class="iconfont"></i> 网站地图</a>
                                </li>
                                <li id="menu-item-2348" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2348">
                                    <a target="_blank" href="${siteConfigDTO.weburl}/blog.html"><i class="iconfont"></i> 博客风格</a>
                                </li>
                                <li id="menu-item-2349" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2349">
                                    <a target="_blank" href="${siteConfigDTO.weburl}/label-overview.html"><i class="iconfont"></i> 标签总览</a>
                                </li>
                                <li id="menu-item-2350" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2350">
                                    <a target="_blank" href="${siteConfigDTO.weburl}/sponsor.html"><i class="iconfont"></i> 赞助本站</a>
                                </li>
                                <li id="menu-item-2355" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2355">
                                    <a target="_blank" href="${siteConfigDTO.weburl}/recent-comments.html"><i class="iconfont"></i> 近期留言</a>
                                </li>
                                <li id="menu-item-2361" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2361">
                                    <a target="_blank" href="${siteConfigDTO.weburl}/random.html"><i class="iconfont"></i> 随机文章
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="clear"></div>
                    </aside>
                    <aside id="php_text-2" class="widget widget_php_text wow fadeInUp" data-wow-delay="0.3s">
                        <h3 class="widget-title">
                            <div class="s-icon"></div>
                            关于本站
                        </h3>
                        <div class="textwidget widget-text">
                        ${siteConfigDTO.description}
                        </div>
                        <div class="clear"></div>
                    </aside>
                    <div class="clear"></div>
                </div>
            </div>
			<footer id="colophon" class="site-footer wow fadeInUp" data-wow-delay="0.3s" role="contentinfo">
                <div class="site-info">
                    Copyright ©&nbsp;2011-<span id="currentYear">2018</span>
                    <a href="${siteConfigDTO.weburl}" target="_blank">${siteConfigDTO.domain}</a> All Rights Reserved. <br/> ${siteConfigDTO.webname} .
                    <a href="http://www.miitbeian.gov.cn/" rel="nofollow" target="_blank">${siteConfigDTO.beianinfo}</a>
                    <span class="add-info"> 博客已稳定运行：<span id="timeShow">2年303天22时22分48秒</span> .
                        <!--  cnzz数据统计 -->
					<script type="text/javascript">
						var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
                        document.write(unescape("%3Cspan id='cnzz_stat_icon_4445524'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s5.cnzz.com/stat.php%3Fid%3D4445524%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));
					</script>
					</span>
                </div>
                <!-- .site-info -->
            </footer>
			<!-- .site-footer -->
			<ul id="scroll">
                <div class="log log-no">
                    <li>
                        <a class="log-button" title="文章目录"><i class="fa fa-bars"></i></a>
                    </li>
                    <div class="log-prompt" style="display: none;">
                        <div class="log-arrow">文章目录</div>
                    </div>
                </div>
                <li>
                    <a class="scroll-h" title="返回顶部"><i class="fa fa-angle-up"></i></a>
                </li>
                <li>
                    <a class="scroll-b" title="转到底部"><i class="fa fa-angle-down"></i></a>
                </li>
                <li class="gb2-site">
                    <a name="gb2big5" id="gb2big5" href="javascript:StranBody()" title="繁體"><span>繁</span></a>
                </li>
                <li class="qr-site">
                    <a href="javascript:void(0)" class="qr" title="二维码"><i class="fa fa-qrcode"></i>
                        <span class="qr-img">
            <div id="output">
                <img class="alignnone" src="${request.contextPath}/themes/${siteConfigDTO.webtheme}/favicon.ico">
            </div>
            </span>
                    </a>
                </li>
                <script type="text/javascript">
                    $(document).ready(function() {
                        if(!+[1, ]) {
                            present = "table";
                        } else {
                            present = "canvas";
                        }
                        $('#output').qrcode({
                            render: present,
                            text: window.location.href,
                            width: "150",
                            height: "150"
                        });
                    });
                </script>
            </ul>