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
    <%@ include file="../include/head.jsp" %>
    <%@ include file="../include/menu_search.jsp" %>
    <link href="../css/main.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/from.js"></script>
</head>
<body>
<form action="../include/Handle-login.jsp" method="post">
    <thead><H2>个人用户登录</H2></thead>
    <table class="tablelogin">
        <tr>
            <td><H4>用户名</H4></td>
            <td>
                <input name="username" type="text" id="txtUser" onblur="return checkName()"/>
            </td>
            <td>
                <!--span,应用样式时，会产生视觉上的变化-->
                <span id="tips_username"></span>
            </td>
        </tr>
        <tr>
            <td><H4>密码</H4></td>
            <td>
                <input id="txtPwd" name="password" type="password" onblur="return checkPassWord()"/>
            </td>
            <td>
                <span id="tips_password"></span>
            </td>
        </tr>

    </table>
    <tfoot>
    <tr>
        <td>
            <input name="submit" type="submit" value="登录"/>
        </td>
    </tr>
    </tfoot>
</form>
</body>
</html>
<%@ include file="../include/foot.jsp" %>