<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 卓裕
  Date: 2023/3/18
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>top</title>
    <meta charset="UTF-8">
</head>
<body id="body_top">
<div id="div_top_1">
    <h2 >网上书城后台管理系统</h2>
</div>
<nav style=" bottom: 5px;">
    <!--这个方法是循环方法，后面的1000是毫秒数，每单位毫秒数执行一次前面的xxx,setInterval("xxx",1000);
    这句话的操作就是，每1000毫秒(即1秒)，取当前时间打印更新在页面该标签里，实现系统时间实时显示-->
    <div id="div_top_2">
        <div id="datetime"style="float: left;background-color: #EEEEEE">
            <script>
                setInterval("document.getElementById('datetime').innerHTML=new Date().toLocaleString();", 1000);
            </script>
        </div>
        <div style="float: right;">
            <button type="button">退出系统</button>
        </div>
</div>
</nav>
</body>
</html>
