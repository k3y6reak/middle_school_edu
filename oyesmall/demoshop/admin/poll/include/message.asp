<%

code = request ("code")

select case code

case "noRefer"

	mess = "외부에서의 직접 연결은 금지되어 있습니다<br>내부에서 자바스크립트를 사용해 이 페이지를 호출할 경우에도 메시지가 나옵니다"
	gogo = "javascript:history.back();"
	gogoMess = "돌아가기"

case "DelPoll"

	mess = "지정하신 설문항목이 정상적으로 삭제되었습니다"
	gogo = "../List.asp"
	gogoMess = "리스트로"

case "notPass"

	mess = "비밀번호가 일치하지 않습니다<br><br>확인해 주시기 바랍니다"
	gogo = "javascript:history.back();"
	gogoMess = "돌아가기"

case "makePoll"

	mess = "설문지 작성이 완료되었습니다"
	gogo = "../List.asp"
	gogoMess = "리스트로..."


case else

	mess = "지정되지 않은 에러입니다"
	gogo = "javascript:history.back();"
	gogoMess = "돌아가기"


end select 

%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="../include/coom.css">
</head>
<body>

<table width="100%" height="100%">
<tr>
	<td height = "50%" align=center valign=center>
		<table width=600 border="1" cellspacing="0" cellpadding="10" bordercolordark="white" bordercolorlight="black" bgcolor="#F0F0F0">
		<tr>
			<td align=center valign=center>
				<%=mess%>
			</td>
		</tr>
		</table>
	</td>
</tr>
<tr>
	<td height = "50%" align=center valign=top><a href="<%=gogo%>"><%=gogoMess%></a></td>
</tr>
</table>

</body>
</html>