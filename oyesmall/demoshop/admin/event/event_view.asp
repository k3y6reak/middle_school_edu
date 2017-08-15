

	<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->
<%
	num = request("num")
	page = request("page")

	

	If page = "" Then
		page = 1
	End If

	Sql = "Select * From banner Where Num="&Num

	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Sql , Db
	
	Room = RS("b_room")
	


	

	
%>


<html>
<head>
<title>◇ ◆ OyesMall Event 상품리스트◆ ◇</title>

<Script Language="JavaScript">


	function list()
		{
			document.view.action="./event_list.asp?page=<%=page%>";
			document.view.submit();
		}


	
	function del()
		{
		
			document.view.action="./event_delete.asp?num=<%=num%>&page=<%=page%>";
			document.view.submit();
		}

	function edit()
		{
			document.view.action="./event_edit.asp?num=<%=num%>&page=<%=page%>";
			document.view.submit();
		}
	
	function g_write()
		{
			document.view.action="./event_write.asp";
			document.view.submit();
		}


	
	
	
</SCRIPT>


<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">
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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B> Event 상품 리스트 (View)</B></FONT></TD>
							<TD align=middle width=150 bgColor=#222222><FONT face=돋움><B>상 품 관 리</B></FONT>
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
		 
		 <TD vAlign=top align=left>&nbsp;&nbsp;OyesMall의 Event 상품을 관리하는 곳입니다. 
			<BR></TD>
		
		</TR>
		</TBODY>
	</TABLE>
	
	<BR>
	
	<TABLE cellSpacing=0 cellPadding=0 width="100%" border=1 bordercolor="#4A494A">
		<Form name=view  method=post>
				<TBODY> 
				<TR >
					<TD align=center >
						<Table width="100%" cellSpacing="0" cellPadding="3" border="0" >
							<TBODY>
							<TR>
								<TD valign=top width=250>
								<TABLE cellSpacing=0 cellPadding=0 width="100%" border=1 bordercolor="#4A494A">
									<TR>
										<TD>
									<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
										<TR>
											<TD bgcolor=#222222 width=100 >&nbsp;<IMG src="../image/icon_orange.gif"><B>Category </B>&nbsp;</TD>
											<TD>&nbsp;<B><font color=#6B92CE size=4><%=RS("cate")%></Font></B></TD>
										</TR>
										<TR>
											<TD bgcolor=#222222 >&nbsp;<IMG src="../image/icon_orange.gif"><B>Selling </B>&nbsp; </TD>
											<TD align=left>&nbsp;<font size=3><%
									IF RS("mainimage") = "1" Then
										Response.Write "<b><font color=red>M</font>ain Image</B>"
									
									End IF

									IF RS("nomi") = "2" Then
										Response.Write "<b><font color=red>C</font>ategory Top Event</B>"
									
									End IF

									IF RS("top3") = "1" Then
										Response.Write "<b><font color=red>T</font>op Best 3 Event</B>"
									
									End IF

									IF RS("category_top") = "1" Then
										Response.Write "<b><font color=red>T</font>op Main Event</B>"
									
									End IF
							%></font></TD>
										</TR>
										
									</Table>
									</TD>
									</TR>
									</Table>
								</TD>
								<TD align=center>
								<% IF RS("image1") <> "" Then%>
									<Table border="0" cellSpacing="3" cellPadding="3" bgcolor="#222222">
												<TR>
													<TD align="center"><img src="http://<%=site%>/demoshop/admin/event_image/<%=RS("cate")%>/<%=RS("image1")%>" border=0>
													</TD>
												</TR>
									</Table>
								<%End IF%>
								<% IF RS("image2") <> "" Then%>
						
								
								<Table border="0" cellSpacing="3" cellPadding="3" bgcolor="#222222">
												<TR>
													<TD align="center">
														<img src="http://<%=site%>/demoshop/admin/event_image/<%=RS("cate")%>/<%=RS("image2")%>" border=0>
													</TD>
												</TR>
									</Table>
								<%End IF%>
							</TD>
						</TR>
						</Tbody>
					</Table>
					</Td>
				</TR>
				</Tbody>
			</Table>
				<BR>
			<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>

				<TBODY> 	
				<Tr>
							<Td align=center >
								<input type="button" style="width:80px;" class=button2 value="LIST" onClick="list();">&nbsp;
								<input type="button" style="width:80px;" class=button2 value="MODIFY" onClick="edit();">&nbsp;
								<input type="button" style="width:80px;" class=button2 value="DELETE" onClick="del();">&nbsp;
								<input type="button" value="상품등록" onClick="g_write();" style="width:80px;" class=button2>
							</Td>
			</Tr>
			</TBODY>
			</Form>
  </Table>

		
	


	
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
	Db.Close

	Set Db = Nothing
	
%>