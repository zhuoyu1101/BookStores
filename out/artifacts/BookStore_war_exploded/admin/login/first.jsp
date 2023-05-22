<%--
  Created by IntelliJ IDEA.
  User: 卓裕
  Date: 2023/3/18
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<%response.setCharacterEncoding("utf-8");%>
    <jsp:forward page="home.jsp">
    <jsp:param value="这是使用jsp:forward从first页面跳转过来的~" name="first"></jsp:param>
    </jsp:forward>

</body>
</html>
