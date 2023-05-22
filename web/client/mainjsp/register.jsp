<%--
  Created by IntelliJ IDEA.
  User: 卓裕
  Date: 2023/3/10
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <!--设置视口（viewport），移动优先的样式，让网页支持响应式布局-->
  <meta charset="UTF-8">
  <title>网上书城_注册页</title>
  <%@ include file="../include/head.jsp" %>
  <%@ include file="../include/menu_search.jsp" %>
  <!--css外部样式表-->
  <link href="../css/main.css" rel="stylesheet" type="text/css"/>
  <!--js外部链接式函数-->
  <script type="text/javascript"src="../js/from.js"></script>
</head>
<body>
<!--以下是注册信息 -->
<form action="../include/Handle-register.jsp" method="post" onsubmit="return checkForm();">
  <thead><H2>新用户注册</H2></thead>
  <table>
    <tr>
      <td><H4>用户名</H4></td>
      <td>
        <input name="username"type="text"id="txtUser"onblur="return checkName()"/>
      </td>
      <td>
        <!--span,应用样式时，会产生视觉上的变化-->
        <span id="tips_username">*用户名由6-18位字符组成</span>
      </td>
    </tr>
    <tr>
      <td><H4>密码</H4></td>
      <td>
        <input id="txtPwd" name="password"type="password"onblur="return checkPassWord()"/>
      </td>
      <td>
        <span id="tips_password">*密码由6—18位字符组成，且必须包含字母、数字和标点符号</span>
      </td>
    </tr>
    <tr>
      <td><H4>确认密码</H4></td>
      <td>
        <input id="txtRpt" name="password2"type="password"onblur="return checkRpt()"/>
      </td>
      <td>
        <span id="tips_repeat">*请保持两次密码一致</span>
      </td>
    </tr>
    <tr>
      <td><H4>用户类型</H4></td>
      <td>
        <select id="selUaer"name="usertype"onblur="return checkSelUser()">
          <option value="0">请选择</option>
          <option value="管理员">管理员</option>
          <option value="普通用户">普通用户</option>
        </select>
      </td>
      <td>
        <span id="tips_usertype">*请选则用户类型</span>
      </td>
    </tr>
    <tr>
      <td><H4>性别</H4></td>
      <td>
        <input name="gender"type="radio"value="male"onchange="return checkGender()"/>男
        <input name="gender"type="radio"value="female"onchange="return checkGender()"/>女
      </td>
      <td>
        <span id="tips_gender">*请选择你的性别</span>
      </td>
    </tr>
    <tr>
      <td><H4>出生日期</H4></td>
      <td>
        <input id="txtDate"name="birthday"type="date"onblur="return checkDate()"/>
      </td>
      <td>
        <span id="tips_birthdate">*请选择你的出生日期</span>
      </td>
    </tr>
    <tr>
      <td><H4>兴趣爱好</H4></td>
      <td>
        <input name="hobby"type="checkbox"value="reding"onblur="return changeHobby() "/>阅读
        <input name="hobby"type="checkbox"value="music"onblur="return changeHobby() "/>音乐
        <input name="hobby"type="checkbox"value="sport"onblur="return changeHobby() "/>运动
      </td>
      <td>
        <span id="tips_hobby">*请选择你的兴趣爱好</span>
      </td>
    </tr>
    <tr>
      <td><H4>电子邮件</H4></td>
      <td>
        <input id="txtMail"name="email"type="email"onblur="return checkEmail()"/>
      </td>
      <td>
        <span id="tips_email">*请填写你的常用Email,将用于密码找回</span>
      </td>
    </tr>
    <tr>
      <td><H4>自我介绍</H4></td>
      <td>
        <textarea id="txtIntro" name="introduction"cols="40"rows="5"onblur="return checkIntroduction()"></textarea>
      </td>
      <td>
        <span id="tips_introduction">*不超过100字</span>
      </td>
    </tr>
  </table>
  <tfoot>
  <tr>
    <td>
      <input name="submit" type="image" src="../images/signup.gif" />
    </td>
    <td>
      <span id="submitshow"></span>
    </td>
  </tr>
  </tfoot>
</form>
</body>
</html>
<%@ include file="../include/foot.jsp" %>
