<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--  User: czx  Date: 2018/11/25--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="../../static/lib/layui/css/layui.css">
    <script src="../../static/js/jquery-3.3.1.js"></script>
    <script src="../../static/lib/layui/layui.js"></script>
    <script src="../../static/lib/layui/layui.all.js"></script>
    <script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>

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
        table{width: 800px !important;margin:10px auto !important;border-radius: 10px !important;}



        td a{color: black;}

        tr{height: 11px;}

    </style>

</head>
<body>
<div class="wrap layui-anim layui-anim-scaleSpring">

    <div class="sales_input layui-fluid">
        <blockquote id="blockquote1" class="layui-elem-quote layui-quote-nm layui-bg-gray clear">
            <h2>订单详细</h2>
            <ul class="nav_ul">
                <li class="layui-btn layui-btn-normal" onclick="WeAdminShow('帮助','./help.html',600,400)" style="position: absolute;right: 100px;">帮助</li>

            </ul>
        </blockquote>
        <blockquote class="layui-elem-quote layui-quote-nm ">
<table  id="test1" class="layui-table"  lay-skin="line">
<tr>
    <th class="layui-bg-gray">订单编号</th>
    <td>
        <input type="text" placeholder="${order.orderId}" readonly>
       <%-- ${order.orderId}--%>
    </td>
    <th class="layui-bg-gray">日期</th>
    <td>
        <input type="text" placeholder="${order.orderTime}" readonly>
       <%-- ${order.orderTime}--%>
    </td>
</tr>
<tr>
    <th class="layui-bg-gray">送货地址</th>
    <td>
        <input type="text" placeholder="${order.deliverGoods}" readonly>
       <%-- ${order.deliverGoods}--%>
    </td>
    <th class="layui-bg-gray">总金额</th>
    <td>
        <input type="text" placeholder="${order.money}" readonly>
        <%--${order.money}--%>
    </td>
</tr>
<tr>
    <th class="layui-bg-gray">状态</th>
    <td colspan="3">
        <input type="text" placeholder="${order.status}" readonly>
        <%--${order.status}--%>
    </td>
</tr>
</table>
<table class="layui-table" id="memberList">
    <tr class="layui-bg-gray">
        <th>商品</th>
        <th>数量</th>
        <th>单位</th>
        <th>单价（元）</th>
        <th>金额（元）</th>
    </tr>

    <c:forEach items="${list}" var="detail">
        <tr>
            <td>${detail.productName}</td>
            <td>${detail.num}</td>
            <td>${detail.units}</td>
            <td>${detail.price}</td>
            <td>${detail.money}</td>
        </tr>
    </c:forEach>
    <a href="/customer/returnAllOrder?orderId=${order.orderId}" style="position: absolute;top: 16px;right: 30px;"><input class="layui-btn layui-bg-orange" type="button" value="返回"/></a>
</table>


        </blockquote>
    </div>
</div>
</body>


</html>
