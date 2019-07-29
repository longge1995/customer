<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>暂时没用，以后要删</title>

    <link rel="stylesheet" href="../../static/css/font.css">
    <link rel="stylesheet" href="../../static/css/weadmin.css">
    <script type="text/javascript" src="../../static/layui/layui.js" ></script>
    <script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>

    <style>

        input:focus{border: 3px solid #01AAED;}
        #blockquote1{height: 35px;margin: 10px;padding: 10px;}
        #blockquote1 h2{float: left;}
        a{text-decoration: none;color: white;}
        a:hover{color: white;}
        td a{color: black;}
    </style>
</head>
<body class="layui-anim layui-anim-scaleSpring">
<blockquote id="blockquote1" class="layui-elem-quote layui-quote-nm layui-bg-gray clear">
    <h2>客户构成分析</h2>
</blockquote>
<div class="weadmin-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 we-search" action="/CustomerForm/choose">

            <div class="layui-inline">
                报表方式
            </div>
            <div class="layui-inline">
                <select name="choose">
                    <c:forEach items="${list1}" var="Choose">
                        <option value=${Choose.id}>${Choose.type}</option>
                    </c:forEach>
                </select>
            </div>
            <input type="submit" class="layui-btn layui-btn-normal" value="查询"/>


        </form>
    </div>
    <div class="weadmin-block">

        <button class="layui-btn layui-bg-blue" onclick="WeAdminShow('帮助','./help.html',600,400)"><i class="layui-icon">&#xe621;</i>帮助</button>
        <a href="customer_info.html"><button class="layui-btn layui-bg-orange"><i class="layui-icon">&#xe65c;</i>返回</button></a>
        <span class="fr" style="line-height:40px">共有数据：88 条</span>
    </div>

    <table class="layui-table"  id="memberList">

        <tr class="layui-bg-gray">
            <th>编号</th>
            <th>${grade}</th>
            <th>服务数量</th>
        </tr>
        <c:forEach items="${list}" var="CustomerForm">
            <tr>
                <td>${CustomerForm.id}</td>
                <td>${CustomerForm.customerGrade}</td>
                <td>${CustomerForm.sum}</td>
            </tr>
        </c:forEach>
    </table>



</div>
</body>

</html>
