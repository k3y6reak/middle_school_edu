
<!---#include file="../dbconn.asp"--->
<!---#include file="../session3.asp"--->
<%
	page = Request("page")

	IF Page = "" Then
		Page = 1
	End IF

	SQL = "select count(num) as recCount from admin_tb"

	Set Rs = Db.Execute(SQL)

	recordCount = Rs(0)
	
	pagesize = 10

	
	pagecount = int((recordCount-1)/pagesize) +1

	
	SQL = "Select Top " & pagesize & " * From admin_tb "
	SQL = SQL & " where num not in "
	SQL = SQL & "(Select Top " & (int(Page - 1) * pagesize) & " num From admin_tb"
	SQL = SQL & " Order By num DESC) order by num DESC" 

	Set Rs = Db.Execute(SQL)

	T_page = Pagecount
	
	submitstr = " 등 록 "
	
	b_num = Request("b_num")

	 IF b_num <> "" Then

		SQL2 = "Select * From admin_tb Where num="&b_num

		Set RS_B = Db.Execute(SQL2)
		
		name2 = RS_B("name")
		email2 = RS_B("email")
		writedate2 = RS_B("writedate")
		phone2 = RS_B("phone")
		adminid2 = RS_B("adminid")
		adminpwd2 = RS_B("adminpwd")
		gubun2 = RS_B("gubun")
		Select case gubun2
			case "1"
			strgubun2 = "직원"
			case "3"
			strgubun2 = "총관리자"
		End Select

		RS_B.Close

		Set RS_B = Nothing

		submitstr = " 수 정 "
	End IF
%>

