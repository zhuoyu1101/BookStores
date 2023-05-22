<%--
  Created by IntelliJ IDEA.
  User: ZhuoYu1101
  Date: 2023/4/5
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="../include/head.jsp" %>
    <%@ include file="../include/menu_search.jsp" %>
    <!--css外部样式表-->
    <link href="../css/main.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"src="../js/my.js"></script>
</head>
<body>
<table>
    <tr>
        <td>
            <img src="../images/IconTexto_WebDev_009.jpg">
        </td>
        <td>
            <h3 style="color:red">注册成功</h3>
            <a href="<%=request.getContextPath()%>/client/mainjsp/index.jsp">
                <span id="second">5</span>秒后自动为您转跳到首页
            </a>
        </td>
    </tr>
</table>
</body>
</html>
<%@ include file="../include/foot.jsp" %>