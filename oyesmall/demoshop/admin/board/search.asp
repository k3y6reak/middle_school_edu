<!---#include file="../dbconn.asp"--->
<!--#include file="../session.asp"-->
<%
	page = Request("page")

	radio = request("radio")
	search_query = request("search_query")

	IF Page = "" Then
		Page = 1
	End IF

	Select Case radio

			Case "1"

				search_checkname = "title"

			Case "2"

				search_checkname = "name"
			
			Case "3"

				search_checkname = "content"

		End Select
	
		SQL = "Select count(num) from board Where "& search_checkname &" Like '%"& search_query &"%' "

		Set RS = DB.Execute(SQL)

		recordcount = RS(0)
		pagesize = 10
		pagecount = int((recordCount-1)/pagesize) +1
		
		SQL = "SELECT TOP " & pagesize & " * FROM Board "
		SQL = SQL & " Where "& search_checkname &" Like '%"& search_query &"%' and num not in "
		SQL = SQL & "(SELECT TOP " & ((Page - 1) * pagesize) & " num FROM Board"
	    SQL = SQL & " Where "& search_checkname &" Like '%"& search_query &"%'"
	    SQL = SQL & " ORDER BY num DESC) order by num desc" 

		Set RS = DB.Execute(SQL)

	T_page = Pagecount

%>

