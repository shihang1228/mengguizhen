<%@page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.order.ConnDB" %>
<%@ page import="com.order.Convert" %>
<%@ page import="java.sql.*" %>

<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
.STYLE2 {
	font-size: 14px;
}
.STYLE11 {font-size: 18px; color: #FF0000; }
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
<jsp:include page="title.jsp" flush="true"/>
<% 
	String name=(String) session.getAttribute("name");
	String cname=(String) request.getParameter("c_name");
	String pass=(String) request.getParameter("c_pass");
	String phone=(String) request.getParameter("c_phone");
	String realname=(String) request.getParameter("c_realname");
	String postcode=(String) request.getParameter("c_postcode");
	String address=(String) request.getParameter("c_address");
	String email=(String) request.getParameter("c_email");
	
	ConnDB conn=new ConnDB();
	Convert convert = new Convert();
	
	name=convert.method(cname);
	pass=convert.method(pass);
	phone=convert.method(phone);
	realname=convert.method(realname);
	postcode=convert.method(postcode);
	address=convert.method(address);
	email=convert.method(email);
	
	if(name!=null || realname!=null || email!=null)
	{
		String sql="INSERT INTO customer VALUES('"+name+"','"+pass+"','"+phone+"','"+realname+"','"+postcode+"','"+address+"','"+email+"')";
		int temp=conn.doUpdate(sql);
		System.out.println(sql);
		if(temp==0)
		{
	%>
<br />

<center>
<table width="800" border="0" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="14" colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td width="295" height="181" align="right"><img src="image/false.jpg" width="96" height="96" /></td>
    <td width="267" align="center"><span class="STYLE11">注册失败.</span>
      <p><span class="STYLE1"><a href="register">点击返回注册</a></span></p></td>
    <td width="220" align="center"><!--DWLayoutEmptyCell-->&nbsp;</td>
  </tr>
  <tr>
    <td height="14" colspan="3">&nbsp;</td>
  </tr>
</table>
</center>	
	<%
		}
		else
		{
	%>
<br />
<center>
<table width="800" border="0" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="14" colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td width="291" height="181" align="right"><img src="image/ok.gif" width="100" height="90" /></td>
    <td width="266" align="center"><p><span class="STYLE11">恭喜! <%= name %> 注册成功.</span></p>
      <p><span class="STYLE1"><a href="shopping">点击返回登陆</a></span></p></td>
    <td width="217" align="center"><!--DWLayoutEmptyCell-->&nbsp;</td>
  </tr>
  <tr>
    <td height="14" colspan="3">&nbsp;</td>
  </tr>
</table>
</center>
	<% 
		}
		
	}
%>
<br />
<jsp:include page="copyright.jsp" flush="true"/>