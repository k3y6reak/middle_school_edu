<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->
<%
	num = request("num")
	page = request("page")

	

	If page = "" Then
		page = 1
	End If

	Sql = "Select * From goods Where Num="&Num

	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Rs.Open Sql , Db
	
	Room = RS("Rooms")
	
	content = RS("content")
'	content = "��"&content
	content = Replace(content,chr(13)&chr(10),chr(13)&chr(10))

	

	
%>


<html>
<head>
<title>�� �� OyesMall ��ǰ����Ʈ�� ��</title>

<Script Language="JavaScript">


	function list()
		{
			document.view.action="./goods_list.asp?page=<%=page%>";
			document.view.submit();
		}

	function g_write()
		{
			alert("���� ī�װ��� �����ϼž� �մϴ�. ^^");				
			document.view.action="../category/cate_list.asp?page=<%=page%>";
			document.view.submit();
		}
	
	function edit()
		{
			document.view.action="./goods_edit.asp?num=<%=num%>&page=<%=page%>";
			document.view.submit();
		}


	
	
	
</SCRIPT>


<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">
</head>

<body bgcolor="#ffffff" text="#000000" leftMargin=0  topMargin=0 marginwidth="0" marginheight="0">
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
							<TD>&nbsp; &nbsp; <FONT face=���� size=2><B>��ǰ ����Ʈ (View)</B></FONT></TD>
							<TD align=middle width=150 bgColor=#222222><FONT face=���� ><B>�� ǰ �� ��</B></FONT>
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
		 
		 <TD vAlign=top align=left>&nbsp;&nbsp;OyesMall�� ��ϵ� ��ǰ�� �����ϴ°��Դϴ�. 
			<BR></TD>
		
		</TR>
		</TBODY>
	</TABLE>
	<BR>
	&nbsp;&nbsp;&nbsp;&nbsp;<B><font color=#6B92CE size=4><%=RS("ca1")%></Font></B>
	<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
		<Form name=view action="./goods_list.asp" method=post>
				<TBODY> 
				<TR> 
				  <TD  height=27 >
					<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD  height="20">
						&nbsp;&nbsp;<B><Font class="font_3"><%=RS("ca1")%> �� <%=RS("ca2")%> �� <B><font  color=#ffffcc size=2><%=RS("ca3")%></Font></B></Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				</TR>
				</Tbody>
			</Table>

		<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
			<Tbody>
				<tr> 
				  <td height="27" colspan="3">&nbsp;</td>
				</tr>
				<TR> 
					  <TD height="250" width="250"valign=top
					  >&nbsp;<Table border=2><TBODY><TR><TD><img src="../mall_image/<%=RS("ca1")%>/<%=Rs("bphoto")%>"></TD></TR></TBODY></TABLE></td>
					  <TD  >&nbsp;</TD>
					  <TD height="90" width="400" ><Table border=2><TBODY><TR><TD><img src="../mall_image/<%=RS("ca1")%>/<%=Rs("sphoto")%>"></TD></TR></TBODY></TABLE>
					  <BR><IMG src="../image/icon_orange.gif">����ȸ�� : <%=RS("g_com")%>
					   <BR><BR><IMG src="../image/icon_orange.gif">�� ǰ �� &nbsp;: <B><%=RS("g_name")%></B>
					   <BR><BR><IMG src="../image/icon_orange.gif">Feature&nbsp;&nbsp;: <%=RS("feature")%>
						<BR><BR><IMG src="../image/icon_orange.gif">��ǰ���� : <%=FormatNumber(RS("or_p"),0)%> ��
						<BR><BR><IMG src="../image/icon_orange.gif">�� �� �� : <%=FormatNumber(RS("point"),0)%> ��
					   <BR><BR><IMG src="../image/icon_orange.gif">��ǰ�ڵ� : <%=RS("g_code")%>
					   <BR><BR><IMG src="../image/icon_orange.gif">��ǰ���� : <%=RS("color")%>
					   <BR><BR><IMG src="../image/icon_orange.gif">������ : <%=RS("r_ea")%> ��
					   <BR><BR><IMG src="../image/icon_orange.gif">�� õ : 
					   <INPUT type=checkbox name=Best_Choice value=1 <%IF RS("best_choice") = "1" Then%>Checked<%End IF%>>Best Choice&nbsp;&nbsp;
						<INPUT type=checkbox name=Weekly_Best value=1 <%IF RS("Weekly_Best") = "1" Then%>Checked<%End IF%>>Weekly Best&nbsp;&nbsp;
						<INPUT type=checkbox name=m_choice value=1 <%IF RS("m_choice") = "1" Then%>Checked<%End IF%>>Main Today Choice&nbsp;&nbsp;
						<INPUT type=checkbox name=choice value=1 <%IF RS("choice") = "1" Then%>Checked<%End IF%>>Today Choice&nbsp;&nbsp;
						<INPUT type=checkbox name=event value=1 <%IF RS("event_2") = "1" Then%>Checked<%End IF%>>Event&nbsp;&nbsp;
								
					   </TD>
				</TR>
				</Tbody>
				</Table>

			<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
			<Tbody>
				<tr> 
				  <td height="27"  colspan=2><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD  height="20">
						&nbsp;&nbsp;<B><Font class="font_3">* ������</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></td>
				</tr>
				<tr> 
				  <td ><BR><% IF RS("cphoto") <> "" Then %><Table border=2><TBODY><TR><TD><img src="../mall_image/<%=RS("ca1")%>/<%=Rs("cphoto")%>"></Td></TR></Tbody></Table><BR><%End IF%></td>
				  <td ><%=content%></TD>
				</tr>
				<TR>
	<TD colspan="2">
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
					<Td colspan=3 height=27>&nbsp;</TD>
				</TR>
				</Tbody>
				</Table>

<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
			<Tbody>
				<Tr>
							<Td align=center >
								<input type="button" style="width:15%;" value="LIST" class=button2 onClick="list();">&nbsp;
								<input type="button" style="width:15%;" value="EDIT" class=button2 onClick="edit();">&nbsp;
								<input type="button" value="��ǰ���" onClick="g_write();" style="width:15%;" class=button2>
							</Td>
			</Tr>
			</TBODY>
			</Form>
  </Table>

		
	


	
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
	RS.Close
	Db.Close

	Set RS = Nothing
	Set Db = Nothing
	
%>