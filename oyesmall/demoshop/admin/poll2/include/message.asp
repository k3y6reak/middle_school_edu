<%

code = request ("code")

select case code

case "noRefer"

	mess = "�ܺο����� ���� ������ �����Ǿ� �ֽ��ϴ�<br>���ο��� �ڹٽ�ũ��Ʈ�� ����� �� �������� ȣ���� ��쿡�� �޽����� ���ɴϴ�"
	gogo = "javascript:history.back();"
	gogoMess = "���ư���"

case "DelPoll"

	mess = "�����Ͻ� �����׸��� ���������� �����Ǿ����ϴ�"
	gogo = "../List.asp"
	gogoMess = "����Ʈ��"

case "notPass"

	mess = "��й�ȣ�� ��ġ���� �ʽ��ϴ�<br><br>Ȯ���� �ֽñ� �ٶ��ϴ�"
	gogo = "javascript:history.back();"
	gogoMess = "���ư���"

case "makePoll"

	mess = "������ �ۼ��� �Ϸ�Ǿ����ϴ�"
	gogo = "../List.asp"
	gogoMess = "����Ʈ��..."


case else

	mess = "�������� ���� �����Դϴ�"
	gogo = "javascript:history.back();"
	gogoMess = "���ư���"


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