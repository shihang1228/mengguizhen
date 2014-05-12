<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>近邻绿色</title><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
		out.println("<script language='javascript'>alert('请先登录!');window.location.href='index_.jsp';</script>");
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
		if(form.c_question.value=="")
		{
			alert("请选择您的问题提示");
			form.c_question.focus();
			return false;
		}
		if(form.c_answer.value=="")
		{
			alert("请填写提示答案");
			form.c_answer.focus();
			return false;
		}
		if(form.c_email.value.indexOf("@")==-1 ||(form.c_email.value.indexOf(".")==-1))
		{
			alert("错误的Email格式，请填写正确的电子邮箱");
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
    <td height="30" colspan="2" align="center" ><span class="STYLE2">用户资料修改</span></td>
  </tr>
  <tr>
    <td width="224" height="30" align="right"><span class="STYLE1">用户名</span>：</td>
    <td width="526" align="left" valign="middle"><%= name %>&nbsp;&nbsp;<span class="STYLE3">*</span> <span class="STYLE1">（任意的数字或者是字符，长度（</span><span class="STYLE3">6-20</span><span class="STYLE1">）</span> </td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">密码</span>：&nbsp;</td>
    <td height="30" align="left"><input type="password" name="c_pass" value="<%= rs.getString("c_pass") %>" />
      <span class="STYLE3">*</span> <span class="STYLE1">（任意的数字或者是字符）</span>  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">确认密码</span>：&nbsp;</td>
    <td height="30" align="left"><input type="password" name="c_pass2" value="<%= rs.getString("c_pass") %>"  /> 
      <span class="STYLE3">*</span> </td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">真实姓名</span>：&nbsp;</td>
    <td height="30" align="left"><input type="text" name="c_realname" value="<%= rs.getString("c_realname") %>"  /> 
      <span class="STYLE3">*</span></td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">联系电话</span>：&nbsp;</td>
    <td height="30" align="left"><input type="text" name="c_phone" value="<%= rs.getString("c_phone") %>"  /> 
      <span class="STYLE3">*</span> <span class="STYLE1">（请认真填写，方便日后联系）</span></td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">邮编</span>：&nbsp;</td>
    <td height="30" align="left"><input type="text" name="c_postcode" value="<%= rs.getString("c_postcode") %>"  /> 
      <span class="STYLE3">*</span> </td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">所在地址</span>：&nbsp;</td>
    <td height="30" align="left"><input type="text" name="c_address" size="30" value="<%= rs.getString("c_address") %>" />
	<span class="STYLE3">*</span> </td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">E_mail</span>：&nbsp;</td>
    <td height="30" align="left"><input type="text" name="c_email" size="30" value="<%= rs.getString("c_email") %>"  /> 
      <span class="STYLE3">*</span> <span class="STYLE1">（如：tangzy111@163.com）</span></td>
  </tr>
  <tr>
    <td height="35" colspan="2" align="center"><input type="submit" class="STYLE1" value=" 提交 " />&nbsp;&nbsp;<input type="button" class="STYLE1" value=" 返回 " onClick="history.go(-1);" /></td>
  </tr>
</table>
</form>
</center>
<jsp:include page="copyright.jsp"/>
</body>
</html>
