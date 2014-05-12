<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {
	font-size: 14px;
}
.STYLE5 {color: #FFFFFF}
.STYLE6 {font-size: 12px; color: #FF0000; }
-->
</style>
<script language="javascript">
<!-- 

	function login()
	{
		window.location.href='c_registry.jsp';
	}

 -->
</script>

<% 
	String c_name=(String) session.getAttribute("c_name");
	String c_header=(String) session.getAttribute("c_header");
	String t_type=(String) request.getParameter("t_type");
	session.setAttribute("t_type",t_type);
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>近邻绿色</title>
</head>

<body>
<center>
<table width="800"  border="1" cellpadding="0" cellspacing="0" bordercolor="#336699" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td width="186" valign="top"><table width="183" border="0" bordercolor="#336699" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <!--DWLayoutTable-->
	  <tr>
        <td width="183" height="7" align="left" valign="baseline"><jsp:include page="login.jsp" flush="true"/></td>
      </tr>
      <tr>
        <td height="7" align="center" valign="baseline"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
	  <tr>
	   <td><jsp:include page="notice.jsp" flush="true"/></td>
	  </tr>
	  <tr>
        <td height="7" align="center" valign="baseline"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
        <td><jsp:include page="link.jsp" flush="true"/></td>
      </tr>
    </table>
	  </td>
	
    <td width="757" rowspan="5" align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <!--DWLayoutTable-->
      <tr>
        <td width="200" height="30" align="center" bgcolor="#336699"><span class="STYLE2">&nbsp;新品上架</span></td>
        <td width="359" align="right"><span class="STYLE6"><a href="index_top_more.jsp">更多&gt;&gt;&gt;</a></span>&nbsp;</td>
      </tr>
      <tr>
        <center>
<table width="200" border="0" bordercolor="#336699" style="border-collapse:collapse">
<%
	Connection conn=null;
	Statement st=null;
	ResultSet rs=null;
	String p_id="",p_name="",p_price="",p_image="",p_description="";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost/test?" + "user=root" + "&password="+"&useUnicode=true&characterEncoding=utf-8");
		st=conn.createStatement();
		String sql="select p_id,p_name,p_price,p_image,p_description from product order by p_time desc ";
		rs=st.executeQuery(sql);
	}
	catch(Exception e)
	{}
int i=1;
int j=0;
for(;i<=2;i++)
{
	j=j+1;
%>
  <tr>
  <% 
		for(;j<=21;j++)
		{  
			if(rs.next())
			{
				p_id=rs.getString("p_id");
				p_name=rs.getString("p_name");
				p_price=rs.getString("p_price");
				p_image=rs.getString("p_image");
				p_description=rs.getString("p_description");
   %>
    <td width="110" height="135" align="center" valign="middle"><img src="<%= p_image %>" width="90" /></td>
    <td width="100" align="center"><span class="STYLE5">============</span><p class="STYLE1"><%= p_name %></p><p><font size="2" color="red">￥<%= p_price %></font></p>
    <p><a href="?p_id=<%= p_id %>" onClick="window.open('?p_id=<%= p_id %>','help','scrollbars=yes,resizable=yes,width=600,height=520')"><input name="details" type="button" class="STYLE1" value="详情"></a><%if (c_name!=null && c_name!=""){%><input name="see" type="button" class="STYLE1" onClick="window.location.href='cartAdd?p_id=<%=p_id%>'" value="购买">
	<%}%>
	</p></td>
    <% 		}
 		
			if(j==3*i)
			{
				break;
			}
    	}
     %>
  </tr>
  <%
}
  %>
</table>
    </center>
      </tr>
    </table>
    </td>
  </tr>
</table>
</center>
</body>
</html>
