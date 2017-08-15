


<%

dim p_name

dim p_title
dim p_qcount
dim i

p_name			= request ("p_name")

p_title			= request ("p_title")
p_qcount		= request ("p_qcount")

%>

<html>
<head>
<script language="javascript">
<!--
function sendform()
{
	form = document.myform;
	for (var i=0; i<<%=p_qcount%>;i++)
	{
		if (!check_space(form.contents[i].value))
		{
			alert( (i+1) + "번째 설문 내용이 빠졌습니다");
			form.contents[i].value = "";
			form.contents[i].focus();
			return;
		}
	}	
	form.submit();
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
<link rel="stylesheet" type="text/css" href="./include/coom.css">
</head>
<body>
<center><br><br>
<form action="AddPollNext2.asp" method="post" name="myform">
<input type="hidden" name="p_name" value="<%=p_name%>">

<input type="hidden" name="p_title" value="<%=p_title%>">
<input type="hidden" name="p_qcount" value="<%=p_qcount%>">

<table width=600 border="0" cellspacing="0" bordercolordark="white" bordercolorlight="black">
<%
for i = 1 to p_qcount
%>
<tr>
	<td width=30 align=center bgcolor="#F0F0F0"><%=i%></td>
	<td><input type="text" name="contents" size="80" class="inputType"></td>
</tr>
<%
next
%>

</table>
<br>
<input type="button" value="  다음 단계로  " onclick="sendform();">&nbsp;<input type="button" value="  이전 단계로  " onclick="javascript:history.back();">

</form>
</body>
</html>