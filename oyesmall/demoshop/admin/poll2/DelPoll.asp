

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
	var str = confirm("회원들이 투표한 기록이 모두 사라집니다\n\n계속 하시겠습니까?");
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
		비밀번호를 입력해 주세요<br><br>
		<table width=300 border="0" cellspacing="0" bordercolordark="white" bordercolorlight="black" bgcolor="#F0F0F0">
		<tr>
			<td align="center" valign="center">비밀번호 <input type="password" name="p_pass"><input type="button" value="보내기" onclick="sendform();"></td>
		</tr>
		</table>
	</td>
</tr>
</table>

</form>
</body>
</html>