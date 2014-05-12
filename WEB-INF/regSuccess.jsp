<%@ page contentType="text/html; charset=gb2312" language="java"%>
<html>

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

	<body>
		<center>
<table width="800" border="0" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="14" colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td width="291" height="181" align="right"><img src="image/logo/ok.gif" width="100" height="90" /></td>
    <td width="266" align="center"><p><span class="STYLE11">恭喜! <%= name %> 注册成功.</span></p>
      <p><span class="STYLE1"><a href="index.jsp">点击返回登陆</a></span></p></td>
    <td width="217" align="center"><!--DWLayoutEmptyCell-->&nbsp;</td>
  </tr>
  <tr>
    <td height="14" colspan="3">&nbsp;</td>
  </tr>
</table>
</center>

<jsp:include page="copyright.jsp" flush="true"/>
</body>
<html>