	<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->
<%
		order_n = Request("order_num")
		page = Request("page")

		Set RS = Server.CreateObject("ADODB.Recordset")

		SQL = "Select state From sell_man Where order_num="&order_n&" "
		RS.Open SQL,DB,1
		IF RS("state")="0" Then
		SQL2 = "Update sell_man Set state=1 Where order_num="&order_n&" "
		'Response.write SQL2
		'Response.End
		DB.Execute (SQL2)
		End IF
		RS.Close
		
		SQL = "Select * From Ve_order Where order_num="&order_n&" "

		RS.Open SQL,DB,1

		name = RS("name")
		Tel = RS("tel1_1")&"-"&RS("tel1_2")&"-"&RS("tel1_3")
		re_name = RS("re_name")
		re_tel = RS("re_tel")
		re_add = RS("re_add")

		kind = RS("re_kind")
		Select case kind
			case "1"
			order_kind = "ī��"
			case "2"
			order_kind = "�¶���"
			case "3"
			order_kind = "ī��+�¶���"
		End select

		order_date = RS("order_date")
		total_p = RS("total_p")

%>
<html>
<head>
<title>�� �߱��ų����� ��</title>
			

	<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">
</Head>

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

		<table width="100%" border="0" bgcolor="#000000">
		<TBODY>
			<TR>
				<TD>
					<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
						<TBODY>
						<TR height=25>
							<TD>&nbsp; &nbsp; <FONT face=���� size=2><B>��ǰ�ֹ� ����Ʈ (Detail)</B></FONT></TD>
							<TD align=middle width=150 bgColor=#222222><FONT face="����"><B>ORDER</B></FONT>
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
		
		 <TD vAlign=top align=left>&nbsp;&nbsp;<B><FONT color=#ffffff>���Ź�ȣ&nbsp;:&nbsp;<font color=#FFA600><%=order_n%></Font></B></FONT> 
			<BR></TD>
		
		</TR>
		</TBODY>
	</TABLE>
	
	<br>
	<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
		<Tbody>
		<Tr>
			<TD width="50%" valign=top>
						
						<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="99%" borderColorLight=#999966 border=1>
							<Tbody>
							<Tr bgcolor=#B5D7CE>
								<TD colspan=2 height=25><B><font color=#215539>&nbsp;&nbsp;��&nbsp;�ֹ��� ����</font></B></TD>
								
							</TR>

							<TR>
								<TD align=center bgcolor=#DEF3DE >�� ��</TD>
								<TD width="60%" align=center><%=name%></TD>
							</TR>

							<TR>
								<TD align=center bgcolor=#DEF3DE >��ȭ��ȣ</TD>
								<TD align=center><%=tel%></TD>
							</TR>

							<TR>
								<TD align=center bgcolor=#DEF3DE >�ֹ���</TD>
								<TD align=center><%=order_date%></TD>
							</TR>

							<TR>
								<TD align=center bgcolor=#DEF3DE >�����ݾ�</TD>
								<TD align=center><%=Formatnumber(total_p,0)%>��</TD>
							</TR>
							</Tbody>
						</Table>
			</TD>
			<TD width="50%" valign=top>
						
						<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="99%" borderColorLight=#999966 border=1>
							<Tbody>
							<Tr bgcolor=#9CC7EF>
								<TD colspan=2 height=25><B><font color=#003473>&nbsp;&nbsp;��&nbsp;������ ����</font></B></TD>
							</TR>

							<TR>
								<TD align=center bgcolor=#DEEFFF >�� ��</TD>
								<TD width="60%" align=center><%=re_name%></TD>
							</TR>

							<TR>
								<TD align=center bgcolor=#DEEFFF >��ȭ��ȣ</TD>
								<TD align=center><%=re_tel%></TD>
							</TR>

							<TR>
								<TD align=center bgcolor=#DEEFFF >�� ��</TD>
								<TD align=center><%=re_add%></TD>
							</TR>
							</Tbody>
						</Table>
			</TD>
		</Tr>
		</Tbody>
	</Table>

	<br>
	
	<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="100%" borderColorLight=#999966 border=1>
		<Tbody>
		<Tr bgcolor=#9CC7EF>
			<TD colspan=2 height=25><B><font color=#003473>&nbsp;&nbsp;��&nbsp;���� ����</font></B></TD>
			
		</TR>
		<% IF kind = "1" Then %>
		<TR>
			<TD align=center bgcolor=#DEEFFF >���� ���</TD>
			<TD width="60%" align=center><%=order_kind%></TD>
		</TR>

		<TR>
			<TD align=center bgcolor=#DEEFFF >ī���ȣ</TD>
			<TD align=center><%=RS("cardno")%></TD>
		</TR>
		<% ElseIF kind = "2" Then %>
		<TR>
			<TD align=center bgcolor=#DEEFFF >���� ���</TD>
			<TD width="60%" align=center><%=order_kind%></TD>
		</TR>

		<TR>
			<TD align=center bgcolor=#DEEFFF >�����</TD>
			<TD align=center><%=RS("bankno")%></TD>
		</TR>

		<TR>
			<TD align=center bgcolor=#DEEFFF >�Ա��ڸ�</TD>
			<TD align=center><%=RS("paidman")%></TD>
		</TR>
		<%Else%>
		<TR>
			<TD align=center bgcolor=#DEEFFF >���� ���</TD>
			<TD width="60%" align=center><%=order_kind%></TD>
		</TR>
		
		<TR bgcolor=#84A2C6>
			<TD colspan=2 height="3"  ></TD>
		</TR>

		<TR>
			<TD align=center bgcolor=#DEEFFF >�����</TD>
			<TD align=center><%=RS("bankno")%></TD>
		</TR>

		<TR>
			<TD align=center bgcolor=#DEEFFF >�Ա��ڸ�</TD>
			<TD align=center><%=RS("paidman")%></TD>
		</TR>

		<TR>
			<TD align=center bgcolor=#DEEFFF >�����ݾ�</TD>
			<TD align=center><%=Formatnumber(RS("bank_amt"),0)%>��</TD>
		</TR>

		<TR bgcolor=#84A2C6>
			<TD colspan=2 height="3"></TD>
		</TR>

		<TR>
			<TD align=center bgcolor=#DEEFFF >ī���ȣ</TD>
			<TD align=center><%=RS("cardno")%></TD>
		</TR>

		<TR>
			<TD align=center bgcolor=#DEEFFF >�����ݾ�</TD>
			<TD align=center><%=Formatnumber(RS("card_amt"),0)%>��</TD>
		</TR>
		<%
		End IF
		RS.Close
		%>
		</Tbody>
	</Table>
	<br>
				
	<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="100%" borderColorLight=#999966 border=1>
		<Tbody>
		<Tr bgcolor=#B5D7CE>
			<TD colspan=4 height=25><B><font color=#215539>&nbsp;&nbsp;��&nbsp;�ֹ� ����</font></B></TD>
			
		</TR>

		<TR>
			<TD align=center bgcolor=#DEF3DE width="5%">No.</TD>
			<TD align=center bgcolor=#DEF3DE >�ֹ���ǰ</TD>
			<TD align=center bgcolor=#DEF3DE width="5%">�� ��</TD>
			<TD align=center bgcolor=#DEF3DE width="10%">�� ��</TD>
		</TR>
		<%
		SQL = "Select * From Seller Where order_num="&order_n&" "
		
		RS.Open SQL,DB,1

		IF NOT RS.EOF Then
			count = 1
			While Not Rs.Eof
			
			good_name = RS("good_name")
			good_ea = RS("good_ea")
			good_price = RS("good_price")
			
		%>
		<TR>
			<TD align=center><%=count%></TD>
			<TD align=center><%=good_name%></TD>			
			<TD align=center><%=good_ea%></TD>
			<TD align=center><%=Formatnumber(good_price,0)%>��</TD>
		</TR>
		<%
			Rs.MoveNext
			count = count + 1 
			Wend
			
			End IF
			RS.close
		%>
		<tr>
			<td colspan=4 align=right><a href="./order_edit.asp?page=<%=page%>&state=1&order_num=<%=order_n%>">�ֹ�����</A> | <a href="./order_edit.asp?page=<%=page%>&state=2&order_num=<%=order_n%>">�����Ϸ�</A> | <a href="./order_edit.asp?page=<%=page%>&state=3&order_num=<%=order_n%>">�߼��غ���</A> | <a href="./order_edit.asp?page=<%=page%>&state=4&order_num=<%=order_n%>">�߼ۿϷ�</A> &nbsp;&nbsp;&nbsp;</td>
		</tr>
		</Tbody>
	</Table>
	
	</td>
	</tr>
			

</table>

<!---#include file="../down.inc"-->
</Body>
</Html>
<%
	Db.Close
	Set RS = Nothing
	Set Db = Nothing
	
%>