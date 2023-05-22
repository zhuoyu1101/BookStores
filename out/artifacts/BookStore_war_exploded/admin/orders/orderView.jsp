<%--
  Created by IntelliJ IDEA.
  User: ZhuoYu1101
  Date: 2023/5/15
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="domain.Order" %>
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
            <td align="center" bgColor="#afd1f3"><strong>订单详细信息</strong></TD>
        </tr>
        <tr>
            <td style="align:center; bgColor:#f5fafe;">
                <table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1"
                       style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid;
                       WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse;
                       BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                    <!--  循环输出所有商品 -->
                    <%
                        request.setCharacterEncoding("UTF-8");
                        response.setCharacterEncoding("UTF-8");
                    %>
                    <tr>
                    <c:forEach items="${order.orderItems}" var="orderItem">
                        <%--从迭代参数order.orderItems中取出订单的各个属性；--%>
                        <tr onmouseover="this.style.backgroundColor = 'white'"
                            onmouseout="this.style.backgroundColor = '#F5FAFE';">
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="15%">
                                订单编号
                            </td>
                            <td width="35%">
                                    ${orderItem.order.getId()}
                            </td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="15%">
                                所属用户
                            </td>
                            <td width="35%">
                                    ${orderItem.order.getUser().getId()}
                            </td>
                        </tr>
                        <tr onmouseover="this.style.backgroundColor = 'white'"
                            onmouseout="this.style.backgroundColor = '#F5FAFE';">
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="15%">
                                收件人
                            </td>
                            <td width="35%">
                                    ${orderItem.order.getReceiverName()}
                            </td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="15%">
                                 联系电话
                            </td>
                            <td width="35%">
                                    ${orderItem.order.getReceiverPhone()}
                            </td>
                        </tr>
                        <tr onmouseover="this.style.backgroundColor = 'white'"
                            onmouseout="this.style.backgroundColor = '#F5FAFE';">
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="15%">
                                送货地址
                            </td>
                            <td width="35%">
                                    ${orderItem.order.getReceiverAddress()}
                            </td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="15%">
                                总价
                            </td>
                            <td width="35%">
                                    ${orderItem.order.getMoney()}
                            </td>
                        </tr>
                </table>
                <table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid2"
                       style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid;
                                        WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse;
                                        BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                        <tr onmouseover="this.style.backgroundColor = 'white'"
                            onmouseout="this.style.backgroundColor = '#F5FAFE';">
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="15%">
                                下单时间
                            </td>
                            <td style="CURSOR: hand; HEIGHT: 22px" width="85%">
                                    ${orderItem.order.getOrdertime()}
                            </td>
                        </tr>
                        <tr onmouseover="this.style.backgroundColor = 'white'"
                            onmouseout="this.style.backgroundColor = '#F5FAFE';">
                            <td style="CURSOR: hand; HEIGHT: 44px" align="center" width="15%">
                                商品信息
                            </td>
                            <td style="CURSOR: hand; HEIGHT: 44px" align="center" width="85%">
                                <table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid3"
                                       style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid;
                                        WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse;
                                        BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                                <tr>
                                    <td style="CURSOR: hand; HEIGHT: 22px;"bgColor="#afd1f3" align="center" width="7%">
                                        序号
                                    </td>
                                    <td style="CURSOR: hand; HEIGHT: 22px;"bgColor="#afd1f3" align="center" width="26%">
                                        商品编号
                                    </td>
                                    <td style="CURSOR: hand; HEIGHT: 22px;"bgColor="#afd1f3" align="center" width="15%">
                                        商品名称
                                    </td>
                                    <td style="CURSOR: hand; HEIGHT: 22px;"bgColor="#afd1f3" align="center" width="15%">
                                        商品价值
                                    </td>
                                    <td style="CURSOR: hand; HEIGHT: 22px;"bgColor="#afd1f3" align="center" width="7%">
                                        购买数量
                                    </td>
                                    <td style="CURSOR: hand; HEIGHT: 22px;"bgColor="#afd1f3" align="center" width="15%">
                                        商品类别
                                    </td>
                                    <td style="CURSOR: hand; HEIGHT: 22px;"bgColor="#afd1f3" align="center" width="15%">
                                        商品描述
                                    </td>
                                </tr>
                                <tr>
                                    <td style="CURSOR: hand; HEIGHT: 22px"bgColor="	#DCDCDC" align="center" width="7%">
                                            ${1}
                                    </td>
                                    <td style="CURSOR: hand; HEIGHT: 22px"bgColor="	#DCDCDC" align="center" width="26%">
                                            ${orderItem.p.getId()}
                                    </td>
                                    <td style="CURSOR: hand; HEIGHT: 22px"bgColor="#DCDCDC" align="center" width="15%">
                                            ${orderItem.p.getName()}
                                    </td>
                                    <td style="CURSOR: hand; HEIGHT: 22px"bgColor="#DCDCDC" align="center" width="15%">
                                            ${orderItem.p.getPrice()}
                                    </td>
                                    <td style="CURSOR: hand; HEIGHT: 22px"bgColor="#DCDCDC" align="center" width="7%">
                                            ${orderItem.buynum}
                                    </td>
                                    <td style="CURSOR: hand; HEIGHT: 22px"bgColor="#DCDCDC" align="center" width="15%">
                                            ${orderItem.p.getCategory()}
                                    </td>
                                    <td style="CURSOR: hand; HEIGHT: 22px"bgColor="#DCDCDC" align="center" width="15%">
                                            ${orderItem.p.getDescription()}
                                    </td>
                                </tr>
                                </table>
                            </td>
                        </tr>
                    </c:forEach>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right" bgColor="#ffffff">
                <input type="button" name="return" value="返回" onclick="history.go(-1)"/>
            </td>
        </tr>
    </table>
</form>
</body>

