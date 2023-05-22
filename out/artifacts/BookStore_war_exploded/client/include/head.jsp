<%@ page import="javax.xml.crypto.dom.DOMCryptoContext" %>
<%@ page import="org.w3c.dom.Document" %><%--
  Created by IntelliJ IDEA.
  User: 卓裕
  Date: 2023/3/10
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8">
    <title>网上书城</title>
    <!--bootstrap,CDN(内容交付方式网络)-->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="../css/autoplay.css" rel="stylesheet" type="text/css"/>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <style>
        .navbar {
            position: relative;
            min-height: 50px;
            margin-bottom: 0px;
            border: 1px solid transparent;
        }
    </style>
</head>
<body>
<!--nav,定义导航链接的部分-->
<nav class="navbar navbar-light" style="background-color: white;" role="navigation">
    <img align="left" src="${pageContext.request.contextPath}/client/images/logo.jpg" width=10%/>
    <!--div,设定字、画、表格等的摆放位置-->
    <div style="float: right" onload="checkUser()">
        <ul class="nav navbar-nav">
            <li><a><img src="${pageContext.request.contextPath}/client/images/cart.gif"/></a></li>
            <li><a style="color:blue;" href="../include/Cart.jsp">购物车</a></li>
            <li><a>|</a></li>
            <li><a style="color:blue;" href="#">帮助中心</a></li>
            <li><a>|</a></li>
            <li><a style="color:blue;" href="">我的账户</a></li>
            <li><a>|</a></li>
            <li><a style="color:blue;" href="${pageContext.request.contextPath}/client/mainjsp/register.jsp">新用户注册</a>
            </li>
        </ul>
    </div>
</nav>
</body>
</html>