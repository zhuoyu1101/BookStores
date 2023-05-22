<%--
  Created by IntelliJ IDEA.
  User: ZhuoYu1101
  Date: 2023/3/26
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除购物车</title>
    <meta http-equiv="Content-Type"content="text/html;charset=UTF-8">
</head>
<body>
<%
    String  Detele_book = "book"+request.getParameter("i");
    session.removeAttribute(Detele_book);
    response.sendRedirect("Cart.jsp");
%>
</body>
</html>
