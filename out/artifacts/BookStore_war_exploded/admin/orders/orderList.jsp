<%--
  Created by IntelliJ IDEA.
  User: ZhuoYu1101
  Date: 2023/5/15
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%String TempId = null;//定义一个全局Id，方便提交表单2数据%>
<HTML>
<head>
    <meta http-equiv="Content-Language" content="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<br/>
<form id="Form1" name="Form1" action="#" method="post">
    <table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
        <tr>
            <td align="center" bgColor="#afd1f3"><strong>查 询 条 件</strong></td>
        </tr>
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tr>
                        <td height="22" align="center" bgColor="#f5fafe">订单编号：</td>
                        <td bgColor="#ffffff"><input type="text"
                                                     name="OrderId" size="50" value="" id="rderId"/>
                        </td>
                        <td height="22" align="center" bgColor="#f5fafe">收件人：</td>
                        <td bgColor="#ffffff"><input type="text"
                                                     name="Address" size="15" value="" id="Address"/>
                        </td>

                    </tr>
                    <tr>
                        <td width="100" height="22" align="center" bgColor="#f5fafe"></td>
                        <td bgColor="#ffffff"><font face="宋体"
                                                    color="red"> &nbsp;</font></td>
                        <td align="right" bgColor="#ffffff"><br/> <br/></td>
                        <td align="right" bgColor="#ffffff">
                            <button type="submit" id="search" name="search"
                                    value="查询">
                                查询
                            </button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="reset" name="reset" value="重置"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" bgColor="#afd1f3"><strong>订单列表</strong></TD>
        </tr>
        <tr>
            <td align="center" bgColor="#f5fafe">
                <table cellspacing="0" cellpadding="1" rules="all"
                       bordercolor="gray" border="1" id="DataGrid1"
                       style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                    <tr
                            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
                        <td align="center" width="26%">订单编号</td>
                        <td align="center" width="9%">收件人</td>
                        <td align="center" width="20%">地址</td>
                        <td align="center" width="17%">联系电话</td>
                        <td width="7%" align="center">所属用户</td>
                        <td width="7%" align="center">订单状态</td>
                        <td width="7%" align="center">查看</td>
                        <td width="7%" align="center">删除</td>
                    </tr>
                    <!--  循环输出所有商品 -->
                    <%
                        request.setCharacterEncoding("UTF-8");
                        response.setCharacterEncoding("UTF-8");
                        //System.out.println("orderList:"+request.getAttribute("orders"));
                    %>

                    <c:forEach items="${orders}" var="order">
<%--                    从迭代参数order中取出订单的各个属性；--%>
                    <tr onmouseover="this.style.backgroundColor = 'white'"
                        onmouseout="this.style.backgroundColor = '#F5FAFE';">
                        <td style="CURSOR: hand; HEIGHT: 22px; align:center; width:26%;">
                            ${order.id}
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px; align:center; width:9%;">
                                ${order.receiverName}
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px; align:center; width:20%;">
                                ${order.receiverAddress}
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px; align:center; width:17%;">
                                ${order.receiverPhone}
                        </td>

                        <td style="CURSOR: hand; HEIGHT: 22px; align:center; width:7%;">
                                ${order.user.id}
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px; align:center; width:7%;">
                                ${order.paystate}
                        </td>
<%--                    查看订单详情，调用FindOrderByIdServlet，并传递订单编号id--%>
                        <td align="center" style="HEIGHT: 22px" width="7%">
                            <a href="${pageContext.request.contextPath}/FindOrderByIdServlet?id=${order.id}">
                                <img src="${pageContext.request.contextPath}/admin/images/icon2.png" width="20" height="20"
                                     border="0" style="CURSOR: hand">
                            </a>
                        </td>
<%--                        删除订单，调用DelOrderByIdServlet，并传递订单编号id--%>
                        <td align="center" style="CURSOR: hand;HEIGHT: 22px" width="7%">
                            <a href="${pageContext.request.contextPath}/DelOrderByIdServlet?id=${order.id}">
                                X
                            </a>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
    </table>
</form>
<form id="Form2" name="Form2" action='${pageContext.request.contextPath}/admin/products/delete.jsp?id=<%=TempId%>' method="post">
</form><%--表单不能嵌套，否则会有些数据提交不了利用标签的form属性就可以不用改变表单的结构，就可以提交表单中的某一部分--%>
</body>
</HTML>