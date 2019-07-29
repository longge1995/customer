<%-- User: CDHong Date: 2018/11/20--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>编辑数据字典</title>
    <link rel="stylesheet" href="../../static/lib/layui/css/layui.css" media="all" />
</head>
<body class="childrenBody padr30">
<form class="layui-form" action="" id="datadictionary_list_edit">
    <div class="layui-form-item">
        <label class="layui-form-label">编号</label>
        <div class="layui-input-block">
            <input type="text" name="id" id="id"  readonly=“readonly”  autocomplete="off" class="layui-input" />
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类别</label>
        <div class="layui-input-block">
            <input type="text" name="datatype" id="datatype" required  lay-verify="required" placeholder="请输入类别" autocomplete="off" class="layui-input" />
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">条目</label>
        <div class="layui-input-block">
            <input type="text" name="datadescribe" id="datadescribe" required  lay-verify="required" placeholder="请输入条目" autocomplete="off" class="layui-input" />
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">值</label>
        <div class="layui-input-block">
            <input type="text" name="datavalue" id="datavalue" required  lay-verify="required" placeholder="请输入值" autocomplete="off" class="layui-input" />
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">是否可编辑</label>
        <div class="layui-input-block" lay-filter="checkbox2">
            <%--table下的能编辑（操作）的数据，传过来肯定都是checked（勾选上的）的，就不用去获取table下的editable了（省略这步操作）--%>
            <%--就是说不用根据table的editable值来判断了，能操作的肯定都是勾选上的，所以使用checked就对了--%>
            <input type="checkbox" name="editable" id="editable" value="1" lay-skin="primary"  checked>
        </div>
    </div>
</form>
    <%--<script type="text/javascript" src="../../static/commons/layui/layui.js"></script>--%>
<script type="text/javascript" src="../../static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../static/js/BaseData/datadictionary_list.js"></script>
</body>
</html>
