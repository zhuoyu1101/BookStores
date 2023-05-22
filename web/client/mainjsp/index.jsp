<%--
  Created by IntelliJ IDEA.
  User: 卓裕
  Date: 2023/3/4
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>网上书城_首页</title>
    <%@ include file="../include/head.jsp" %>
    <%@ include file="../include/menu_search.jsp" %>
    <link href="../css/autoplay.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath }/client/css/main.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript"src="../js/autoplay.js"></script>
  </head>
  <body>
  <!-- 图书商场首页轮播图 start -->
  <div id="box_autoplay">
    <div class="list">
      <ul>
        <li><img src="../images/ad/index_ad1.jpg" width="900" height="335"/></li>
        <li><img src="../images/ad/index_ad2.jpg" width="900" height="335"/></li>
        <li><img src="../images/ad/index_ad3.jpg" width="900" height="335"/></li>
      </ul>
    </div>
  </div>
  <br>
  <table style="background-color: lightgoldenrodyellow ;width:900px;">
    <tr>
      <td><img src="../images/billboard.gif"/></td>
      <td><img src="../images/hottitle.gif"/></td>
    </tr>
    <tr>
      <td height="200" width="497" valign="top"><font color="red">尊敬的网上书城用户:<br>
        ----为了让大家有更好的购物体验,3月25日起,"当日达"业务暂停服务,回炉升级!<br>
      ----具体开放时间请留意公告.感谢大家的支持与理解,祝大家购物愉快!</font></td>
      <td height="200" width="403" valign="top" >三体</td>
    </tr>
  </table>
  </body>
</html>
<%@ include file="../include/foot.jsp" %>
