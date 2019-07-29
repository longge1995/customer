<%--  User: czx  Date: 2018/11/22--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="../../static/lib/layui/css/layui.css">
    <script src="../../static/js/jquery-3.3.1.js"></script>
    <script src="../../static/lib/layui/layui.js"></script>
    <%--<script src="../../lib/layui/layui.all.js"></script>--%>
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





        tr{height: 11px;}

    </style>
</head>
<body class="layui-anim layui-anim-scaleSpring">
<blockquote id="blockquote1" class="layui-elem-quote layui-quote-nm layui-bg-gray clear">
    <h2>修改联系人</h2>
    <ul class="nav_ul" style="position: absolute;right: 185px;">
        <button class="layui-btn layui-bg-blue" onclick="WeAdminShow('帮助','./help.html',600,400)"><i class="layui-icon">&#xe621;</i>帮助</button>

    </ul>
</blockquote>
<blockquote class="layui-elem-quote layui-quote-nm ">


        <table class="layui-table" id="memberList">
    <form action="/customer/editcontact" method="get">
        <input type="text" name="id" value="${contact.id}" style="display: none">
        <input type="text" name="customerId" value="${contact.customerId}" style="display: none">
        <tr>
            <th class="layui-bg-gray">姓名</th>
            <td><input type="text" value="${contact.name}" name="name"></td>
            <th class="layui-bg-gray">性别</th>
            <td><input type="text" value="${contact.sex}" name="sex"></td>
        </tr>
        <%--<tr>
            <td>性别</td>
            <td><input type="text" value="${contact.sex}" name="sex"></td>
        </tr>--%>
        <tr>
            <th class="layui-bg-gray">职位</th>
            <td><input type="text" value="${contact.job}" name="job"></td>
            <th class="layui-bg-gray">办公电话</th>
            <td><input type="text" value="${contact.phone}" name="phone"></td>
        </tr>
        <%--<tr>
            <td>办公电话</td>
            <td><input type="text" value="${contact.phone}" name="phone"></td>
        </tr>--%>
        <tr>
            <th class="layui-bg-gray">手机</th>
            <td><input type="text" value="${contact.tel}" name="tel"></td>
            <th class="layui-bg-gray">备注</th>
            <td><input type="text" value="${contact.remark}" name="remark"></td>
        </tr>
        <%--<tr>
            <td>备注</td>
            <td><input type="text" value="${contact.remark}" name="remark"></td>
        </tr>--%>
        <div style="display: inline-block;position: absolute;top: 16px;right: 30px;">
            <input class="layui-btn layui-btn-normal" type="submit" value="提交">
            <a class="layui-btn layui-btn-normal layui-bg-orange" href="javascript:history.back()" >返回</a>
        </div>
    </form>
        </table>
</blockquote>
</body>
</html>
