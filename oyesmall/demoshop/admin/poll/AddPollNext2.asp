

<%

dim p_name
dim p_email
dim p_pass
dim p_title
dim p_qcount
dim i
dim contents



p_name				= request ("p_name")

p_title				= request ("p_title")
p_qcount			= request ("p_qcount")




for i = 1 to request("contents").count

	contents = contents & request("contents")(i) & "_^_"

next

%>

<html>
<head>
<script language="javascript">
<!--
function sendform()
{
	form = document.myform;
	form.submit();
}
-->
</script>
<link rel="stylesheet" type="text/css" href="./include/coom.css">
</head>
<body>
<center><br><br>

<form action="AddPollEnd.asp" method="post" name="myform">
<input type="hidden" name="p_name" value="<%=p_name%>">

<input type="hidden" name="p_title" value="<%=p_title%>">
<input type="hidden" name="p_qcount" value="<%=p_qcount%>">
<input type="hidden" name="contents" value="<%=contents%>">
<input type="hidden" name="p_over" value="<%=p_over%>">

<table width=600 border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
<tr height=22>
	<td align="center" bgcolor="#F0F0F0" width=110>작성자</td>
	<td>&nbsp;<%=p_name%></td>
</tr>


<tr height=22>
	<td align="center" bgcolor="#F0F0F0">설문지 제목</td>
	<td>&nbsp;<b><%=p_title%></b></td>
</tr>
<tr height=22>
	<td align="center" bgcolor="#F0F0F0">설문지 항목</td>
	<td align="left">
		<table width="100%" cellspacing=10>
		<tr>
			<td>
			<%
			str = ""
			for i = 1 to request ("contents").count

				str = str & i & ".&nbsp;" & request("contents")(i) & "<br>"

			next
			response.write str
			%>
			</td>
		</tr>
		</table>		
	</td>
</tr>
</table>
<br>
<input type="button" value="  설문지 제작  " onclick="sendform();">&nbsp;<input type="button" value="  이전 단계로  " onclick="javascript:history.back();">


</form>
</body>
</html>