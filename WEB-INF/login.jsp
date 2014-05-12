<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {
	font-size: 14px;
}
.STYLE6 {font-size: 12px; color: #FF0000; }
-->
</style>
<script language="javascript">
<!--
	function check_login(form)
	{
		if(form.c_name.value=="")
		{
			alert("请输入您的用户名");
			form.c_name.focus();
			return false;
		}
		if(form.c_pass.value=="")
		{
			alert("请输入您的密码");
			form.c_pass.focus();
			return false;
		}
	}
-->
</script>
<% 
	String c_name=(String) session.getAttribute("c_name");
	if(c_name==null || c_name=="")
	{
 %>
<form action="login" method="post" onSubmit="return check_login(this);">
    <table width="185" height="165" border="0" cellpadding="0" cellspacing="0" bordercolor="#99CCFF" style="border-collapse:collapse">
      <!--DWLayoutTable-->
      <tr>
        <td height="20" colspan="2" align="center" valign="middle" bgcolor="#336699"><span class="STYLE2">用户登录</span></td>
      </tr>
      <tr>
        <td height="14" colspan="2" align="right" valign="middle"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
        <td width="60" height="20" align="right" valign="middle"><span class="STYLE1">用户名&nbsp;</span></td>
        <td width="134" valign="top"><input type="text" name="c_name" size="14" /></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="middle"><span class="STYLE1">密&nbsp;码&nbsp;</span></td>
        <td height="20" valign="top"><input type="password" name="c_pass" size="14" /></td>
      </tr>
      <tr>
        <td height="30" colspan="2" align="center" valign="middle"><input type="submit" name="action" class="STYLE1" value="confirm"/>&nbsp;<a href="register" type="button" class="STYLE1">注册</a></td>
      </tr>
    </table>
</form>
<%	
	}
	else
			{	
				boolean cookieFound=false;
				Cookie myCookie=null;
				Cookie [] cookieset=request.getCookies();
					
				int temp=0;
				if(cookieset !=null)
				{
					for(int i=0;i<cookieset.length;i++)
					{
						if(cookieset[i].getName().equals(c_name))
						{
							cookieFound=true;
							myCookie=cookieset[i];
							
						}
					}
				}
				if(cookieFound)
				{
					temp = Integer.parseInt(myCookie.getValue());					
					temp++;
					if(temp==100)
					{
						out.println("<script language='javascript'>alert('^_^ 尊敬的顾客，您是第100个访问者，感谢您对本站的支持！^_^')</script>");			
					}
					myCookie.setValue(String.valueOf(temp));
					myCookie.setMaxAge(60*60*24*30);
					response.addCookie(myCookie);
					cookieFound=false;
				}
				else
				{
					temp=1;
					myCookie =new Cookie(c_name,String.valueOf(temp));
					myCookie.setMaxAge(60*60*24*30);
					response.addCookie(myCookie);
					
				}
						
		%>

<table width="185" border="0" bordercolor="#336699" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <!--DWLayoutTable-->
      <tr>
        <td height="25" colspan="2" align="center" valign="middle"><marquee scrolldelay="5" scrollamount="2" bgcolor="#FFFFFF" >
      <span class="STYLE1 STYLE6">欢迎登录近邻绿色</span>
        </marquee></td>
        </tr>
      <tr>
        <td width="68" rowspan="4" align="right" valign="middle">亲爱的：<%= c_name %>用户</td>
        <td height="20" align="left" valign="middle">&nbsp;&nbsp;<span class="STYLE1"><a href="my_cart.jsp">我的购物车</a></span></td>
      </tr>
      <tr>
        <td  height="20" align="left" valign="middle">&nbsp;&nbsp;<span class="STYLE1"><a href="my_order.jsp">我的订单</a></span></td>
      </tr>
      <tr>
        <td height="20" align="left">&nbsp;&nbsp;<span class="STYLE1"><a href="cust_update.jsp">修改我的资料</a></span></td>
      </tr>
      <tr>
        <td height="20" rowspan="2" align="left">&nbsp;&nbsp;<span class="STYLE1"><a href="exit">退 出</a></span></td>
      </tr>
      <tr>
        <td height="20" align="center"></td>
        </tr>
      <tr>
        <td height="14" colspan="2" align="left"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
        <td height="20" colspan="2" align="center"><span class="STYLE1">&nbsp;您是第 <font color="#FF0000"><%= temp-1 %></font> 次登录本站</span></td>
		<% System.out.println("heihei");%>
        </tr>
    </table>
	<%
		}
		response.sendRedirect("shopping");
	%>
