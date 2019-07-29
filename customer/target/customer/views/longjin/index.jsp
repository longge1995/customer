<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>Title</title>
</head>
<body>
        <a href="/Contribution/finAll">客户贡献分析</a><br/>
        <a href="/CustomerForm/findGrade">客户构成分析</a><br/>
        <a href="/CustomerService/findByYear">客户服务分析</a><br/>
        <a href="/CustomerLoss/findCustomerLoss">客户流失分析</a><br/>
</body>
</html>
