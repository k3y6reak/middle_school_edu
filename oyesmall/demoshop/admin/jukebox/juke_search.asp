<% Response.Expires = 0 %>


<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->

<%
	num = request("num")
	page = request("page")
	radio = Request("radio")
	AA = Request("AA")
	


'	Response.Write radio
'	response.end

	If page = "" Then
		page = 1
	End If

	SQL = "Select * From juke Where "&radio&" Like '%"&AA&"%'"
	SQL = SQL & " Order By num Desc" 


	Set Rs=server.createobject("adodb.recordset")
	rs.pagesize=10
	rs.open sql,db,1

	Recordcount = RS.Recordcount

	T_page = RS.Pagecount
%>


<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>◇ ◆ OyesMall Juke Box◆ ◇</title>

<Script Language="JavaScript">
<!--
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


	 function jukeit() {
						document.jForm.action="JukeBox_list.asp"
						document.jForm.submit();
					   }


		var checkflag = "false";
		function jCheck(field) {
			if (checkflag == "false") {
				for (i=0; i < field.length; i++) {
					field[i].checked=true;
				}
				checkflag = "true"
				return "   전 체 해 제   ";
			}
			else {
				for (i=0; i < field.length; i++) {
					field[i].checked=false;
				}
				checkflag = "false"
				return "   전 체 선 택   ";
			}
		}

//  다중 삭제 스크립트...
	function del(num)
	{
				
		if(!confirm("정말로 삭제 하시겠습니까?")) return;					
		document.checkform.action="./juke_del.asp?page=<%=page%>";
		document.checkform.submit();
				
				
	}

	




	function music() {
			var flag = "false";
			var MU = document.checkform.chk;
			for (i=0; i <= MU.length-1; i++) {
					if (document.checkform.chk[i].checked) {
							flag = "true";
					}
			}
			if (flag == "false") {
					alert ("최소한 하나는 선택하셔야죠~^^*");
					return false;
			}
			document.checkform.action="./myjuke.asp";
			document.checkform.submit();
	}

	


	function clearField(field)
		{ 
		if (field.value == field.defaultValue) 
			{  
			field.value = ""; 
			} 
		}
	
	function checkField(field)
		{ 
		if (field.value == "") 
			{ 
			field.value = field.defaultValue; 
			} 
		}
	
	function pop(pPage,Opt) 
		{ 
		popUpWin = window.open(pPage,'',Opt); 
		}

//-->
</SCRIPT>

	<SCRIPT language=JavaScript>


	function song()
			 {
			  var aa=document.all.jForm.check.length;
			  var c=0;
			  var yn;
			  if(aa==null || aa=="")
			  {
				  alert(" 선택할수 있는 노래가 없습니다.");
			  }  
			  else
			  {  
			  for(i=0;i<aa;i++)
			   { 
				  if(document.all.check[i].checked==true)
				   c++;
			   }   
			   }

				  if(c==0)
				   { alert(" 하나 이상의 항목을 선택해야 합니다."); }
				  else 
					{ 
					  { 
						url="song.asp";    
						window.open(url,"aaa","top=100,left=100,width=290,height=280,toolbar=no,location=0,directory=0,status=0,menubar=0,scrollbars=no,resizable=1");
						document.jForm.target="aaa";
						document.jForm.action = url;
						window.jForm.submit(); }
					}        
			}               
	//쥬크박스 듣기
	function jukeit(ID) 
		{
		window.open("my_juke.asp?j_asx="+ID, "jukebox","top=100,left=100,width=300,height=300,toolbar=no,location=0,directory=0,status=0,menubar=0,scrollbars=no,resizable=1");

		}

	function delit() 
		{
		if(!confirm("JukeBox 를 닫겠습니까?")) return;					
		document.checkform.action="./myjukeall_del.asp?page=<%=page%>";
		document.checkform.submit();
		}

	</SCRIPT>


<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">

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

<body bgcolor="#000000" text="#000000" leftMargin=0  topMargin=0 marginwidth="0" marginheight="0" onLoad="MM_preloadImages('images/del-o.gif')">
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
		 
		 <TD vAlign=top align=left>&nbsp;&nbsp;OyesMall의 Juke box를 관리 하는곳입니다. 
			<BR></TD>
		
		</TR>
		</TBODY>
	</TABLE>
	
