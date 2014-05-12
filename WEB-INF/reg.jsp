<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.order.ConnDB" %>
<%@ page import="com.order.Convert" %>
<%@ page import="java.sql.*" %>
<%
	String name = (String) request.getParameter("c_name");
	ConnDB conn = new ConnDB();
	Convert convert = new Convert();
%>
<script language="javascript">

function check_name(form)
	{
		if(form.c_name.value=="")
		{
			alert("请填写您的用户名!");
			form.c_name.focus();
			return false;
		}
		if(form.c_name.value.length<6 || form.c_name.value.length>20)
		{
			alert("用户名的长度必须在6-20之间！");
			form.c_name.focus();
			return false;
		}
	}
	function check_info(form)
	{
		if(form.c_pass.value=="")
		{
			alert("请填写您的密码!");
			form.c_pass.focus();
			return false;
		}
		if(form.c_pass2.value=="")
		{
			alert("请确认您的密码");
			form.c_pass2.focus();
			return false;
		}
		if(form.c_pass2.value != form.c_pass.value)
		{
			alert("两次密码不一致，请重新填写");
			form.c_pass2.focus();
			return false;
		}
		if(form.c_phone.value=="")
		{
			alert("请输入您的联系电话");
			form.c_phone.focus();
			return false;
		}
		if(form.c_phone.value.length>15)
		{
			alert("错误的电话号码，请重新填写您的电话！");
			form.c_phone.focus();
			return false;
		}
		if(isNaN(form.c_phone.value) || form.c_phone.value.indexOf('.',0)!=-1)
		{
			alert("请不要输入非法字符");
			form.c_phone.focus();
			return false;
		}	
		if(form.c_realname.value=="")
		{
			alert("请填写你的真实姓名");
			form.c_realname.focus();
			return false;
		}
		if(form.c_postcode.value=="")
		{
			alert("请填写邮政编码");
			form.c_postcode.focus();
			return false;
		}
		if(form.c_email.value.indexOf("@")==-1 ||(form.c_email.value.indexOf(".")==-1))
		{
			alert("错误的Email格式，请填写正确的电子邮箱");
			form.c_email.focus();
			return false;
		}
	}

</script>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px;}
.STYLE2 {font-size:14px;}
.STYLE3 {color: #FF0000; font-size: 12px; }
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
	<form action="regok" method="POST" onsubmit="return check_info(this);">
	<center>
	<table width="800" border="1" bordercolor="#336699" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <!--DWLayoutTable-->
	  
	  <tr>
		<td width="233" height="30" align="right"><span class="STYLE1">用户名</span>：&nbsp;</td>
		<td height="30" align="left">&nbsp;&nbsp;&nbsp;<input type="text" name="c_name"/> 
		<span class="STYLE3">*</span></td>
	  </tr>
	  
      <tr>
		<td width="31%" height="30" align="right"><span class="STYLE1">密码</span>：&nbsp;</td>
    <td width="69%" height="30" align="left">&nbsp;&nbsp;&nbsp;<input type="password" name="c_pass"/>
      <span class="STYLE3">*</span><span class="STYLE1">（任意的数字或者是</span><span class="STYLE3">3-30</span><span class="STYLE1">字符）</span></td>  
      </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">确认密码</span>：&nbsp;</td>
    <td height="30" align="left">&nbsp;&nbsp;&nbsp;<input type="password" name="c_pass2"/> 
      <span class="STYLE3">*</span></td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">真实姓名</span>：&nbsp;</td>
	<td height="30" align="left" >&nbsp;&nbsp;&nbsp;<input type="text" name="c_realname"/>
	<span class="STYLE3">*</span></td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">联系电话</span>：&nbsp;</td>
    <td height="30" align="left">&nbsp;&nbsp;&nbsp;<input type="text" name="c_phone"/> 
      <span class="STYLE3">*</span><span class="STYLE1">（请认真填写，方便日后联系）</span></td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">邮编</span>：&nbsp;</td>
    <td height="30" align="left">&nbsp;&nbsp;&nbsp;<input type="text" name="c_postcode"/> 
      <span class="STYLE3">*</span> </td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">所在地址</span>：&nbsp;</td>
    <td height="30" align="left">&nbsp;&nbsp;&nbsp;<input type="text" name="c_address" size="30"/>
	 <span class="STYLE3">*</span></td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">E_mail</span>：&nbsp;</td>
    <td height="30" align="left">&nbsp;&nbsp;&nbsp;<input type="text" name="c_email" size="30"/> 
      <span class="STYLE1"><span class="STYLE3">*</span>（如</span>：<span class="STYLE1">tangzy111@163.com）</span></td>
  </tr>
  <tr>
    <td height="35" colspan="2" align="center"><input type="submit" name="action" value="submit" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返回" onclick="history.go(-1);"/></td>
  </tr>
</table>
</center>
</form>