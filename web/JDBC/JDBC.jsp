        <%--
  Created by IntelliJ IDEA.
  User: ZhuoYu1101
  Date: 2023/3/28
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>不带参数查询</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%
    Connection conn=null;
    Statement stmt=null;
    ResultSet rs=null;
    try{
        //加载驱动
        Class.forName("com.mysql.cj.jdbc.Driver");//加载驱动程序以及
        out.println("数据库驱动加载成功");
        //建立连接
        conn = DriverManager.getConnection
                ("jdbc:mysql://localhost:3306/maiba?useSSL=true&characterEncoding=utf-8&serverTimezone=GMT&user=root&password=root");
        out.println("创建连接成功<br>");
        //sql预处理
        stmt  = conn.createStatement();
        rs=stmt.executeQuery("select * from user");//查询整个用户表数据
        //执行语句
        while(rs.next()){//遍历整个表数据
            out.print("  id：" + rs.getInt(1));
            out.print(";  account：" + rs.getString(2));
            out.print(";  password：" + rs.getString(3));
            out.print("<BR>");

        }

    }catch(Exception e){
        e.printStackTrace();

    }finally {
        //释放资源
        if (rs != null)
            rs.close();
        if (stmt != null)
            stmt.close();
        if (conn != null)
            conn.close();
    }
%>

</body>
</html>
