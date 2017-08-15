

<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->
<%
	num = request("num")
	page = request("page")

	If page = "" Then
		page = 1
	End If

	SQL = "select count(num) as recCount from goods"
	Set Rs = Db.Execute(SQL)

	recordCount = Rs(0)
	
	pagesize = 10

	
	pagecount = int((recordCount-1)/pagesize) +1

	
	SQL = "Select Top " & pagesize & " * From goods "
	SQL = SQL & " where num not in "
	SQL = SQL & "(Select Top " & (int(Page - 1) * pagesize) & " num From goods"
	SQL = SQL & " Order By num DESC) order by num desc" 


	Set Rs = Db.Execute(SQL)
	

	T_page = Pagecount

	

	
%>


<html>
<head>
<title>◇ ◆ OyesMall 상품리스트◆ ◇</title>
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
			document.checkform.action="./goods_re_delete.asp?page=<%=page%>";
			document.checkform.submit();
		}
	
	function write()
	{
		alert("먼저 카테고리를 선택하셔야 합니다. ^^");				
		document.checkform.action="../category/cate_list.asp";
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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B>상품 리스트</B></FONT></TD>
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
		 
		 <TD vAlign=top align=left>&nbsp;&nbsp;OyesMall에 등록된 상품 목록을 관리하는곳입니다. 
			<BR></TD>
		
		</TR>
		</TBODY>
	</TABLE>
	


	
	<Div Align=Right>
	
		
		
		<B>[<A href="javascript:write();">상품등록</a>]&nbsp;	[<% response.write page %>/<% response.write T_page %>]</B>
	</Div>
	
	
	
	<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
	<form method=post action="./goods_list.asp" name="checkform">
	    <input type=hidden value="<%=page%>" name=page >
		<TBODY>
			<TR>
				<TD align=middle width="4%"  height=20>
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">C</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="6%" height=20>
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">No.</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="13%" height=20>
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Category</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle height=20 width="13%">
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Code</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle height=20>
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Subject</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="13%" height=20>
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Company</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="9%" height=20>
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Price</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				
				<TD align=middle width="7%" height=20>
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Stock</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="10%" height=20>
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Selling</Font></B>
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
				<TD vAlign=center align=center><%=RS("ca1")%></TD>
				<TD vAlign=center >&nbsp;<%=rs("g_code")%></TD>
				<TD vAlign=center >&nbsp;<A href="./goods_view.asp?num=<%=rs("num")%>&page=<%=page%>"><%
						If Len(RS("g_name")) > 20 Then
							Response.Write Left(RS("g_name"),20)&"&nbsp;..."
						Else
							Response.Write (RS("g_name"))
						End If
					%></A></TD>
				<TD vAlign=center >&nbsp;<%
						If Len(RS("g_com")) > 10 Then
							Response.Write Left(RS("g_com"),10)&"&nbsp;..."
						Else
							Response.Write (RS("g_com"))
						End If
					%></TD>
				<TD vAlign=center align=center><%=FormatNumber(RS("or_p"),0)%></TD>
				
				<TD vAlign=center align=middle><%=Rs("r_ea")%></TD>
				<TD vAlign=center align=middle>
							<%
									IF RS("best_choice") = "1" Then
										Response.Write "<Font color=red>B</font>est_choice"
									Else
										Response.write "&nbsp;"
									End IF
									
									IF RS("Weekly_Best") = "1" Then
										Response.Write "<Font color=red>W</font>eekly_Best"
									Else
										Response.write "&nbsp;"
									End IF

									IF RS("m_choice") = "1" Then
										Response.Write "<Font color=red>M</font>ain Today Choice"
									Else
										Response.write "&nbsp;"
									End IF

									IF RS("choice") = "1" Then
										Response.Write "<Font color=red>T</font>oday Choice"
									Else
										Response.write "&nbsp;"
									End IF

									IF RS("event_2") = "1" Then
										Response.Write "<Font color=red>E</font>vent"
									Else
										Response.write "&nbsp;"
									End IF
							%></TD>
			</TR>
		
					
			
			<%
				Rs.MoveNext

				Count = Count + 1

				Wend
			%>
			<TR>
	<TD colspan="9">
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
				<Td align=left  >&nbsp;
					<input type="button"  value="상품등록" onClick="javascript:window.location.href='../category/cate_list.asp'" style="width:80px;" class=button2>&nbsp;
					<input type="button"  value="전체선택" onClick="all_check(true);" style="width:80px;" class=button2>&nbsp;
					<input type="button"  value="선택해제" onClick="all_check(false);" style="width:80px;" class=button2>&nbsp;
 
					<input type="button" value="선택상품삭제" onclick="del();" style="width:80px;" class=button2>
				</Td>
				<Td   align=right>

					<%
						intStart = int((page-1)/10)*10 + 1					
						intEnd = intStart + 9
					%>
					<% IF intstart <> 1 Then %>
				[<A Href="./goods_list.asp?page=1">Start</A>]
				<% End IF%>
					<% If intstart = 1 Then %>
						&nbsp;
						
					<% Else %>
						<A Href="./goods_list.asp?page=<%=intstart-1%>">◀</A>
					<% End IF %>

					<% For i=intstart to intend 
						
						IF i = int(page) Then 

							Response.Write "<B>"&i&"</B>"
						Else
						
							Response.Write " <A Href=./goods_list.asp?page="&i&"> ["&i&"]</a> "
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
						<A Href="./goods_list.asp?page=<%=intend+1%>">▶</A>
					<% End If%>
					<% IF intstart <> intend Then %>
				[<A Href="./goods_list.asp?page=<%=T_page%>">End</A>]
				<% End IF%>&nbsp;
						</Td>
			</Tr>
			
			<%
					Else
			%>
			<TR>
				<Td align=center colspan=11 bgcolor=#cccc99 height=30><Font color=red>
					등록된 상품이 아직 없습니다.^^</Font></TD>
			</TR>
			<%
					End IF
					RS.Close
					
					Set RS = Nothing
			%>
		
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
	<Form name="Search" action="./goods_search.asp" method=post>
  
	<TBODY>
		<TR>
			<TD colspan=4>
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD  height="20">
						&nbsp;&nbsp;<B><Font class="font_3">* 상품정보 검색</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		</TD>
		</TR>
		
		
		<TR>
			
			<TD  height=25 width="15%">
				<IMG src="../image/icon_orange.gif">카테고리</FONT></B> 
				</TD>
			<TD width="35%"><Select name=catename style="background:#C5C5C5 ">
										<Option Value="">&nbsp;선 택</Option>
										<Option Value="Men">&nbsp;Men</Option>
										<Option Value="Women">&nbsp;Women</Option>
										<Option Value="Kids">&nbsp;Kids&Baby</Option>
										<Option Value="Home">&nbsp;Home & Office</Option>
										<Option Value="Electronics">&nbsp;Electronics</Option>
										<Option Value="Books">&nbsp;Books & Media</Option>
										<Option Value="Leisure">&nbsp;Leisure & Sports</Option>
										<Option Value="Hobby">&nbsp;Hobby</Option>
										<Option Value="Luxury">&nbsp;Luxury</Option>
								</Select></TD>
			<TD  height=25 width="15%">
				<IMG src="../image/icon_orange.gif">상품코드</FONT></B></TD>
			<TD width="35%"><INPUT  maxLength=20 name=g_code2 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:70%;background:#C5C5C5"></TD>
		</TR>

		<TR>
			
			<TD  height=25>
				<IMG src="../image/icon_orange.gif">상품명 </FONT></B></TD>
			<TD><INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:70%;background:#C5C5C5" maxLength=20 name=g_name2></TD>
				
			<TD  height=25>
			  <IMG src="../image/icon_orange.gif">제조사 </FONT></B> </TD>
			<TD><INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:70%;background:#C5C5C5" maxLength=20 name=g_com2></TD>
			
		</TR>
			
		<TR>
			<TD  height=25>
				<IMG src="../image/icon_orange.gif">가격대 </FONT></B> 
				</TD>
			<TD>
				<SELECT class=lm  style="WIDTH: 90px;BACKGROUND: #C5C5C5; " name=or_p1> 
									<OPTION value=10000 selected>&nbsp;10,000원</OPTION> 
									<OPTION value=20000>&nbsp;20,000원</OPTION> 
									<OPTION value=30000>&nbsp;30,000원</OPTION> 
									<OPTION value=40000>&nbsp;40,000원</OPTION> 
									<OPTION value=50000>&nbsp;50,000원</OPTION> 
									<OPTION value=60000>&nbsp;60,000원</OPTION> 
									<OPTION value=70000>&nbsp;70,000원</OPTION> 
									<OPTION value=80000>&nbsp;80,000원</OPTION> 
									<OPTION value=90000>&nbsp;90,000원</OPTION> 
									<OPTION value=100000>&nbsp;100,000원</OPTION> 
									<OPTION value=150000>&nbsp;150,000원</OPTION> 
									<OPTION value=200000>&nbsp;200,000원</OPTION> 
									<OPTION value=250000>&nbsp;250,000원</OPTION> 
									<OPTION value=300000>&nbsp;300,000원</OPTION> 
									<OPTION value=350000>&nbsp;350,000원</OPTION> 
									<OPTION value=400000>&nbsp;400,000원</OPTION> 
									<OPTION value=450000>&nbsp;450,000원</OPTION> 
									<OPTION value=500000>&nbsp;500,000원</OPTION>
							  </SELECT> 이상 ~ 
                              <SELECT class=lm style="WIDTH: 90px;BACKGROUND: #C5C5C5; "  name=or_p2> 
									<OPTION value=99999999999 selected>&nbsp;all price</OPTION> 
									<OPTION value=20000>&nbsp;20,000원</OPTION> 
									<OPTION 	value=30000>&nbsp;30,000원</OPTION>
									<OPTION 	value=40000>&nbsp;40,000원</OPTION>
									<OPTION value=50000>&nbsp;50,000원</OPTION>
									<OPTION 	value=60000>&nbsp;60,000원</OPTION>
									<OPTION 	value=70000>&nbsp;70,000원</OPTION>
									<OPTION value=80000>&nbsp;80,000원</OPTION>
									<OPTION 	value=90000>&nbsp;90,000원</OPTION> 
									<OPTION 	value=100000>&nbsp;100,000원</OPTION> 
									<OPTION value=150000>&nbsp;150,000원</OPTION> 
									<OPTION 	value=200000>&nbsp;200,000원</OPTION> 
									<OPTION value=250000>&nbsp;250,000원</OPTION> 
									<OPTION value=300000>&nbsp;300,000원</OPTION> 
									<OPTION value=350000>&nbsp;350,000원</OPTION> 
									<OPTION 	value=400000>&nbsp;400,000원</OPTION> 
									<OPTION value=450000>&nbsp;450,000원</OPTION>
									<OPTION 	value=500000>&nbsp;500,000원</OPTION>
								</SELECT> 이하
			</TD>
			<TD  height=25>
				<IMG src="../image/icon_orange.gif">등록일</FONT></B></TD>
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
			
			<TD  colspan=4 height=40 >&nbsp;
			<INPUT  style="width:80px;" type=submit value="Search" name=submit3 class=button2 >&nbsp;</TD>
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