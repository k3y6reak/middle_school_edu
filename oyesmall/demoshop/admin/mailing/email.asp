
<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->
<html>
<head>
<title>::::::OyesMall E-mail Service :::::::</title>

<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">

<Script Language="JavaScript">
<!--
function submit_ok() {
	if ( document.mailing.title.value == "" ) {
		alert("제목을 써야죠^^\n메일에 제목은 필수 아니겠어요.");
		document.mailing.title.focus();
		return false;
	}
	if ( document.mailing.content.value == "" ) {
		alert("내용을 입력하세요\n내용없는 메일을 보낼수 없습니다.");
		document.mailing.content.focus();
		return false;
	}

	document.mailing.submit();
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
<table width="100%" border="0" height="83%" bgcolor=#000000>
  <tr>
    <td height="100%" width="17%" valign=top>
      <!--#include file="../goods/admin_left.asp" -->
    </td>
    <td height="100%" width="83%" valign=top>


	<!----list start---->



	<table width="100%" border="0" bgcolor="#000000">
		<TBODY>
			<TR>
				<TD>
					<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
						<TBODY>
						<TR height=25>
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B> Mailing</B></FONT></TD>
							<TD align=middle width=150 bgColor=#222222><FONT face=돋움><B>회 원 관 리</B></FONT>
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
					OyesMall 회원들에게 메일을 보내는 곳입니다.
				</TD>
			</TR>
		</TBODY>
	</TABLE>
	<BR>
	<Div align=center>
<TABLE cellSpacing=0 cellPadding=0 width="98%" border=1 bordercolor="#4A494A">
					  <TBODY>
					 <TR>
							<Td align=center>
							<Table width="100%" cellSpacing="0" cellPadding="3" border="0">
	<Form name=mailing action="./email_ok.asp" method=post >

	
	
	
		<TBODY>
		
	
		
		<TR>
			<TD width=120 bgColor="#4A494A">&nbsp;
				<IMG src="../image/icon_orange.gif">NAME</B></TD>
			<TD>
				<%
					Ch = request("chk").count 
				
								
					If Request("chk") <> "" Then
					
						for i = 1 to Ch  
						Sql = "Select name From members  Where num='"& request("chk")(i) &"'"
						
						

						Set RS = DB.Execute(Sql)
						
						
						name = Rs("name")

						
						Response.write "<B>"&name&"</B>&nbsp;&nbsp;"
						next
						
						For Each m in request("chk")
							response.write "<input type='hidden' name='chk' value=" & m & ">"
						Next
						
						RS.Close
						Set RS = Nothing
					Else
					Response.Write ("<b>모든회원</B>")

					End if

					
					DB.Close
					
					Set DB = Nothing
				%>
			</TD>
		</TR>

		
		
		

		<TR>
			<TD bgColor="#4A494A">&nbsp;
				<IMG src="../image/icon_orange.gif">제 목</B></TD>
			<TD><INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100%;background:#C5C5C5" maxLength=50 name=title> </TD>
		</TR>

		<TR>
			<TD bgColor="#4A494A">&nbsp;
				<IMG src="../image/icon_orange.gif">내 용</B></TD>
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

				<TEXTAREA class=minput style="OVERFLOW: auto;WIDTH: 100%;background:#C5C5C5" name="content" rows=12 wrap=hard cols=40 style="font-size:9pt;color:#000000;border:1 solid #366670;width:100%" ></TEXTAREA> 
			</TD>
		</TR>

		
		</TBODY>
	</TABLE>
	</TD>
	</TR>
	</Tbody>
	</Table>
</Div>
<BR>
<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="1">
					</TD>
				</TR>
			</TBODY>
		</TABLE>

	
					<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
						<TBODY>
							<TR>
								<TD align=middle height=40><INPUT style="width:15%;" class=button2  type=button value="보내기" onClick="submit_ok();">&nbsp; 
									<INPUT style="width:15%;" class=button2 type=reset value=다시쓰기 > 
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				
	</FORM>


	
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

