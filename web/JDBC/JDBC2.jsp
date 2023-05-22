<%--
  Created by IntelliJ IDEA.
  User: ZhuoYu1101
  Date: 2023/3/28
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>插入</title>
</head>
<body>
<%@page import="java.sql.*"%>
<%
  String name="spring";
  Connection conn = null;
  Statement stmt = null;
  boolean defaultCommit = false;
  String strSQL1 = "insert into maiba.user(id,account,password,user_name,email) values(2,'"+name+"','123456','spring learner','spring@126.com')";
  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection
            ("jdbc:mysql://localhost:3306/maiba?useSSL=true&characterEncoding=utf-8&serverTimezone=GMT&user=root&password=root");
    stmt = conn.createStatement();
    stmt.executeUpdate(strSQL1);
  }
  catch (Exception e) {
    e.printStackTrace();
  }finally {
    if (stmt != null) {
      stmt.close();
    }
    if (conn != null) {
      conn.close();
    }
  }
%>

</body>
</html>
