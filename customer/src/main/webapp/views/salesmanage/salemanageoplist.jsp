<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>销售机会管理</title>
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
    <h2>销售机会管理</h2>
</blockquote>
<div class="weadmin-body">

<%--
<a href="views/salesmanage/addsaleop.jsp">新建</a>
<a href="saleManage/findAllSaleOpList">显示所有</a>--%>

    <div class="layui-row">
<form action="saleManage/searchSaleOp" method="get" name="form" class="layui-form layui-col-md12 we-search">
    <div class="layui-inline">
        <input class="layui-input" type="text" name="customerName" placeholder="输入客户名称查询" maxlength="20" autocomplete="off" />
    </div>
    <div class="layui-inline">
        <input class="layui-input" type="text" name="outline" placeholder="输入概要查询" maxlength="20" autocomplete="off" />
    </div>
    <div class="layui-inline">
        <input class="layui-input" type="text" name="contacts" placeholder="输入联系人查询" maxlength="25" autocomplete="off" />
    </div>
    <input class="layui-btn" type="submit" value="查询" />
    <button class="layui-btn" onclick="location.reload()"><i class="layui-icon">&#xe9aa;</i></button>
        <%--客户名称<input type="text" name="customerName" placeholder="输入客户名称查询" maxlength="20" autocomplete="off" />
        概要<input type="text" name="outline" placeholder="输入概要查询" maxlength="20" autocomplete="off" />
        联系人<input type="text" name="contacts" placeholder="输入联系人查询" maxlength="25" autocomplete="off" />--%>


</form>
    </div>
    <div class="weadmin-block">
       
        <button class="layui-btn layui-bg-blue" onclick="WeAdminShow('帮助','./help.html',1000,500)"><i class="layui-icon">&#xe621;</i>帮助</button>
        <a href="views/salesmanage/addsaleop.jsp"><button class="layui-btn"><i class="layui-icon">&#xe61f;</i>添加</button></a>
        <span class="fr" style="line-height:40px">共有数据：${fn:length(list)} 条</span>
    </div>


<table class="layui-table" id="memberList">
    <tr class="layui-bg-gray">
        <th>客户编号</th>
        <th>客户名称</th>
        <th>概要</th>
        <th>联系人</th>
        <th>联系电话</th>
        <th>创建时间</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${list}" var="list">
        <input type="hidden" value="${list.id}"/>
        <tr>
            <td>${list.salesId}</td>
            <td>${list.customerName}</td>
            <td>${list.outline}</td>
            <td>${list.contacts}</td>
            <td>${list.contactsTel}</td>
            <td>${list.creationTime}</td>
            <td>${list.status}</td>
            <td class="td-manage">
                <a title="指派" href="saleManage/assignSaleOp?salesId=${list.salesId}">
                    <i class="layui-icon">&#xe770;</i>
                </a>
                <a title="详情" href="saleManage/showSaleOpMsg?salesId=${list.salesId}">
                    <i class="layui-icon">&#xe63c;</i>
                </a>
                <a title="编辑" href="saleManage/geteditSaleOp?id=${list.id}">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <%--<a title="编辑" class="edit" href="javascript:;"  value="${list.id}"><i class="layui-icon">&#xe642;</i></a>--%>
                <%--<a title="删除" href="saleManage/delSaleOp?id=${list.id}">
                    <i class="layui-icon">&#xe640;</i>
                </a>--%>
                <a title="删除" class="del" href="javascript:;"  value="${list.id}"><i class="layui-icon">&#xe640;</i></a>
            </td>

<%--
            <td><a href="saleManage/assignSaleOp?salesId=${list.salesId}">指派</a></td>
            <td><a href="saleManage/showSaleOpMsg?salesId=${list.salesId}">详情</a></td>
            <td><a href="saleManage/geteditSaleOp?id=${list.id}">编辑</a></td>
            <td><a href="saleManage/delSaleOp?id=${list.id}">删除</a></td>--%>
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
<script src="../../static/lib/layui/layui.js" charset="utf-8"></script>
<script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="../../static/js/page.js"></script>
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



    $(".del").click(function(){
        var id=$(this).attr("value");
        var editPage=layer.confirm('确定删除？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            location.href = "saleManage/delSaleOp?id="+id+"";

        }, function(){

        });
    });
</script>




</body>
</html>