<%--
  Created by IntelliJ IDEA.
  User: ZhuoYu1101
  Date: 2023/5/12
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>download</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/DownloadServlet" >
<table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
    <tr>
        <td align="center" bgColor="#afd1f3"><strong>查 询 条 件</strong></td>
    </tr>
    <tr>
        <table>
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td height="22" align="center" bgColor="#f5fafe">请输入年份</td>
                    <td bgColor="#ffffff"><input type="text"
                                                 name="year" size="15" value="" id="year"/>
                    </td>
                    <td height="22" align="center" bgColor="#f5fafe">请选择月份</td>
                    <td bgColor="#ffffff"><select name="month" id="month">
                        <option value="" selected="selected">--选择月份--</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select></td>
                </tr>

                <tr>
                    <td width="100" height="22" align="center" bgColor="#f5fafe"></td>
                    <td bgColor="#ffffff"><font face="宋体"
                                                color="red"> &nbsp;</font></td>
                    <td align="right" bgColor="#ffffff"><br/> <br/></td>
                    <td align="right" bgColor="#ffffff">
                        <button type="submit" id="download" name="download"
                                value="下载">
                            下载
                        </button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="reset" name="reset" value="重置"/>
                    </td>
                </tr>
            </table>
        </table>
    </tr>
</table>
</form>
</body>
</html>
