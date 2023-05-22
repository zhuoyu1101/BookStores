<%--
  Created by IntelliJ IDEA.
  User: ZhuoYu1101
  Date: 2023/3/29
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>


<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" >
    <title>MySQL</title>
</head>
<body>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); //显示声明将数据库驱动程序注册到jdbc的驱动管理器中
        String url ="jdbc:mysql://localhost:3306/maiba?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT&useSSL=false";
        String username = "root"; //数据库用户名
        String password = "root"; //数据库密码
        Connection conn = DriverManager.getConnection(url, username, password); //连接数据库
        out.print("数据库连接成功！");
        conn.close();
    } catch (Exception e) {
        out.print("数据库连接失败！");
        out.print("错误信息：" + e.toString());
    }
%>

</body>
</html>
