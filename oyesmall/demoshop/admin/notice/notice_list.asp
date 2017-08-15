

<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->
<%
	num = request("num")
	page = request("page")

	If page = "" Then
		page = 1
	End If

	SQL = "select count(num) as recCount from notice"
	Set Rs = Db.Execute(SQL)

	recordCount = Rs(0)
	
	pagesize = 10

	
	pagecount = int((recordCount-1)/pagesize) +1

	
	SQL = "Select Top " & pagesize & " * From notice "
	SQL = SQL & " where num not in "
	SQL = SQL & "(Select Top " & (int(Page - 1) * pagesize) & " num From notice"
	SQL = SQL & " Order By num DESC) order by num desc" 


	Set Rs = Db.Execute(SQL)
	

	T_page = Pagecount

	

	
%>


<html>
<head>
<title>◇ ◆ OyesMall Notice◆ ◇</title>
<Script Language="JavaScript">
  function all_check(bool)
	  {      
		  var check_count=0,uncheck_count=0;      
		  len = document.checkform.chk.length;      
		 
		  if (bool)
				  {          
				  for(i=0; i<len; i++)
					  {            
					  check_count++;           
					  document.checkform.chk[i].checked = true;         
					  }         
					return 
					}  
					

			 
			  else
				  {          
					  for(i=0; i<len; i++)
					  {            
					  uncheck_count++;            
					  document.checkform.chk[i].checked = false;         
					  }          
				  return    
			  }   
	  }
</Script>
<Script Language="JavaScript">

