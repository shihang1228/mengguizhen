<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="shopBeans.CartBean"%>
<%@ page import="shopBeans.ConnDB"%>
<%

	String c_name=(String)session.getAttribute("c_name");
	String c_header=(String)session.getAttribute("c_header");

	if(c_name=="" || c_name==null)
	{
		out.println("<script language='javascript'>alert('���ȵ�¼!');window.location.href='index_.jsp';</script>");
	}
	else
	{
		ConnDB conn=new ConnDB();
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
<title>������ɫ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2{
	font-size: 14px;
}
.STYLE9 {color: #FF0000}
.STYLE10 {color: #00FF00}
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
<script language="javascript">
<!--
	function check_pay(form)
	{
		if(form.pay_fangshi.value=="")
		{
			alert("��ѡ�����ĸ��ʽ");
			form.pay_fangshi.focus();
			return false;
		}
		if(form.pay_address.value=="")
		{
			alert("���������ĵ�ַ");
			form.pay_address.focus();
			return false;
		}
		if(form.pay_email.value=="")
		{
			alert("����������Eamil");
			form.pay_email.focus();
			return false;
		}
		if(form.pay_email.value.indexOf("@")==-1 ||(form.pay_email.value.indexOf(".")==-1))
		{
			alert("�����Email��ʽ������д��ȷ�ĵ�������");
			form.pay_email.focus();
			return false;
		}
	}
-->
</script>

</head>
<body>
<jsp:include page="title.jsp" flush="true"/>

<center>
<table width="800"  border="1" bordercolor="#336699" cellspacing="0" cellpadding="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
        <tr>
          <td width="183" align="center" valign="top"><jsp:include page="login1.jsp" flush="true"/></td>
          <td width="602" valign="top"><table width="100%"  border="0" bordercolor="#336699" style="border-collapse:collapse" cellspacing="0" cellpadding="0">
            <!--DWLayoutTable-->
                      <tr>
                        <td height="14" colspan="5" align="center">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="2%" height="37" align="center">&nbsp;</td>
                        <td width="18%" height="34" align="center" bgcolor="#336699" class="STYLE2"><img src="../../ncp/image/list.jpg" /></td>
                        <td width="25%" align="left" bgcolor="#336699" class="STYLE2">��Ʒ�嵥</td>
                        <td width="53%" align="center" bgcolor="#336699">&nbsp;</td>
                        <td width="2%">&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan="5">&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan="5">
<table width="96%" height="83" border="1" bordercolor="#336699" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <tr align="center" valign="middle">
        <td height="27" class="STYLE1">���</td>
        <td height="27" class="STYLE1">��Ʒ���</td>
        <td class="STYLE1">��Ʒ����</td>
        <td height="27" class="STYLE1">����</td>
        <td height="27" class="STYLE1">����</td>
        <td width="85" height="27" class="STYLE1">���</td>
        </tr> 
	<%
		float sum=0;
		String p_id="";
		String goodsname="";
		for(int i=0;i<cart.size();i++){
			CartBean goodsitem=(CartBean)cart.elementAt(i);
			sum=sum+goodsitem.p_number*goodsitem.p_price;
			p_id=goodsitem.p_id;
			ResultSet rs_goods=conn.doQuery("select * from Product where p_id='"+p_id+"'");
			if (rs_goods.next())
			{
				goodsname=rs_goods.getString("p_name");
				
			}
	%> 
      <tr align="center" valign="middle"> 
        <td width="33" height="27"><font size="2"><%=i+1%></font></td>
        <td width="114" height="27"><font size="2"><%=p_id%></font></td> 
        <td width="207" height="27"><font size="2"><%=goodsname%></font></td>
        <td width="68" height="27"><font size="2">��<%=goodsitem.p_price%></font></td> 
        <td width="48" height="27" class="STYLE1"><%=goodsitem.p_number%></td> 
        <td height="27"><font size="2">��<%=(goodsitem.p_price*goodsitem.p_number)%></font></td> 
	<%
		}
		session.setAttribute("sum",String.valueOf(sum));
	%>
	 </tr>
      <tr align="center" valign="middle">
        <td height="27" colspan="6">&nbsp;</td>
        </tr>
      </table></td>
                      </tr>
                      <tr>
                        <td colspan="5"><table width="100%" height="58" border="0" bordercolor="#336699" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <tr align="center" valign="middle">
        <td height="23">&nbsp;</td>
        <td>&nbsp;</td>
        <td height="23" colspan="-3" align="left">&nbsp;</td>
      </tr>
      <tr align="center" valign="middle">
		<td width="48%" height="10"><a href="index_.jsp"><font size="2">���ؼ�������</font></a></td>
        <td width="26%">&nbsp;</td>
        <td width="26%" height="10" colspan="-3" align="left"><span class="STYLE1">�ϼ��ܽ��</span><font size="2"><font size="2">��</font></font><span class="STYLE9">��<%=sum%></span></td>
		</tr>
      <tr align="center" valign="middle">
        <td height="10">&nbsp;</td>
        <td>&nbsp;</td>
        <td height="10" colspan="-3" align="left">&nbsp;</td>
      </tr>
      <tr align="center" valign="middle">        </tr>
</table></td>
                      </tr>
                      <tr>
                        <td height="57" colspan="5" align="center" valign="top">
						<form action="payment.jsp" method="post" onSubmit="return check_pay(this);">
						<table width="96%" border="1" bordercolor="#336699" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
                          <!--DWLayoutTable-->
                          <tr>
                            <td width="1%" height="30" bgcolor="#336699"><!--DWLayoutEmptyCell-->&nbsp;</td>
                            <td width="16%" align="center" bgcolor="#336699"><img src="../../ncp/image/payment.jpg" /></td>
                            <td width="12%" align="center" bgcolor="#336699" class="STYLE2">���ʽ</td>
                            <td width="42%" bgcolor="#336699"><!--DWLayoutEmptyCell-->&nbsp;</td>
                            <td width="29%" bgcolor="#336699"><!--DWLayoutEmptyCell-->&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="20" colspan="5"><!--DWLayoutEmptyCell-->&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="30" colspan="3" align="right"><span class="STYLE1 STYLE9">��ѡ�����ĸ��ʽ</span><span class="STYLE9">��</span>&nbsp;</td>
							<%
								String pay_sql="select pay_payment from payment";
								ResultSet payrs=conn.doQuery(pay_sql);
							%>
                            <td height="30" colspan="2"><select name="pay_fangshi">
							<option value="">-��ѡ�񸶿ʽ-</option>
							<%
								while(payrs.next())
								{
						  %>
							<option value="<%= payrs.getString("pay_payment") %>"><%= payrs.getString("pay_payment") %></option>
						<%
								}
						%>
                            </select> </td>
                          </tr>
                          <tr>
                            <td height="30" colspan="3" align="right"><span class=" STYLE1 STYLE9">���������ĵ�ַ</span><span class="STYLE9">��</span>&nbsp;</td>
                            <td height="30" colspan="2"><input type="text" name="pay_address" size="40"/></td>
                          </tr>
                          <tr>
                            <td height="30" colspan="3" align="right"><span class="STYLE1 STYLE9">����������E_mail</span><span class="STYLE9">��</span>&nbsp;</td>
                            <td height="30" colspan="2"><input type="text" name="pay_email" size="26"/></td>
                          </tr>
                          <tr>
                            <td height="30" colspan="5"><!--DWLayoutEmptyCell-->&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="30" colspan="5" align="center"><input type="submit" class="STYLE1" value="ȷ������"/>&nbsp;&nbsp;
                            <input name="button" type="button" class="STYLE1" value="ȡ������" onClick="history.go(-1);"/></td>
                          </tr>
                        </table>
						</form>                        </td>
                      </tr>
                      <tr>
                        <td height="30" colspan="5" align="center" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
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