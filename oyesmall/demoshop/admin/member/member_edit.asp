
<!---#include file="../dbconn.asp"--->
<!---#include file="../session3.asp"--->
<%

	num = Request("num")
	page = Request("page")

	Sql = "Select * From members Where num="&num

	Set Rs = Server.CreateObject("ADODB.RecordSet")
	
	Rs.Open Sql , Db

%>

<html>
<head>
<title>�� �� OyesMall ȸ�������� ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">
	<LINK href="join.files/style.css" type=text/css rel=StyleSheet>
		
		

	<Script Language="JavaScript">
				<!--
				function write_ok() 
					{
						
						if ( document.AA.passwd.value == "" ) 
							{
								alert("PassWord�� ������ �ּ��� ^^");
								document.AA.passwd.focus();
								return false;
							}
						if ( document.AA.passwd_a.value == "" ) 
							{
								alert("��й�ȣ ��Ʈ�� ���� �亯�� ������ �ּ��� ^^");
								document.AA.passwd_a.focus();
								return false;
							}
						if ( document.AA.name.value == "" ) 
							{
								alert("ȸ���� �̸��� ������ �ּ��� ^^");
								document.AA.name.focus();
								return false;
							}
						if ( document.AA.jumin1.value == "" ) 
							{
								alert("�ֹε�Ϲ�ȣ ���ڸ��� ������ �ּ��� ^^");
								document.AA.jumin1.focus();
								return false;
							}
						if ( document.AA.jumin2.value == "" ) 
							{
								alert("�ֹε�Ϲ�ȣ ���ڸ��� ������ �ּ��� ^^");
								document.AA.jumin2.focus();
								return false;
							}
						if ( document.AA.birth_yy.value == "" ) 
							{
								alert("��������� �¾ �ظ� ������ �ּ��� ^^");
								document.AA.birth_yy.focus();
								return false;
							}
						if ( document.AA.birth_mm.value == "" ) 
							{
								alert("��������� �¾ ���� ������ �ּ���  ^^");
								document.AA.birth_mm.focus();
								return false;
							}
						if ( document.AA.birth_dd.value == "" ) 
							{
								alert("��������� �¾ ���� ������ �ּ��� ^^");
								document.AA.birth_dd.focus();
								return false;
							}
						
						if ( document.AA.point.value == "" ) 
							{
								alert("Point ������ ������ �ּ��� ^^");
								document.AA.point.focus();
								return false;
							}
						if ( document.AA.address.value == "" ) 
							{
								alert("ȸ���� �ּҸ� ������ �ּ��� ^^");
								document.AA.address.focus();
								return false;
							}
						if ( document.AA.tel1_1.value == "" ) 
							{
								alert("������ȣ�� ������ �ּ��� ^^");
								document.AA.tel1_1.focus();
								return false;
							}
						if ( document.AA.tel1_2.value == "" ) 
							{
								alert("��ȭ��ȣ ������ ������ �ּ��� ^^");
								document.AA.tel1_2.focus();
								return false;
							}
						if ( document.AA.tel1_3.value == "" ) 
							{
								alert("��ȭ��ȣ�� ������ �ּ��� ^^");
								document.AA.tel1_3.focus();
								return false;
							}
						if ( document.AA.email.value == "" ) 
							{
								alert("ȸ���� E-Mail�ּҸ� ������ �ּ��� ^^");
								document.AA.email.focus();
								return false;
							}
					
								
						
				document.AA.submit();
				}
				//-->
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
							<TD>&nbsp; &nbsp; <FONT face=���� size=2><B> MEMBERS</B></FONT></TD>
							<TD align=middle width=150 bgColor=#222222><FONT face=����><B>ȸ �� �� ��</B></FONT>
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
			
			<TD vAlign=top align=left>&nbsp;&nbsp;<B><font size=2 color=#ff6600><%=Trim(Rs("name"))%></font></B>&nbsp;ȸ���� ������ ������ �Դϴ�. 
			<BR></TD>
		</TR>
		</TBODY>
	</TABLE>
