

<%

dim p_num

p_num = request ("p_num")

%>

<html>
<head>
<script language="javascript">
<!--
function sendform()
{
	form = document.myform;
	var str = confirm("ȸ������ ��ǥ�� ����� ��� ������ϴ�\n\n��� �Ͻðڽ��ϱ�?");
	if (str)
	{
		form.submit();
	}
	else
	{
		return;
	}
}
-->
</script>
<link rel="stylesheet" type="text/css" href="./include/coom.css">
</head>
<body onload="document.myform.p_pass.focus();">
<form action = "./DelPollOk.asp" method="post" name="myform">
<input type="hidden" name="p_num" value="<%=p_num%>">

<table width="100%" height="100%">
<tr>
	<td align="center" valign="center">
		��й�ȣ�� �Է��� �ּ���<br><br>
		<table width=300 border="0" cellspacing="0" bordercolordark="white" bordercolorlight="black" bgcolor="#F0F0F0">
		<tr>
			<td align="center" valign="center">��й�ȣ <input type="password" name="p_pass"><input type="button" value="������" onclick="sendform();"></td>
		</tr>
		</table>
	</td>
</tr>
</table>

</form>
</body>
</html>