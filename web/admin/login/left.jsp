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
    <title>left</title>
</head>
<body>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container">
        <div style="line-height: 10%;">
            <!--无序列表，使用 <ul> + <li> 标签-->
            <ul class="nav navbar-nav">
                <li style="height:10%;">
                    <a href="${pageContext.request.contextPath}/admin/login/home.jsp?item=<%="product_list"%>" target="_self">
                        商品管理
                    </a>
                </li>
                <li style="height:10%;">
                    <a href="${pageContext.request.contextPath}/admin/login/home.jsp?item=<%="download"%>" target="_self" class="left_list">
                        销售榜单
                    </a>
                </li>
                <li style="height:10%;">
                    <a href="${pageContext.request.contextPath}/FindOrdersServlet" target="_self" class="left_list">
                        订单管理
                    </a>

                </li>
                <li style="height:10%;">公告管理</li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
