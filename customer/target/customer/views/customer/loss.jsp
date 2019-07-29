<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--  User: czx  Date: 2018/11/26--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>客户流失管理</title>
    <link rel="stylesheet" href="../../static/css/font.css">
    <link rel="stylesheet" href="../../static/css/weadmin.css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
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
    <h2>客户流失管理</h2>
</blockquote>
<div class="weadmin-body">
    <div class="layui-row">
<form action="/customer/searchloss" class="layui-form layui-col-md12 we-search">

    <div class="layui-inline">
        客户
    </div>
    <div class="layui-inline">
        <input class="layui-input" type="text" name="customerName"/>
    </div>
    <div class="layui-inline">
        客户经理
    </div>
    <div class="layui-inline">
        <input class="layui-input" type="text" name="customerMgr"/>
    </div>
    <div class="layui-inline">
        状态
    </div>
    <div class="layui-inline">
        <select name="status">
            <option name="status" value="">全部</option>
            <option name="status" value="0">暂缓流失</option>
            <option name="status" value="1">确认流失</option>
        </select>
    </div>
    <input class="layui-btn" type="submit" value="查询"/>
</tr>


</form>
    </div>
        <div class="weadmin-block">

            <button class="layui-btn layui-bg-blue" onclick="WeAdminShow('帮助','./help.html',600,400)"><i class="layui-icon">&#xe621;</i>帮助</button>
          <%--  <button title="刷新" class="layui-btn" onclick="location.reload()"><i class="layui-icon">&#xe9aa;</i></button>--%>
            <span class="fr" style="line-height:40px">共有数据：${fn:length(loss)} 条</span>
        </div>
<table class="layui-table" id="memberList">
    <tr class="layui-bg-gray">
        <th>编号</th>
        <th>客户</th>
        <th>客户经理</th>
        <th>上次下单时间</th>
        <th>确认流失时间</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${loss}" var="loss" >
    <tr>
        <td>${loss.customerId}</td>
        <td>${loss.customerName}</td>
        <td>${loss.customerMgr}</td>
        <td>${loss.lastOrderTime}</td>
        <td>${loss.lossTime}</td>
        <td  class="status">${loss.status}</td>
        <td class="td-manage">
            <a title="暂缓流失" href="/customer/deferloss?id=${loss.id}"><i class="layui-icon">&#xe60e;</i></a>
            <a title="确认流失" href="/customer/sureloss?id=${loss.id}"><i class="layui-icon">&#xe605;</i></a>
        </td>
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

    <span id="del" style="display: none">${del}</span>


</div>
<script src="../../static/lib/layui/layui.js" charset="utf-8"></script>
<script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
<script>
    $(function () {
        $(".status").each(function(){
            if($(this).html()=="0"){
                $(this).html("暂缓流失");
            }
            if($(this).html()=="1"){
                $(this).html("确认流失");
            }
        });
    });
</script>
<script>

    layui.use("layer",function() {
        var layer = layui.layer;  //layer初始化


        var dels=$("#del").html();
        if(dels){
            //alert($("#tips").html());
            layer.msg(dels);



            $("#del").html(" ");



        }


    });

</script>
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
