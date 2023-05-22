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
<%
    //获取数据
    request.setCharacterEncoding("UTF-8");
    String username_temp = request.getParameter("username");
    String password_temp = request.getParameter("password");
%>
<%@page import="java.sql.*,dbpool.poolConnectDB"%>
<%
    boolean state =false;
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");//加载驱动程序以及
        Connection conn = DriverManager.getConnection
                ("jdbc:mysql://localhost:3306/bookstore?useSSL=true&characterEncoding=utf-8&serverTimezone=GMT&user=root&password=root");
        //Connection conn=poolConnectDB.getConnection();
        //System.out.println("创建连接成功");
        // 可以查询的得到匹配的 会输出最终结果
        // 得不到匹配的 会使得到结果为空
        String strSQL = "select username,PASSWORD from bookstore.user where username=?and PASSWORD=?";
        PreparedStatement pst  = conn.prepareStatement(strSQL);//实例化
        pst.setString(1,username_temp);
        pst.setString(2,password_temp);
        ResultSet rs = pst.executeQuery();// 执行查询 语句
        while(rs.next()){// 如果有数据，则可以执行
            state = true;
        }
        rs.close();
        pst.close();
        //out.print("数据库连接成功！");
        conn.close();
        //poolConnectDB.close(rs,pst,conn);
    }catch(Exception e){
        out.print("数据库连接失败！");
        out.print("错误信息：" + e.toString());
    }
    if(state){
        //账户密码正确，则跳回首页
        request.getSession().setAttribute("username", username_temp);
        response.sendRedirect(request.getContextPath() + "/client/include/loginsuccess.jsp");
    }else{
        //账号密码错误
        session.setAttribute("Message", "账号密码错误");
        response.sendRedirect(request.getContextPath() + "/client/include/loginfail.jsp");
    }
%>

</body>
</html>
