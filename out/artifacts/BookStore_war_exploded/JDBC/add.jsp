<%--
  Created by IntelliJ IDEA.
  User: ZhuoYu1101
  Date: 2023/4/17
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>list</title>
    <link href="../admin/css/main.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@ page import="domain.Product" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="product" class="domain.Product" scope="request"/>
<form action="../admin/products/add-handle.jsp" method="post" >
    <div>
        <table style="border:1px solid gray;text-align: center">
            <tr>
                <td style="border:1px solid gray;background-color: cornflowerblue;">添加商品</td>
            </tr>
        </table>

        <table style="border:1px solid gray;">
            <tr>
                <td>商品名称：</td>
                <td><input name="name"type="text" /> </td>
                <td>商品价格：</td>
                <td><input name="price"type="text" /> </td>
            </tr>
            <tr>
                <td>商品数量：</td>
                <td><input name="pnum"type="text"/> </td>
                <td>商品类别：</td>
                <td>
                    <select name="category">
                        <option value="0">请选择商品类别</option>
                        <option value="管理员">计算机</option>
                        <option value="普通用户">数学</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>商品图片：</td>
                <td><input name="imgurl"type="file"></td>
            </tr>
            <tr>
                <td>商品描述</td>
                <td>
                    <textarea name="description"cols="40"rows="5"></textarea>
                </td>
            </tr>
        </table>
        <table style="text-align: center">
            <tr>
                <td><input type="submit" name="determine" value="确定"/></td>
                <td><input type="button" name="reset" value="重置"/></td>
                <td><input type="button" name="return" value="返回"></td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>
