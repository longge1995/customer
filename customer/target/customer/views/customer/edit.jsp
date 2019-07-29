<%--  User: czx  Date: 2018/11/22--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

    <link rel="stylesheet" href="../../static/css/font.css">
    <link rel="stylesheet" href="../../static/css/weadmin.css"/>
    <%--<script type="text/javascript" src="static/lib/layui/layui.all.js" charset="utf-8"></script>--%>

</head>

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

    input[type=text]{ width: 150px;height: 20px;border: none;}

    .input_div{display: inline-block;}
    .input_div span{display:inline-block;font-size: 15px;font-weight: bold;padding: 5px 15px 5px 15px;}
    table{width: 1000px !important;margin:10px auto !important;border-radius: 10px !important;}


    select{width: 231px;height: 26px;border: 3px solid #eeeeee;color: #7e7e7e;border-radius: 5px;}

    textarea{padding:10px 0 10px 10px;width: 675px;border: 3px solid #eeeeee;color: #7e7e7e;border-radius: 5px;height: 46px;}
    textarea:focus{border: 3px solid #01AAED;}
    #input1{width: 660px;}


    tr{height: 11px;}

</style>


<body>


    <div class="wrap layui-anim layui-anim-scaleSpring">
        <div class="sales_input layui-fluid">
            <blockquote id="blockquote1" class="layui-elem-quote layui-quote-nm layui-bg-gray clear">
                <h2>客户信息管理</h2>
                <ul class="nav_ul" style="position: absolute;right: 100px;">
                    <li class="layui-btn layui-btn-normal" onclick="WeAdminShow('帮助','./help.html',600,400)">帮助</li>
                    <a href="/customer/findContactById?id=${customer.customerId}"><li class="layui-btn layui-btn-normal">联系人</li></a>
                    <a href="/customer/record?id=${customer.customerId}"><li class="layui-btn layui-btn-normal">交往记录</li></a>
                    <a href="/customer/tohistory?customerId=${customer.customerId}"><li class="layui-btn layui-btn-normal">历史订单</li></a>
                    <a href="/customer/findAll"><li class="layui-btn layui-btn-normal layui-bg-orange"><i class="layui-icon">&#xe65c;</i>返回</li></a>

                </ul>
            </blockquote>

            <%--<a href="/customer/findContactById?id=${customer.customerId}">联系人</a>
            <a href="/customer/record?id=${customer.customerId}">交往记录</a>
            <a href="/customer/record?id=${customer.customerId}">历史订单</a>--%>

 <%--   <form action="/customer/findContactById">
        <input type="text" name="id" value="${customer.customerId}" style="display: none">
        <input type="submit" value="联系人"></input>
    </form>
    <form action="/customer/rocord">
        <input type="text" name="id" value="${customer.customerId}" style="display: none">
        <input type="submit" value="交往记录"></input>
    </form>
    <form action="/customer/findContactById">
        <input type="text" name="id" value="${customer.customerId}" style="display: none">
        <input type="submit" value="历史订单"></input>
    </form>--%>
            <blockquote class="layui-elem-quote layui-quote-nm">

                <table id="test1" class="layui-table"   lay-skin="line">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>
                    <form action="/customer/edit" method="get" class="layui-form  layui-col-md12 we-search">
                    <tr>
                        <th class="layui-bg-gray">客户编号:</th>
                        <td><input type="text" name="customerId" value="${customer.customerId}" readonly/></td>
                        <th class="layui-bg-gray">名称</th>
                        <td><input type="text" name="customerName"  value="${customer.customerName}" required><i style="color:red;">*</i></td>
                    </tr>
                    <%--<tr>
                        <td>名称</td>
                        <td><input type="text" name="customerName"  value="${customer.customerName}"></td>
                    </tr>--%>
                    <tr>
                        <th class="layui-bg-gray">地区</th>
                        <td><input type="text" name="city"  value="${customer.city}" required><i style="color:red;">*</i></td>
                        <th class="layui-bg-gray">客户经理</th>
                        <td><input type="text" name="customerMgr" value="${customer.customerMgr}" required><i style="color:red;">*</i></td>
                    </tr>
                    <%--<tr>
                        <td>客户经理</td>
                        <td><input type="text" name="customerMgr" value="${customer.customerMgr}"></td>
                    </tr>--%>
                    <tr>
                        <th class="layui-bg-gray">客户等级</th>
                        <td colspan="3"><input type="text" name="customerGrade" value="${customer.customerGrade}" required><i style="color:red;">*</i></td>
                    </tr>
                    <tr>
                        <th class="layui-bg-gray">客户满意度</th>
                        <td colspan="3">
                                <div class="layui-inline">
                                    <select name="customerSatisfaction" required>
                                        <option name="customerSatisfaction" value="${customer.customerSatisfaction}" selected="selected">${customer.customerSatisfaction}</option>
                                        <option name="customerSatisfaction" value="☆">☆</option>
                                        <option name="customerSatisfaction" value="☆☆">☆☆</option>
                                        <option name="customerSatisfaction" value="☆☆☆">☆☆☆</option>
                                        <option name="customerSatisfaction" value="☆☆☆☆">☆☆☆☆</option>
                                        <option name="customerSatisfaction" value="☆☆☆☆☆">☆☆☆☆☆</option>
                                    </select>
                                    <i style="color:red;">*</i>
                                </div>
                        </td>
                            <%--<input type="text" name="customerSatisfaction" value="${customer.customerSatisfaction}">--%>
                    </tr>
                    <tr>
                        <th class="layui-bg-gray">客户信用度</th>
                        <td colspan="3">
                                <div class="layui-inline">
                                    <select name="customerCredit" required>
                                        <option name="customerCredit" value="${customer.customerCredit}" selected="selected">${customer.customerCredit}</option>
                                        <option name="customerCredit" value="☆">☆</option>
                                        <option name="customerCredit" value="☆☆">☆☆</option>
                                        <option name="customerCredit" value="☆☆☆">☆☆☆</option>
                                        <option name="customerCredit" value="☆☆☆☆">☆☆☆☆</option>
                                        <option name="customerCredit" value="☆☆☆☆☆">☆☆☆☆☆</option>
                                    </select>
                                    <i style="color:red;">*</i>
                                </div>
                            <%--<form class="layui-form layui-col-md12 we-search">
                                <div class="layui-inline">
                                    <select name="customerCredit">
                                        <option name="customerCredit" value="${customer.customerCredit}" selected="selected">${customer.customerCredit}</option>
                                        <option name="customerCredit" value="☆">☆</option>
                                        <option name="customerCredit" value="☆☆">☆☆</option>
                                        <option name="customerCredit" value="☆☆☆">☆☆☆</option>
                                        <option name="customerCredit" value="☆☆☆☆">☆☆☆☆</option>
                                        <option name="customerCredit" value="☆☆☆☆☆">☆☆☆☆☆</option>
                                    </select>
                                </div>
                            </form>--%>
                        </td>
                            <%--<input type="text" name="customerCredit" value="${customer.customerCredit}">--%>
                    </tr>
                    <tr>
                        <th class="layui-bg-gray">地址</th>
                        <td> <input type="text" name="address" value="${customer.address}" required><i style="color:red;">*</i></td>
                        <th class="layui-bg-gray">邮政编码&nbsp;</th>
                        <td><input type="text" name="postalCode" value="${customer.postalCode}" required><i style="color:red;">*</i></td>
                    </tr>
                    <%--<tr>
                        <td>邮政编码</td>
                        <td><input type="text" name="postalCode" value="${customer.postalCode}"></td>
                    </tr>--%>
                    <tr>
                        <th class="layui-bg-gray">电话</th>
                        <td><input type="text" name="phone" value="${customer.phone}" required><i style="color:red;">*</i></td>
                        <th class="layui-bg-gray">传真</th>
                        <td><input type="text" name="fax" value="${customer.fax}" required><i style="color:red;">*</i></td>
                    </tr>
                    <%--<tr>
                        <td>传真</td>
                        <td><input type="text" name="fax" value="${customer.fax}"></td>
                    </tr>--%>
                    <tr>
                        <th class="layui-bg-gray">网址</th>
                        <td colspan="3"><input type="text" name="url" value="${customer.url}" required><i style="color:red;">*</i></td>
                    </tr>
                    <tr>
                        <th class="layui-bg-gray">营业执照注册号</th>
                        <td><input type="text" name="businessLicense" value="${customer.businessLicense}"></td>
                        <th class="layui-bg-gray">法人</th>
                        <td><input type="text" name="jurrdicalPerson" value="${customer.jurrdicalPerson}" required><i style="color:red;">*</i></td>
                    </tr>
                    <%--<tr>
                        <td>法人</td>
                        <td><input type="text" name="jurrdicalPerson" value="${customer.jurrdicalPerson}"></td>
                    </tr>--%>
                    <tr>
                        <th class="layui-bg-gray">注册资金（万元）</th>
                        <td><input type="text" name="registeredCapital" value="${customer.registeredCapital}"></td>
                        <th class="layui-bg-gray">年营业额</th>
                        <td><input type="text" name="annualSales" value="${customer.annualSales}"></td>
                    </tr>
                    <%--<tr>
                        <td>年营业额</td>
                        <td><input type="text" name="annualSales" value="${customer.annualSales}"></td>
                    </tr>--%>
                    <tr>
                        <th class="layui-bg-gray">开户银行</th>
                        <td><input type="text" name="depositBank" value="${customer.depositBank}" required><i style="color:red;">*</i></td>
                        <th class="layui-bg-gray">银行账号</th>
                        <td><input type="text" name="bankAccount" value="${customer.bankAccount}"></td>
                    </tr>
                    <%--<tr>
                        <td>银行账号</td>
                        <td><input type="text" name="bankAccount" value="${customer.bankAccount}"></td>
                    </tr>--%>
                    <tr>
                        <th class="layui-bg-gray">地税登记号</th>
                        <td><input type="text" name="landTaxCode" value="${customer.landTaxCode}"></td>
                        <th class="layui-bg-gray">国税登记号</th>
                        <td><input type="text" name="centralTax" value="${customer.centralTax}"></td>
                    </tr>
                    <%--<tr>
                        <td>国税登记号</td>
                        <td><input type="text" name="centralTax" value="${customer.centralTax}"></td>
                    </tr>--%>
                        <tr>
                            <td colspan="4">

                                <input style="display: inline-block;position: absolute;top: -567px;right: -96px;" class="layui-btn layui-btn-normal" type="submit" value="保存"/>

                            </td>
                        </tr>
                    </form>

                </table>



            </blockquote>
        </div>
    </div>
    <script type="text/javascript" src="../../static/lib/layui/layui.js" ></script>
    <%--<script type="text/javascript" src="../../static/lib/layui/layui.js" charset="utf-8"></script>--%>
</body>

</html>