<html>
<head>
<title>◇ ◆ OyesMall Admin◆ ◇</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">
<style type="text/css">
.bu{BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:120px;background:#C5C5C5}
</style>
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
				<Script language=javascript>
					function search()
						{
							if(document.search1.search_query.value=="")
							{
								alert("검색할 키워드를 기입해 주세요");
								document.search1.search_query.focus();
								return false;
							}
							document.search1.submit();
						}
						
				</script>

				<script language="JavaScript">
<!--
function onlyNumber() {
	if(((event.keyCode > 64)&&(event.keyCode < 91))||((event.keyCode > 106)&&(event.keyCode < 123)))
		event.returnValue=false;
}
function nullCheck ( o , msg ) {
	if ( o.value.length == 0 ) {
		alert ( msg + "꼭 입력하셔야 합니다." );
		o.focus ();
		return true;
	}
	return false;
}
function Check ( o ) {
	if ( nullCheck ( o.name , "성명은 " ) ) return false;
	if ( nullCheck ( o.adminid , "아이디는 " ) ) return false;
	if ( nullCheck ( o.adminpwd , "비밀번호는 " ) ) return false;
	if ( nullCheck ( o.phone , "전화번호는 " ) ) return false;
}
//-->
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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B>직원관리(List)</B></FONT></TD>
							<TD align=middle width=150 bgColor=#222222><FONT face=돋움 ><B>ADMINISTER</B></FONT>
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
					OyesMall의 직원을 관리하는 페이지입니다. 
				</TD>
			</TR>
		</TBODY>
	</TABLE>
	<!-- view start -->

				
				<BR>
				<Div align=center>
	<Table width="99%" cellSpacing="1" cellPadding="0" border="0" bgcolor="#4A494A">
	<form method="post" action="write_ok.asp" name="order4Form" onSubmit="return Check(this)">
	<TR>
		<TD>
			<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" bgcolor="#000000">
				<TBODY>
					<TR>
						<TD width="100" height="27" align="center" bgcolor="#4A494A">
							<b>Name</b>&nbsp;&nbsp;
						</TD>
						<TD>
							&nbsp;&nbsp;<input type=text name="name" value="<%=name2%>" class="bu">
						</TD>
						<TD width="100" height="27" align="center" bgcolor="#4A494A">
							<b>ID</b>&nbsp;&nbsp;
						</TD>
						<TD>
							&nbsp;&nbsp;<input type=text name="adminid" class="bu" value="<%=adminid2%>">
						</TD>
					</TR>
					<TR>
						<TD bgcolor="#4A494A" height="27" align="center">
							<b>Email</b>&nbsp;&nbsp;
						</TD>
						<TD>
							&nbsp;&nbsp;<input type=text name="email" class="bu" value="<%=Email2%>" style="width:150px;">
						</TD>
						<TD width="100" height="27" align="center" bgcolor="#4A494A">
							<b>PassWord</b>&nbsp;&nbsp;
						</TD>
						<TD>
							&nbsp;&nbsp;<input type=text name="adminpwd" class="bu" value="<%=adminpwd2%>">
						</TD>
					</TR>
					<TR>
						<TD bgcolor="#4A494A" height="27" align="center">
							<b>Phone</b>&nbsp;&nbsp;
						</TD>
						<TD>
							&nbsp;&nbsp;<input type=text name="phone" class="bu" value="<%=Phone2%>" onKeyDown=onlyNumber()>
						</TD>
						<TD width="100" height="27" align="center" bgcolor="#4A494A">
							<b>Section</b>&nbsp;&nbsp;
						</TD>
						<TD>
							&nbsp;&nbsp;<Select name="gubun" style="background:#C5C5C5 ">
										<option value="<%=gubun2%>" selected >&nbsp;<%=strgubun2%></option>
										<Option Value="1">&nbsp;직원</Option>
										<Option Value="3">&nbsp;총관리자</Option>
								</Select>
						</TD>
					</TR>
					
					
				</TBODY>
			</TABLE>
		</TD>
	</TR>
</Table>
			<BR>
			
			
			<TABLE cellSpacing="0" cellPadding="0" width="99%" border="0">
					<TBODY>
						<Tr>
							<Td align=center  >
								<input type="hidden" name="editnum" value="<%=b_num%>">
								<input type="submit" style="width:80px;" class=button2 value="<%=submitstr%>" >
								</Td>
						</Tr>
					</Tbody>
					
			</Table>
			</Form>
			</div>
	

	<!-- view end -->
	<BR>
	<script language="javascript">
	function del(num)
							{
								if(!confirm("정말로 삭제 하시겠습니까?")) return;					
								document.checkform.action="./del.asp?page=<%=page%>";
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
						<B><Font class="font_3">name</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="15%"  height=20  ><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">ID</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="20%"  height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Email</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle  height=20  width="15%"><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Phone</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle  height=20  width="10%"><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Section</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle  height=20  width="10%"><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="18">
						<B><Font class="font_3">Date</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				
			</TR>
			<% IF RS.EOF OR RS.BOF Then %>
			<TR>
				<TD align=center height=100 colspan=8>등록된 직원이 없습니다.</TD>
			</TR>
			</Tbody>
			</Form>
	</Table>
	<%Else%>
			<%
				Count = 1

				While Not Rs.Eof and Count <= 10
				num = RS("num")
				name = RS("name")
				email = RS("email")
				writedate = Left(RS("writedate"),10)
				phone = RS("phone")
				adminid = RS("adminid")
				gubun = RS("gubun")
				Select case gubun
					case "0"
					strgubun = "직원"
					case "1"
					strgubun = "총관리자"
				End Select
			%>
			<Tr onMouseOver="this.style.background='#313031'" onMouseOut="this.style.background='#000000'" valign="top">
				<TD vAlign=center align=middle>
					<Input type=checkbox name="chk" value="<%=num%>"></TD>
				<TD vAlign=center align=middle><% IF num <> num_v  Then%><%=num%><%Else%><img src="../image/popicon.gif" border=0><%End If%></TD>
				<TD vAlign=center align=middle>&nbsp;&nbsp;<A Href="./list.asp?page=<%=page%>&b_num=<%=num%>"><%=name%></A>
																</TD>
				<TD vAlign=center align=middle><A Href="./list.asp?page=<%=page%>&b_num=<%=num%>"><%=adminid%></a></TD>
				<TD vAlign=center align=middle><A Href="./list.asp?page=<%=page%>&b_num=<%=num%>"><%=email%></a></TD>
				<TD vAlign=center align=middle><A Href="./list.asp?page=<%=page%>&b_num=<%=num%>"><%=phone%></a></TD>
				<TD vAlign=center align=middle><%=strgubun%></TD>
				<TD vAlign=center align=middle><%=writedate%></TD>
			</Tr>
			<%
				Rs.MoveNext

				Count = Count + 1

				Wend

				RS.close

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
				<Td  colspan=3 >&nbsp;
					
					<input type="button" style="width:80px;" class=button2 value="전체선택" onClick="all_check(true);" >&nbsp;
					<input type="button"style="width:80px;" class=button2 value="선택해제" onClick="all_check(false);" >&nbsp;
 
					<input type="button" value="선택삭제" onclick="del();" style="width:80px;" class=button2>&nbsp;</Td>
				<Td Align=right colspan=3>

					<%
						intStart = int((page-1)/10)*10 + 1					
						intEnd = intStart + 9
					%>
					<% IF intstart <> 1 Then %>
				[<A Href="./list.asp?page=1">Start</A>]
				<% End IF%>
					<% If intstart = 1 Then %>
						&nbsp;
						
					<% Else %>
						<A Href="./list.asp?page=<%=intstart-1%>">◀</A>
					<% End IF %>

					<% For i=intstart to intend 
						
						IF i = int(page) Then 

							Response.Write "<b>"&i&"</b>"
						Else
						
							Response.Write " <A Href=./list.asp?page="&i&"> ["&i&"]</a> "
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
						<A Href="./list.asp?page=<%=intend+1%>">▶</A>
					<% End If%>
					<% IF intstart <> intend Then %>
				[<A Href="./list.asp?page=<%=T_page%>">End</A>]
				<% End IF%>&nbsp;
				</Td>
			</Tr>
			
			
			</Tbody>
			</Form>
	</Table>
	<%End IF%>
	<BR>

				

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