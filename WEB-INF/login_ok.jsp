<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="com.order.ConnDB" %>
<%@ page import="java.sql.*" %>

<% 
	String c_name=(String)request.getParameter("c_name");
	String c_pass=(String)request.getParameter("c_pass");
	String cname=(String) session.getAttribute("c_name");
	String name="",pass="";
	ConnDB conn=new ConnDB();
	if (c_name!=null || c_name!="")
	{
		try
		{
			String strSql="select c_name,c_pass from customer where c_name='"+c_name+"' and c_pass='"+c_pass+"'";
			ResultSet rsLogin=conn.doQuery(strSql);
			System.out.println(strSql);
			while(rsLogin.next())
			{
				name=rsLogin.getString("c_name");
				pass=rsLogin.getString("c_pass");
			}
		}
		catch(Exception e)
		{}
    	if(name.equals(c_name) && pass.equals(c_pass))
    	{
    		session.setAttribute("c_name",c_name);
			%>
				<jsp:forward page="login.jsp"/>
			<% 
    	}    
	else
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='2; URL=shopping' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		%>
		<style type="text/css">
		<!--
		.STYLE10 {
			font-size: 14px;
			color: #FF0000;
		}
.STYLE3 {color: #FF0000; font-size: 12px; }
		-->
		</style>
		<br /><br /><br /><br /><br /><br /><br /><br />
 <center>
	  <table width="300" border="1" bordercolor="#99CCFF" style="border-collapse:collapse" cellpadding="0" cellspacing="0">
	  <!--DWLayoutTable-->
	  <tr bgcolor="#99CCFF">
		<td height="13">&nbsp;</td>
	    </tr>
	  <tr>
		<td height="60" align="center"><span class="STYLE10">用户名或者密码错误，请验证后再输<span class="STYLE3">！</span></span></td>
	    </tr>
   </table>
</center>
		<%
	}	
}
 %>