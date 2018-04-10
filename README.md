# bugucms
轻量级、插件化的内容管理系统

# 相关技术
Centos 7.4      
JDK1.8.162   
Spring Boot 2.0.0   
LogBack      
FreeMarker 模板引擎         
Maven 3.5.3 (使用阿里云Maven仓库)          
Tomcat 8.5.28   
MySQL 5.7.19   
Oracle 11g    
MyBatis 3.4.6   
JSON    
kaptcha图片验证码组件  
HTML5      
jQuery 1.10.1     
bootstrap 3.3.7        

# 启动
## 注意
（1）ojdbc6.jar需要手动安装，在项目的lib目录下，需要用命令```mvn install:install-file -DgroupId=com.oracle -DartifactId=ojdbc6 -Dversion=11.2.0.4 -Dpackaging=jar -Dfile=ojdbc6.jar```安装        
（2）Spring Boot 默认将 /webjars/** 映射到 classpath:/META-INF/resources/webjars/ ，根据访问资源的规则，在JSP页面中引入jquery.js的方法为：
```
<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/1.10.1/jquery.js"></script>
```
（3）错误页面网页与API调用分开，用``isAPI``字段标识，``String isAPI = request.getParameter("isAPI");``，网页访问不传，API访问传``Y``，API调用系统异常返回JSON，网页访问系统异常输出HTML页面。            

## 本地启动   
（1）打开``pom.xml``里面```spring-boot-starter-tomcat```的```<scope>provided</scope>```   
（2）运行```BugucmsApplication.java```里面的```main```方法  

## Tomcat启动
（1）注释掉``pom.xml``里面```spring-boot-starter-tomcat```的```<scope>provided</scope>``` ，或者直接复制```pom-prd-tomcat.xml```到```pom.xml```   
（2）使用IntelliJ IDEA        S
Build --> Build Artifacts --> 选择要打包编译的war --> 在项目target文件夹下出现新的war包   
或者使用eclipse    
Run as -->Maven Build -->  在弹出的框里面输入命令 ``package``，点击run，等待任务完成出现 ``BUILD SUCCES``，``ROOT.war``就会被打包好在``target``目录下     

（3）将war包放到tomcat的webapps目录下  

## 发布流程
（1）打包之前copy``pom-prd-tomcat.xml``到``pom.xml``      
（2）打包之前``application-prd.properties``配置数据库用户名，密码 copy到``application.properties``  
（3）部署之前初始化ddl表结构（如果需要）      
（4）部署之前``20180407-prd.sql``初始化数据     
 