<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>������ɫ</title><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
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
</style></head>
<body>
<jsp:include page="title.jsp"/>
<% 
	String c_name=(String)session.getAttribute("c_name");
	if(c_name=="" || c_name==null)
	{
		out.println("<script language='javascript'>alert('���ȵ�¼!');window.location.href='index_.jsp';</script>");
	}
	ConnDB conn=new ConnDB();
	String name = (String) session.getAttribute("c_name");
	String sql="select * from customer where c_name='"+name+"'";
	ResultSet rs=conn.doQuery(sql);
	rs.next();
	
%>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px;}
.STYLE2 {font-size:14px;}
.STYLE3 {color: #FF0000; font-size: 12px; }
-->
</style>
<script>
<!--
	function check_info(form)
	{
		if(form.c_pass2.value != form.c_pass.value)
		{
			alert("�������벻һ�£���������д");
			form.c_pass2.focus();
			return false;
		}
		if(form.c_phone.value=="")
		{
			alert("������������ϵ�绰");
			form.c_phone.focus();
			return false;
		}
		if(form.c_phone.value.length>15)
		{
			alert("����ĵ绰���룬��������д���ĵ绰��");
			form.c_phone.focus();
			return false;
		}
		if(form.c_question.value=="")
		{
			alert("��ѡ������������ʾ");
			form.c_question.focus();
			return false;
		}
		if(form.c_answer.value=="")
		{
			alert("����д��ʾ��");
			form.c_answer.focus();
			return false;
		}
		if(form.c_email.value.indexOf("@")==-1 ||(form.c_email.value.indexOf(".")==-1))
		{
			alert("�����Email��ʽ������д��ȷ�ĵ�������");
			form.c_email.focus();
			return false;
		}
	}
	
-->
</script>
<center> 
<form action="cust_update_ok.jsp?name=<%= name %>" method="post" onSubmit="return check_info(this);">
<table width="800" border="1" bordercolor="#336699" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="30" colspan="2" align="center" ><span class="STYLE2">�û������޸�</span></td>
  </tr>
  <tr>
    <td width="224" height="30" align="right"><span class="STYLE1">�û���</span>��</td>
    <td width="526" align="left" valign="middle"><%= name %>&nbsp;&nbsp;<span class="STYLE3">*</span> <span class="STYLE1">����������ֻ������ַ������ȣ�</span><span class="STYLE3">6-20</span><span class="STYLE1">��</span> </td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">����</span>��&nbsp;</td>
    <td height="30" align="left"><input type="password" name="c_pass" value="<%= rs.getString("c_pass") %>" />
      <span class="STYLE3">*</span> <span class="STYLE1">����������ֻ������ַ���</span>  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">ȷ������</span>��&nbsp;</td>
    <td height="30" align="left"><input type="password" name="c_pass2" value="<%= rs.getString("c_pass") %>"  /> 
      <span class="STYLE3">*</span> </td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">��ʵ����</span>��&nbsp;</td>
    <td height="30" align="left"><input type="text" name="c_realname" value="<%= rs.getString("c_realname") %>"  /> 
      <span class="STYLE3">*</span></td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">��ϵ�绰</span>��&nbsp;</td>
    <td height="30" align="left"><input type="text" name="c_phone" value="<%= rs.getString("c_phone") %>"  /> 
      <span class="STYLE3">*</span> <span class="STYLE1">����������д�������պ���ϵ��</span></td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">�ʱ�</span>��&nbsp;</td>
    <td height="30" align="left"><input type="text" name="c_postcode" value="<%= rs.getString("c_postcode") %>"  /> 
      <span class="STYLE3">*</span> </td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">���ڵ�ַ</span>��&nbsp;</td>
    <td height="30" align="left"><input type="text" name="c_address" size="30" value="<%= rs.getString("c_address") %>" />
	<span class="STYLE3">*</span> </td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">E_mail</span>��&nbsp;</td>
    <td height="30" align="left"><input type="text" name="c_email" size="30" value="<%= rs.getString("c_email") %>"  /> 
      <span class="STYLE3">*</span> <span class="STYLE1">���磺tangzy111@163.com��</span></td>
  </tr>
  <tr>
    <td height="35" colspan="2" align="center"><input type="submit" class="STYLE1" value=" �ύ " />&nbsp;&nbsp;<input type="button" class="STYLE1" value=" ���� " onClick="history.go(-1);" /></td>
  </tr>
</table>
</form>
</center>
<jsp:include page="copyright.jsp"/>
</body>
</html>
