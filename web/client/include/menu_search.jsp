<%--
  Created by IntelliJ IDEA.
  User: 卓裕
  Date: 2023/3/10
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container">
        <div>
            <!--无序列表，使用 <ul> + <li> 标签-->
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">文学</a></li>
                <li><a href="#">生活</a></li>
                <li><a href="#">计算机</a></li>
                <li><a href="#">外语</a></li>
                <li><a href="#">经管</a></li>
                <li><a href="#">励志</a></li>
                <li><a href="#">社科</a></li>
                <li><a href="#">学术</a></li>
                <li><a href="#">少儿</a></li>
                <li><a href="#">艺术</a></li>
                <li><a href="#">原版</a></li>
                <li><a href="#">科技</a></li>
                <li><a href="#">考试</a></li>
                <li class="dropdown">
                    <a href="${pageContext.request.contextPath }/client/include/ProductList.jsp" class="dropdown-toggle" data-toggle="dropdown" style="color: greenyellow">
                        全部商品目录
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">目录1</a></li>
                        <li><a href="#">目录2</a></li>
                        <li><a href="#">目录3</a></li>
                        <li class="divider"></li>
                        <li><a href="#">分离的链接</a></li>
                        <li class="divider"></li>
                        <li><a href="#">另一个分离的链接</a></li>
                    </ul>
                </li>
            </ul>
        </div>0
    </div>
</nav>
<nav class="navbar navbar-light" style="background-color: orange;">
    <div style="float: right; ">
        <form  role="form" action="${pageContext.request.contextPath }/servlet/MenuSearchServlet" >
            <table style="width:400px;height:45px">
                <tr>
                    <td><span class="input-group-addon">Search</span></td>
                    <td><input name="textfield" type="text" class="form-control me-2" placeholder="请输入书名"></td>
                    <td><button type="submit" style="background-color: springgreen">搜索</button></td>
                </tr>
            </table>
        </form>
    </div>
</nav>
</body>
</html>
