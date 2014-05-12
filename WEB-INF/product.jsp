<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="com.order.ConnDB" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>近邻绿色</title>
<% 
	String p_id=(String) request.getParameter("p_id");
	String p_name="",p_quantity="",p_image="",p_description="";
	float p_price=0;
	ConnDB conn=new ConnDB();
	String sql="select * from product where p_id='"+p_id+"'";
	ResultSet rs = conn.doQuery(sql);
	while(rs.next())
	{
		p_name=rs.getString("p_name");
		p_price=rs.getFloat("p_price");
		p_quantity=rs.getString("p_quantity");
		p_image=rs.getString("p_image");
		p_description=rs.getString("p_description");
	}
	

 %>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
.STYLE2 {
	font-size: 14px;}
.STYLE3 {color: #FF0000}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}

-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>

<body>
<center>
<table width="620" border="1" bordercolor="#336699" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="40" colspan="3" align="center" bgcolor="#336699"><span class="STYLE2">商品详情</span></td>
    </tr>
  <tr>
    <td width="127" rowspan="5" align="center"><img src="<%= p_image %>" width="110"/></td>
    <td width="127" align="center"><span class="STYLE1">商品ID</span>：</td>
    <td width="238" height="35" class="STYLE2">&nbsp;<%= p_id %></td>
    </tr>
  <tr>
    <td width="127" align="center"><span class="STYLE1">商品名称</span>：</td>
    <td height="35" class="STYLE2">&nbsp;<%= p_name %></td>
    </tr>
  <tr>
    <td width="127" height="34" align="center"><span class="STYLE1">商品原价</span>：</td>
     <td align="left" style="text-decoration:line-through;color:#FF0000">
	<font size="2">&nbsp;￥ <%=p_price+p_price*0.3 %>&nbsp;</font> </td>
    </tr>
  <tr>
    <td width="127" align="center"><span class="STYLE1">商品现价</span>：</td>
    <td height="35" class="STYLE2">&nbsp;<font size="2" color="red">￥ <%= p_price %></font></td>
    </tr>
  <tr>
  <td height="30" align="center" class="STYLE2 STYLE3"><a href="#" onClick="window.open('view_picture.jsp?p_id=<%= p_id %>','help','scrollbars=yes,resizable=yes,width=600,height=400')">游览大图</a></td>
    <td height="30" colspan="2"></td>
     </tr>
  <tr>
    <td width="127" align="center"><span class="STYLE1">商品描述</span>：</td>
    <td height="30" colspan="2"><textarea name="p_description" cols="45" rows="12"><%= p_description %></textarea></td>
  </tr>
  <tr class="STYLE2">
    <td height="40" colspan="3" align="center"><a href="javascript:self.close()" class="styleac">[关闭窗口]</a></td>
  </tr>
</table>
</center>
</body>
</html>