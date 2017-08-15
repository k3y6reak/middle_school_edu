
<!---#include file="../dbconn.asp"--->
<!--#include file="../session.asp"-->
<%
	num = Request("num")
	page = Request("page")
	
	IF Page = "" Then
		Page = 1
	End IF

	SQL_R = "Update Board Set readcount = readcount + 1 Where num="&num

	Db.Execute SQL_R

	SQL = "Select * From board Where num="&num

	Set Rs = Db.Execute(SQL)
	
	num = Rs("num")
	r_email = RS("email")
	ref = Rs("ref")
	r_step = Rs("r_step")
	reforder = Rs("reforder")
	Content = RS("content")
	Content = Replace(content,Chr(13)&Chr(10),"&nbsp;<BR><BR>")
%>

<html>
<head>
<title>◇ ◆ OyesMall Board◆ ◇</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<STYLE type=TEXT/CSS>
SELECT {
	FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: 굴림
}
INPUT {
	FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: 굴림
}
TEXTAREA {
	FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: 굴림
}
OPTION {
	FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: 굴림
}
BODY {
	FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: "굴림"; TEXT-DECORATION: none
}
A:link {
	COLOR: black; TEXT-DECORATION: none; font-color: #333300
}
A:visited {
	COLOR: black; TEXT-DECORATION: none; font-color: #333300
}
A:active {
	COLOR: black; TEXT-DECORATION: none; font-color: #333300
}
A:hover {
	COLOR: black; TEXT-DECORATION: none; font-color: #cc6600
}
TR {
	FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: "굴림"; TEXT-DECORATION: none
}
TD {
	FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: "굴림"; TEXT-DECORATION: none
}
</STYLE>



			<style type="text/css"> 
						BODY {
									scrollbar-face-color: #D8D4B6; 
									scrollbar-shadow-color: #333300; 

									scrollbar-highlight-color: #333300; 
									scrollbar-3dlight-color:#333300; 

									scrollbar-darkshadow-color: #D8D4B6; 
									scrollbar-track-color: #D8D4B6; 

									scrollbar-arrow-color: #333300
									} 

				</style> 

				<Script language="javascript">
					function reply()
							{
								document.re.submit();
							}

					function write()
							{
								if(!confirm("정말로 삭제 하시겠습니까?")) return;			
								document.checkform.action="./write.asp";
								document.checkform.submit();
							}
				</script>
				<SCRIPT language=javaScript>
						<!--
						
					
						function e_mail(email)
						{
						window.open("./send_mail.asp?email=<%=r_email%>","send_mail","scrollbars=no,toolbar=no,location=no,directories=no,status=no,width=590,height=420,resizable=no,menubar=no,top=120,left=204");
						}
						// -->
				</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" leftMargin=0  topMargin=0 marginwidth="0" marginheight="0">
<!--#include file="../main_top.asp"-->
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
	<TBODY>
  <tr>
    <td bgcolor="#D8D4B6">&nbsp;</td>
  </tr></TBODY>
