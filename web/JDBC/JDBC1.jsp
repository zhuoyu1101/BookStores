<%--
  Created by IntelliJ IDEA.
  User: ZhuoYu1101
  Date: 2023/3/28
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>带参数查询</title>
</head>
<body>
<%@page import="java.sql.*"%>
<%
    try{

        Class.forName("com.mysql.cj.jdbc.Driver");//加载驱动程序以及
        Connection conn = DriverManager.getConnection
                ("jdbc:mysql://localhost:3306/maiba?useSSL=true&characterEncoding=utf-8&serverTimezone=GMT&user=root&password=root");
        String strSQL = "select * from user where account=?";
        PreparedStatement pst  = conn.prepareStatement(strSQL);
        pst.setString(1,"zhuoyu");
        ResultSet rs = pst.executeQuery();
        while(rs.next()){
            out.print("  id：" + rs.getInt(1));
            out.print(";  account：" + rs.getString(2));
            out.print(";  password：" + rs.getString(3));
            out.print("<BR>");
        }
        rs.close();
        pst.close();
        out.print("数据库连接成功！");
        conn.close();
    }catch(Exception e){
        out.print("数据库连接失败！");
        out.print("错误信息：" + e.toString());
    }
%>

</body>
</html>
