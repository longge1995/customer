<%-- User: CDHong Date: 2018/11/20--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>用户列表</title>
    <link rel="stylesheet" href="static/commons/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="static/css/public.css" media="all" />
    <style>
        #blockquote1{height: 35px;margin: 10px;padding: 10px;}
        #blockquote1 h2{float: left;}
    </style>
</head>
<body class="childrenBody layui-anim layui-anim-scaleSpring">
<blockquote id="blockquote1" class="layui-elem-quote layui-quote-nm layui-bg-gray clear">
    <h2>数据字典管理</h2>
</blockquote>
    <blockquote class="layui-elem-quote">
        <form action=""  class="layui-form">

            <div class="layui-form-item">

                <div class="layui-inline">
                    类别
                </div>
            <div class="layui-inline">
                <input type="datatype" placeholder="请输入查询类别" autocomplete="off"  name="datatype" class="layui-input" />
            </div>

            <div class="layui-inline">
                条目
            </div>
                <div class="layui-inline">
                    <input type="datadescribe" placeholder="请输入查询条目" autocomplete="off"  name="datadescribe" class="layui-input" />
                </div>

            <div class="layui-inline">
                值
            </div>
                <div class="layui-inline">
                    <input type="datavalue" placeholder="请输入查询的值" autocomplete="off"  name="datavalue" class="layui-input" />
                </div>


                <div class="layui-inline">
                    <a class="layui-btn" lay-submit lay-filter="search">查询</a>
                    <a class="layui-btn layui-btn-normal add_btn">添加</a>
                    <a class="layui-btn " lay-submit lay-filter="return">返回数据表格</a>
                </div>
            </div>

        </form>
    </blockquote>

    <table id="datadictionary_list" lay-filter="datadictionary_list"></table>

    <script type="text/html" id="userTool">
        <%--根据表格每一行中editable字段的数值来判断是否要使用toolbar工具--%>
        {{# if(d.editable){ }}
        <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="edit_btn">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del_btn">删除</a>
        {{# } }}
    </script>

    <script type="text/javascript" src="static/commons/layui/layui.js"></script>
    <script type="text/javascript" src="static/js/BaseData/datadictionary_list.js"></script>
</body>
</html>
