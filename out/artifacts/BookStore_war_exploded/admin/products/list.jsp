<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="domain.Product" %>
<%@ page import="java.util.*" %>
<%@ page import="com.oracle.wls.shaded.org.apache.xpath.objects.XString" %>
<jsp:useBean id="product" class="domain.Product" scope="request"/>
<%String TempId = null;//定义一个全局Id，方便提交表单2数据%>
<HTML>
<head>
    <meta http-equiv="Content-Language" content="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <script type="text/javascript">
        //添加商品
        function addProduct() {
            window.location.href = "${pageContext.request.contextPath}/admin/login/home.jsp?item=<%="product_add"%>";
        }

        function openPostWindow(url, data, name) {
            var tempForm = document.createElement("form");
            tempForm.id = "tempForm1";
            tempForm.method = "post";
            tempForm.action = url;
            tempForm.target = name;    // _blank - URL加载到一个新的窗口

            var hideInput = document.createElement("input");
            hideInput.type = "hidden";
            hideInput.name = "content";
            hideInput.value = data;
            tempForm.appendChild(hideInput);
            // 可以传多个参数
            /* var nextHideInput = document.createElement("input");
            nextHideInput.type = "hidden";
            nextHideInput.name = "content";
            nextHideInput.value = data;
            tempForm.appendChild(nextHideInput); */
            if (document.all) {    // 兼容不同浏览器
                tempForm.attachEvent("onsubmit", function () {
                });        //IE
            } else {
                tempForm.addEventListener("submit", function () {
                }, false);    //firefox
            }
            document.body.appendChild(tempForm);
            if (document.all) {    // 兼容不同浏览器
                tempForm.fireEvent("onsubmit");
            } else {
                tempForm.dispatchEvent(new Event("submit"));
            }
            tempForm.submit();
            document.body.removeChild(tempForm);
        }

    </script>

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
                        <td height="22" align="center" bgColor="#f5fafe">商品编号：</td>
                        <td bgColor="#ffffff"><input type="text"
                                                     name="id" size="15" value="" id="id"/>
                        </td>
                        <td height="22" align="center" bgColor="#f5fafe">类别：</td>
                        <td bgColor="#ffffff"><select name="category" id="category">
                            <option value="" selected="selected">--选择商品类别--</option>
                            <option value="文学">文学</option>
                            <option value="生活">生活</option>
                            <option value="计算机">计算机</option>
                            <option value="外语">外语</option>
                            <option value="经营">经营</option>
                            <option value="励志">励志</option>
                            <option value="社科">社科</option>
                            <option value="学术">学术</option>
                            <option value="少儿">少儿</option>
                            <option value="艺术">艺术</option>
                            <option value="原版">原版</option>
                            <option value="科技">科技</option>
                            <option value="考试">考试</option>
                            <option value="生活百科">生活百科</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td height="22" align="center" bgColor="#f5fafe">商品名称：</td>
                        <td bgColor="#ffffff"><input type="text"
                                                     name="name" size="15" value="" id="name"/>
                        </td>
                        <td height="22" align="center" bgColor="#f5fafe">价格区间(元)：</td>
                        <td bgColor="#ffffff"><input type="text"
                                                     name="minprice" size="10"/> - <input type="text"
                                                                                          name="maxprice" size="10"/>
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
            <td align="center" bgColor="#afd1f3"><strong>商品 列 表</strong></TD>
        </tr>
        <tr>
            <td align="right">
                <button type="button" id="add" name="add" value="添加"
                        onclick="addProduct()">
                    添加
                </button>
            </td>
        </tr>
        <tr>
            <td align="center" bgColor="#f5fafe">
                <table cellspacing="0" cellpadding="1" rules="all"
                       bordercolor="gray" border="1" id="DataGrid1"
                       style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                    <tr
                            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
                        <td align="center" width="24%">商品编号</td>
                        <td align="center" width="18%">商品名称</td>
                        <td align="center" width="9%">商品价格</td>
                        <td align="center" width="9%">商品数量</td>
                        <td width="8%" align="center">商品类别</td>
                        <td width="8%" align="center">编辑</td>
                        <td width="8%" align="center">删除</td>
                    </tr>
                    <!--  循环输出所有商品 -->
                    <%
                        request.setCharacterEncoding("UTF-8");
                        response.setCharacterEncoding("UTF-8");
                        //调用JavaBean的方法searchAll()获得产品列表，然后循环输出所有商品
                        List<Product> products = product.searchAll();
                        for (Product p : products) {
                    %>
                    <tr onmouseover="this.style.backgroundColor = 'white'"
                        onmouseout="this.style.backgroundColor = '#F5FAFE';">
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="200">
                            <%=p.getId()%>
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                            width="18%">
                            <%=p.getName()%>
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">
                        <%=p.getCategory()%>
                        </td>
                        <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="8%">
                            <%=p.getPrice()%>
                        </td>

                        <td style="CURSOR: hand; HEIGHT: 22px" align="center">
                            <%=p.getPnum()%>
                        </td>

                        <!-- 编辑 -->
                        <td align="center" style="HEIGHT: 22px" width="7%">
                            <img src="${pageContext.request.contextPath}/admin/images/edit.png" width="20" height="20"
                                 border="0" style="CURSOR: hand">
                        </td>
                        <!-- 删除 -->
                        <td align="center" style="CURSOR: hand;HEIGHT: 22px" width="7%">
                            <input form="Form2" type="submit" style='color:#FF0000;font-weight:bold' id="delete" name="delete" value="X"/>
                        </td>
                    </tr>
                    <%TempId=p.getId();} %>

                </table>
            </td>
        </tr>
    </table>
</form>
<form id="Form2" name="Form2" action='${pageContext.request.contextPath}/admin/products/delete.jsp?id=<%=TempId%>' method="post">
</form><%--表单不能嵌套，否则会有些数据提交不了利用标签的form属性就可以不用改变表单的结构，就可以提交表单中的某一部分--%>
</body>
</HTML>