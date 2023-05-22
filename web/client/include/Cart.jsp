<%--
  Created by IntelliJ IDEA.
  User: ZhuoYu1101
  Date: 2023/3/26
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>购物车</title>
    <%@ include file="head.jsp" %>
    <%@ include file="menu_search.jsp" %>
    <link href="../css/main.css" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type"content="text/html;charset=UTF-8">\
    <script>
        function cart_del(){

        }
    </script>
</head>
<body>
<table width='100%' border='0' cellspacing='0'>
    <tr>
        <td style='text-align:left'><a style="color:blue;" href="../mainjsp/index.jsp">首页</a>&nbsp>&nbsp购物车</td>
    </tr>
    <tr>
        <td width='13%'><h4>序号</h4></td>
        <td width='21%'><h4>商品名称</h4></td>
        <td width='13%'><h4>价格</h4></td>
        <td width='10%'><h4>库存</h4></td>
        <td width='20%'><h4>数量</h4></td>
        <td width=30><h4>删除</h4></td></tr>
</table>
<%
    String book[][]=new String[4][4];
    book[0]=(String[]) session.getAttribute("book0");
    book[1]=(String[]) session.getAttribute("book1");
    book[2]=(String[]) session.getAttribute("book2");
    book[3]=(String[]) session.getAttribute("book3");
    int price=0;//计算价格
    int j=1;//表格序号
    for(int i=0;i<4;i++) {
        if (book[i] != null) {
            out.println("<form action='DeleteCart.jsp?i=" + i + "' method='post'");
            out.println("<div id='div" + i + "'>");
            out.println("<table width='100%' border='0' cellspacing='0'>");
            out.println("<tr><td width='13%'>" + j + "</td><td width='21%'>" + book[i][0] + "</td>");
            out.println("<td width='13%'>" + book[i][1] + "</td>");
            out.println("<td width='10%'>" + book[i][2] + "</td>");
            out.println("<td width='20%'>" + book[i][3] + "</std>");
            out.println("<td width=30><button style='color:#FF0000;font-weight:bold' onclick='return cart_del()'>X</button></td></tr>");
            out.println("</table>");
            out.println("</div>");
            out.println("</form>");
            price += Integer.parseInt(book[i][1]);
            j++;
        }
    }
    out.print("<h6>合计："+price+"元</h6>");
%>

</body>
</html>
<%@ include file="foot.jsp" %>