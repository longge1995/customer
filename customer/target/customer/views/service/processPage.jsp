<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
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
        table{width: 1000px !important;margin:10px auto !important;border-radius: 10px !important;}


        select{width: 231px;height: 26px;border: 3px solid #eeeeee;color: #7e7e7e;border-radius: 5px;}

        textarea{padding:10px 0 10px 10px;width: 675px;border: 3px solid #eeeeee;color: #7e7e7e;border-radius: 5px;height: 46px;}
        textarea:focus{border: 3px solid #01AAED;}
        #input1{width: 660px;}


        tr{height: 11px;}


        #history{color: black;}
        #history:hover{color: red;}

    </style>
</head>
<body>
<div class="wrap layui-anim layui-anim-scaleSpring">
    <div class="sales_input layui-fluid">
        <blockquote id="blockquote1" class="layui-elem-quote layui-quote-nm layui-bg-gray clear">
            <h2>服务处理详情</h2>
            <ul class="nav_ul" style="position: absolute;right: 185px;">
                <li class="layui-btn layui-btn-normal" onclick="WeAdminShow('帮助','./help.html',600,400)">帮助</li>
            <%--    <a href="service_management_ deal.html"><li class="layui-btn layui-btn-normal">返回</li></a>
                <li class="layui-btn layui-btn-normal">保存</li>--%>

            </ul>
        </blockquote>
        <blockquote class="layui-elem-quote layui-quote-nm">


    <form action="service/saveProcess">
        <table id="test1" class="layui-table"   lay-skin="line">
            <tr>
                <th class="layui-bg-gray">编号</th>
                <td><input type="text" name="id" value="${serviceManage.id}" readonly/></td>
                <th class="layui-bg-gray">服务类型</th>
                <td><input type="text" name="serviceType" value="${serviceManage.serviceType}" readonly/></td>
            </tr>
            <tr>
                <th class="layui-bg-gray">概要</th>
                <td colspan="3"><input style="width: 500px;" type="text" name="outLine" value="${serviceManage.outLine}" readonly/></td>
            </tr>
            <tr>
                <th class="layui-bg-gray">客户</th>
                <td><input type="text" name="customerName" value="${serviceManage.customerName}" readonly/></td>
                <th class="layui-bg-gray">状态</th>
                <td><input type="text" name="status" value="${serviceManage.status}" readonly/></td>
            </tr>
            <tr>
                <th class="layui-bg-gray">服务请求</th>
                <td colspan="3"><input style="width: 500px;" type="text" name="serviceReq" value="${serviceManage.serviceReq}" readonly/></td>
            </tr>
            <tr>
                <th class="layui-bg-gray">创建人</th>
                <td><input type="text" name="creationName" value="${serviceManage.creationName}" readonly/></td>
                <th class="layui-bg-gray">创建时间</th>
                <td><input type="text" name="creationTime" value="${serviceManage.creationTime}" readonly/></td>
            </tr>
            <tr>
                <th class="layui-bg-gray">分配给</th>
                <td><input type="text" name="allocator" value="${serviceManage.allocator}" readonly/></td>
                <th class="layui-bg-gray">分配时间</th>
                <td><input type="text" name="assignTime" value="${serviceManage.assignTime}" readonly/></td>
            </tr>
            <tr>
                <th class="layui-bg-gray">服务处理</th>
                <td colspan="2"><input type="text" name="processContent" value="${serviceManage.processContent}" /><i style="color:red;">*</i></td>
                <td><a id="history" title="查看历史处理记录" href="/service/findServiceHistory/${serviceManage.id}"><i class="layui-icon">&#xe63c;</i>查看历史处理记录</a> </td>
            </tr>
            <tr>
                <th class="layui-bg-gray">处理人</th>
                <td><input type="text" name="processName" value="${loginusername}" readonly/><i style="color:red;">*</i></td>
                <th class="layui-bg-gray">处理时间</th>
                <td><input type="text" name="processTime" value="${serviceManage.processTime}" readonly/><i style="color:red;">*</i></td>
            </tr>


             <div style="display: inline-block;position: absolute;top: 16px;right: 30px;">
                    <input class="layui-btn layui-bg-blue" type="submit" value="保存"/>

                    <input class="layui-btn layui-bg-orange" type="button" name="Submit" value="返回" onclick="javascript:history.back()" />
             </div>

        </table>
    </form>
        </blockquote>
    </div>
</div>
</body>
</html>