<BR>
	


	
		<Div align=center>
	
	
	<Div Align=Right>
		
		<B>[&nbsp;Result:&nbsp;<font color=red><%= recordcount %></Font>&nbsp;곡&nbsp;]</B>&nbsp;
	</Div>
	<% IF RS.BOF or RS.EOF Then%>
		<Script Language="Javascript">
		
		alert(" 검색된 게시물이 없습니다. 다른 키워드를 이용하세요 ^^")
		history.go(-1);
    </Script>
			<%
				else
				pagecount = int((recordCount-1)/rs.pagesize) +1
				rs.absolutepage=page
			%>
	<TABLE cellSpacing="0" cellPadding="0" width="99%" border="0">
	<form method=post name="checkform">
	    <input type=hidden value="<%=page%>" name=page >
		<input type=hidden name=n_step value=<%=request("n_step")%>>
		<TBODY>
			<TR>
				<TD align=middle width="5%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
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
				<TD align=middle height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Title / Album</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align="middle" height=20 width="15%"><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Singer&nbsp;/&nbsp;Group</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="25%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">File Name</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				 <TD align=middle width="10%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">File Size</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				 <TD align=middle width="10%"height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Category</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				
				
				
				
			</TR>


			<%
				Count = 1

				While Not Rs.Eof and Count <= 10
			%>

  
			<Tr onMouseOver="this.style.background='#313031'" onMouseOut="this.style.background='#000000'" valign="center">
			
				<TD vAlign=center align=middle>
					<Input type=checkbox name="chk" value="<%=Rs("num")%>"></TD>
				<TD align=middle  height=25><%=rs("num")%></TD>
				<TD align=center  height=25 >&nbsp;<a href="mmst://211.181.176.131/ec_master_002/oyesmall/<%=Rs("category")%>/<%=Rs("mp3")%>"><%=rs("title")%></A></TD>
				<TD align="middle"  height="25" ><%=rs("name")%></TD>
				<TD align=middle   height=25>
					<%
						If Len(Rs("mp3")) > 15 Then
							Response.Write Left(Rs("mp3"),15)&".."
						Else
							Response.Write (Rs("mp3"))
						End If
					%>
					</TD>
				<TD align=middle   height=25><%=rs("filesize")%></TD>
				<TD align=middle   height=25><%=RS("category")%></TD>
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
				<Td  colspan=4 >&nbsp;
						<input type="button" style="width:80px;" class=button2 value="List" onClick="javascript:window.location.href='./jukebox_list.asp'">&nbsp;
						<input type="button" style="width:80px;" class=button2 value="전체선택" onClick="all_check(true);">&nbsp;
						<input type="button" style="width:80px;" class=button2 value="선택해제" onClick="all_check(false);">&nbsp;
	 
						

						<input type="button" value="선택 곡 담기" onclick="music();" style="width:80px;" class=button2>	
						</Td>		
				<Td Align=right colspan=3>

					<%
						intStart = int((page-1)/10)*10 + 1					
						intEnd = intStart + 9
					%>
					<% IF intstart <> 1 Then %>
				[<A Href="./juke_search.asp?page=1&radio=<%=radio%>&AA=<%=AA%>">Start</A>]
				<% End IF%>
					<% If intstart = 1 Then %>
						&nbsp;
						
					<% Else %>
						<A Href="./juke_search.asp?page=<%=intstart-1%>&radio=<%=radio%>&AA=<%=AA%>">◀</A>
					<% End IF %>

					<% For i=intstart to intend 
						
						IF i = int(page) Then 

							Response.Write "<b>"&i&"</b>"
						Else
					%>
						
							 <A Href="./juke_search.asp?page=<%=i%>&radio=<%=radio%>&AA=<%=AA%>"> [<%=i%>]</a>
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
						<A Href="./juke_search.asp?page=<%=intend+1%>&radio=<%=radio%>&AA=<%=AA%>">▶</A>
					<% End If%>
					<% IF intstart <> intend Then %>
				[<A Href="./juke_search.asp?page=<%=T_page%>&radio=<%=radio%>&AA=<%=AA%>">End</A>]
				<% End IF%>&nbsp;
				</Td>
			
						
			</Tr>
		
		</TBODY> 
	</FORM>
	</TABLE>
		<BR>
		
	



