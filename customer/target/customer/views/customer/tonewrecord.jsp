<%--  User: czx  Date: 2018/11/23--%>
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


        textarea{padding:10px 0 10px 10px;width: 675px;border: 3px solid #eeeeee;color: #7e7e7e;border-radius: 5px;height: 46px;}
        textarea:focus{border: 3px solid #01AAED;}


        tr{height: 11px;}

    </style>
</head>

<body>
    <div class="wrap layui-anim layui-anim-scaleSpring">
        <div class="sales_input layui-fluid">
            <blockquote id="blockquote1" class="layui-elem-quote layui-quote-nm layui-bg-gray clear">
                <h2>新建交往记录</h2>
                <ul class="nav_ul" style="position: absolute;right: 185px;">
                    <li class="layui-btn layui-btn-normal" onclick="WeAdminShow('帮助','./help.html',600,400)">帮助</li>

                </ul>
            </blockquote>
            <blockquote class="layui-elem-quote layui-quote-nm ">
                <table id="test1" class="layui-table"  lay-skin="line">
                    <form action="/customer/tosaverecord">
                    <input type="text" value="${id}" name="customerId" style="display: none">

                        <tr>
                            <th class="layui-bg-gray">时间</th>
                            <td><input type="date" name="contactTime" required><i style="color:red;">*</i></td>
                            <th class="layui-bg-gray">地点</th>
                            <td><input type="text" name="place" required><i style="color:red;">*</i></td>
                        </tr>
                        <tr>
                            <th class="layui-bg-gray">概要</th>
                            <td><input type="text" name="outline" required><i style="color:red;">*</i></td>
                            <th class="layui-bg-gray">备注</th>
                            <td><input type="text" name="remarks"></td>
                        </tr>
                        <tr>
                            <th class="layui-bg-gray">详细信息</th>
                            <td colspan="3"><input type="text" name="detailedInfo"></td>
                        </tr>
                      <div style="display: inline-block;position: absolute;top: 16px;right: 30px;">
                         <input class="layui-btn layui-bg-blue" type="submit" value="保存">
                          <a class="layui-btn layui-btn-normal layui-bg-orange" href="javascript:history.back()" >返回</a>
                      </div>

                    <%--时间：<input type="text" name="contactTime">
                    地点：<input type="text" name="place">
                    概要：<input type="text" name="outline">
                    备注：<input type="text" name="remarks">
                    详细信息：<input type="text" name="detailedInfo">
                        <input type="submit" value="保存">--%>
                    </form>
                </table>
            </blockquote>
        </div>
    </div>
</body>

</html>
