<%
'〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
'〓                                                              〓
'〓     사  이  트  명  :  http://www.TaAng.pe.kr                〓
'〓     프 로 그 램 명  :  TaAng_guestbook v1.0                  〓
'〓     개    발    자  :  Hae-Min, Lee (Alias = TaAng)          〓
'〓     제    작    일  :  2001.04.01                            〓
'〓                                                              〓
'〓                                                              〓
'〓     질문은 [Q & A 게시판] 을 이용하여 주시기 바라구여.       〓
'〓     잘 분석해 보시고 멎지게 다듬어 보세여.                   〓
'〓                                                              〓
'〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
%>
<html>
<head>
<title> TaAng's 방명록 </title>
<link rel=stylesheet type="text/css" href="../font.css" title="font">
</head>
<script language="javascript">
<!--
function sendit(){
	if(document.login.pwd.value == ""){
		alert("Password 입력요망.");
		document.login.pwd.focus();
	return false;
	}
	document.login.submit();
}
//-->
</script>
<body bgcolor="#eeeeee" text="black" link="blue" vlink="purple" alink="red" onload="login.pwd.focus();">
<form name="login" method="post" action="delete.asp">
<table align="center" width="100%" border="0" bgcolor="black" cellspacing="1" cellpadding="0">
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="white">
				<tr bgcolor="#BBBBBB"> 
					<td height="22"> 
						<div align="center">
						<font face=돋움 size="2" color="#ffffff">삭제하시려면 비밀번호가 필요합니다!</font>
					</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr bgcolor="#FFFFFF"> 
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr align="center">
								<td width="50%" bgcolor="#FFFFFF" align="center">
									<input type="hidden" name="no" value="<%=request("no")%>">
									<font face=돋움 size="2" color="666666">&nbsp;&nbsp;비밀번호
									<input type="password" name="pwd" size="8" style="border:1 solid"></font>
								</td>
								<td width="50%" bgcolor="#FFFFFF" align="center">&nbsp;
									<input type="button" value="삭  제" name="sub" OnClick="sendit()" style="border:1 solid;height:19">
								</td>
							</tr>
							<tr><td colspan="2">&nbsp;</td></tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>