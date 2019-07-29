<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<head>
    <base href="<%=basePath%>"/>
	<meta charset="UTF-8">
	<title>客户关系管理系统</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="shortcut icon" href="./favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./static/css/font.css">
	<link rel="stylesheet" href="./static/css/weadmin.css">


    <script src="./static/lib/layui/layui.js" charset="utf-8"></script>








    <link rel="stylesheet" type="text/css" href="./static/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="./static/fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="./static/css/demo.css" />
    <link rel="stylesheet" type="text/css" href="./static/css/component.css" />




    <style>

        .login{border-radius: 20px !important;box-shadow: 10px 10px 50px  rgba(0, 0, 0, 0.5) !important;background:rgba(0, 0, 0, 0.5) !important; }
        .message{font-size: 18px !important;border-top-right-radius: 5px !important; border-bottom-right-radius: 5px !important;border-top-left-radius: 5px !important; }
        /*.layui-input:focus{border:3px solid #00B3FF !important;}*/
        /*hr{height: 20px;}*/
    </style>
</head>
<body class="login-bg ">
    
    <div class="login layui-anim layui-anim-scaleSpring">
        <div class="message layui-bg-red"><b>后台管理系统管理员登录</b></div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" action="/tologin/findByUsername" >
            <%--<input name="username" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr />
            <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr />--%>

                <span class="input input--ichiro" style="margin-top: -3px;">
					<input class="input__field input__field--ichiro" type="text" id="input-1" name="username"/>
					<label class="input__label input__label--ichiro" for="input-1">
						<span class="input__label-content input__label-content--ichiro">用户名</span>
					</label>
				</span>
                <span class="input input--ichiro" style="margin-top: 15px;">
					<input class="input__field input__field--ichiro" type="password" id="input-2" name="password"/>
					<label class="input__label input__label--ichiro" for="input-2">
						<span class="input__label-content input__label-content--ichiro">密码</span>
					</label>
				</span>

            <input style="margin-top: -5px;" class="loginin  layui-bg-red" value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">

            <%--<span class="input input--kuro">
					<input class="input__field input__field--kuro" type="text" id="input-7" />
					<label class="input__label input__label--kuro" for="input-7">
						<span class="input__label-content input__label-content--kuro">Username</span>
					</label>
				</span>
            <span class="input input--jiro">
					<input class="input__field input__field--jiro" type="text" id="input-10" />
					<label class="input__label input__label--jiro" for="input-10">
						<span class="input__label-content input__label-content--jiro">Cat's Name</span>
					</label>
				</span>
            <span class="input input--akira">
					<input class="input__field input__field--akira" type="text" id="input-22" />
					<label class="input__label input__label--akira" for="input-22">
						<span class="input__label-content input__label-content--akira">First Name</span>
					</label>
				</span>--%>



        </form>
    </div>

    <span id="tips" style="display: none">${msg}</span>

    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">


        layui.use("layer",function() {
            var layer = layui.layer;  //layer初始化


            var tips=$("#tips").html();



           // var flag = $("#tips").attr("value") ==="false" ? false : true;


          //  alert(flag);

            if(tips){
                //alert($("#tips").html());
                layer.msg(tips);

             //   $("#tips").attr("value",false);

                $("#tips").html(" ");

            }


        });






        
        	/*layui.extend({
				admin: '{/}./static/js/admin'
			});
            layui.use(['form','admin'], function(){
              var form = layui.form
              	,admin = layui.admin;
              // layer.msg('玩命卖萌中', function(){
              //   //关闭后的操作
              //   });
              //监听提交
              form.on('submit(login)', function(data){
                // alert(888)
                layer.msg(JSON.stringify(data.field),function(){
                    location.href='./index.html'
                });
                return false;
              });
            });   */
    </script>  
    <!-- 底部结束 -->
</body>
</html>