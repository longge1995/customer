<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


        select{width: 231px;height: 26px;border: 3px solid #eeeeee;color: #7e7e7e;border-radius: 5px;}

        textarea{padding:10px 0 10px 10px;width: 675px;border: 3px solid #eeeeee;color: #7e7e7e;border-radius: 5px;height: 46px;}
        textarea:focus{border: 3px solid #01AAED;}

        tr{height: 11px;}

    </style>

</head>
<body>
<div class="wrap layui-anim layui-anim-scaleSpring">
    <div class="sales_input layui-fluid">

        <blockquote id="blockquote1" class="layui-elem-quote layui-quote-nm layui-bg-gray clear">
            <h2>服务创建</h2>
        </blockquote>
        <blockquote class="layui-elem-quote layui-quote-nm ">


<form class="layui-form" action="service/save">

    <table id="test1" class="layui-table"  lay-skin="line">


        <tr>
            <th class="layui-bg-gray">编号</th>
            <td>
                <input placeholder="请输入数字" type="text" name="serviceNo" required  lay-verify="required"  autocomplete="off" class="layui-input">
            </td>
            <th class="layui-bg-gray">服务类型</th>
            <td>
                <form class="layui-form layui-col-md12 we-search">
                    <div class="layui-inline">
                        <select name="serviceType" lay-verify="required">
                            <option value=""></option>
                            <option value="咨询">咨询</option>
                            <option value="建议">建议</option>
                            <option value="投诉">投诉</option>
                        </select><i style="color: red">*</i>
                    </div>
                </form>
            </td>
        </tr>
        <tr>
            <th class="layui-bg-gray">概要</th>
            <td colspan="3"><input style="width: 500px;" placeholder="请输入概要" type="text" name="outLine" required  lay-verify="required"  autocomplete="off" class="layui-input">
                <i style="color: red">*</i>
            </td>
        </tr>
        <tr>
            <th class="layui-bg-gray">客户</th>
            <td colspan="1">
                <select name="customerName" >
                <option value="">--请选择--</option>
                <c:forEach items="${list}" var="customerManage" >
                    <option  value="${customerManage.customerName}">${customerManage.customerName}</option>
                </c:forEach>
            </select><i style="color: red">*</i>
            </td>
            <th class="layui-bg-gray">状态</th>
            <td colspan="1"> <input type="text" name="status" readonly value="新创建" lay-verify="required"  autocomplete="off" class="layui-input"></td>
        </tr>
        <tr>
            <th class="layui-bg-gray">服务请求</th>
            <td colspan="3">
                <textarea name="serviceReq" placeholder="请输入内容" class="layui-textarea"></textarea><i style="color: red">*</i>
            </td>
        </tr>
        <tr>
            <th class="layui-bg-gray">创建人</th>
            <td><input type="text" name="creationName" readonly value="${loginusername}"  lay-verify="required"  autocomplete="off" class="layui-input"  ><i style="color: red">*</i></td>
            <th class="layui-bg-gray">创建时间</th>
            <td> 
<%--
                <input type="date"   readonly name="creationTime" required   autocomplete="off"  >
--%>
                <input type="date" name="creationTime"  ><i style="color: red">*</i>
            </td>
        </tr>

    </table>




    <%--<div class="layui-form-item">
        <label class="layui-form-label">编号</label>
        <div class="layui-input-block">
            <input type="text" name="serviceNo" required  lay-verify="required"  autocomplete="off" class="layui-input">
        </div>
    </div>--%>
    <%--<div class="layui-form-item">
        <label class="layui-form-label">服务类型</label>
        <div class="layui-input-block">
            <select name="serviceType" lay-verify="required">
                <option value=""></option>
                <option value="咨询">咨询</option>
                <option value="建议">建议</option>
                <option value="投诉">投诉</option>
            </select>
        </div>
    </div>--%>
    <%--<div class="layui-form-item">
        <label class="layui-form-label">概要</label>
        <div class="layui-input-block">
            <input type="text" name="outLine" required  lay-verify="required"  autocomplete="off" class="layui-input">
        </div>
    </div>--%>
   <%-- <div class="layui-form-item">
        <label class="layui-form-label">客户</label>
        <div class="layui-input-block">
            <input type="text" name="customerName" required  lay-verify="required"  autocomplete="off" class="layui-input">
        </div>
    </div>--%>
   <%-- <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="text" name="status" readonly value="新创建" lay-verify="required"  autocomplete="off" class="layui-input">
        </div>
    </div>--%>
    <%--<div class="layui-form-item layui-form-text">
        <label class="layui-form-label">服务请求</label>
        <div class="layui-input-block">
            <textarea name="serviceReq" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>--%>
    <%--<div class="layui-form-item">
        <label class="layui-form-label">创建人</label>
        <div class="layui-input-block">
            <input type="text" name="creationName" required  lay-verify="required"  autocomplete="off" class="layui-input">
        </div>
    </div>--%>
    <%--<div class="layui-form-item">
        <label class="layui-form-label">创建时间</label>
        <div class="layui-input-block">
            <input type="text" id="creationTime"  readonly name="creationTime" required  lay-verify="required"  autocomplete="off" class="layui-input" >
        </div>
    </div>--%>

    <div class="layui-form-item">
        <div class="layui-input-block" style="position: absolute;top: 16px;right: 30px;">
            <button class="layui-btn" lay-submit lay-filter="formDemo">保存</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>


            <span id="del" style="display: none">${del}</span>




<script src="../../static/layui/layui.js"></script>
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
    layui.use('form', function(){
        var form = layui.form;
        form.render();

    });

    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({

            elem: '#creationTime'
            ,format: 'yyyy-MM-dd HH:mm:ss'
            ,value: new Date(),//参数即为：2018-08-20 20:08:08 的时间戳

        });
    });

</script>
        </blockquote>
    </div>
</div>
</body>
</html>