//  다중 삭제 스크립트...
	function del(num)
		{
			if(!confirm("정말로 삭제 하시겠습니까?")) return;					
			document.checkform.action="./notice_delete.asp?page=<%=page%>";
			document.checkform.submit();
		}
	
	function write_ok()
		{
			document.checkform.action="./notice_write.asp";
			document.checkform.submit();
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
<table width="100%" border="0" height="90%" bgcolor=#000000>
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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B>NOTICE</B></FONT></TD>
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
		 
		 <TD vAlign=top align=left>&nbsp;&nbsp;OyesMall에 등록된 공지사항을 관리하는곳입니다. 
			<BR></TD>
		
		</TR>
		</TBODY>
	</TABLE>
	<Div align=center>
	<% 
			v_num = Request("n_open")
			IF v_num <> "" Then 

			SQL_V = "Select * From notice Where num="&v_num&" "
			Set RS_V =DB.Execute (SQL_V)
			
			Content = RS_V("content")
			Content = Replace(content,Chr(13)&Chr(10),"&nbsp;<BR><BR>")
	
	%>
	<Script Language="JavaScript">


	function v_del()
		{
			if(!confirm("정말로 삭제 하시겠습니까?")) return;					
			document.view.action="./notice_delete.asp?num=<%=RS_V("num")%>";
			document.view.submit();
		}
	
	function v_edit()
		{
			document.view.action="./notice_edit.asp?num=<%=RS_V("num")%>&page=<%=page%>";
			document.view.submit();
		}

</SCRIPT>
		<BR>
		<Table width="99%" cellSpacing="1" cellPadding="0" border="0" bgcolor="#4A494A">
			<TR>
			<TD>
			<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" bgcolor="#000000">
			<form Name=view  method=post>
			<input type=hidden name=delmode value=1>
				<Tbody>
				<TR>
						<TD bgColor="#4A494A" height=25 colspan=2>&nbsp;<FONT 
					color=#ffffff><B><%=RS_V("title")%></B></FONT></TD>
				</TR>
				<TR>
						<TD height=20 colspan=2>&nbsp;</TD>
				</TR>
				<TR>
						<TD width=10></TD>
						<TD><%=content%></TD>
				</TR>
				
			</Tbody>
			</Form>
		</Table>
		</TD>
		</TR>
		</Table>
		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 bgcolor=#000000>
		<TR>
						<TD height=40 align=center colspan=2><input type="button" value="List" onclick="javascript:window.location.href='./notice_list.asp?page=<%=page%>'" style="width:15%;" class=button>&nbsp;&nbsp;<input type="button" value="수 정" onclick="v_edit();" style="width:15%;" class=button>&nbsp;&nbsp;<input type="button" value="삭 제" onclick="v_del();" style="width:15%;" class=button></TD>
				</TR>
			</Table>
		<BR><BR>
	<%End IF%>
	<Div Align=Right>
		<B>[<% response.write page %>/<% response.write T_page %>]</B>
	</Div>

	<TABLE cellSpacing="0" cellPadding="0" width="99%" border="0">
	<form method=post  name="checkform">
	    <input type=hidden value="<%=page%>" name=page >
		<TBODY>
			<TR>
				<TD align=middle width="4%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">C</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="5%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">No.</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				 <TD align=middle width="10%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Branch</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle height=20 ><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Title</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="15%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Date</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="5%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Edit</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				
			</TR>

			<%
			IF NOT RS.EOF Then
			
				Count = 1
				While Not Rs.Eof and Count <= 10
				branch = RS("branch")

				Select Case branch
				Case "1"
					cate = "[news]"
				Case "2"
					cate = "[event]"
				End Select
			%>
  
				<Tr onMouseOver="this.style.background='#313031'" onMouseOut="this.style.background='#000000'" valign="top">
					<TD vAlign=center align=middle><Input type=checkbox name="chk" 	value="<%=Rs("num")%>"></TD>
					<TD vAlign=center align=middle><%=rs("num")%></TD>
					<TD vAlign=center align=middle><%=cate%></TD>
					<TD vAlign=center align=center><A Href="./notice_list.asp?n_open=<%=RS("num")%>"><B><%=rs("title")%></B></A></TD>
					<TD vAlign=center align=center><%=left(Rs("postdate"),10)%></TD>
					<TD vAlign=center align=center><A Href="./notice_edit.asp?num=<%=RS("num")%>&page=<%=page%>"><img src="../image/edit.gif" border=0></A></TD>
				</TR>
					
			
			<%
				Rs.MoveNext

				Count = Count + 1

				Wend
				RS.Close
				Set RS = Nothing

			%>
				<TR>
					<TD colspan="6">
						<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
							<TBODY>
								<TR>
									<TD align="middle" height="1">
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
				</Tbody>
				</Table>
				<BR>
<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
<Tbody>

		<TR>
			<Td Align=left colspan=4 >&nbsp;
					<input type="button" style="width:80px;" class=button2 value="글쓰기" onClick="write_ok();" >&nbsp;
					<input type="button" style="width:80px;" class=button2 value="전체선택" onClick="all_check(true);">&nbsp;
					<input type="button" style="width:80px;" class=button2 value="선택해제" onClick="all_check(false);" >&nbsp;
					<input type="button" value="선택목록삭제" onclick="del();" style="width:80px;" class=button2 >
			</Td>
			
			<Td Align=right colspan=2>

					<%
						intStart = int((page-1)/10)*10 + 1					
						intEnd = intStart + 9
					%>
					<% IF intstart <> 1 Then %>
						[<A Href="./notice_list.asp?page=1">Start</A>]
					<% End IF%>
					<% If intstart = 1 Then %>
						&nbsp;
					<% Else %>
						<A Href="./notice_list.asp?page=<%=intstart-1%>">◀</A>
					<% End IF %>

					<% For i=intstart to intend 
						
						IF i = int(page) Then 

							Response.Write "<b>"&i&"</b>"
						Else
						
							Response.Write " <A Href=./notice_list.asp?page="&i&"> ["&i&"]</a> "
						End if

						If int(intstart) =int(t_page) then  
							exit for
						end if
						intstart=intstart+1

					   Next
					%>

					<% If intstart = T_page Then %>
						&nbsp;
					<% else %>
						<A Href="./notice_list.asp?page=<%=intend+1%>">▶</A>
					<% End If%>
					<% IF intstart <> intend Then %>
						[<A Href="./notice_list.asp?page=<%=T_page%>">End</A>]
					<% End IF%>&nbsp;
			</Td>
		</TR>
			<%Else%>
		<TR>
				<Td align=center colspan=6  height=50>
					등록된 공지사항이 아직 없습니다.^^
				</Td>
		<p>
		</TR>
		<TR>
				<Td align=right colspan=6 height=50>
					<input type="button" style="width:80px;" class=button2 value="글쓰기" onClick="write_ok();" >&nbsp;
					<input type="button" style="width:80px;" class=button2 value="전체선택" onClick="all_check(true);">&nbsp;
					<input type="button" style="width:80px;" class=button2 value="선택해제" onClick="all_check(false);" >&nbsp;
					<input type="button" value="선택목록삭제" onclick="del();" style="width:80px;" class=button2 >
				</Td>
		</TR>
			<%End IF%>
</TBODY> 
</TABLE>
	</FORM>
		
	<TABLE cellSpacing="0" cellPadding="0" width="99%" border="0">
	<Form name="Search" action="./notice_search.asp" method=post>
  
	<TBODY>
		<TR>
			<TD colspan=4>
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD  height="18">
						&nbsp;&nbsp;<B><Font class="font_3">* Search</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		</TD></TD>
			
		</TR>
		
		<TR>
			<TD  height=25 width="15%">
				<IMG src="../image/icon_orange.gif">분 류</FONT></B></TD>
			<TD  width="35%"><Select name=branch2 size=1 style="WIDTH:80px;BACKGROUND: #C5C5C5; ">
													<Option  value="0">선 택</Option>
													<Option value="1">[News]</Option>
													<Option value="2">[Event]</Option>
											</Select></TD>
			<TD  height=25 width="15%">
				<IMG src="../image/icon_orange.gif">제 목 </FONT></B></TD>
			<TD  width="35%"><INPUT  maxLength=20 name=title2 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:70%;background:#C5C5C5"></TD>
			
		</TR>

		<TR>
			<TD  height=25>
				<IMG src="../image/icon_orange.gif">등록일</FONT></B></TD>
			<TD >
				<INPUT  maxLength=20 name=date1 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:40%;background:#C5C5C5"> <B>~</B>
					<INPUT  maxLength=20  name=date2 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:40%;background:#C5C5C5"></TD>
			<TD  height=25 width="15%">
				<IMG src="../image/icon_orange.gif">내 용 </FONT></B></TD>
			<TD  width="35%"><INPUT  maxLength=20 name=content2 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:70%;background:#C5C5C5"></TD>
			
		</TR>

	<TD colspan="4">
		<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="1">
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</TD>
</TR>
		<TR>
			<TD height=40 colspan=4 >&nbsp;
			
			<INPUT style="width:80px;" type=submit value="Search" class=button2></TD>
			
		</TR>
			


	</TBODY>
	</FORM>
	</TABLE>

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
	Db.Close

	Set Db = Nothing
	
%>