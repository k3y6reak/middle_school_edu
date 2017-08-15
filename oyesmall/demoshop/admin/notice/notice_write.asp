
<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->
<html>
<head>
<title>◇ ◆ OyesMall Notice◆ ◇</title>

<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">
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
<Script Language="JavaScript">
	function list()
		{
		document.notice.action="./notice_list.asp";
		document.notice.submit();
		}

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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B>NOTICE (Write)</B></FONT></TD>
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
					OyesMall에 공지사항을 등록하는 곳입니다.
				</TD>
			</TR>
		</TBODY>
	</TABLE>
<Div align=center>
	<Form name=notice action="./notice_write_ok.asp" method=post >

	<TABLE cellSpacing=0 cellPadding=0 width="99%" border=1 bordercolor="#4A494A">
	
	
		<TBODY>
		<TR>
			<TD>
				<Table width="100%" cellSpacing="0" cellPadding="3" border="0">
					<TR>
						<TD width=120 bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">제 목</B></TD>
						<TD><INPUT  style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100%;background:#C5C5C5" maxLength=50 name=title> </TD>
					</TR>
					<TR>
						<TD width=120 bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">분 류</B></TD>
						<TD><input type=radio name=branch value="1" checked><font color=orange>[News]</font>
								&nbsp;&nbsp;&nbsp;
								<input type=radio name=branch value="2"><font color=orange>[Event]</font>
								 </TD>
					</TR>

					<TR>
						<TD width=120 bgColor="#4A494A">
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

							<TEXTAREA class=minput style="OVERFLOW: auto;WIDTH: 100%;background:#C5C5C5" name="content" rows=12 wrap=hard cols=60 style="font-size:9pt;color:#000000;border:1 solid #366670;width:100%"></TEXTAREA> 
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
							<TR>
								<TD align=middle><INPUT style="width:80px;" class=button2  type=button value="등 록" onClick="submit_ok();" >&nbsp; 
									<INPUT style="width:80px;" class=button2 type=reset value=다시쓰기 >&nbsp;&nbsp;<INPUT style="width:80px;" class=button2  type=button value="글목록" onClick="list();" >
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

