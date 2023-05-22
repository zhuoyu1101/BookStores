<%--
  Created by IntelliJ IDEA.
  User: ZhuoYu1101
  Date: 2023/4/17
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>add-handle</title>
</head>
<body>
<jsp:useBean id="product" class="domain.Product" scope="request"/>
<jsp:setProperty name="product" property="*"/>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    product.add(product);
    response.sendRedirect(request.getContextPath()+ "/admin/login/home.jsp?item=product_list");
%>

</body>
</html>
