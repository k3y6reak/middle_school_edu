

	<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->

<%
	num = request("num")
	
	

	page = request("page")
	If page = "" Then
		page = 1
	End If

	SQL = "select count(num) as recCount from sell_man"
	Set Rs = Db.Execute(SQL)

	recordCount = Rs(0)
	
	pagesize = 15

	
	pagecount = int((recordCount-1)/pagesize) +1

	
	SQL = "Select Top " & pagesize & " * From sell_man "
	SQL = SQL & " where num not in "
	SQL = SQL & "(Select Top " & (int(Page - 1) * pagesize) & " num From sell_man"
	SQL = SQL & " Order By num DESC) order by num desc" 


	Set Rs = Db.Execute(SQL)
	

	T_page = Pagecount

	

	
%>


<html>
<head>
<title>◇ ◆ OyesMall 상품주문리스트◆ ◇</title>
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
			document.checkform.action="./delete_check.asp?page=<%=page%>";
			document.checkform.submit();
		}
	
	function edit(num)
		{
	//	document.checkform.action="./order_edit.asp?num="+num;
		document.checkform.action="./order_list.asp";
		document.checkform.submit();
		}
</SCRIPT>


<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">

				<SCRIPT language=javaScript>
				<!--
				function or_detail(order_num){window.open("./order_detail.asp?order_num="+order_num,"checkform","scrollbars=yes,toolbar=no,location=no,directories=no,status=no,width=590,height=350,resizable=no,menubar=no,top=5,left=5");
				}
				// -->
				</SCRIPT>
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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B>상품주문 리스트</B></FONT></TD>
							<TD align=middle width=150 bgColor=#222222><FONT face="돋움"><B>ORDER</B></FONT>
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
		
		 <TD vAlign=top align=left>&nbsp;&nbsp;OyesMall에서  상품이 주문된 현황을 관리하는곳입니다. 
			<BR></TD>
		
		</TR>
		</TBODY>
	</TABLE>
	


	<BR>
	<Div Align=Right>
	
		
		
		<B>	[<%=page%>/<%=T_page%>]</B>
	</Div>
	
	
	
	<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
	<form method=post action="./order_list.asp" name="checkform">
	    <input type=hidden value="<%=page%>" name=page >
		
		<TBODY>
			<TR>
				<TD align=middle width="3%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
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
				<TD align=middle width="12%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Order_Code</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle height=20 ><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Order_ID / Name</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="10%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Tel</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="10%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Order_Kind</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="10%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">T_Price</Font></B>
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
				<TD align=middle width="10%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">State</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="5%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Del</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
			</TR>

			<%
				IF NOT RS.EOF Then
				
				Count = 1

				While Not Rs.Eof and Count <= pagesize

					order_num = RS("order_num")
					num = RS("num")
					user_id = RS("user_id")
					total_p = RS("total_p")
					re_tel = RS("re_tel")
					order_date = Left(RS("order_date"),10)
					state = RS("state")
					Select Case state
						Case "0"
						str_state = "<font color=red>미확인</font>"
						Case "1"
						str_state = "주문접수"
						Case "2"
						str_state = "결제완료"
						Case "3"
						str_state = "발송준비중"
						Case "4"
						str_state = "발송완료"
					End Select

					
					kind = RS("re_kind")
					Select case kind
						case "1"
						order_kind = "카드"
						case "2"
						order_kind = "온라인"
						case "3"
						order_kind = "카드+온라인"
					End select
			%>

			
			<Tr onMouseOver="this.style.background='#313031'" onMouseOut="this.style.background='#000000'" valign="top">
				<TD vAlign=center align=middle><Input type=checkbox name="chk" 	value="<%=num%>"></TD>
				
				<TD vAlign=center align=middle><%=num%></TD>
				<TD vAlign=center align=center><A Href="./order_detail.asp?order_num=<%=order_num%>"><%=order_num%></A></TD>
				<TD vAlign=center Align=center ><A Href="./order_detail.asp?order_num=<%=order_num%>"><%=user_id%></a></TD>
				<TD vAlign=center Align=center ><A Href="./order_detail.asp?order_num=<%=order_num%>"><%=re_tel%></a></TD>
				<TD vAlign=center Align=center ><A Href="./order_detail.asp?order_num=<%=order_num%>"><%=order_kind%></a></TD>
				<TD vAlign=center Align=center ><%=FormatNumber(total_p,0)%>원</TD>
				<TD vAlign=center  Align=center ><%=order_date%></TD>
				<TD  vAlign=center Align=center><%=str_state%></TD>
				
				<TD vAlign=center align=middle><input type=button value="Del" class=button2  onClick="javascript:window.location.href='./delete_check.asp?order_num=<%=order_num%>';"> </TD>
				
			</TR>
			
			
			<%
				Rs.MoveNext

				Count = Count + 1

				Wend

				RS.Close
				Set RS = Nothing
			%>
			<TR>
	<TD colspan="10">
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
				<Td colspan=4>&nbsp;
					<input type="button" style="width:80px;" class=button2 value="전체선택" onClick="all_check(true);">&nbsp;
					<input type="button" style="width:80px;" class=button2 value="선택해제" onClick="all_check(false);">&nbsp;
 
					<input type="button" value="선택목록삭제" onclick="del();" style="width:100px;" class=button2>
				</Td>
				<Td Align=right colspan=6>

					<%
						intStart = int((page-1)/10)*10 + 1					
						intEnd = intStart + 9
						
					%>
					<% IF intstart <> 1 Then %>
				[<A Href="./order_list.asp?page=1">Start</A>]
				<% End IF%>
					<% If intstart = 1 Then %>
						&nbsp;
						
					<% Else %>
						<A Href="./order_list.asp?page=<%=intstart-1%>">◀</A>
					<% End IF %>

					<% For i=intstart to intend 
						
						IF i = int(page) Then 

							Response.Write "<b>"&i&"</b>"
						Else
						
						%>
						<A Href="./order_list.asp?page=<%=i%>"> [<%=i%>]</a>
						<%
						End if

						If int(intstart) =int(t_page) then  
							exit for
						end if
						intstart=intstart+1

					   Next
					 
					
					If intstart = T_page Then %>
						
						&nbsp;
					<% else %>
						<A Href="./order_list.asp?page=<%=intend+1%>">▶</A>
					<% End If%>
					<% IF intstart <> intend Then %>
				[<A Href="./order_list.asp?page=<%=T_page%>">End</A>]
				<% End IF%>&nbsp;
						</Td>
			
				
			</Tr>
			<%Else%>
			<TR>
				<Td align=center colspan=11 bgcolor=#cccc99 height=30><Font color=red>
					거래된 상품이 아직 없습니다.^^</Font></TD>
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