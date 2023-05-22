<%--
  Created by IntelliJ IDEA.
  User: ZhuoYu1101
  Date: 2023/3/26
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="domain.Product" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="product" class="domain.Product" scope="request"/>
<html>
<head>
    <title>全部商品目录</title>
    <%@ include file="head.jsp" %>
    <%@ include file="menu_search.jsp" %>
    <link href="${pageContext.request.contextPath}/client/css/main.css" rel="stylesheet" type="text/css"/>
    <meta http-equiv="Content-Type"content="text/html;charset=UTF-8">
</head>
<body>
<table >
    <tr>
        <td><h2>商品目录</h2></td>
    </tr>
    <tr>
        <td><h4></h4></td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <%
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //调用JavaBean的方法searchAll()获得产品列表
        List<Product> products = product.searchAll();
        if(request.getAttribute("ProductList")!=null){
            products= (List<Product>) request.getAttribute("ProductList");
        }
        String book[][]=new String[products.size()][5];
        int i=0;
        for (Product p : products) {
            book[i][0] =p.getImgurl();
            book[i][1] =p.getName();
            book[i][2] = String.valueOf(p.getPrice());
            book[i][3] = String.valueOf(p.getPnum());
            book[i][4] = p.getId();
            i++;
        }
        request.setAttribute("book",book);
    %>
    <tr>
    <c:forEach items="${book}" var="p"  >
        <td>
            <div class="divbookpic">
                <p>
                    <img src="${pageContext.request.contextPath}/client/images/productingImg/${p[0]}" alt=${p[1]} weight=115 height=129 />
                </p>
            </div>
            <div class="divlisttitle">
                <form action="Handle-AddCart.jsp?PId=${p[4]}" method="post"></form>
                    <label>书名：<input type="text"style="border: none"name="PName"value=${p[1]} readonly="readonly"/></label><br>
                    <label>售价：<input type="text"style="border: none"name="Price"value=${p[2]} readonly="readonly"/></label><br>
                    <label>库存：<input type="text"style="border: none"name="PNum"value=${p[3]} readonly="readonly"/></label><br>
                    <input type="submit" value="购买"/>
                </form>
            </div>
        </td>
    </c:forEach>
    </tr>
</table>
</body>
</html>
<%@ include file="foot.jsp" %>