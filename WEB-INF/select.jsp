<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
-->
</style>
<script language="javascript">
<!--
	function check_Found(form)
	{
		if(form.select_type.value=="")
		{
			alert("请选择搜索的类型");
			form.select_type.focus();
			return false;
		}
	}
-->	
</script>

<center>
<form action="select_ok.jsp" method="post" onsubmit="return check_Found(this);">
<table width="800" border="1"  bordercolor="#336699" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td width="397" height="45" align="right" bgcolor="#336699">&nbsp;</td>
    <td width="58" align="right" bgcolor="#336699"><span class="STYLE1">商品名</span>：</td>
    <td width="230" bgcolor="#336699"><input type="text" name="select_p_name" value="" size="30" /></td>
    <td width="156" bgcolor="#336699"><input type="submit" name="Submit" value=" 搜索 " /></td>
  </tr>
</table>
</form>
</center>