<!----- 쥬크박스----->


<%
'	Sql = "Select * From my_juke Order By num Asc"

	SQL = "SELECT J.num, J.title, J.name, J.category, M.SessionID, M.ck, M.mp3,M.j_num From Juke J, my_juke M WHERE J.num=M.ck AND M.SessionID="&Session.SessionID&" ORDER BY j_num ASC"
	
'	Response.write sql
'	response.end
	Set J_Rs = Db.Execute(SQL)

	If Not J_Rs.Eof Then

	
	
%>



	<Div align=center>

	<TABLE cellSpacing=0 cellPadding=0 width="99%" border=1 bordercolor="#4A494A">
		<Form name=jForm method=POST>
		<TBODY>
		  <tr>
			
				 <td rowspan="11" width=40% align=center bgcolor=#222222>
					<!--#include file = "./my_juke.asp"----->							
				</td>
				<td width="5%" align=center  height=25><Font color=ffffff><b>No.</b></font></td>

						<td align=center  height=25 width="17%"><Font color=ffffff><b>Title&nbsp;/&nbsp;Album</B></Font></td>

						<td width="13%" align=center  height=25><Font color=ffffff><b>Singer&nbsp;/&nbsp;Group</b></font></td>

						<td width="5%" align=center  height=25><Font color=ffffff><b>♬</b></font></td>

						<td width="5%" align=center  height=25><Font color=ffffff><B>Chk</B></font></td>

						<td width="5%" align=center  height=25><Font color=ffffff><b>Del</b></font></td>
			</tr>
			
			<%
				Count = 10

				While Not J_Rs.Eof and Count >0 

				no = 10 - Count + 1
			%>
					<tr bgcolor="#ffffff" onMouseOver="this.style.backgroundColor='#CBDFE4'" onMouseOut="this.style.backgroundColor='#ffffff'">
						
						<td align=center><%=no%></td>
						<td align=center><%=J_Rs("title")%></td>
						<td align=center><%=J_Rs("name")%></td>
						<td align=center><A href="mmst://211.181.176.131/ec_master_002/oyesmall/<%=J_Rs("category")%>/<%=J_Rs("mp3")%>"><Font color=Black><b>♬</b></font></a></td>
						<Td align=center><Input type=checkbox name=check value=<%=J_Rs("ck")%>></td>
					    <td align=center><A Href="./myjuke_del.asp?num=<%=J_Rs("j_num")%>"><img src="./images/del.gif" border=0></a></td>
						

						
					</tr>
			<%
				J_Rs.MoveNext
				Count = Count - 1
				Wend

				J_Rs.Close
				Set J_Rs = Nothing
				DB.Close
				Set DB = Nothing
				
				If  Count > 0 Then
				
					For i=1 To Count
			%>
			<tr bgcolor="#ffffff" onMouseOver="this.style.backgroundColor='#CBDFE4'" onMouseOut="this.style.backgroundColor='#ffffff'">
				<td align=center height=27>&nbsp;</td>
				<td align=center>&nbsp;</td>
				<td align=center>&nbsp;</td>
				<td align=center>&nbsp;</td>
				<td align=center>&nbsp;</td>
				<td align=center>&nbsp;</td>
			</tr>
			<% 
				Next
				End if
			%>
			
				
			</td>
		  </tr>
		</table>

		<BR>
<Div Align=right>
	<input type=button name="j_check" value="전 체 선 택 " OnClick='this.value=jCheck(this.form.check);' style="width:100px;" class=button2>
	&nbsp;&nbsp;&nbsp;
	<INPUT  style="width:100px;" class=button2 onclick="song();" type=button value=" My JukeBox 듣기 "> &nbsp;&nbsp;
	<INPUT style="width:100px;" class=button2 onclick="delit();" type=button value=" 쥬크박스 비우기 "> 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</Div>
		
	<% 
			End if  
			
			End if 
	%>
</Div >

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




