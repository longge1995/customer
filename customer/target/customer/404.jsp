<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
    <base href="<%=basePath%>"/>

    <meta charset="UTF-8">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //Meta-Tags -->

    <link rel="stylesheet" href="static/404/css/font-awesome.min.css" media="all" />

    <!-- Style --> <link rel="stylesheet" href="static/404/css/style.css" type="text/css" media="all">

    <!-- Fonts -->
    <link href="//fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
    <!-- //Fonts -->

</head>
<!-- //Head -->

<!-- Body -->
<body>

<h1>Random <span>Error</span> Page</h1>
<div class="w3layout-agileits">
    <h2>404 </h2>
    <h3>噢！我的上帝！页面找不到了！</h3>
    <h3>我简直不敢相信自己的眼睛！</h3>
    <p>Go back to your home page or you may also refresh the page</p>
    <a href="#"><i class="fa fa-angle-double-left" aria-hidden="true"></i>Return Home</a>
</div>

<div class="w3footeragile">
    <p> &copy; 2018 错误页面 . All Rights Reserved | Design by <a href="http://w3layouts.com" target="_blank">huaeryeer</a></p>
</div>

</body>
<!-- //Body -->

</html>