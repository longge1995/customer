<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
    <base href="<%=basePath%>"/>

    <meta charset="UTF-8">
    <title>客户关系管理系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="shortcut icon" href="./favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="static/css/font.css">
    <link rel="stylesheet" href="static/css/weadmin.css"/>
    <%--<script type="text/javascript" src="static/lib/layui/layui.all.js" charset="utf-8"></script>--%>
    <script type="text/javascript" src="static/lib/layui/layui.all.js" charset="utf-8"></script>

</head>
<body class=" layui-anim layui-anim-scaleSpring">

<%--<a href="/customer/findAll">客户信息管理</a>--%>


<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="./index.html">客户关系管理系统</a>
    </div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>

    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            当前用户：${USER_SESSION.username}
            <%--<dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                   当前用户：${USER_SESSION.username}
                </dd>
            </dl>--%>
        </li>
        <li class="layui-nav-item to-index">
           <%-- <a href="/">退出登录</a>--%>
               <a href="${pageContext.request.contextPath}/tologin/logout">退出登录</a>
        </li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>营销管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>

                        <%--<a href="/customer/findAll">客户信息管理</a>--%>
                            <%--<a _href="./pages/views/sales_opportunity.html">--%>
                            <a _href="/saleManage/findAllSaleOpList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>销售机会管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>

                    </li>
                    <li>
                        <a _href="/saleManage/findAllAssignSaleOpList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>客户开发计划管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>

                    </li>

                </ul>
            </li>
            <li>
                <a _href="javascript:;">
                    <i class="iconfont">&#xe705;</i>
                    <cite>客户管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/customer/findAll">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>客户信息管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>

                    </li>
                    <li>
                        <a _href="/customer/findAllLoss">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>客户流失管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>

                    </li>

                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>服务管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="service/findUserWithCutomer">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>服务创建</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="service/findNewCreation">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>服务分配</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="service/findAllocated">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>服务处理</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="service/findProcessed">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>服务反馈</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="service/findFile">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>服务归档</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>统计报表</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/Contribution/finAll">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>客户贡献分析</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="/CustomerForm/findGrade">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>客户构成分析</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="/CustomerService/findByYear">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>客户服务分析</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="/CustomerLoss/findCustomerLoss">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>客户流失分析</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6ce;</i>
                    <cite>基础数据</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/views/basedata/datadictionary_list.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>数据字典管理</cite>
                        </a>
                    </li>

                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="wenav_tab" id="WeTabTip" lay-allowclose="true">
        <ul class="layui-tab-title" id="tabName">
            <li>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show layui-anim layui-anim-upbit">
                <iframe src='static/views/welcome.html' frameborder="0" scrolling="yes" class="weIframe"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">Copyright ©2018 huaeryeer v1.0 All Rights Reserved</div>
</div>
<!-- 底部结束 -->
<script type="text/javascript">
    //			layui扩展模块的两种加载方式-示例
    //		    layui.extend({
    //			  admin: '{/}../../static/js/admin' // {/}的意思即代表采用自有路径，即不跟随 base 路径
    //			});
    //			//使用拓展模块
    //			layui.use('admin', function(){
    //			  var admin = layui.admin;
    //			});
    layui.config({
        base: './static/js/'
        ,version: '101100'
    }).use('admin');
    layui.use(['jquery','admin'], function(){
        var $ = layui.jquery;

    });

</script>


</body>


<!--Tab菜单右键弹出菜单-->
<ul class="rightMenu" id="rightMenu">
    <li data-type="fresh">刷新</li>
    <li data-type="current">关闭当前</li>
    <li data-type="other">关闭其它</li>
    <li data-type="all">关闭所有</li>
</ul>




</html>
