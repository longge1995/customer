<%--
  Created by IntelliJ IDEA.
  User: haoge
  Date: 2018/11/25
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>新建数据字典</title>
    <link rel="stylesheet" href="static/commons/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="static/css/public.css" media="all" />
</head>
<body class="childrenBody padr30">
<form class="layui-form" action="" id="datadictionary_list_add">
    <div class="layui-form-item">
        <label class="layui-form-label">编号</label>
        <div class="layui-input-block">
            <input type="text" name="id" value=""  autocomplete="off" class="layui-input" />
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类别</label>
        <div class="layui-input-block">
            <input type="text" name="datatype" required  lay-verify="required" placeholder="请输入类别" autocomplete="off" class="layui-input" /><i style="color:red;">*</i>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">条目</label>
        <div class="layui-input-block">
            <input type="text" name="datadescribe" required  lay-verify="required" placeholder="请输入条目" autocomplete="off" class="layui-input" /><i style="color:red;">*</i>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">值</label>
        <div class="layui-input-block">
            <input type="text" name="datavalue" required  lay-verify="required" placeholder="请输入值" autocomplete="off" class="layui-input" /><i style="color:red;">*</i>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">是否可编辑</label>
        <div class="layui-input-block" lay-filter="checkbox1">
            <%--必须和在js文件下对checkbox监听的方法里面的data.value的类型int一致，后面监听才能对相同类型的value赋值, 所以所要保证value=int类型的数据--%>
            <input type="checkbox" name="editable" value="1" lay-skin="primary"  >
        </div>
    </div>
</form>
<script type="text/javascript" src="static/commons/layui/layui.js"></script>
<script type="text/javascript" src="static/js/BaseData/datadictionary_list.js"></script>
</body>
</html>
