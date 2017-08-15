

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
		alert("작성자의 이름이 빠졌습니다");
		form.p_name.value = ""
		form.p_name.focus();
		return;
	}



	if (!check_space(form.p_title.value))
	{
		alert("설문 제목을 적으세요");
		form.p_title.value = ""
		form.p_title.focus();
		return;
	}

	var str = confirm(form.p_qcount.value + " 개 항목으로 된 설문지를 선택하셨습니다\n\n계속 하시겠습니까?");
	if (str)
	{
		form.submit();
	}
	else
	{
		alert("취소 되었습니다");
		return;
	}
}

function check_space(str)
//공백문자 체크
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
	<th align="right" width=100>작성자&nbsp;</th>
	<td><input type="text" name="p_name" value="<%=p_name%>" style="border-style:groove;"></td>
</tr>

<tr>
	<th align="right">설문제목&nbsp;</th>
	<td><textarea name="p_title" cols=80 rows=3 style="border-style:groove;"><%=p_title%></textarea></td>
</tr>
<tr>
	<th align="right">설문 문항수&nbsp;</th>
	<td>
		<select name="p_qcount">
			<option value="2">2 문항</option>
			<option value="3">3 문항</option>
			<option value="4">4 문항</option>
			<option value="5">5 문항</option>
			<option value="6">6 문항</option>
			<option value="7">7 문항</option>
			<option value="8">8 문항</option>
			<option value="9">9 문항</option>
		</select>	
	</td>
</tr>
<tr>
</table>
<br>
<input type="button" value="  다음 단계로  " onclick="sendform();">&nbsp;<input type="button" value="  돌아가기  " onclick="javascript:history.back();">

</form>
</body>
</html>