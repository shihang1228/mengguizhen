function check_name(form)
	{
		if(form.c_name.value=="")
		{
			alert("����д�����û���!");
			form.c_name.focus();
			return false;
		}
		if(form.c_name.value.length<6 || form.c_name.value.length>20)
		{
			alert("�û����ĳ��ȱ�����6-20֮�䣡");
			form.c_name.focus();
			return false;
		}
	}
	function check_info(form)
	{
		if(form.c_pass.value=="")
		{
			alert("����д��������!");
			form.c_pass.focus();
			return false;
		}
		if(form.c_pass2.value=="")
		{
			alert("��ȷ����������");
			form.c_pass2.focus();
			return false;
		}
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
		if(isNaN(form.c_phone.value) || form.c_phone.value.indexOf('.',0)!=-1)
		{
			alert("�벻Ҫ����Ƿ��ַ�");
			form.c_phone.focus();
			return false;
		}	
		if(form.c_realname.value=="")
		{
			alert("����д�����ʵ����");
			form.c_realname.focus();
			return false;
		}
		if(form.c_postcode.value=="")
		{
			alert("����д��������");
			form.c_postcode.focus();
			return false;
		}
		if(form.c_email.value.indexOf("@")==-1 ||(form.c_email.value.indexOf(".")==-1))
		{
			alert("�����Email��ʽ������д��ȷ�ĵ�������");
			form.c_email.focus();
			return false;
		}
	}