<%--
  Created by IntelliJ IDEA.
  User: 卓裕
  Date: 2023/3/18
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>home</title>
</head>
<body>
<div id="container" style="width:100%;height:100%;">
    <div id="header" style="background-color:#FFA500;">
        <%@include file="top.jsp" %>
    </div>
    <div id="menu" style="background-color:#EEEEEE;float:left;width:15%;height:80%;">
        <jsp:include page='left.jsp'/>
    </div>

    <div id="content" style="height:200px;width:85%;height:70%;float:left;">
        <%
            request.setCharacterEncoding("utf-8");
            String item = request.getParameter("item");
            if (item != null && item.equals("product_list")) {%>
        <jsp:include page='../products/list.jsp'/>
        <%} else if (item != null && item.equals("product_add")) {%>
        <jsp:include page='../products/add.jsp'/>
        <%} else if (item != null && item.equals("download")) {%>
        <jsp:include page='../products/download.jsp'/>
        <%} else if (item != null && item.equals("orders")) {%>
        <jsp:include page='../orders/orderList.jsp'/>
        <%} else if (item != null && item.equals("view")) {%>
        <jsp:include page='../orders/orderView.jsp'/>
        <%} else {%>
        <jsp:include page='welcome.jsp'/>
        <%}%>

    </div>
    <div id="footer" style="height:15%;">
        <%@include file="bottom.jsp" %>
    </div>
   <h3><%-- <%=request.getParameter("first")%>--%>
    </h3>
</div>
</body>
</html>
