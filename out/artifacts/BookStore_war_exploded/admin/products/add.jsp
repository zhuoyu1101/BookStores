<%@ page language="java" pageEncoding="UTF-8"%>
<HTML>
<head>
	<meta http-equiv="Content-Language" content="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form id="userAction_save_do" name="Form1"
		action="../products/add-handle.jsp" method="post">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>添加商品</STRONG> </strong>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">商品名称：</td>
				<td bgColor="#ffffff"><input type="text" name="name"/></td>
				<td align="center" bgColor="#f5fafe">商品价格：</td>
				<td bgColor="#ffffff">
					<input type="text" name="price" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">商品数量：</td>
				<td bgColor="#ffffff">
					<input type="text" name="pnum" />
				</td>
				<td align="center" bgColor="#f5fafe">商品类别：</td>
				<td bgColor="#ffffff">
					<select name="category" id="category">
						<option value="" selected="selected">--选择商品类加--</option>
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
				</select>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" >商品图片：</td>
				<td bgColor="#ffffff" colspan="3">
				<input type="file" name="imgurl" accept=".jpg (*.jpg),.gif (*.gif)"  size="30" value="" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe">商品描述：</td>
				<td bgColor="#ffffff" colSpan="3">
					<textarea name="description" cols="30" rows="3" style="WIDTH: 96%"></textarea>
				</td>
			</tr>
			<tr>
				<td style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<input type="submit" value="确定">	
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input type="reset" value="重置" >					
					<FONT face="宋体">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</FONT> 
					<INPUT type="button" onclick="history.go(-1)" value="返回" />					
				</td>
			</tr>
		</table>
	</form>
	
</body>
</HTML>