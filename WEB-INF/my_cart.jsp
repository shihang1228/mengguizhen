<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="shopBeans.CartBean"%>
<%@ page import="shopBeans.ConnDB"%>
<%

	String c_name=(String)session.getAttribute("c_name");
	String c_header=(String)session.getAttribute("c_header");
	double m=Math.random();
	String order_number=String.valueOf(m).substring(2,12);
	session.setAttribute("order_number",order_number);
	if(c_name=="" || c_name==null)
	{
		out.println("<script language='javascript'>alert('请先登录!');window.location.href='index_.jsp';</script>");
	}
	else
	{
		ConnDB conn=new ConnDB();
		CartBean cb=new CartBean();
		Vector cart=(Vector)session.getAttribute("cart");
		if(cart==null || cart.size()==0)
		{
			response.sendRedirect("cart_null.jsp");
		}
		else
		{
	%>
<html>
<head>
<title>近邻绿色</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2{
	font-size: 14px;
}
.STYLE9 {color: #FF0000}
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

</head>
<body>
<jsp:include page="title.jsp" flush="true"/>

<center>
<table width="800"  border="1" bordercolor="#336699" cellspacing="0" cellpadding="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
        <tr>
          <td width="183" align="center" valign="top"><jsp:include page="login1.jsp" flush="true"/></td>
          <td width="602" valign="top"><table width="100%"  border="0" bordercolor="#336699" style="border-collapse:collapse" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="14" colspan="6" align="center">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="2%" height="37" align="center">&nbsp;</td>
                        <td width="18%" height="34" align="center" bgcolor="#336699" class="STYLE2"><img src="../../ncp/image/cart.jpg" /></td>
                        <td width="25%" align="left" bgcolor="#336699" class="STYLE2">我的购物车</td>
                        <td width="53%" align="center" bgcolor="#336699">&nbsp;</td>
                        <td width="2%">&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan="6">&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan="6">
<form action="my_cart.jsp" method="post">
<table width="96%" height="83" border="1" bordercolor="#336699" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <tr align="center" valign="middle">
        <td height="27" class="STYLE1">编号</td>
        <td height="27" class="STYLE1">商品编号</td>
        <td class="STYLE1">商品名称</td>
        <td height="27" class="STYLE1">单价</td>
        <td height="27" class="STYLE1">数量</td>
        <td height="27" class="STYLE1">金额</td>
        <td class="tableBorder_B1">&nbsp;</td>
      </tr> 
	<%
		float sum=0;
		String p_id="";
		int quantity=0;
		String goodsname="";
		for(int i=0;i<cart.size();i++){	
			
			String sum1=request.getParameter("num"+i);//得到修改的数量
			
			CartBean goodsitem=(CartBean)cb.updateCart(cart,i,sum1);
			sum=sum+goodsitem.p_number*goodsitem.p_price;
			p_id=goodsitem.p_id;
			ResultSet rs_goods=conn.doQuery("select * from Product where p_id='"+p_id+"'");
			if (rs_goods.next())
			{
				goodsname=rs_goods.getString("p_name");
				
			}
	%> 
      <tr align="center" valign="middle"> 
        <td width="32" height="27"><font size="2"><%=i+1%></font></td>
        <td width="108" height="27"><font size="2"><%=p_id%></font></td> 
        <td width="201" height="27"><font size="2"><%=goodsname%></font></td>
        <td width="66" height="27"><font size="2">￥<%=goodsitem.p_price%></font></td> 
        <td width="40" height="27"><input name="num<%=i%>" size="3" type="text" class="txt_grey" value="<%=goodsitem.p_number%>" onBlur="check(this.form)"/></td> 
        <td width="65" height="27"><font size="2">￥<%=(goodsitem.p_price*goodsitem.p_number)%></font></td> 
        <td width="41"><a href="cart_move.jsp?ID=<%=i%>" class="STYLE1">删除</a></td>
        <script language="javascript">
			<!--
			function check(myform){
				if(isNaN(myform.num<%=i%>.value) || myform.num<%=i%>.value.indexOf('.',0)!=-1){
					alert("请不要输入非法字符");myform.num<%=i%>.focus();return;}
				if(myform.num<%=i%>.value==""){
					alert("请输入修改的数量");myform.num<%=i%>.focus();return;}	
				myform.submit();
			}
			-->
		</script>
	<%
		}

	%> </tr>
      <tr align="center" valign="middle">
        <td height="27" colspan="7">&nbsp;</td>
        </tr>
      </table>
<table width="100%" height="83" border="0" bordercolor="#336699" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <tr align="center" valign="middle">
        <td height="10">&nbsp;</td>
        <td height="10" colspan="-3" align="left">&nbsp;</td>
      </tr>
      <tr align="center" valign="middle">
		<td width="74%" height="10"><font size="2">&nbsp;		</font>		</td>
        <td width="26%" height="10" colspan="-3" align="left"><span class="STYLE1">合计总金额</span><font size="2"><font size="2">：</font></font><span class="STYLE9">￥<%=sum%></span></td>
		</tr>
      <tr align="center" valign="middle">
        <td height="21" class="tableBorder_B1">　</td>
        <td height="21" colspan="-3" align="left" class="tableBorder_B1"></td>
      </tr>
      <tr align="center" valign="middle">
        <td height="21" class="tableBorder_B1">&nbsp;</td>
        <td height="21" colspan="-3" align="left" class="tableBorder_B1"></td>
      </tr>
      <tr align="center" valign="middle">
        <td height="21" colspan="2"><input type="button" class="STYLE1" value="继续购物" onClick="window.location.href='index_.jsp'"/><font size="2"> &nbsp; <input type="button" class="STYLE1" value="去收银台结帐" onClick="window.location.href='cart_checkout.jsp'"/> &nbsp; <input type="button" class="STYLE1" value="清空购物车" onClick="window.location.href='cart_clear.jsp'"/></font></td>
        </tr>
</table></form>						</td>
                      </tr>
                      <tr>
                        <td colspan="6">&nbsp;</td>
                      </tr>
          </table>          </td>
        </tr>
      </table>
</td>
  </tr>
</table>
</td>
</tr>
</table>
</center>
<br>
<jsp:include page="copyright.jsp" flush="true"/>
</body>
</html>
<%conn.closeConnection();}
}%>