<%
'����������������������������������
'��                                                              ��
'��     ��  ��  Ʈ  ��  :  http://www.TaAng.pe.kr                ��
'��     �� �� �� �� ��  :  TaAng_guestbook v1.0                  ��
'��     ��    ��    ��  :  Hae-Min, Lee (Alias = TaAng)          ��
'��     ��    ��    ��  :  2001.04.01                            ��
'��                                                              ��
'��                                                              ��
'��     ������ [Q & A �Խ���] �� �̿��Ͽ� �ֽñ� �ٶ󱸿�.       ��
'��     �� �м��� ���ð� ������ �ٵ�� ������.                   ��
'��                                                              ��
'����������������������������������
%>
<html>
<head>
<title> TaAng's ���� </title>
<link rel=stylesheet type="text/css" href="../font.css" title="font">
</head>
<script language="javascript">
<!--
function sendit(){
	if(document.login.pwd.value == ""){
		alert("Password �Է¿��.");
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
						<font face=���� size="2" color="#ffffff">�����Ͻ÷��� ��й�ȣ�� �ʿ��մϴ�!</font>
					</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr bgcolor="#FFFFFF"> 
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr align="center">
								<td width="50%" bgcolor="#FFFFFF" align="center">
									<input type="hidden" name="no" value="<%=request("no")%>">
									<font face=���� size="2" color="666666">&nbsp;&nbsp;��й�ȣ
									<input type="password" name="pwd" size="8" style="border:1 solid"></font>
								</td>
								<td width="50%" bgcolor="#FFFFFF" align="center">&nbsp;
									<input type="button" value="��  ��" name="sub" OnClick="sendit()" style="border:1 solid;height:19">
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