<!--#include file="../session.asp"-->
<html>
<head>
<title>�� �� OyesMall Board�� ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">

			<Script Language="JavaScript">
				<!--
				function write_ok() 
					{
						
						if ( document.write.name.value == "" ) 
							{
								alert("�ۼ��ڸ� ���ž��� ^^");
								document.write.name.focus();
								return false;
							}
						if (!check_mail(document.write.email))
							{
										alert('�����ּҰ� ���Ŀ� ���� �ʽ��ϴ�.');
										document.write.email.focus();
										return false; 
							}
						if ( document.write.title.value == "" ) 
							{
								alert("�̱��� ������ �� �ּ��� ^^");
								document.write.title.focus();
								return false;
							}
						if ( document.write.content.value == "" ) 
							{
								alert("������ �� �ּ��� ^^");
								document.write.content.focus();
								return false;
							}
						if ( document.write.tank.value == "" ) 
							{
								alert("��ũ�� ��� �ּ��� ^^");
								document.write.tank.focus();
								return false;
							}
						if ( document.write.pwd.value == "" ) 
							{
								alert("�̱��� ������ ������ �ʿ��ϹǷ� ��й�ȣ�� ������ �ּ��� ^^");
								document.write.pwd.focus();
								return false;
							}
						
								
						
				document.write.submit();
				}

				// �����ּ� �˻�
function check_mail(cg) {
	emailEx1 = /[^@]+@[A-Za-z0-9_\-]+\.[A-Za-z]+/;
	emailEx2 = /[^@]+@[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z]+/;
	emailEx3 = /[^@]+@[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z]+/;

	if(emailEx1.test(cg.value)) return true;
	if(emailEx2.test(cg.value)) return true;
	if(emailEx3.test(cg.value)) return true;

	return false;
}
				//-->
		</Script>
</head>

<body bgcolor="#000000" text="#000000" leftMargin=0  topMargin=0 marginwidth="0" marginheight="0">
<!--#include file="../main_top.asp"-->
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 bgcolor=#000000>
	<TBODY>
  <tr>
    <td>&nbsp;</td>
  </tr></TBODY>
</table>
<table width="100%" border="0" height="90%" bgcolor=#000000>
  <tr>
    <td height="100%" width="17%" valign=top>
      <!--#include file="../goods/admin_left.asp" -->
    </td>
    <td height="100%" width="83%" valign=top>

	<!----list start---->
		<Form name=write action="./write_ok.asp" method=post >
			<input type=hidden name=num value="<%=Request("num")%>">
			<input type=hidden name=ref value="<%=Request("ref")%>">
			<input type=hidden name=r_step value="<%=Request("r_step")%>">
			<input type=hidden name=reforder value="<%=Request("reforder")%>">
		<table width="100%" border="0" bgcolor="#000000">
		<TBODY>
		<TR>
			<TD>
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
					<TBODY>
					<TR height=25>
						<TD>&nbsp; &nbsp; <FONT face=���� size=2><B>�Խ���(Write)</B></FONT>
						</TD>
						<TD align=middle width=150 bgColor=#222222>
							<FONT face=���� ><B>OPERATION</B></FONT>
						</TD>
					</TR>
					</TBODY>
				</TABLE>
			</TD>
		</TR>
		</TBODY>
	</TABLE>
	<BR>
	
	<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TBODY>
			<TR>
				
				<TD vAlign=top align=left>&nbsp;&nbsp;
					OyesMall�� �Խ��ǿ� ���� �ø��� �������Դϴ�. 
				</TD>
			</TR>
		</TBODY>
	</TABLE>
	<BR>
	<Div align=center>

	
	<TABLE cellSpacing=0 cellPadding=0 width="99%" border=1 bordercolor="#4A494A">
		<TBODY>
		<TR>
			<TD>
				<Table width="100%" cellSpacing="0" cellPadding="3" border="0">
					<TR>
						<TD width=120 bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">�ۼ���</B></TD>
						<TD>
							<INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100px;background:#C5C5C5"   name=name > </TD>
					</TR>
					<TR>
						<TD bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">E-Mail</B></TD>
						<TD>
							<INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:200px;background:#C5C5C5"   name=email > </TD>
					</TR>
					<TR>
						<TD bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">Homepage</B></TD>
						<TD>
							<INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:200px;background:#C5C5C5"   name=home value="http://"> </TD>
					</TR>
					<TR>
						<TD bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">�� ��</B></TD>
						<TD>
							<INPUT maxLength=40 name=title style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:90%;background:#C5C5C5"  > </TD>
					</TR>
					<TR>
						<TD bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">�� ��</B></TD>
						<TD>
							<TABLE cellSpacing=0 cellPadding=0 border=0>
								<TBODY>
									<TR>
										<TD><INPUT type=radio value="text" name="coding" checked>TEXT
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<INPUT type=radio value="html" name="coding">HTML
										</td>
									</TR>
								</TBODY>
							</TABLE>
							<TEXTAREA style="OVERFLOW: auto;WIDTH: 100%;background:#C5C5C5" name="content" rows=12 wrap=hard cols=60 style="font-size:9pt;color:#000000;border:1 solid #366670;width:100%"></TEXTAREA> 
						</TD>
					</TR>
					<TR>
										<TD bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">Tank</B></TD>
										<TD> <SELECT  size=1 name=tank style="WIDTH: 100px;background:#C5C5C5"> 
														<OPTION value="" selected>�� ��</OPTION>
														<OPTION value=cha_bg01.gif >īŸ��Ʈ</OPTION>
														<OPTION value=cha_bg02.gif >ũ�ν�����</OPTION>
														<OPTION value=cha_bg03.gif >ĳ��</OPTION>
														<OPTION value=cha_bg04.gif >ĳ����ũ</OPTION>
														<OPTION value=cha_bg05.gif >��ũ��ũ</OPTION>
														<OPTION value=cha_bg06.gif >���η���</OPTION>
														<OPTION value=cha_bg07.gif >�̻���</OPTION>
														<OPTION value=cha_bg08.gif >��Ƽ�̽�</OPTION>
														<OPTION value=cha_bg09.gif >��������ũ</OPTION>
														<OPTION value=cha_bg10.gif >���̿¾���Ŀ</OPTION>
														<OPTION value=cha_bg11.gif >��ũ����</OPTION>
														<OPTION value=cha_bg12.gif >�����̵�</OPTION>
														<OPTION value=cha_bg13.gif >������ũ</OPTION></TD>
									</TR>
					<TR>
						<TD bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">��й�ȣ</B></TD>
						<TD>
							<INPUT maxLength=10 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100px;background:#C5C5C5" name=pwd type=password> </TD>
					</TR>
				</Table>
			</TD>
		</TR>
		</Tbody>
	</Table>
	<BR>


	
					<TABLE height=26 cellSpacing=0 cellPadding=0 width="99%" border=0>
						<TBODY>
							<TR>
								<TD align=middle ><INPUT style="width:80px;" class=button2 type=button value="Submit" name=action Onclick="write_ok();">&nbsp;&nbsp; 
									<INPUT id=reset1 style="width:80px;" class=button2 type=reset value=Reset name=reset1>&nbsp;&nbsp;<INPUT style="width:80px;" class=button2 type=button value="List" name=action Onclick="javascript:window.location.href='./list.asp'"> 
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				
	</FORM>

	</Div>



	
	<!----list End------>
	</td>
  </tr>

  <tr>
	<td>&nbsp;</td>
  </tr>
  
</table>

<!---#include file="../down.inc"-->

</BODY>
</HTML>
