<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>制定计划</title>
    <link rel="stylesheet" href="../../static/lib/layui/css/layui.css">
    <script src="../../static/js/jquery-3.3.1.js"></script>
    <script src="../../static/lib/layui/layui.js"></script>
    <script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../../static/css/weadmin.css">
    <style>
        /*------------------------样式重置----------------------*/
        body,h1,h2,h3,h4,h5,h6,p,dl,dd,ul,ol,form,input,textarea,th,td,select{margin: 0;padding: 0;}
        em{font-style: normal;}
        li{list-style: none;}
        a{text-decoration: none;color: white;}
        a:hover{color: white;}
        img{border: none;vertical-align: top;}
        table{border-collapse: collapse;}
        input,textarea{outline:none;}
        textarea{resize: none;overflow: auto;}
        body{font-size: 12px;font-family: '微软雅黑';}


        /*-----------------样式重置-----------------------------*/





        .clear{zoom:1;}    /*<!--ie清浮动-->*/
        .clear:after{content:'';display: block;clear: both;}  /*<!--标准浏览器清浮动 -->*/





        .wrap{position: relative !important;top: 10px;}
        .nav_ul{float: right;}

        #blockquote1{height: 35px;}
        #blockquote1 h2{float: left;}
        input{padding-left: 10px; border-radius: 5px;padding-right: 15px;border: 3px solid #eeeeee;}
        input:focus{border: 3px solid #01AAED;}
        input[type=text]{ width: 200px;height: 20px;border: none;}
        .input_div{display: inline-block;}
        .input_div span{display:inline-block;font-size: 15px;font-weight: bold;padding: 5px 15px 5px 15px;}
        table{width: 1000px !important;margin:10px auto !important;border-radius: 10px !important;}


        select{width: 231px;height: 26px;border: 3px solid #eeeeee;color: #7e7e7e;border-radius: 5px;}

        textarea{padding:10px 0 10px 10px;width: 675px;border: 3px solid #eeeeee;color: #7e7e7e;border-radius: 5px;height: 46px;}
        textarea:focus{border: 3px solid #01AAED;}
        #input1{width: 660px;}


        tr{height: 11px;}

    </style>
</head>
<body>
<div class="wrap layui-anim layui-anim-scaleSpring">
    <div class="sales_input layui-fluid">
        <blockquote id="blockquote1" class="layui-elem-quote layui-quote-nm layui-bg-gray clear">
            <h2>制定计划</h2>
            <ul class="nav_ul">
                <li class="layui-btn layui-btn-normal" onclick="WeAdminShow('帮助','result_draw_plan.html',1200,500)">帮助</li>
                <%--<a href="saleManage/startPlan?salesId=${saleManage.salesId}"><li class="layui-btn layui-btn-normal">执行计划</li></a>--%>
                <a href="javascript:;" class="startplan" value="${saleManage.salesId}"><li class="layui-btn layui-btn-normal">执行计划</li></a>
                <%--<a class="layui-btn" href="javascript:history.back()">返回</a>--%>
                <a class="layui-btn layui-bg-orange" href="saleManage/findAllAssignSaleOpList">返回</a>
               <%-- <a title="刷新" class="layui-btn" href="javascript:;" onclick="location.reload()"><i class="layui-icon">&#xe9aa;</i></a>--%>
            </ul>
        </blockquote>
        <blockquote style="background: white;" class="layui-elem-quote layui-quote-nm">




<table id="test1" class="layui-table"   lay-skin="line">
    <tr>
        <th class="layui-bg-gray">销售编号：</th>
        <td><input type="text" name="salesId" value="${saleManage.salesId}" readonly /></td>
        <th class="layui-bg-gray">机会来源</th>
        <td><input type="text" name="opportunitySource" value="${saleManage.opportunitySource}" readonly /></td>
    </tr>

    <tr>
        <th class="layui-bg-gray">客户名称</th>
        <td><input type="text" name="customerName" value="${saleManage.customerName}" readonly /></td>
        <th class="layui-bg-gray">成功几率(%)：</th>
        <td><input type="text" name="successProbability" value="${saleManage.successProbability}" readonly /></td>
    </tr>

    <tr>
        <th class="layui-bg-gray">概要</th>
        <td colspan="3"><input type="text" name="outline" value="${saleManage.outline}" readonly /></td>
    </tr>
    <tr>
        <th class="layui-bg-gray">联系人</th>
        <td><input type="text" name="contacts" value="${saleManage.contacts}" readonly /></td>
        <th class="layui-bg-gray">联系人电话</th>
        <td><input type="text" name="contactsTel" value="${saleManage.contactsTel}" readonly /></td>
    </tr>

    <tr>
        <th class="layui-bg-gray">机会描述</th>
        <td colspan="3"><input type="text" name="opportunityDecs" value="${saleManage.opportunityDecs}" readonly /></td>
    </tr>
    <tr>
        <th class="layui-bg-gray">创建人</th>
        <td><input type="text" name="foundName" value="${saleManage.foundName}" readonly /></td>
        <th class="layui-bg-gray">创建时间</th>
        <td><input type="text" name="creationTime" value="${saleManage.creationTime}" readonly /></td>
    </tr>

    <tr>
        <th class="layui-bg-gray">指派人：</th>
        <td><input type="text" name="assignName" value="${saleManage.assignName}" readonly /></td>
        <th class="layui-bg-gray">指派时间</th>
        <td><input type="text" name="assignTime" value="${saleManage.assignTime}" readonly /></td>
    </tr>

</table>

<table  class="layui-table" lay-size="sm" lay-skin="row">
    <tr class="layui-bg-gray">
        <th style="text-align: center;">日期</th>
        <th style="text-align: center;">计划项</th>
    </tr>
    <c:forEach items="${list}" var="list">
        <form action="saleManage/savePlanItem" method="get" name="form">
            <input type="hidden" name="planId" value="${list.id}">
            <input type="hidden" name="opportunityId" value="${list.opportunityId}">
            <tr>
            <td>
                <input type="text" name="drawTime" value="${list.drawTime}" readonly>
            </td>
            <td>
                <input type="text" name="planItem" value="${list.planItem}" required maxlength="20" autocomplete="off">
                <input class="layui-btn" type="submit" value="保存"  />
                <input class="layui-btn" type="button" value="删除" onclick='location.href=("saleManage/delPlanItem/${list.id}/${list.opportunityId}")'/>
            </td>

            </tr>
        </form>
    </c:forEach>
</table>

<table>
    <form action="saleManage/addPlanItem" method="get" name="form">
        <table class="layui-table" lay-size="sm">
        <input type="hidden" name="salesId" value="${saleManage.salesId}">
        <tr>
        <th class="layui-bg-gray">日期</th>
        <td><input type="date" name="drawTime" required autocomplete="off"><i style="color:red;">*</i></td>
            <th class="layui-bg-gray">计划项</th>
        <td><input type="text" name="planItem" required maxlength="20" autocomplete="off"><i style="color:red;">*</i></td>
        <td><button class="layui-btn" type="submit">保存</button></td>
        </tr>

        </table>

    </form>
</table>

        </blockquote>

    </div>
</div>
<span id="assignlist" style="display: none">${list}</span>
</body>
<script>
    layui.use("layer",function() {
        var layer = layui.layer;  //layer初始化



        $(".startplan").click(function(){
            var assignlist=$("#assignlist").html();
            if(assignlist!="[]"){

                var id=$(this).attr("value");
                location.href = "saleManage/startPlan?salesId="+id+"";

            }else{
                layer.msg("该销售机会未制定计划！");
            }
        });





    });






</script>
</html>
