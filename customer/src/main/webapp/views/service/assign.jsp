<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
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
    <h2>服务分配</h2>
</blockquote>
<div class="weadmin-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 we-search" action="service/searchAssign">
            <div class="layui-inline">
                客户
            </div>
            <div class="layui-inline">
                <input type="text" name="customerName" class="layui-input"/>
            </div>

            <div class="layui-inline">
                概要
            </div>
            <div class="layui-inline">
                <input type="text" name="outLine"  class="layui-input"/>
            </div>

            <div class="layui-inline">
                服务类型
            </div>
            <div class="layui-inline">
                <select name="serviceType" >
                    <option value="">全部</option>
                    <option value="咨询">咨询</option>
                    <option value="建议">建议</option>
                    <option value="投诉">投诉</option>
                </select>
            </div>
<br/><br/>
            <div class="layui-inline">
                创建日期
            </div>
            <div class="layui-inline">
                <input type="Date" name="creationTime" class="layui-input">
            </div>
            <div class="layui-inline">
                -
            </div>
            <div class="layui-inline">
                <input type="Date" name="creationTime2" class="layui-input"/>
            </div>


            <div class="layui-inline">
                状态
            </div>
            <div class="layui-inline">
                <select name="status" >
                    <option value="新创建">新创建</option>
                </select>
            </div>
            <input type="submit" class="layui-btn" value="查询">
        </form>
    </div>
</div>

<div class="weadmin-block">

    <button class="layui-btn layui-bg-blue" onclick="WeAdminShow('帮助','./help.html',600,400)"><i class="layui-icon">&#xe621;</i>帮助</button>

    <%--<button class="layui-btn" onclick="add()"><i class="layui-icon">&#xe61f;</i>查询</button>--%>
    <span class="fr" style="line-height:40px">共有数据：${fn:length(list)} 条</span>
</div>

                <table class="layui-table" id="memberList" id="mytable">
                    <tr class="layui-bg-gray">
                        <th>编号</th>
                        <th>客户</th>
                        <th>概要</th>
                        <th>服务类型</th>
                        <th>创建人</th>
                        <th>创建日期</th>
                        <th>分配给</th>
                        <th>操作</th>
                    </tr>

                    <c:forEach items="${list}" var="serviceManage">
                        <form action="service/allocateUser/${serviceManage.id}">
                        <tr>
                        <td >${serviceManage.id}</td>
                        <td >${serviceManage.customerName}</td>
                        <td >${serviceManage.outLine}</td>
                        <td >${serviceManage.serviceType}</td>
                        <td >${serviceManage.creationName}</td>
                        <td >${serviceManage.creationTime}</td>
                        <td>
                            <select name="allocator" >
                                <option value="">--请选择--</option>
                            <c:forEach items="${listUser}" var="user" >
                                <option  value="${user.name}">${user.name}</option>
                             </c:forEach>
                            </select>
                            <input class="layui-btn layui-btn-xs" type="submit" value="分配给">
                        </td>
                        <td>
                           <%-- <a title="删除" href="service/del/${serviceManage.id}"><i class="layui-icon">&#xe640;</i></a>--%>
                            <a title="删除" class="del" href="javascript:;"  value="${serviceManage.id}"><i class="layui-icon">&#xe640;</i></a>
                        </td>
                        </tr>
                        </form>
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

                    


</body>


<script>
    $(".del").click(function(){
        var id=$(this).attr("value");
        var editPage=layer.confirm('确定删除？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            location.href = "service/del/"+id+"";
        }, function(){

        });
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
</script>
<script src="../../static/lib/layui/layui.js" charset="utf-8"></script>
<script src="../../static/js/eleDel.js" type="text/javascript" charset="utf-8"></script>


<span id="del" style="display: none">${del}</span>

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


<script type="text/javascript" src="../../static/js/page.js"></script>
</html>
