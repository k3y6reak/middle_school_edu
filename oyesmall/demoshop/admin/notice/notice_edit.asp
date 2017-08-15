<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->
<%
	num = Request("num")
	page = Request("page")
	
	IF Page = "" Then
		Page = 1
	End IF


	SQL = "Select * From notice Where num="&num

	Set Rs = Db.Execute(SQL)
	
	num = Rs("num")
	title = RS("title")
	Title = Replace(title,"'","''")
	Content = RS("content")
	content = Replace(content,chr(13)&chr(10),chr(13)&chr(10))
%>

<html>
<head>
<title>◇ ◆ OyesMall Notice◆ ◇</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">

				<Script language="javascript">
			

					function del()
							{
								if(!confirm("정말로 삭제 하시겠습니까?")) return;			
								document.notice.action="./notice_delete.asp?page=<%=page%>";
								document.notice.submit();
							}
					function list()
							{
								document.notice.action="./notice_list.asp?page=<%=page%>";
								document.notice.submit();
							}
				</script>
<Script Language="JavaScript">
<!--
function submit_ok() {
	if ( document.notice.title.value == "" ) {
		alert("제목을 입력하세요. ^^");
		document.notice.title.focus();
		return false;
	}
	if ( document.notice.content.value == "" ) {
		alert("내용을 입력하세요. ^^");
		document.notice.content.focus();
		return false;
	}

	document.notice.submit();
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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B>NOTICE (Edit)</B></FONT></TD>
							<TD align=middle width=150 bgColor=#222222><FONT face=돋움 ><B>OPERATION</B></FONT>
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
							OyesMall 공지사항을 수정하는 페이지입니다. 
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<BR>

		<Div align=center>
			<Form name=notice action="./notice_edit_ok.asp" method=post >
			<INPUT type=hidden value="<%=num%>" name=num>
		<input type=hidden value="<%=page%>" name=page>
		<TABLE cellSpacing=0 cellPadding=0 width="99%" border=1 bordercolor="#4A494A">
		<TBODY>
		<TR>
			<TD>
				<Table width="100%" cellSpacing="0" cellPadding="3" border="0">
					<TR>
						<TD width=120 bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">제 목</B></TD>
						<TD><INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100%;background:#C5C5C5" maxLength=50 name=title value="<%=RS("title")%>"> </TD>
					</TR>
					<TR>
						<TD width=120 bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">분 류</B></TD>
						<TD><input type=radio name=branch value="1"<%IF RS("branch") = "1" Then%>Checked<%End IF%>><font color=orange>[News]</font>
								&nbsp;&nbsp;&nbsp;
								<input type=radio name=branch value="2" <%IF RS("branch") = "2" Then%>Checked<%End IF%>><font color=orange>[Event]</font>
								 </TD>
					</TR>

					<TR>
						<TD width=120 bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">내 용</B></TD>
						<TD>
							<TABLE cellSpacing=0 cellPadding=0 border=0>
								<TBODY>
									<TR>
										<TD><INPUT type=radio value="text" name="coding" <% IF RS("coding") = "text" Then%>Checked<%End IF%>>TEXT
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<INPUT type=radio value="html" name="coding"  <% IF RS("coding") = "html" Then%>Checked<%End IF%>>HTML
										</td>
									</TR>
								</TBODY>
							</TABLE>

							<TEXTAREA class=minput style="OVERFLOW: auto;WIDTH: 100%;background:#C5C5C5" name="content" rows=12 wrap=hard cols=60 style="font-size:9pt;color:#000000;border:1 solid #366670;width:100%"><%=content%></TEXTAREA> 
						</TD>
					</TR>
				</Table>
			</TD>
		</TR>
		
		</TBODY>
	</TABLE>
	<BR>
			<TABLE cellSpacing="0" cellPadding="0" width="99%" border="0">
					<TBODY>
						<Tr>
							<Td  align=center>
								<input type="button" style="width:80px;" class=button2 value="정보변경" onClick="submit_ok();" >&nbsp;
								<input type="reset" style="width:80px;" class=button2 value="다시쓰기"  >&nbsp;
								<input type="button" style="width:80px;" class=button2 value="글목록" onClick="list();" >&nbsp;
								<input type="button" style="width:80px;" class=button2 value="삭 제" onClick="del();" >&nbsp;
							
								
								</Td>
						</Tr>
					</Tbody>
					
			</Table>
			</Form>
                                     
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
<%
	RS.Close
	Db.Close
	Set RS = Nothing
	Set Db = Nothing
	
%>