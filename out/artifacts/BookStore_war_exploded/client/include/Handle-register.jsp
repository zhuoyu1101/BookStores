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
</head>
<body>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Arrays" %>
<%
    //获取数据
    request.setCharacterEncoding("UTF-8");
    String username_temp = request.getParameter("username");
    String password_temp = request.getParameter("password");
    String usertype_temp = request.getParameter("usertype");
    String gender_temp = request.getParameter("gender");
    String birthday_temp = request.getParameter("birthday");
    String[] hobby_temp = request.getParameterValues("hobby");//checkBox传输的数据为数组
    String HOBBY = Arrays.toString(hobby_temp);//将数组转化为字符串，方便存入数据库
    String email_temp = request.getParameter("email");
    String introduction_temp = request.getParameter("introduction");
    //插入数据
    Connection conn = null;
    Statement stmt = null;
//    boolean defaultCommit = false;
    String strSQL1 = "insert into bookstore.user(username,PASSWORD,usertype,gender,birthday,hobby,email,introduce)" +
            "values('"+username_temp+"','"+password_temp+"','"+usertype_temp+"','"+gender_temp+"'," +
            "'"+birthday_temp+"','"+HOBBY+"','"+email_temp+"','"+introduction_temp+"')";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection
                ("jdbc:mysql://localhost:3306/bookstore?useSSL=true&characterEncoding=utf-8&serverTimezone=GMT&user=root&password=root");
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


<%
    response.sendRedirect(request.getContextPath() + "/client/include/registersuccess.jsp");
%>
</body>
</html>
