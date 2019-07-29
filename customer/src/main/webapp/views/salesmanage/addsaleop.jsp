<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    java.util.Date currentTime = new java.util.Date();//得到当前系统时间
    String str_date2 = format.format(currentTime); //将日期时间格式化
    String str_date = str_date2.toString(); //将Date型日期时间转换成字符串形式
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>添加销售机会</title>
    <link rel="stylesheet" href="../../static/lib/layui/css/layui.css">
    <script src="../../static/js/jquery-3.3.1.js"></script>
    <script src="../../static/lib/layui/layui.js"></script>
    <link rel="stylesheet" href="../../static/css/weadmin.css">
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
            <h2>新建销售机会</h2>
            <ul class="nav_ul">
                <li class="layui-btn layui-btn-normal" onclick="WeAdminShow('帮助','./help.html',600,400)" style="position: absolute;right: 185px;">帮助</li>

            </ul>
        </blockquote>
        <blockquote class="layui-elem-quote layui-quote-nm ">


<form action="saleManage/addSaleOp">
    <table id="test1" class="layui-table"   lay-skin="line">
        <tr>
            <th class="layui-bg-gray">销售编号</th>
            <td><input type="text" name="salesId" required placeholder="输入销售编号" onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="9" autocomplete="off"></td>
            <th class="layui-bg-gray">机会来源</th>
            <td><input type="text" name="opportunitySource" placeholder="输入机会来源" maxlength="20" autocomplete="off"></td>
        </tr>

        <tr>
            <th class="layui-bg-gray">客户名称</th>
            <td><input type="text" name="customerName" required placeholder="输入客户名称" maxlength="20" autocomplete="off"><i style="color:red;">*</i></td>
            <th class="layui-bg-gray">成功几率(%)</th>
            <td><input type="text" name="successProbability" required placeholder="输入2位数" onkeyup="if(isNaN(value))execCommand('undo')" maxlength="2" autocomplete="off"><i style="color:red;">*</i></td>
        </tr>

        <tr>
            <th class="layui-bg-gray">概要</th>
            <td colspan="3"><input type="text" name="outline" required placeholder="输入概要" maxlength="20" autocomplete="off"><i style="color:red;">*</i></td>
        </tr>
        <tr>
            <th class="layui-bg-gray">联系人</th>
            <td><input type="text" name="contacts" placeholder="输入联系人" maxlength="6" autocomplete="off"></td>
            <th class="layui-bg-gray">联系人电话</th>
            <td><input type="text" name="contactsTel" placeholder="最多11位数字" maxlength="11" onkeyup="this.value=this.value.replace(/\D/g,'')" autocomplete="off"></td>
        </tr>

        <tr>
            <th class="layui-bg-gray">机会描述</th>
            <td colspan="3"><input style="width: 700px;height: 100px;" type="text" name="opportunityDecs" required placeholder="输入机会描述" maxlength="50" autocomplete="off"><i style="color:red;">*</i></td>
        </tr>
        <tr>
            <th class="layui-bg-gray">创建人</th>
            <td><input type="text" name="foundName" value="${USER_SESSION.username}" readonly><i style="color:red;">*</i></td>
            <th class="layui-bg-gray">创建时间</th>
            <td><input type="text" name="creationTime" value="<%=str_date%>" readonly><i style="color:red;">*</i></td>
        </tr>

    </table>
    <div style="display: inline-block;position: absolute;top: 16px;right: 30px;">

    <button class="layui-btn" type="submit">保存</button>

    <a class="layui-btn" href="javascript:history.back()">返回</a>
    </div>
</form>
        </blockquote>
    </div>
</div>
</body>
</html>