<html>
<head>
<title>◇ ◆ OyesMall Board◆ ◇</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">
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

						  function del(num)
							{
								if(!confirm("정말로 삭제 하시겠습니까?")) return;					
								document.checkform.action="./delete_check_s.asp";
								document.checkform.submit();
							}
	
						function b_list()
							{
								document.checkform.action="./list.asp?page=<%=page%>";
								document.checkform.submit();
							}
				</Script>
				<Script language=javascript>
					function search()
						{
							if(document.	search1.AA.value=="")
							{
								alert("검색할 키워드를 기입해 주세요");
								document.search1.AA.focus();
								return false;
							}
							document.search1.submit();
						}
						
				</script>
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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B>게시판(Search)</B></FONT></TD>
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
					OyesMall의 게시판을 관리하는 페이지입니다. 
				</TD>
			</TR>
		</TBODY>
	</TABLE>
	<%
			b_num = Request("b_num")

			 IF b_num <> "" Then

			SQL_R = "Update Board Set readcount = readcount + 1 Where num="&b_num

			Db.Execute SQL_R
			
	'		SQL2 = "Select * From board Where num="&b_num
			SQL2 = "Select * From board Where "&radio&" Like '%"&search_query&"%' and num="&b_num&" "
		
			Set RS_B = Db.Execute(SQL2)
			

			num_v = Rs_B("num")
			r_email = RS_B("email")
			ref = Rs_B("ref")
			r_step = Rs_B("r_step")
			reforder = Rs_B("reforder")
			title = Trim(RS_B("title"))
			
			
			Content = RS_B("content")
			Content = Replace(content,Chr(13)&Chr(10),"&nbsp;<BR><BR>")

			
			

	%>
	<Script language="javascript">
					function reply()
							{
								document.re.submit();
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
	<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="100%" borderColorLight=#999966 border=1>
					<TBODY>
						<TR>
							<TD width=140 bgColor=#336600 height=27 align=center>
								<FONT color=#ffffff><b>Subject</B></Font></TD>
							<TD  bgColor=#cccc99 colspan=3><font color=green>&nbsp;&nbsp;<B><%=title%></B></Font></TD>
						</TR>
						<TR>
							<TD width="20%" bgColor=#cccc99 height=27 align=center><b>Name</B></TD>
							<TD width="30%">&nbsp;&nbsp;<% IF RS_B("master") = "1" Then %><font face="comic sans ms bold" size=3><font color=red>Red</font><font color=#069FC6>Master</font></font><% Else %><%=RS_B("name")%><%End IF%></TD>
							<TD width="20%" bgColor=#cccc99 height=27 align=center><b>Date</B></TD>
							<TD width="30%">&nbsp;&nbsp;<%=Rs_B("postdate")%></TD>
						</TR>
						
						<TR>
							<TD width=140 bgColor=#cccc99 height=27 align=center><b>E-Mail</B></TD>
							<TD>&nbsp;&nbsp;<a href="javascript:e_mail();" ><%=Rs_B("email")%></A></TD>
							<TD width=140 bgColor=#cccc99 height=27 align=center><b>Homepage</B></TD>
							<TD>&nbsp;&nbsp;<A Href="<%=RS_b("home")%>" target=_new><%=Rs_b("home")%></A></TD>
						</TR>
						
					
					<Tbody>
					
			</Table>
			
			<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="100%" borderColorLight=#999966 border=0>
					<TBODY>
						<TR>
							<Td width=10></Td>
							<Td><%=content%></Td>
						</Tr>
						<%
							   
							  SQL_com = "Select Co_name, Co_date, Co_Content,co_seq,num,master,co_pass from Comment  where num=" &b_num
			  
							  Set RS_com = Db.Execute(SQL_com)
							  
							  IF Not RS_com.EOF Then

						%>
						<TR>
							<TD colspan=2 height=30></TD>
						</TR>
						<TR>
							<TD colspan=2><HR width="98%"></TD>
						</TR>

                        <%
									While Not RS_com.Eof 	
									co_content = RS_com("co_content")
									co_Content = Replace(co_content,Chr(13),"<BR>")
									
									co_num = RS_com("num")
									co_pass = RS_com("co_pass")
									co_seq = RS_com("co_seq")
									co_name = RS_com("co_name")
									co_date = Left(RS_com("co_date"),10)
									master = RS_com("master")
						%>  
						
						<TR onMouseOver="this.style.background='#e0ffe0'" onMouseOut="this.style.background='#D8D4B6'" >
							<TD colspan=2 align=center  >
								<Table border=0 width="95%" >
									<TR >
										<TD width="15%" valign=top><% IF master = "1" Then %><font face="comic sans ms bold" size=3><font color=red>Red</font><font color=#069FC6>Master</font></font><% Else %><%=co_name%><%End IF%></TD>
										<TD ><%=co_content%></Td>
										<TD width="15%" align=center valign=top><%=co_date%></TD>
										<TD width="3%" align=center valign=top><A href="./comment_del.asp?page=<%=page%>&num=<%=co_num%>&co_seq=<%=co_seq%>"><img src="./image/com_del.gif" border=0></A></TD>
									</TR>
								</Table>
							</TD>
						</TR>
						<%
								RS_com.MoveNext

								Wend

							End IF

							Set RS_com = Nothing
						%>
						
					<!-- 커멘트 쓰기 -->
						<Script language="javascript">
						function addComment()
							  {
								  if (document.frmMent.co_name.value=="") 
										{
										  alert("이름을 입력해 주세요");
										  document.frmMent.co_name.focus();
										  return;
										}
								if (document.frmMent.co_pass.value=="") 
										{
										  alert("비밀번호를 입력해 주세요");
										  document.frmMent.co_pass.focus();
										  return;
										}
								if (document.frmMent.co_content.value=="") 
										{
										  alert("내용을 입력해 주세요");
										  document.frmMent.co_content.focus();
										  return;
										}
								document.frmMent.submit();
							  }

							 
							</Script>
						
						<TR>
							<TD colspan=2><HR width="98%"></TD>
						</TR>
						<TR>
							<TD colspan=2 align=right>
								<form name="frmMent" action="./comment_ok.asp" Method="post">
								<input type="hidden" name="num" value="<%=b_num%>" >
								<input type="hidden" name="page" value="<%=page%>">
								<Table border=0 bordercolor=red cellSpacing=1 cellPadding=3 width="90%" >
									<Tbody>
									<TR bgcolor=#D8D4B6>
										<%
												IF admingubun <3 Then
										%>
										<TD align=right>Name  &nbsp;<BR><input type=text name="co_name" size=10 maxLength=10 >&nbsp;<BR>Password  &nbsp;<BR><input type=password name="co_pass" size=10 maxLength=10 >&nbsp;</TD>
										<% 
												Else
												
										%>
										<TD align=right>Name  &nbsp;<BR><input type=text name="co_name" size=10 maxLength=10 value="redmaster">&nbsp;<BR>Password  &nbsp;<BR><input type=password name="co_pass" size=10 maxLength=10  value="redscorpio">&nbsp;</TD>
										<%End IF%>
										<TD colspan=2 align=right width="470px">&nbsp;<Textarea name="co_content" rows=6 wrap=hard cols=60 style="OVERFLOW: auto; HEIGHT: 70px"></TextArea><input type=button value=comment class=button style="height:70px" onClick="addComment();" >&nbsp;&nbsp;&nbsp;</TD>
									</TR>
									</Tbody>
								</Table>
								

							</TD>
						</TR>
						<TR>
							<TD colspan=2><HR width="98%"></TD>
						</TR>
						</form><!-- 커멘트 쓰기 End -->
						
					</Tbody>
			</Table>
			<BR>
			<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="100%" borderColorLight=#999966 border=1>
					<TBODY>
						<Tr>
							<Td align=right colspan=11 bgColor=#cccc99 >
								<A href="javascript:reply();"  title="답변하기^^ "><img src="./image/reply.gif" border=0 ></a>&nbsp;&nbsp;
								<A href="./write.asp"  title="새글쓰기^^ "><img src="./image/write.gif" border=0 ></a>&nbsp;&nbsp;
								<A href="./edit.asp?num=<%=num_v%>"  title="수정하기^^ "><img src="./image/modify.gif" border=0 ></a>&nbsp;&nbsp;
								<A href="./delete_ok.asp?num=<%=num_v%>&page=<%=page%>" title="삭제^^ "><img src="./image/delete.gif" border=0 ></a>&nbsp;&nbsp;
								<A href="./list.asp"  title="리스트로^^ "><img src="./image/list.gif" border=0 ></a>&nbsp;&nbsp;&nbsp;
								</Td>
						</Tr>
					</Tbody>
					<form method=post action="./write.asp" name="re">
						<input type = hidden name = num value="<%=num_v%>">
						<input type = hidden name = ref value="<%=ref%>">
						<input type = hidden name = r_step value="<%=r_step%>">
						<input type = hidden name = reforder value="<%=reforder%>">
					</Form>
			</Table>
	<BR><BR>
	<%
			End IF
			Set RS_B = Nothing
	%>
	<!-- view end -->
	<BR>
	<script language="javascript">
	function del(num)
							{
								if(!confirm("정말로 삭제 하시겠습니까?")) return;					
								document.checkform.action="./delete_check.asp?page=<%=page%>";
								document.checkform.submit();
							}
	</Script>
	<div align=center>
	<TABLE cellSpacing="0" cellPadding="0" width="99%" border="0">
	<form method=post action="./member_list.asp" name="checkform">
			<TBODY>
			<TR>
				<TD align=middle width="4%" height=20 ><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">C</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="7%"  height=20  ><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">No.</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle   height=20  ><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Subject</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="18%"  height=20  ><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Writer</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle  height=20  width="20%"><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Date</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="10%"  height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Hit</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
			</TR>
			<% IF RS.EOF OR RS.BOF Then %>
			<TR>
				<TD align=center height=100 colspan=6>게시판에 등록된 글이 없습니다.</TD>
			</TR>
			</Tbody>
			</Form>
	</Table>
	<%
				Else
				Count = 1

				While Not Rs.Eof and Count <= 10
			%>
			<Tr onMouseOver="this.style.background='#313031'" onMouseOut="this.style.background='#000000'" valign="top">
				<TD vAlign=center align=middle>
					<Input type=checkbox name="chk" value="<%=Rs("num")%>"></TD>
				<TD vAlign=center align=middle><% IF RS("num") <> num_v  Then%><% IF RS("reforder") > 0 Then %>&nbsp;<%Else%><%=RS("num")%><%End IF%><%Else%><img src="../image/popicon.gif" border=0><%End If%></TD>
				<TD vAlign=center >&nbsp;&nbsp;
										<%
											IF RS("reforder") > 0 Then
											 AA = RS("reforder")
										
											for i=1 to AA
												Response.write "&nbsp;"
											next
										%>
											<img src="./image/rew.gif">
										<%End IF%>
											
																<A Href="./search.asp?page=<%=page%>&radio=<%=radio%>&search_query=<%=search_query%>&b_num=<%=RS("num")%>"><%=rs("title")%></A>
																<% IF DateDiff("h",RS("postdate"),Now()) < 24 Then %>&nbsp;<img src="./image/new1.gif"><%End IF%></TD>
				<TD vAlign=center align=middle><% IF RS("master") = "1" Then %><font face="comic sans ms bold" size=3><font color=red>Red</font><font color=#069FC6>Master</font></font><% Else %><%=RS("name")%><%End IF%></TD>
				<TD vAlign=center align=middle><%=rs("postdate")%></TD>
				<TD vAlign=center align=middle><%=rs("readcount")%></TD>
			</Tr>
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
				<Td  colspan=3>&nbsp;
					<input type="button" style="width:80px;" class=button2 value="글목록" onClick="b_list();" >&nbsp;
					<input type="button" style="width:80px;" class=button2 value="전체선택" onClick="all_check(true);" >&nbsp;
					<input type="button" style="width:80px;" class=button2 value="선택해제" onClick="all_check(false);" >&nbsp;
 
					<input type="button" value="선택 글 삭제" onclick="del();" style="width:80px;" class=button2>&nbsp;</Td>
				<Td Align=right colspan=3>

					<%
						intStart = int((page-1)/10)*10 + 1					
						intEnd = intStart + 9
					%>
					<% IF intstart <> 1 Then %>
				[<A Href="./search.asp?page=1&radio=<%=radio%>&search_query=<%=search_query%>">Start</A>]
				<% End IF%>
					<% If intstart = 1 Then %>
						&nbsp;
						
					<% Else %>
						<A Href="./search.asp?page=<%=intstart-1%>&radio=<%=radio%>&search_query=<%=search_query%>">◀</A>
					<% End IF %>

					<% For i=intstart to intend 
						
						IF i = int(page) Then 

							Response.Write "<b>"&i&"</b>"
						Else
					%>
						
							 <A Href="./search.asp?page=<%=i%>&radio=<%=radio%>&search_query=<%=search_query%>"> [<%=i%>]</a>
					<%
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
						<A Href="./search.asp?page=<%=intend+1%>&radio=<%=radio%>&search_query=<%=search_query%>">▶</A>
					<% End If%>
					<% IF intstart <> intend Then %>
				[<A Href="./search.asp?page=<%=T_page%>&radio=<%=radio%>&search_query=<%=search_query%>">End</A>]
				<% End IF%>&nbsp;
				</Td>
			</Tr>
			
			<Tr>
				
			</Tr>
			</Tbody>
			</Form>
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
	End IF
	Db.Close

	Set Db = Nothing
	
%>
