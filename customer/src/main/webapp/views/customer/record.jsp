<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--  User: czx  Date: 2018/11/23--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>
    <title></title>
    <link rel="stylesheet" href="../../static/css/font.css">
    <link rel="stylesheet" href="../../static/css/weadmin.css">
    <script type="text/javascript" src="../../static/lib/layui/layui.js" charset="utf-8"></script>
    <script src="../../lib/layui/layui.js" charset="utf-8"></script>
    <script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
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
    <h2>交往记录</h2>
</blockquote>
<div class="weadmin-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 we-search">
            <div class="layui-inline">
                客户编号
            </div>
            <div class="layui-inline">
                <input type="text" autocomplete="off" class="layui-input" value="${customer.customerId}" readonly>
            </div>
            <div class="layui-inline">
                客户名称
            </div>
            <div class="layui-inline">
                <input type="text" autocomplete="off" class="layui-input" value="${customer.customerName}" readonly>
            </div>
        </form>
    </div>
    <div class="weadmin-block">
        <button class="layui-btn layui-bg-blue" onclick="WeAdminShow('帮助','./help.html',600,400)"><i class="layui-icon">&#xe621;</i>帮助</button>
        <a href="javascript:history.back()"><button class="layui-btn layui-bg-orange"><i class="layui-icon">&#xe65c;</i>返回</button></a>
        <a href="/customer/tonewrecord?id=${customer.customerId}"><button class="layui-btn"><i class="layui-icon">&#xe61f;</i>新建</button></a>
       <%-- <button title="刷新" class="layui-btn" onclick="location.reload()"><i class="layui-icon">&#xe9aa;</i></button>--%>
        <span class="fr" style="line-height:40px">共有数据：${fn:length(record)} 条</span>
    </div>
<%--<a href="/customer/tonewrecord?id=${customer.customerId}">新建</a>--%>
<table class="layui-table" id="memberList">

<tr class="layui-bg-gray">
    <td>时间</td>
    <td>地点</td>
    <td>概要</td>
    <td>详细信息</td>
    <td>备注</td>
    <td>操作</td>
</tr>
<c:forEach items="${record}" var="list">
<tr>
    <td>${list.contactTime}</td>
    <td>${list.place}</td>
    <td>${list.outline}</td>
    <td>${list.detailedInfo}</td>
    <td>${list.remarks}</td>
    <td class="td-manage">
        <a title="编辑" href="/customer/toeditrecord?id=${list.id}"><i class="layui-icon">&#xe642;</i></a>
        <%--<a title="删除" href="/customer/delrecord?id=${list.id}"><i class="layui-icon">&#xe640;</i></a>--%>
        <a class="del" href="javascript:;"  value="${list.id}"><i class="layui-icon">&#xe640;</i></a>
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


</div>
<span id="del" style="display: none">${del}</span>
</body>
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


    $(".del").click(function(){
        var id=$(this).attr("value");
        var editPage=layer.confirm('确定删除？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            location.href = "/customer/delrecord?id="+id;
        }, function(){

        });
    });


</script>

<script type="text/javascript" src="../../static/js/page.js"></script>
</html>
