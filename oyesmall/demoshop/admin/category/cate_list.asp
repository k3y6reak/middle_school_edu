
<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->
<%
	page = Request("page")

	If page = "" Then 
		page = 1
	End If

	Sql="select * from category order by ref asc, step asc"
	Set Rs = Server.CreateObject("ADODB.RecordSet")

	Rs.Open Sql , Db,1
	
%>

<html>
	<head>
		<Title>:::::::OyesMall Category Mode:::::::</Title>
		<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">

<Script Language="JavaScript">
				<!--
				function cate_ok() 
					{
						
						if ( document.middlesubmit.c_title.value == "" ) 
							{
								alert("카테고리명을 쓰셔야죠 ^^");
								document.middlesubmit.c_title.focus();
								return false;
							}
						
				document.middlesubmit.submit();
				}

				function a_cate_ok() 
					{
						
						if ( document.topsubmit.c_title.value == "" ) 
							{
								alert("대분류 카테고리명을 쓰셔야죠 ^^");
								document.topsubmit.c_title.focus();
								return false;
							}
						
				document.topsubmit.submit();
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
    <td height="100%" width="83%" Valign=top>
	<!----list start---->

	<table width="100%" border="0" bgcolor="#000000">
		<TBODY>
			<TR>
				<TD>
						<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
						<TBODY>
						<TR height=25>
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B>상품 	카테고리</B></FONT></TD>
							<TD align=middle width=150 bgColor=#222222><FONT face=돋움 ><B>상 품 관 리</B></FONT>
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
		 
		 <TD vAlign=top align=left>&nbsp;&nbsp;OyesMall에 등록하려는 상품의 카테고리를 관리하는 곳입니다. 
			<BR></TD>
		
		</TR>
		</TBODY>
	</TABLE>
	<BR>

<div align=center>
            
	  <TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="99%" 
		borderColorLight=#4B4B4B border=1 >
		
			
			<TBODY>
			<TR>
				<TD align=middle width="50%"bgColor="#4A494A" height=25><FONT 
					color=#ffffff>카테고리명(상품갯수)</FONT></TD>
				<TD align=middle width="10%" bgColor="#4A494A" height=25><FONT 
				  color=#ffffff>추 가</FONT></TD>
				<TD align=middle bgColor="#4A494A" height=25 width="10%"><FONT 
				color=#ffffff>삭 제</FONT></TD>
				<TD align=middle width="10%" bgColor="#4A494A" height=25><FONT 
				  color=#ffffff>상품등록</FONT></TD>
			</TR>

			<Form name=topsubmit method=post action="./cate_good_ok.asp">	
				<Tr onMouseOver="this.style.background='#4A494A'" onMouseOut="this.style.background='#ffffff'" bgcolor="#ffffff" valign="top">
					<TD vAlign=center ><img src="../image/folder.gif" >&nbsp;최상위 카테고리(OyesMall main page)
					</td>
					<TD Align=left align=center colspan=3>
						<input type=text name=c_title style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:50%;;background:#C5C5C5">	&nbsp;&nbsp;
						<input type="button" value="Create" class=button3 OnClick="a_cate_ok();">
						<input type=hidden name=a value=1>
					</TD>
				</Tr>
			</Form>

			<%
				

				While Not Rs.Eof 
			%>
			
			<Tr onMouseOver="this.style.background='#4A494A'" onMouseOut="this.style.background='#ffffff'" bgcolor="#ffffff" valign="top">
				<TD vAlign=center >

				<% AA = rs.fields("lev") + 1 %>
				<%for i=1 to AA%>&nbsp; &nbsp; &nbsp;<%next%>
						
						
						<img src="../image/folder.gif" >&nbsp;<% IF RS("lev")=0 Then %><B><font color=blue><%=Rs("c_title")%></font></B><%ElseIF RS("lev")=1 Then %><Font color=green><%=RS("c_title")%></font><%Else%><%=RS("c_title")%><%End IF%></td>
				<TD vAlign=center align=center><% If Rs("lev")=2 Then %>&nbsp;<%Else%>
					<A Href="./cate_list.asp?c_no=<%=rs("c_no")%>"><img src="../image/plus1.gif" border=0></A><%End If%></TD>
			
				<TD vAlign=center align=center>
				
				<A Href="./cate_del.asp?ref=<%=rs("ref")%>&lev=<%=rs("lev")%>&step=<%=RS("step")%>&c_no=<%=RS("c_no")%>"><img src="../image/del.gif" border=0></A></TD>

				<TD vAlign=center align=center>
					<% If Rs("lev") >= 2 Then%>
					<A	Href="../goods/goods_write.asp?c_no=<%=Rs("c_no")%>&lev=<%=Rs("lev")%>&ref=<%=Rs("ref")%>&ref_n=<%=Rs("ref_n")%>&step=<%=RS("step")%>"><img src="../image/plus1.gif" border=0></A>
					<%Else%>&nbsp;<%End If%></TD>
			</Tr>

			<%
					c_no = Request("c_no")
					If int(c_no) = Rs("c_no") Then
			%>
			<TR bgcolor=#ffffff>
				  <form name=middlesubmit method=post action="./cate_good_ok.asp">
						<input type=hidden name=a value=2>
						<input type=hidden name=ref value="<%=rs("ref")%>">
						<input type=hidden name=lev value="<%=rs("lev")%>">
						<input type=hidden name=no value="<%=rs("c_no")%>">
						<input type=hidden name=step value="<%=rs("step")%>">
				  
				  <TD vAlign=center >
					<% AA = rs.fields("lev") + 2 %>
				<%for i=1 to AA%>&nbsp; &nbsp; &nbsp;<%next%>
					<img src="../image/open.gif" >
					<INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:25%;;background:#C5C5C5" name=c_title> 
					<INPUT  type=button value=Create  onclick="cate_ok()" class=button3> 
					</TD>
				</FORM>
				  <TD align=middle>&nbsp;</TD>
				  <TD align=middle>&nbsp;</TD>
				  <TD align=middle>
					&nbsp;
				  </TD>
				
			</TR>
					<% End If %>
			<%
				Rs.MoveNext
				Wend
			%>

			
			</Tbody>
			
		</Table>
	
</div>


	
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


