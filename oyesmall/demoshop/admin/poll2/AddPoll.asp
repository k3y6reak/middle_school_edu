

<html>
<head>
<link rel="stylesheet" type="text/css" href="./include/coom.css">
<script language="javascript">
<!--
function sendform()
{	
	form = document.myform;
	if (!check_space(form.p_name.value))
	{
		alert("�ۼ����� �̸��� �������ϴ�");
		form.p_name.value = ""
		form.p_name.focus();
		return;
	}



	if (!check_space(form.p_title.value))
	{
		alert("���� ������ ��������");
		form.p_title.value = ""
		form.p_title.focus();
		return;
	}

	var str = confirm(form.p_qcount.value + " �� �׸����� �� �������� �����ϼ̽��ϴ�\n\n��� �Ͻðڽ��ϱ�?");
	if (str)
	{
		form.submit();
	}
	else
	{
		alert("��� �Ǿ����ϴ�");
		return;
	}
}

function check_space(str)
//���鹮�� üũ
{	
	if (str.search(/\S/)<0)
	{
		return false;
	}
	var temp=str.replace(' ','');
	if (temp.length == 0)
	{
		return false;
	}
	return true;
}
-->
</script>
</head>
<body>
<center><br><br>
<form action="AddPollNext.asp" method="post" name="myform">

<table width=600 border="0" cellspacing="0" bordercolordark="white" bordercolorlight="black" bgcolor="#F0F0F0">
<tr>
	<th align="right" width=100>�ۼ���&nbsp;</th>
	<td><input type="text" name="p_name" value="<%=p_name%>" style="border-style:groove;"></td>
</tr>

<tr>
	<th align="right">��������&nbsp;</th>
	<td><textarea name="p_title" cols=80 rows=3 style="border-style:groove;"><%=p_title%></textarea></td>
</tr>
<tr>
	<th align="right">���� ���׼�&nbsp;</th>
	<td>
		<select name="p_qcount">
			<option value="2">2 ����</option>
			<option value="3">3 ����</option>
			<option value="4">4 ����</option>
			<option value="5">5 ����</option>
			<option value="6">6 ����</option>
			<option value="7">7 ����</option>
			<option value="8">8 ����</option>
			<option value="9">9 ����</option>
		</select>	
	</td>
</tr>
<tr>
</table>
<br>
<input type="button" value="  ���� �ܰ��  " onclick="sendform();">&nbsp;<input type="button" value="  ���ư���  " onclick="javascript:history.back();">

</form>
</body>
</html>