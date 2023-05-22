<%--
  Created by IntelliJ IDEA.
  User: ZhuoYu1101
  Date: 2023/3/26
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type"content="text/html;charset=UTF-8">
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String[] s=new String[4];
    s[0]=request.getParameter("PName");
    s[1]=request.getParameter("Price");
    s[2]=request.getParameter("PNum");
    s[3]="1";
    if(s[0]==null) {
        return;
    }
    switch(s[0]){
        case "网管员必备宝典":
            session.setAttribute("book0",s);
            break;
        case "学会宽容":
            session.setAttribute("book1",s);
            break;
        case "杜拉拉升职记":
            session.setAttribute("book2",s);
            break;
        case "Java基础入门":
            session.setAttribute("book3",s);
            break;
    }
    response.sendRedirect("Cart.jsp");
%>
</body>
</html>
