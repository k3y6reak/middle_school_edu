 




<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->
<%
	num = Request("num")

	page = request("page")

	If page = "" Then
		page = 1
	End If
	branch2 = Request("branch2")

	title2 = Replace(Request("title2"),",","")
    title2 = Replace(title2," ","")

	content2 = Replace(Request("content2"),",","")
    content2 = Replace(content2," ","")

 		
    date1 = Replace(Request("date1"),",","")
    date1 = Replace(date1," ","")	 
	date2 = Replace(Request("date2"),",","")
    date2 = Replace(date2," ","")


	
	Set Rs = Server.CreateObject("ADODB.Recordset")

	sql_query = ""
	
	'branch로 검색했을 경우..
	If branch2 <> "" then 
		sql_query = sql_query & "branch ="& branch2 &" "
	End If

	'title로 검색했을 경우..
	If title2 <> "" then 
		If branch2 <> "" then
			sql_query = sql_query & " and title Like '%"& title2 &"%'"
		Else
			sql_query = sql_query & "title Like '%"& title2 &"%'"
		End if
	End If

	'content로 검색했을 경우..
	If content2 <> "" then 
		If title2 <> "" then
			sql_query = sql_query & " and content Like '%"& content2 &"%'"
		Elseif branch2 <> "" then
			sql_query = sql_query & " and content Like '%"& content2 &"%'"
		Else
			sql_query = sql_query & "content Like '%"&content2&"%'"
		End if
	End If

	'	등록날짜로 검색했을 경우..
	If date1 <> "" or date2 <> "" then 
		If title2 <> "" then
			sql_query = sql_query & " and postdate between convert(datetime,'"&year(date1)&"-"&month(date1)&"-"&day(date1)&"') AND convert(datetime,'"&year(date2)&"-"&month(date2)&"-"&day(date2)&"')"
		Elseif content2 <> "" then
			sql_query = sql_query & " and postdate between convert(datetime,'"&year(date1)&"-"&month(date1)&"-"&day(date1)&"') AND convert(datetime,'"&year(date2)&"-"&month(date2)&"-"&day(date2)&"')"
		Elseif branch2 <> "" then
			sql_query = sql_query & " and postdate between convert(datetime,'"&year(date1)&"-"&month(date1)&"-"&day(date1)&"') AND convert(datetime,'"&year(date2)&"-"&month(date2)&"-"&day(date2)&"')"
		Else
			sql_query = sql_query & "postdate between convert(datetime,'"&year(date1)&"-"&month(date1)&"-"&day(date1)&"') AND convert(datetime,'"&year(date2)&"-"&month(date2)&"-"&day(date2)&"')"
		End if
	End If


	

	'쿼리실행
	sql_query = "Select * from notice where "& sql_query &" order by num desc"
		
	Set Rs=server.createobject("adodb.recordset")
	rs.pagesize=10
	rs.open sql_query,db,1

	T_page = RS.Pagecount
	nCount = Rs.PageSize


	

		
	
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

	

	function list()
		{
			document.checkform.action="./notice_list.asp?page=<%=page%>";
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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B>NOTICE (search)</B></FONT></TD>
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
		
		 <TD vAlign=top align=left>&nbsp;&nbsp;OyesMall에 등록된 공지사항을 검색한 결과입니다.  
			<BR></TD>
		
		</TR>
		</TBODY>
	</TABLE>
	

<BR>
	
	<DIV align=right><B>검색목록수 :&nbsp;<font color=#ffffff><% response.write rs.recordcount%></font>&nbsp; 개</B>&nbsp;&nbsp;</DIV>

	<% If Rs.Bof or Rs.Eof Then %> 
	<Script Language="Javascript">
		
		alert(" 검색된 글이 없습니다. 다른 키워드를 이용하세요 ^^")
		history.go(-1);
    </Script>
	
			<% Else %>
	
	
	<div align=center>
	<TABLE cellSpacing=0 cellPadding=0 width="99%" border=0>
	<form method=post action="./goods_list.asp" name="checkform">
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
			'	IF NOT RS.EOF Then
				
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
				<TD vAlign=center align=center><A Href="./notice_view.asp?num=<%=RS("num")%>"><B><%=rs("title")%></B></A></TD>
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

			<Tr>
			<Td colspan=4 >&nbsp;
					<input type="button" style="width:80px;" class=button2 value="List" onClick="list();" >&nbsp;
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
			</Tr>
			
		
		</TBODY> 
	</FORM>
	</TABLE>
		<BR>


		<TABLE>
			<TBODY>
				 <TR>
					<TD>&nbsp;
					</TD>
				</TR>
			</TBODY>
		</TABLE>

		
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
	End IF

	Db.Close

	Set Db = Nothing

%>