</table>
<table width="100%" border="0" height="90%" bgcolor=#D8D4B6>
  <tr>
    <td height="100%" width="17%" valign=top>
      <!--#include file="../goods/admin_left.asp" -->
    </td>
    <td height="100%" width="83%" valign=top>
	<!----list start---->
			<TABLE height=28 cellSpacing=1 cellPadding=0 width="100%" bgColor=#333300 	border=0>
				<TBODY>
				<TR>
					<TD>
						<TABLE height=26 cellSpacing=0 cellPadding=0 width="100%" bgColor=#cccc99  border=0>
							<TBODY>
							<TR>
								<TD>&nbsp; &nbsp; <FONT face=돋움 size=3><B>게시판(Content)</B></FONT>
								</TD>
								<TD align=middle width=150 bgColor=#333300>
									<FONT face=돋움 color=#ffffcc><B>OPERATION</B></FONT>
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
						<TD vAlign=top align=left width=80>
							<IMG src="../image/member.gif">
						</TD>
						<TD vAlign=top align=left>
							OyesMall의 게시판에 글을 확인하는  페이지입니다. 
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<BR>
			<Div align=right><B>[ <A href="./list.asp">List Page</A> ]</B></Div>
			<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="100%" borderColorLight=#999966 border=1>
					<TBODY>
						<TR>
							<TD width=140 bgColor=#336600 height=27 align=center>
								<FONT color=#ffffff><b>Subject</B></Font></TD>
							<TD  bgColor=#cccc99 colspan=3><font color=green>&nbsp;&nbsp;<B><%=Rs("title")%></B></Font></TD>
						</TR>
						<TR>
							<TD width="20%" bgColor=#cccc99 height=27 align=center><b>Name</B></TD>
							<TD width="30%">&nbsp;&nbsp;<% IF RS("master") = "1" Then %><font face="comic sans ms bold" size=3><font color=red>Red</font><font color=#069FC6>Master</font></font><% Else %><%=RS("name")%><%End IF%></TD>
							<TD width="20%" bgColor=#cccc99 height=27 align=center><b>Date</B></TD>
							<TD width="30%">&nbsp;&nbsp;<%=Rs("postdate")%></TD>
						</TR>
						
						<TR>
							<TD width=140 bgColor=#cccc99 height=27 align=center><b>E-Mail</B></TD>
							<TD>&nbsp;&nbsp;<a href="javascript:e_mail();" ><%=Rs("email")%></A></TD>
							<TD width=140 bgColor=#cccc99 height=27 align=center><b>Homepage</B></TD>
							<TD>&nbsp;&nbsp;<A Href="<%=RS("home")%>" target=_new><%=Rs("home")%></A></TD>
						</TR>
						
					
					<Tbody>
					
			</Table>
			
			<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="100%" borderColorLight=#999966 border=0>
					<TBODY>
						<TR>
							<Td width=10>&nbsp;</Td>
							<Td><%=content%></Td>
						</Tr>
					</Tbody>
			</Table>
			<BR>
			<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="100%" borderColorLight=#999966 border=1>
					<TBODY>
						<Tr>
							<Td align=right colspan=11 bgColor=#cccc99 >
								<A href="javascript:reply();"  title="답변하기^^ "><img src="./image/reply.gif" border=0 ></a>&nbsp;&nbsp;
								<A href="./write.asp"  title="새글쓰기^^ "><img src="./image/write.gif" border=0 ></a>&nbsp;&nbsp;
								<A href="./edit.asp?num=<%=num%>"  title="수정하기^^ "><img src="./image/modify.gif" border=0 ></a>&nbsp;&nbsp;
								<A href="./delete_ok.asp?num=<%=num%>&page=<%=page%>" title="삭제^^ "><img src="./image/delete.gif" border=0 ></a>&nbsp;&nbsp;
								<A href="./list.asp"  title="리스트로^^ "><img src="./image/list.gif" border=0 ></a>&nbsp;&nbsp;&nbsp;
								</Td>
						</Tr>
					</Tbody>
					<form method=post action="./write.asp" name="re">
						<input type = hidden name = num value=<%=num%>>
						<input type = hidden name = ref value=<%=ref%>>
						<input type = hidden name = r_step value=<%=r_step%>>
						<input type = hidden name = reforder value=<%=reforder%>>
					</Form>
			</Table>


				
			

	
	<!----list End------>
	</td>
  </tr>

  <tr>
	<td>&nbsp;</td>
  </tr>
  
</table>

<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
	<Tbody>
	<tr>
		<td bgcolor=#333300 align=center><BR><!---#include file="../down.inc"--><BR></td>
	</Tr>
	</tbody>
</table>

</BODY>
</HTML>
<%
	Db.Close

	Set Db = Nothing
	
%>