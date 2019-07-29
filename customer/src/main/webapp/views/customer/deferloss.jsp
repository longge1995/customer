<%--  User: czx  Date: 2018/11/27--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>暂缓流失</title>
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

        textarea{border: 3px solid #eeeeee;}
        textarea:focus{border: 3px solid #01AAED;}
        td a{color: black;}

        tr{height: 11px;}

    </style>
</head>
<body>
<div class="wrap layui-anim layui-anim-scaleSpring">

    <div class="sales_input layui-fluid">

        <blockquote id="blockquote1" class="layui-elem-quote layui-quote-nm layui-bg-gray clear">
            <h2>暂缓流失</h2>
            <ul class="nav_ul" style="position: absolute;right: 96px;">
                <li class="layui-btn layui-btn-normal" onclick="WeAdminShow('帮助','./help.html',600,400)">帮助</li>
                <a href="javascript:history.back()"><li class="layui-btn layui-btn-normal layui-bg-orange">返回</li></a>


            </ul>
        </blockquote>
        <blockquote class="layui-elem-quote layui-quote-nm ">

<table id="test1" class="layui-table"  lay-skin="line">

<form action="/customer/updatedeferloss">
    <tr>
        <th class="layui-bg-gray">编号</th>
        <td><input type="text" value="${loss.id}" name="id" readonly></td>
        <th class="layui-bg-gray">客户</th>
        <td>${loss.customerName}</td>
    </tr>
    <tr>
        <th class="layui-bg-gray">客户经理</th>
        <td>${loss.customerMgr}</td>
        <th class="layui-bg-gray">上次下单时间</th>
        <td>${loss.lastOrderTime}</td>
    </tr>
    <tr>
        <th class="layui-bg-gray">暂缓措施</th>
        <td colspan="3">
            <input style="width: 400px;" type="text" name="pauseWay" readonly value=" ${loss.pauseWay}">
        </td>
    </tr>
    <tr>
        <th class="layui-bg-gray">追加暂缓措施</th>
        <td colspan="3">
            <%--<input  type="text" name="addPauseWay" value="${loss.addPauseWay}">--%>
            <textarea style="width: 400px;height: 100px;" name="addPauseWay" required></textarea><i style="color:red;">*</i>
        </td>
    </tr>
       <%-- <a href="/customer/sureloss?id=${loss.id}"><input class="layui-btn"  type="button" value="确认流失"></a>--%>
      <input style="position: absolute;top: 16px;right: 30px;" class="layui-btn layui-bg-blue" type="submit" value="保存">
</form>
</table>
        </blockquote>
    </div>
</div>
</body>
</html>
