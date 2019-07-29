<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>客户贡献分析</title>
    <link rel="stylesheet" href="../../static/css/font.css">
    <link rel="stylesheet" href="../../static/css/weadmin.css">
    <style>
        input:focus{border: 3px solid #01AAED;}
        #blockquote1{height: 35px;margin: 10px;padding: 10px;}
        #blockquote1 h2{float: left;}
        a{text-decoration: none;color: white;}
        a:hover{color: white;}
        td a{color: black;}


        .clear{zoom:1;}    /*<!--ie清浮动-->*/
        .clear:after{content:'';display: block;clear: both;}  /*<!--标准浏览器清浮动 -->*/
    </style>
</head>
<body class="layui-anim layui-anim-scaleSpring">

    <blockquote id="blockquote1" class="layui-elem-quote layui-quote-nm layui-bg-gray clear">
        <h2>客户贡献分析</h2>
    </blockquote>

    <div class="weadmin-body">
        <div class="layui-row">
    <form class="layui-col-md12 we-search layui-form" action="/Contribution/findByName">




        <div class="layui-inline">
            客户名称
        </div>
        <div class="layui-inline">
            <input type="search" name="name" placeholder="请输入客户名称" autocomplete="off" class="layui-input"/>
        </div>

        <div class="layui-inline">
            <select name="choose">
                <option value="">全部</option>
                <c:forEach items="${list1}" var="CustomerContribution">
                    <option>${CustomerContribution.time}</option>
                </c:forEach>
            </select>
        </div>

                                    <%--<select name="choose">
                                        <option value="0">全部</option>
                                        <option>2018</option>
                                        <option>2017</option>
                                    </select>--%>
        <input type="submit" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo" value="查询"/>


    </form>
        </div>
    </div>
    <div class="weadmin-block">

        <button class="layui-btn layui-bg-blue" onclick="WeAdminShow('帮助','./help.html',600,400)"><i class="layui-icon">&#xe621;</i>帮助</button>
        <span class="fr" style="line-height:40px">共有数据：${fn:length(list)} 条</span>
    </div>


<table class="layui-table" id="memberList">
    <%--<colgroup>
        <col width="150">
        <col width="200">
    </colgroup>--%>
    <tr class="layui-bg-gray">
        <th>编号</th>
        <th>客户名称</th>
        <th>订单金额（元）</th>
    </tr>
    <c:forEach items="${list}" var="CustomerContribution">
        <tr>
            <td>${CustomerContribution.id}</td>
            <td>${CustomerContribution.name}</td>
            <td>${CustomerContribution.money}</td>
        </tr>
    </c:forEach>
</table>
    <%--分页功能实现--%>
    <div class="clear">
        <div class="gridItem"  style="float: left;">
            <%--  style="padding: 5px; width: 300px; float: left; text-align: left; height: 20px; font-size: 15px;"--%>
            共有 <span id="spanTotalInfor" class="layui-btn layui-btn-xs"></span>&nbsp;条记录,
            当前第<span id="spanPageNum" class="layui-btn layui-btn-xs"></span>&nbsp;页,
            共<span id="spanTotalPage" class="layui-btn layui-btn-xs"></span>&nbsp;页.
        </div>

        <div class="gridItem" style="float: right;">
            <%-- style="margin-left:50px;  padding: 5px; width: 400px; float: left; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;"--%>
            <span id="spanFirst" class="layui-btn  layui-btn-xs layui-bg-gray"><i class="layui-icon">&#xe619;</i></span>
            <span id="spanPre" class="layui-btn  layui-btn-xs layui-bg-gray"><i class="layui-icon">&#xe603;</i></span>
            <span id="spanInput" style="margin: 0px; padding: 0px 0px 4px 0px; height:100%; ">
                <input id="Text1" type="text" class="TextBox" onkeyup="changepage()"   style="height:25px; text-align: center;width:50px;border: 3px solid black;"/>
            </span>
            <span id="spanNext" class="layui-btn  layui-btn-xs layui-bg-gray"><i class="layui-icon">&#xe602;</i></span>
            <span  id="spanLast" class="layui-btn  layui-btn-xs layui-bg-gray"><i class="layui-icon">&#xe61a;</i></span>
        </div>
    </div>

    <%--分页功能实现--%>
    <script type="text/javascript" src="../../static/lib/layui/layui.js" ></script>
    <script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
<%--<script type="text/javascript" src="../../static/lib/layui/layui.js" ></script>--%>

<%--<script type="text/javascript" src="static/js/index.js" ></script>--%>
    <script>
        var theTable = document.getElementById("memberList");
        var txtValue = document.getElementById("Text1").value;
        function changepage() {
            var txtValue2 = document.getElementById("Text1").value;
            if (txtValue != txtValue2) {
                if (txtValue2 > pageCount()) {

                }
                else if (txtValue2 <= 0) {

                }
                else if (txtValue2 == 1) {
                    first();
                }
                else if (txtValue2 == pageCount()) {
                    last();
                }
                else {
                    hideTable();
                    page = txtValue2;
                    pageNum2.value = page;

                    currentRow = pageSize * page;
                    maxRow = currentRow - pageSize;
                    if (currentRow > numberRowsInTable) currentRow = numberRowsInTable;
                    for (var i = maxRow; i < currentRow; i++) {
                        theTable.rows[i].style.display = '';
                    }
                    if (maxRow == 0) { preText(); firstText(); }
                    showPage();
                    nextLink();
                    lastLink();
                    preLink();
                    firstLink();
                }

                txtValue = txtValue2;
            }
        }
    </script>
    <script type="text/javascript" src="../../static/js/page.js"></script>
</body>
</html>