<BR>
<Div align=center>

	<TABLE cellSpacing=0 cellPadding=0 width="98%" border=1 bordercolor="#4A494A">
		<TBODY>
					 <TR>
							<Td align=center>
							<Table width="100%" cellSpacing="0" cellPadding="3" border="0">
		<Form method=post action="./join_edit_ok.asp" name=AA>
		<input type=hidden name=num value=<%=num%>>
		<input type=hidden value="<%=page%>" name=page>
	
	
		<TBODY>
		<TR>
			<TD width=120 bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">ȸ�� ID</B></TD>
			<TD><B><%=Rs("user_id")%></B> </TD>
		</TR>

		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">��й�ȣ</B></TD>
			<TD><INPUT maxLength=8  style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100px;background:#C5C5C5" name=passwd value="<%=Rs("passwd")%>" type=password> </TD>
		</TR>

		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">��й�ȣ ��Ʈ</B></TD>
			<TD><SELECT name=passwd_q style="WIDTH: 220px;BACKGROUND: #C5C5C5; "> 
							<OPTION <% IF RS("passwd_q")="��Ӵ��� ������?" Then %>Selected <%End IF%>>��Ӵ��� ������?</OPTION> 
							<OPTION <% IF RS("passwd_q")="�ƹ����� ������?" Then %>Selected <%End IF%>>�ƹ����� ������?</OPTION> 
							<OPTION <% IF RS("passwd_q")="�ڽ��� ������?" Then %>Selected <%End IF%>>�ڽ��� ������?</OPTION> 
						    <OPTION <% IF RS("passwd_q")="��￡ ���� �߾��� ��Ҵ�?"Then %>Selected <%End IF%>>��￡ ���� �߾��� ��Ҵ�?</OPTION> 
							<OPTION <% IF RS("passwd_q")="���� �����ϰ� ���� �����?"Then %>Selected <%End IF%>>���� �����ϰ� ���� �����?</OPTION> 
							<OPTION <% IF RS("passwd_q")="�ڽ��� ���� ��1ȣ��?"Then %>Selected <%End IF%>>�ڽ��� ���� ��1ȣ��?</OPTION> 
							<OPTION <% IF RS("passwd_q")="���� ������ �� ��ȭ��?"Then %>Selected <%End IF%>>���� ������ �� ��ȭ��?</OPTION> 
							<OPTION <% IF RS("passwd_q")="������� ���������?(��)1970/05/25"Then %>Selected <%End IF%>>������� ���������?(��)1970/05/25</OPTION> 
						    <OPTION <% IF RS("passwd_q")="�����ϴ� ������?"Then %>Selected <%End IF%>>�����ϴ� ������?</OPTION>
					  </Select></TD>
		</TR>

		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">�� ��</B></TD>
			<TD><INPUT maxLength=20 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100px;background:#C5C5C5" name=passwd_a value="<%=Rs("passwd_a")%>"> </TD>
		</TR>
		
		
		
		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">�� ��</B></TD>
			<TD><INPUT maxLength=8 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100px;background:#C5C5C5"  name=name value="<%=Trim(Rs("name"))%>" readonly></TD>
		</TR>
		
		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">�ֹε�Ϲ�ȣ</B></TD>
			<TD><INPUT maxLength=6 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:70px;background:#C5C5C5" name=jumin1 value="<%=Rs("jumin1")%>">&nbsp;-&nbsp;<INPUT maxLength=7 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:70px;background:#C5C5C5" name=jumin2 value="<%=Rs("jumin2")%>"> </TD>
		</TR>

		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">�������</B></TD>
			<TD><INPUT maxLength=20 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:60px;background:#C5C5C5" name=birth_yy value=<%=Rs("birth_yy")%>> ��  <SELECT style="WIDTH:55px;BACKGROUND: #C5C5C5; " name=birth_mm>  
			  <OPTION <% if Rs("birth_mm")=01 then %>Selected <%end if%> value=01>01</OPTION>
			  <OPTION <% if Rs("birth_mm")=02 then %>Selected <%end if%> value=02>02</OPTION>
			  <OPTION <% if Rs("birth_mm")=03 then %>Selected <%end if%> value=03>03</OPTION>
			  <OPTION <% if Rs("birth_mm")=04 then %>Selected <%end if%> value=04>04</OPTION> 
			  <OPTION <% if Rs("birth_mm")=05 then %>Selected <%end if%> value=05>05</OPTION> 
			  <OPTION <% if Rs("birth_mm")=06 then %>Selected <%end if%> value=06>06</OPTION> 
			  <OPTION <% if Rs("birth_mm")=07 then %>Selected <%end if%> value=07>07</OPTION> 
			  <OPTION <% if Rs("birth_mm")=08 then %>Selected <%end if%> value=08>08</OPTION>
			  <OPTION <% if Rs("birth_mm")=09 then %>Selected <%end if%> value=09>09</OPTION> 
			  <OPTION <% if Rs("birth_mm")=10 then %>Selected <%end if%> value=10>10</OPTION> 
			  <OPTION <% if Rs("birth_mm")=11 then %>Selected <%end if%> value=11>11</OPTION> 
			  <OPTION <% if Rs("birth_mm")=12 then %>Selected <%end if%> value=12>12</OPTION> 

			  
			 </SELECT> �� 
			 
			 <SELECT style="WIDTH:55px;BACKGROUND: #C5C5C5; " name=birth_dd> 
			  
			  <OPTION <% if Rs("birth_dd")=01 then %>Selected <%end if%>value=01>01</OPTION> 
			  <OPTION <% if Rs("birth_dd")=02 then %>Selected <%end if%>value=02>02</OPTION> 
			  <OPTION <% if Rs("birth_dd")=03 then %>Selected <%end if%>value=03>03</OPTION> 
			  <OPTION <% if Rs("birth_dd")=04 then %>Selected <%end if%>value=04>04</OPTION> 
			  <OPTION <% if Rs("birth_dd")=05 then %>Selected <%end if%>value=05>05</OPTION> 
			  <OPTION <% if Rs("birth_dd")=06 then %>Selected <%end if%>value=06>06</OPTION> 
			  <OPTION <% if Rs("birth_dd")=07 then %>Selected <%end if%>value=07>07</OPTION> 
			  <OPTION <% if Rs("birth_dd")=08 then %>Selected <%end if%>value=08>08</OPTION> 
			  <OPTION <% if Rs("birth_dd")=09 then %>Selected <%end if%>value=09>09</OPTION> 
			  <OPTION <% if Rs("birth_dd")=10 then %>Selected <%end if%>value=10>10</OPTION> 
			  <OPTION <% if Rs("birth_dd")=11 then %>Selected <%end if%>value=11>11</OPTION> 
			  <OPTION <% if Rs("birth_dd")=12 then %>Selected <%end if%>value=12>12</OPTION> 
			  <OPTION <% if Rs("birth_dd")=13 then %>Selected <%end if%>value=13>13</OPTION> 
			  <OPTION <% if Rs("birth_dd")=14 then %>Selected <%end if%>value=14>14</OPTION> 
			  <OPTION <% if Rs("birth_dd")=15 then %>Selected <%end if%>value=15>15</OPTION> 
			  <OPTION <% if Rs("birth_dd")=16 then %>Selected <%end if%>value=16>16</OPTION> 
			  <OPTION <% if Rs("birth_dd")=17 then %>Selected <%end if%>value=17>17</OPTION> 
			  <OPTION <% if Rs("birth_dd")=18 then %>Selected <%end if%>value=18>18</OPTION> 
			  <OPTION <% if Rs("birth_dd")=19 then %>Selected <%end if%>value=19>19</OPTION> 
			  <OPTION <% if Rs("birth_dd")=20 then %>Selected <%end if%>value=20>20</OPTION> 
			  <OPTION <% if Rs("birth_dd")=21 then %>Selected <%end if%>value=21>21</OPTION> 
			  <OPTION <% if Rs("birth_dd")=22 then %>Selected <%end if%>value=22>22</OPTION> 
			  <OPTION <% if Rs("birth_dd")=23 then %>Selected <%end if%>value=23>23</OPTION> 
			  <OPTION <% if Rs("birth_dd")=24 then %>Selected <%end if%>value=24>24</OPTION> 
			  <OPTION <% if Rs("birth_dd")=25 then %>Selected <%end if%>value=25>25</OPTION> 
			  <OPTION <% if Rs("birth_dd")=26 then %>Selected <%end if%>value=26>26</OPTION> 
			  <OPTION <% if Rs("birth_dd")=27 then %>Selected <%end if%>value=27>27</OPTION> 
			  <OPTION <% if Rs("birth_dd")=28 then %>Selected <%end if%>value=28>28</OPTION>
			  <OPTION <% if Rs("birth_dd")=29 then %>Selected <%end if%>value=29>29</OPTION> 
			  <OPTION <% if Rs("birth_dd")=30 then %>Selected <%end if%>value=30>30</OPTION> 
			  <OPTION <% if Rs("birth_dd")=31 then %>Selected <%end if%>value=31>31</OPTION> 
			</SELECT> �� &nbsp; 
            <INPUT type=radio value=1 <% If Rs("birth_gbn")=1 Then %>Checked <% end if %> name=birth_gbn>��� 
			<INPUT 
            type=radio value=2 <% If Rs("birth_gbn")=2 Then %>Checked <%End if %>name=birth_gbn>���� </FONT></TD></TR>
		
		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">������</B></TD>
			<TD><INPUT maxLength=20 style="WIDTH: 70px;BACKGROUND: #C5C5C5; " name=point value="<%=Rs("point")%>"> </TD>
		</TR>

		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">��ȥ����</B></TD>
			<TD>
				<INPUT type=radio value=1 <% IF Rs("ismarry")=1 Then %>CHECKED 
					<%end if%> name=ismarry >��ȥ 
				<INPUT type=radio value=2 <% If Rs("ismarry")=2 Then %>CHECKED 
					<%End if%>name=ismarry>��ȥ</FONT> </TD>
		</TR>

	
		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">�� ��</B></TD>
			<TD><INPUT  style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:400px;background:#C5C5C5" maxLength=100 name=address value="<%=Rs("address")%>"> </TD>
		</TR>
		
		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">��ȭ��ȣ</B></TD>
			<TD>
				<INPUT  maxLength=3  style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:50px;background:#C5C5C5" name=tel1_1 value="<%=Rs("tel1_1")%>">
				&nbsp;-&nbsp; 
				<INPUT maxLength=4 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:50px;background:#C5C5C5"  name=tel1_2 value="<%=Rs("tel1_2")%>">
				&nbsp;-&nbsp; 
				<INPUT maxLength=4 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:50px;background:#C5C5C5" name=tel1_3 value="<%=Rs("tel1_3")%>"> 
				
				<INPUT type=radio value=1 <% IF RS("whereTel1")=1 Then %>Checked<%End if%> name=whereTel1>���� 
				<INPUT type=radio value=2 <% If Rs("whereTel1")=2 Then %> Checked<%end if%> name=whereTel1>����
				
			</TD>
		</TR>
        
		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">�޴���</B></TD>
			<TD>
				<INPUT maxLength=3 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:50px;background:#C5C5C5" name=hp1 value="<%=Rs("hp1")%>">
				&nbsp;-&nbsp; 
				<INPUT maxLength=4 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:50px;background:#C5C5C5" name=hp2 value="<%=Rs("hp2")%>">
				&nbsp;-&nbsp; 
				<INPUT  maxLength=4 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:50px;background:#C5C5C5" name=hp3 value="<%=Rs("hp3")%>">
			</TD>
		</TR>

		
        <TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">�� ��</B></TD>
			<TD>
				  <SELECT name=job style="WIDTH: 130px;BACKGROUND: #C5C5C5; "> 
					<OPTION <% if Rs("job")="����л�" then %>Selected <%end if%>>�л�</OPTION>  
					
					<OPTION <% if Rs("job")="���л�" then %>Selected <%end if%>>���л�</OPTION>   
					<OPTION <% if Rs("job")="��ǻ��/���ͳ�" then %>Selected <%end if%>>��ǻ��/���ͳ�</OPTION>  
					<OPTION <% if Rs("job")="���" then %>Selected <%end if%>>���</OPTION>  
					<OPTION <% if Rs("job")="������" then %>Selected <%end if%>>������</OPTION>  
					<OPTION <% if Rs("job")="����" then %>Selected <%end if%>>����</OPTION>  
					<OPTION <% if Rs("job")="���񽺾�" then %>Selected <%end if%>>���񽺾�</OPTION>   
					<OPTION <% if Rs("job")="����" then %>Selected <%end if%>>����</OPTION>   
					<OPTION <% if Rs("job")="����/����/�����" then %>Selected <%end if%>>����/����/�����</OPTION>   
					<OPTION <% if Rs("job")="�����" then %>Selected <%end if%>>�����</OPTION>  
					<OPTION <% if Rs("job")="����" then %>Selected <%end if%>>����</OPTION>  
					<OPTION <% if Rs("job")="�Ƿ�" then %>Selected <%end if%>>�Ƿ�</OPTION>  
					<OPTION <% if Rs("job")="����" then %>Selected <%end if%>>����</OPTION>   
					<OPTION <% if Rs("job")="�Ǽ���" then %>Selected <%end if%>>�Ǽ���</OPTION>   
					<OPTION <% if Rs("job")="������" then %>Selected <%end if%>>������</OPTION>  
					<OPTION <% if Rs("job")="�ε����" then %>Selected <%end if%>>�ε����</OPTION>   
					<OPTION <% if Rs("job")="��۾�" then %>Selected <%end if%>>��۾�</OPTION>   
					<OPTION <% if Rs("job")="��/��/��/�����" then %>Selected <%end if%>>��/��/��/�����</OPTION>   
					<OPTION <% if Rs("job")="����" then %>Selected <%end if%>>����</OPTION>   
					<OPTION <% if Rs("job")="����" then %>Selected <%end if%>>����</OPTION>  
					<OPTION <% if Rs("job")="��Ÿ" then %>Selected <%end if%>>��Ÿ</OPTION>  
				</SELECT>
			</TD>
		</TR>

		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">E-Mail</B></TD>
			<TD><INPUT maxLength=25 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:150px;background:#C5C5C5" name=email value="<%=Rs("email")%>"> </TD>
		</TR>
		</TBODY>
	</TABLE>
	</TD>
	</TR>
	</Tbody>
	</Table>
	</Div>
	<BR>

	
	<table width="100%" border="0" bgcolor="#000000">
		<TBODY>
			<TR>
				<TD>
					<TABLE height=26 cellSpacing=0 cellPadding=0 width="100%" border=0>
						<TBODY>
							<TR>
								<TD align=middle><INPUT class=button2 style="width:80px;"  type=button value="��������" onclick="write_ok();">&nbsp; 
									<INPUT id=reset1 class=button2 style="width:80px;" type=reset value=�ٽþ��� name=reset1>&nbsp;&nbsp;<input type="button" class=button2 style="width:80px;" value="LIST" onClick="history.go(-1);"> 
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
		</TBODY>
	</FORM>
	</TABLE>
	


	<%
			RS.Close
			DB.Close

			Set RS = Nothing
			Set DB = Nothing
	%>
        
        
       
        
 


	
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
