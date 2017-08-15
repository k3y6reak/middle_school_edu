

	<!---#include file="../dbconn.asp"--->
	<!---#include file="../session.asp"--->
<%
	num = request("num")
	page = request("page")

	If page = "" Then
		page = 1
	End If

	SQL = "select count(num) as recCount from banner"
	Set Rs = Db.Execute(SQL)

	recordCount = Rs(0)
	
	pagesize = 10

	
	pagecount = int((recordCount-1)/pagesize) +1

	
	SQL = "Select Top " & pagesize & " * From banner "
	SQL = SQL & " where num not in "
	SQL = SQL & "(Select Top " & (int(Page - 1) * pagesize) & " num From banner"
	SQL = SQL & " Order By num DESC) order by num desc" 


	Set Rs = Db.Execute(SQL)
	

	T_page = Pagecount

	

	
%>


<html>
<head>
<title>◇ ◆ OyesMall Event 상품리스트◆ ◇</title>
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
			document.checkform.action="./event_del.asp?page=<%=page%>";
			document.checkform.submit();
		}
	


	
	
	function pop(pPage,Opt) 
		{ 
		popUpWin = window.open(pPage,'',Opt); 
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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B> Event 상품 리스트</B></FONT></TD>
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
	


	
	<Div Align=Right>
	
		
		
		<B>[<A href="./event_write.asp">Event 상품등록</a>]&nbsp;[<% response.write page %>/<% response.write T_page %>]</B>
	</Div>
	
	
	
	<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
	<form method=post action="./goods_list.asp" name="checkform">
	    <input type=hidden value="<%=page%>" name=page >
		<TBODY>
			<TR>
				<TD align=middle width="4%"  height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">C</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="5%"><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">No.</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				 <TD align=middle width="30%" ><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Event Subject</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				 <TD align=middle width="24%" ><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Category</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				
				<TD align=middle width="25%" ><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Selling</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				 <TD align=middle width="5%"><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Edit</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="5%" ><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Delete</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				
				
			
				
			</TR>

			<%
				IF NOT RS.EOF Then
				
				Count = 1

				While Not Rs.Eof and Count <= 10
			%>

  
			<Tr onMouseOver="this.style.background='#313031'" onMouseOut="this.style.background='#000000'" valign="top">
				<TD vAlign=center align=middle><Input type=checkbox name="chk" 	value="<%=Rs("num")%>"></TD>
				
				<TD vAlign=center align=middle><%=rs("num")%></TD>
				
				<TD vAlign=center align=center><A 							href="./event_view.asp?num=<%=rs("num")%>&page=<%=page%>"><B><%=rs("b_name")%></B></A></TD>
				<TD vAlign=center align=middle><%=rs("cate")%></TD>
				<TD vAlign=center align=middle>
							<%
									IF RS("mainimage") = "1" Then
										Response.Write "<b><font color=red>M</font></B>ain Image"
									Else
										Response.Write "&nbsp;"
									End IF

									IF RS("nomi") = "2" Then
										Response.Write "<b><font color=red>C</font></B>ategory Top Event"
									Else
										Response.write "&nbsp;"
									End IF

									IF RS("top3") = "1" Then
										Response.Write "<b><font color=red>T</font></B>op Best 3 Event"
									Else
										Response.Write "&nbsp;"
									End IF

									IF RS("category_top") = "1" Then
										Response.Write "<b><font color=red>T</font></B>op Main Event"
									Else
										Response.Write "&nbsp;"
									End IF


							%></TD>
				<TD vAlign=center align=center><A 							href="./event_edit.asp?num=<%=rs("num")%>&page=<%=page%>"><img src="../image/edit.gif" border=0></A></TD>
				<TD vAlign=center align=center><A 							href="./event_delete.asp?num=<%=rs("num")%>&page=<%=page%>"><img src="../image/del.gif" border=0></A></TD>
				
				
				
			</TR>
					
			
			<%
				Rs.MoveNext

				Count = Count + 1

				Wend
			%>
			<TR>
	<TD colspan="7">
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
			<Td align=left >&nbsp;
					<input type="button"  value="상품등록" onClick="javascript:window.location.href='./event_write.asp'" style="width:80px;" class=button2>&nbsp;
					<input type="button" style="width:80px;" class=button2 value="전체선택" onClick="all_check(true);">&nbsp;
					<input type="button" style="width:80px;" class=button2 value="선택해제" onClick="all_check(false);">&nbsp;
 
					<input type="button" value="선택상품삭제" onclick="del();" style="width:80px;" class=button2>
				</Td>
				<Td Align=right >

					<%
						intStart = int((page-1)/10)*10 + 1					
						intEnd = intStart + 9
					%>
					<% IF intstart <> 1 Then %>
				[<A Href="./event_list.asp?page=1">Start</A>]
				<% End IF%>
					<% If intstart = 1 Then %>
						&nbsp;
						
					<% Else %>
						<A Href="./event_list.asp?page=<%=intstart-1%>">◀</A>
					<% End IF %>

					<% For i=intstart to intend 
						
						IF i = int(page) Then 

							Response.Write "<B>"&i&"</B>"
						Else
					%>
							<A Href="./event_list.asp?page=<%=i%>"> [<%=i%>]</a> 
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
						<A Href="./event_list.asp?page=<%=intend+1%>">▶</A>
					<% End If%>
					<% IF intstart <> intend Then %>
				[<A Href="./event_list.asp?page=<%=T_page%>">End</A>]
				<% End IF%>&nbsp;
						</Td>
			
				
			</Tr>
			<%Else%>
			<TR>
				<Td align=center colspan=11 bgcolor=#cccc99 height=30><Font color=red>
					등록된 상품이 아직 없습니다.^^</Font></TD>
			</TR>
			<%End IF%>
		
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