<%--
  Created by IntelliJ IDEA.
  User: ZhuoYu1101
  Date: 2023/4/17
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="domain.Product" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>delete</title>
</head>
<jsp:useBean id="product" class="domain.Product" scope="request"/>
<body><%

    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    product.delete(request.getParameter("id"));
    response.sendRedirect(request.getContextPath() + "/admin/login/home.jsp?item=product_list");
%>
</body>
</html>
