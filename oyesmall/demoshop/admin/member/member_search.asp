

	<!---#include file="../dbconn.asp"--->
	<!---#include file="../session.asp"--->
<%
	num = Request("num")

	name = Replace(Request("name2"),",","")
    name = Replace(name," ","")
    
	user_id = Replace(Request("user_id2"),",","")
    user_id = Replace(user_id," ","")
    
	email = Replace(Request("email2"),",","")
    email = Replace(email," ","")

	
    date1 = Replace(Request("date1"),",","")
    date1 = Replace(date1," ","")	 
	date2 = Replace(Request("date2"),",","")
    date2 = Replace(date2," ","")
	

'	Response.write user_id
'	response.end

	page = request("page")

	If page = "" Then
		page = 1
	End If

		Set Rs = Server.CreateObject("ADODB.Recordset")

	sql_query = ""
	
	'Name으로 검색했을 경우..
	If name <> "" then 
		sql_query = sql_query & "name Like '%"& name &"%'"
	End If

	'ID로 검색했을 경우..
	If user_id <> "" then 
		If name <> "" then
			sql_query = sql_query & " and user_id Like '%"& user_id &"%'"
		Else
			sql_query = sql_query & "user_id Like '%"& user_id &"%'"
		End if
	End If

	'E.mail로 검색했을 경우..
	If email <> "" then 
		If name <> "" then
			sql_query = sql_query & " and email Like '%"& email &"%'"
		Elseif user_id <> "" then
			sql_query = sql_query & " and email Like '%"& email &"%'"
		Else
			sql_query = sql_query & "email Like '%"& email &"%'"
		End if
	End If


	
'	등록날짜로 검색했을 경우..
	If date1 <> "" or date2 <> "" then 
		If name <> "" then
			sql_query = sql_query & " and postdate between convert(datetime,'"&year(date1)&"-"&month(date1)&"-"&day(date1)&"') AND convert(datetime,'"&year(date2)&"-"&month(date2)&"-"&day(date2)&"')"
		Elseif user_id <> "" then
			sql_query = sql_query & " and postdate between convert(datetime,'"&year(date1)&"-"&month(date1)&"-"&day(date1)&"') AND convert(datetime,'"&year(date2)&"-"&month(date2)&"-"&day(date2)&"')"
		Elseif email <> "" then
			sql_query = sql_query & " and postdate between convert(datetime,'"&year(date1)&"-"&month(date1)&"-"&day(date1)&"') AND convert(datetime,'"&year(date2)&"-"&month(date2)&"-"&day(date2)&"')"
		Else
			sql_query = sql_query & "postdate between convert(datetime,'"&year(date1)&"-"&month(date1)&"-"&day(date1)&"') AND convert(datetime,'"&year(date2)&"-"&month(date2)&"-"&day(date2)&"')"
		End if
	End If

	'쿼리실행
	sql_query = "Select * from members where "& sql_query &" order by num desc"


	Set Rs=server.createobject("adodb.recordset")
	rs.pagesize=10
	rs.open sql_query,db,1

	T_page = RS.Pagecount
	nCount = Rs.PageSize


%>


<html>
<head>
<title>::::::: OyesMall 회원 검색 페이지 ::::::::</title>
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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B> MEMBERS (Search)</B></FONT></TD>
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
	
	<DIV align=right><B>검색회원수 :&nbsp;<font color=#ffffff><% response.write rs.recordcount%></font> 명</B>&nbsp;&nbsp;</DIV>
		<!-- 검색된 결과가  없을 경우 ---->

	<% If Rs.Bof or Rs.Eof Then %> 
	<Script Language="Javascript">
		
		alert(" 검색된 회원이 없습니다. 다른 키워드를 이용하세요 ^^")
		history.go(-1);
    </Script>
	
			<% Else %>
	<!---- 검색된 결과가 존재할 경우 ---->
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
			'	Count = 1

				While Not Rs.Eof' and Count <= 10
			%>
			<Tr onMouseOver="this.style.background='#313031'" onMouseOut="this.style.background='#000000'" valign="top">
				
				<TD vAlign=center align=middle><Input type=checkbox name="chk" 		value="<%=Rs("num")%>"></TD>
				
				<TD vAlign=center align=middle><%=rs("num")%></TD>
				<TD vAlign=center align=center><A href="./member_edit.asp?num=<%=rs("num")%>"><%=rs("user_id")%></A></td>
				<TD vAlign=center align=center><A href="./member_edit.asp?num=<%=rs("num")%>"><%=Rs("name")%></A></Td>
				<TD vAlign=center align=center><%=Rs("email")%></TD>
				<TD vAlign=center align=center><%=Rs("tel1_1")%>-<%=Rs("tel1_2")%>-<%=Rs("tel1_3")%></TD>
				<TD vAlign=center align=center><%=rs("point")%></TD>
				<TD vAlign=center align=middle><%=Rs("postdate")%></TD>
				
			</TR>
			
			<%
				Rs.MoveNext

			'	Count = Count + 1

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
				<Td  >&nbsp;
					<input type="button" class=button2 style="width:80px;" value="List" onClick="javascript:window.location.href='./member_list.asp'">&nbsp;
					<input type="button" class=button2 style="width:80px;" value="전체선택" onClick="all_check(true);">&nbsp;
					<input type="button" class=button2 style="width:80px;" value="선택해제" onClick="all_check(false);">&nbsp;
 
					<input type="button" value="선택회원 삭제" onclick="del();" class=button2 style="width:80px;">&nbsp;

					<input type="button" value="선택회원 메일 발송" onclick="mail();" class=button2 style="width:110px;">

				</Td>
			</Tr>
			</TBODY>
			</FORM>
		</TABLE>
		<% end if%>

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
				<TD><INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:70%;background:#C5C5C5" maxLength=20 name=user_id2></TD>
				<TD height=25 width="15%">
					<IMG src="../image/icon_orange.gif">이 름 </FONT></B></TD>
				<TD><INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:70%;background:#C5C5C5" maxLength=20 name=name2></TD>
				
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

