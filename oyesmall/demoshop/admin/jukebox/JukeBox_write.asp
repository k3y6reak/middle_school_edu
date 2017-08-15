<!---#include file="../session.asp"--->
<%
		ea = Request("ea")
		If IsEmpty(ea) then
				ea = 0
		End if
%>


<html>
<head>
<title>::::::: JUKE BOX ::::::: </title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">


<script language="javascript">
function DoUpload() {
		  theFeats =   "width=500,height=120,left=350,top=350";
		  theUniqueID = (new Date()).getTime() % 100000000000000;
		  window.open("./JukeBox_progressbar.asp?ID=" + theUniqueID, theUniqueID, theFeats);
		  document.ABCForm.action = "./JukeBox_write_ok.asp?ea=<%=ea%>&ID=" + theUniqueID;
		  document.ABCForm.submit();
		}
</Script>

<Script Language="JavaScript">
				<!--
				function write_ok() 
					{
						
						if ( document.ABCForm_2.category.value == "0" ) 
							{
								alert("등록하려는 음악의 카테고리를 선택하셔야죠 ^^");
								document.ABCForm_2.category.focus();
								return false;
							}
						if ( document.ABCForm_2.name.value == "" ) 
							{
								alert("가수명을 쓰셔야죠 ^^");
								document.ABCForm_2.name.focus();
								return false;
							}
						if ( document.ABCForm_2.title.value == "" ) 
							{
								alert("음악의 제목을 쓰셔야죠 ^^");
								document.ABCForm_2.title.focus();
								return false;
							}
						if ( document.ABCForm_2.mp3.value == "" ) 
							{
								alert("음악을 선택하셔야죠 ^^");
								document.ABCForm_2.mp3.focus();
								return false;
							}
						
								
						
				document.ABCForm_2.submit();
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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B>JUKEBOX</B></FONT></TD>
							<TD align=middle width=150 bgColor=#222222><FONT face=돋움><B>MUSIC</B></FONT>
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
		 
		 <TD vAlign=top align=left>&nbsp;&nbsp;OyesMall에 음악을 담는곳 입니다 
			<BR></TD>
		
		</TR>
		</TBODY>
	</TABLE>
	<BR>
	<Div align=center>
	<TABLE cellSpacing="0" cellPadding="0" width="99%" border="0">
		<Form name="ABCForm" method=POST action="./jukebox_write.asp">
	
	
		<TBODY>
		<TR bgColor="#4A494A">
			<TD >
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
					<TBODY>
						<TR  height="18">
							<TD align=left ><IMG src="../image/icon_orange.gif"><B>Quantity :</B>&nbsp;&nbsp;&nbsp;<INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:10%;background:#C5C5C5" name=ea value=1>
						<input type="submit"  value="곡"  style="width:40px;" class=button2 >
								
							</TD>
						</TR>
					</TBODY>
				</TABLE>
				</TD>
		</TR>
		</TBODY>
		</Form>
	</TABLE>
	<BR>
	
	
	
	<TABLE cellSpacing="0" cellPadding="0" width="99%" border="0">
		<Form name="ABCForm_2" method=POST EncType="MultiPart/Form-Data" action= "./JukeBox_write_ok.asp?ea=<%=ea%>">
		
		<TBODY>
		<%For i=1 to int(ea)%>

		
		<TR>
			<TD>
				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=1 bordercolor="#4A494A">
					  <TBODY>
					 <TR>
							<Td align=center>
							<Table width="100%" cellSpacing="0" cellPadding="3" border="0">
								<TR>
									<TD width=100 bgColor="#4A494A">
										<IMG src="../image/icon_orange.gif">카테고리<b>&nbsp;&nbsp;<font color=#3366cc><%=i%></font></B></TD>
									<TD><SELECT name=category style="background:#C5C5C5">
											<OPTION value=0>--Genre--</OPTION>
											<OPTION VALUE="Dance">--Dance--</OPTION>
											<OPTION VALUE="Ballad">--Ballad--</OPTION>
											<OPTION VALUE="Rock">--Rock--</OPTION>
											<OPTION VALUE="Classic">--Classic-</OPTION>
										</SELECT>
									
										</TD>
								</TR>

								<TR>
									<TD bgColor="#4A494A">
										<IMG src="../image/icon_orange.gif">가수/그룹<B>&nbsp;<font color=#3366cc><%=i%></font></B></TD>
									<TD><INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:20%;background:#C5C5C5" name=name> </TD>
								</TR>

								<TR>
									<TD bgColor="#4A494A">
										<IMG src="../image/icon_orange.gif">노래제목<B>&nbsp;&nbsp;<font color=#3366cc><%=i%></font></B></TD>
									<TD><INPUT maxLength=30 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:30%;background:#C5C5C5" name=title> </TD>
								</TR>
								
								<TR>
									<TD bgColor="#4A494A">
										<IMG src="../image/icon_orange.gif">첨부파일<B>&nbsp;&nbsp;<font color=#3366cc><%=i%></font></B></TD>
									<TD>
										<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="100%" bgColor=#efefef borderColorLight=#999966 border=1>
											<TBODY>
											<TR>
												
												<TD><INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100%;background:#C5C5C5" maxLength=90 size=60 name=mp3 type=file> </TD>
												
											</TR>
								
											</TBODY>
										
									
										</TABLE>
									
									</TD>
								</TR>
							</Table>
							</TD>
						</TR>
						</Tbody>
					</Table>
				</TD>
		</TR>
		<TR >
				<TD height=20 colspan=2></TD>
			</TR>
	
		<%next%>
		</Tbody>
		</Table>
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
			
			<TD align=middle height=40>
				<input type="button" style="width:80px;" class=button2 value="Up_Load" onclick="write_ok()">&nbsp;&nbsp;
				<input type="reset" style="width:80px;" class=button2 value="RESET" >
					
			</td>
		</TR>

		

		</TBODY>
	
		

	</Form>
	</Table>
	
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








		

