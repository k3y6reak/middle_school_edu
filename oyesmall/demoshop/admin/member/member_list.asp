
<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->
<%
	num = Request("num")

	page = request("page")

	If page = "" Then
		page = 1
	End If

	SQL = "select count(num) as recCount from members"

	Set Rs = Db.Execute(SQL)

	recordCount = Rs(0)
	
	pagesize = 10

	
	pagecount = int((recordCount-1)/pagesize) +1

	
	SQL = "Select Top " & pagesize & " * From members "
	SQL = SQL & " where num not in "
	SQL = SQL & "(Select Top " & (int(Page - 1) * pagesize) & " num From members"
	SQL = SQL & " Order By num DESC) order by num desc" 

	Set Rs = Db.Execute(SQL)

	T_page = Pagecount
%>


<html>
<head>
<title>::::::: OyesMall 회원 리스트</title>
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
			document.checkform.action="./join_delete.asp?page=<%=page%>";
			document.checkform.submit();
		}
	
	function mail(num)
		{
			document.checkform.action="../mailing/email.asp";
			document.checkform.submit();
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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B> MEMBERS</B></FONT></TD>
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
			
			<TD vAlign=top align=left>&nbsp;&nbsp;OyesMall에 가입한 모든 회원의 정보를 관리합니다. 
			<BR></TD>
		</TR>
		</TBODY>
	</TABLE>
	
	<BR>
	
	<DIV align=right>
		<B>전체회원수 :&nbsp;<font color=#ffffff><% response.write recordcount%></font>&nbsp;명</B></DIV>
	
	<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
	<form method=post action="./member_list.asp" name="checkform">
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
				<TD align=middle width="6%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">No.</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle height=20 ><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">ID</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="12%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Name</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="20%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">E-mail</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="12%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Phone</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="9%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Point</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="10%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Date</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
			</TR>

			<%
				Count = 1

				While Not Rs.Eof and Count <= 10
				
				num = RS("num")
				user_id = rs("user_id")
				name = RS("name")
				email = RS("email")
				tel1_1 = Rs("tel1_1")
				tel1_2 = Rs("tel1_2")
				tel1_3 = Rs("tel1_3")
				tel = tel1_1&"-"&tel1_2&"-"&tel1_3
				
				point = RS("point")
				postdate = RS("postdate")
				
				IF admingubun < "2" Then
					email = "redclub@redboard.net"
					tel = "000-0000-0000"
				
				End IF
				
			%>
			<Tr onMouseOver="this.style.background='#313031'" onMouseOut="this.style.background='#000000'" valign="top">
				<TD vAlign=center align=middle>
					<Input type=checkbox name="chk" value="<%=num%>"></TD>
				<TD vAlign=center align=middle><%=num%></TD>
				<TD vAlign=center align=center><A href="./member_edit.asp?num=<%=num%>"><%=user_id%></A></td>
				<TD vAlign=center align=center><A href="./member_edit.asp?num=<%=num%>&page=<%=page%>"><%=name%></A></Td>
				<TD vAlign=center align=center><%=email%></TD>
				<TD vAlign=center align=center><%=tel%></TD>
				<TD vAlign=center align=center><%=FormatNumber(point,0)%></TD>
				<TD vAlign=center align=middle><%=postdate%></TD>
				
			</TR>
			
			<%
				Rs.MoveNext

				Count = Count + 1

				Wend

				RS.Close
				Set RS = Nothing
			%>
			<TR>
	<TD colspan="8">
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
				<TD align=left colspan=3>&nbsp;
				<input type="button" style="width:80px;" class=button2 value="전체선택" onClick="all_check(true);">&nbsp;
					<input type="button" style="width:80px;" class=button2 value="선택해제" onClick="all_check(false);">&nbsp;
 
					<input type="button" value="선택회원 삭제" onclick="del();" style="width:80px;" class=button2>&nbsp;

					<input type="button" value="선택회원 메일 발송" onclick="mail();" style="width:110px;" class=button2></TD>
				<Td Align=right  colspan=5>

					<%
						intStart = int((page-1)/10)*10 + 1					
						intEnd = intStart + 9
					%>
					<% IF intstart <> 1 Then %>
				[<A Href="./member_list.asp?page=1">Start</A>]
				<% End IF%>
					<% If intstart = 1 Then %>
						&nbsp;
						
					<% Else %>
						<A Href="./member_list.asp?page=<%=intstart-1%>">◀</A>
					<% End IF %>

					<% For i=intstart to intend 
						
						IF i = int(page) Then 

							Response.Write "<b>"&i&"</b>"
						Else
						%>
						<A Href="./member_list.asp?page=<%=i%>"> [<%=i%>]</a> 
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
						<A Href="./member_list.asp?page=<%=intend+1%>">▶</A>
					<% End If%>
					<% IF intstart <> intend Then %>
				[<A Href="./member_list.asp?page=<%=T_page%>">End</A>]
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

		
		<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
		<Form name="Search" action="./member_search.asp" method=post  >
	  
		<TBODY>
			<TR>
				<TD colspan="4">
					<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD  height="20">
						&nbsp;&nbsp;<B><Font class="font_3">* 회원정보 검색</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				
			</TR>
			
			<TR>
				<TD  height=25 width="15%">
					<IMG src="../image/icon_orange.gif"> I D</FONT></B></TD>
				<TD><INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100px;background:#C5C5C5" maxLength=20 name=user_id2></TD>
				<TD height=25 width="15%">
					<IMG src="../image/icon_orange.gif">이 름 </FONT></B></TD>
				<TD><INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100px;background:#C5C5C5" maxLength=20 name=name2></TD>
				
			</TR>

			<TR>
				<TD  height=25>
					  <IMG src="../image/icon_orange.gif">E-Mail </FONT></B> </TD>
				<TD><INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:70%;background:#C5C5C5" maxLength=20 name=email2></TD>
				<TD  height=25>
					<IMG src="../image/icon_orange.gif">가입시기</FONT></B></TD>
				<TD>
					<INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:40%;background:#C5C5C5" maxLength=20 name=date1> ~
					<INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:40%;background:#C5C5C5" maxLength=20  name=date2></TD>
					
		
				
			</TR>
			<TR>
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
			
				<TD  colspan="4" height=40>&nbsp;
				<INPUT id=submit3 class=button2 style="width:80px;"type=submit value="Search" name=submit3></TD>
		</TR>		

		</TBODY>
		</FORM>
		</TABLE>



	
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