<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->
<% 
		SQL_LOG = "Select sessionID From tbl_temp Where SessionID ="&oyes_order&" "
		Set Lo = DB.Execute (SQL_LOG)
		IF Not Lo.EOF then 
			loginmen = "1"
		Else
			loginmen = "2"
		End IF
		Lo.Close
		Set Lo = Nothing
		
		IF loginmen = "2" Then
					Response.write "<script language='javascript'>"
					Response.write "alert('���� �α����� �� �ּ���. ^^');"
					Response.write "location.href='../account/login2.asp'"
					Response.write "</script>"
			

		Else

		
		SQL = "Select userID,passwd From tbl_Temp Where SessionID="& oyes_order &" " 

		Set RS_M = Server.CreateObject("ADODB.RecordSet")
		
		RS_M.Open SQL, DB, 1
			user_id = RS_M("userID")
			passwd = RS_M("passwd")
		RS_M.Close

		SQL2 = "Select * From Members Where user_id='"& user_id &"' And passwd='"& passwd &"' "

		Set RS_E = DB.Execute (SQL2)
		

%>

<HTML>
	<HEAD><TITLE>OyesMall �� ���Ű��� ȯ���մϴ�</TITLE>



<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>
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
								alert("ȸ������ �̸��� ������ �ּ��� ^^");
								document.AA.name.focus();
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
						
					
						if ( document.AA.address.value == "" ) 
							{
								alert("ȸ������ �ּҸ� ������ �ּ��� ^^");
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
								alert("ȸ������ E-Mail�ּҸ� ������ �ּ��� ^^");
								document.AA.email.focus();
								return false;
							}
					
								
						
				document.AA.submit();
				}
				//-->
		</Script>
<style type="text/css"> 

.button{
		height:20;padding-top:1pt ;BORDER-RIGHT: #000000 1px solid;Font-family:"Tahoma"; BORDER-TOP: #000000 1px solid; FONT-SIZE: 12px; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; background-color:#47b3b7; FONT-FAMILY: tahoma,arial ;color:#ffffff ; border-color:#42B2B5 ;  width : 100;
}
</STYLE>



<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<META http-equiv=Content-Type content="text/html; charset=ks_c_5601-1987">
<LINK href="./style3.css" type=text/css rel=StyleSheet>

</HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginwidth="0" marginheight="0"><!----------top--------------->
<!--#include file="../shop/shop_maintop.asp"-->
<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=747 border=0>
  <TBODY>
  <TR>
    <!--#include file="../shop/shop_left.asp"-->
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <FORM name=form2>
        <TBODY>
        <TR>
          <TD>&nbsp;&nbsp;<IMG height=26 src="../shop_image/myaccount.gif" 
          width=153></TD>
          </TR></FORM></TBODY></TABLE>						
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR bgColor=#d7d7d7>
          <TD class=lm style="PADDING-LEFT: 20px" height=25><A 
            href="../shop/shop_main.asp">home</A> &gt; <%IF loginmen = "2" Then%><A 
            href="./login2.asp"><%Else%><A Href="./profile.asp"><%End IF%>my account</A> &gt; <A Href="./leave.asp">Apply for leaving OyesMall</A> </TD></TR>
        <TR bgColor=#eeeeee>
          <TD class=lm style="PADDING-LEFT: 20px" bgColor=#efefef 
        height=4></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 align=center border=0 width="95%">
		<Tbody>
		<Tr>
			<Td>
				 <table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" align=center>
					<tr>
						<td bgcolor="#FFFFFF">                       
							<div align="center">
						    <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
									<TBODY>
									<TR>
										<TD colSpan=4 height=12></TD></TR>
									<TR>
										  <TD width=19><IMG height=21 alt="" src="../shop_image/tb_1_g.gif" 
											width=19 border=0></TD>
										  <TD style="PADDING-LEFT: 4px; PADDING-TOP: 5px" width=121 
										  bgColor=#47b3b7><FONT class=w><B>ȸ����������</B>&nbsp;&nbsp;</FONT></TD>
										  <TD width=5><IMG height=21 alt="" src="../shop_image/tb_2_g.gif" 
											width=5 border=0></TD>
										  <TD></TD>
									</TR>
									</TBODY>
							</TABLE>  
								
							<TABLE cellSpacing=1 cellPadding=0 width="100%" bgColor=#cdcdc border=0>  
								<TR> 
								<Form method=post action="./profile_edit_ok.asp" name=AA>
										<TD style="PADDING-LEFT: 6px" bgColor=#feffeb colSpan=3 
											height=60 ><FONT class=C55>ȸ������ ������ �Ʒ��� �����ϴ�. <BR>(<FONT 
            class=C66>*</FONT>)�� ���� �߸� �����Ͻ� �����̳�, ��������� ���� �� �������� ������ �����մϴ�. 
            <BR>ȸ������ ���������� ���� Wizwid���񽺸� ���� ���ϰ� �̿��ϼ���. </FONT></TD>
							   </TR>

							    <TR>
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 >&nbsp;&nbsp;<FONT class=C55>����� ID</FONT></TD> 
									 <TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2 height=25><INPUT maxLength=8 size=10 name=user_id value="<%=RS_E("user_id")%>" type=text CLASS=txtfld readonly></td> 
								</tr> 
								
							

								<tr > 
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2><FONT class=C66>*</FONT>&nbsp;<FONT class=C55>��й�ȣ</FONT></TD> 
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2>
									<INPUT maxLength=8 size=10 name=passwd value="<%=RS_E("passwd")%>" type=password CLASS=txtfld><BR><FONT class=c3><FONT color=#47b3b7>(��й�ȣ�� 4~12���̳��� �����ڳ� �����̾�� �մϴ�.)</FONT></FONT> </td>
								</Tr>
									
							
								
								<TR height=25>
										  <TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2><FONT 
											class=C66>*</FONT>&nbsp;<FONT class=C55>��й�ȣ ��Ʈ</FONT></TD>
										  <TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2>
										  <SELECT style="FONT-SIZE: 12px; WIDTH: 202px" name=passwd_q> 
											<OPTION <% IF RS_E("passwd_q")="��Ӵ��� ������?" Then %>Selected <%End IF%>>��Ӵ��� ������?</OPTION> 
											<OPTION <% IF RS_E("passwd_q")="�ƹ����� ������?" Then %>Selected <%End IF%>>�ƹ����� ������?</OPTION> 
											<OPTION <% IF RS_E("passwd_q")="�ڽ��� ������?" Then %>Selected <%End IF%>>�ڽ��� ������?</OPTION> 
											<OPTION <% IF RS_E("passwd_q")="��￡ ���� �߾��� ��Ҵ�?"Then %>Selected <%End IF%>>��￡ ���� �߾��� ��Ҵ�?</OPTION> 
											<OPTION <% IF RS_E("passwd_q")="���� �����ϰ� ���� �����?"Then %>Selected <%End IF%>>���� �����ϰ� ���� �����?</OPTION> 
											<OPTION <% IF RS_E("passwd_q")="�ڽ��� ���� ��1ȣ��?"Then %>Selected <%End IF%>>�ڽ��� ���� ��1ȣ��?</OPTION> 
											<OPTION <% IF RS_E("passwd_q")="���� ������ �� ��ȭ��?"Then %>Selected <%End IF%>>���� ������ �� ��ȭ��?</OPTION> 
											<OPTION <% IF RS_E("passwd_q")="������� ���������?(��)1970/05/25"Then %>Selected <%End IF%>>������� ���������?(��)1970/05/25</OPTION> 
											<OPTION <% IF RS_E("passwd_q")="�����ϴ� ������?"Then %>Selected <%End IF%>>�����ϴ� ������?</OPTION>
										</SELECT>&nbsp;&nbsp;<FONT 
											class=c3><FONT color=#47b3b7>��й�ȣ �нǽ� ���� ���������Դϴ�.</FONT> 
										</FONT></TD>
								</TR>
								
								<TR height=25>
										  <TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2><FONT 
											class=C66>*</FONT>&nbsp;<FONT class=C55>�亯</FONT></TD>
										  <TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><INPUT 
											style="FONT-SIZE: 12px" size=32 name=passwd_a value="<%=RS_E("passwd_a")%>">&nbsp;<FONT class=c3><FONT 
											color=#47b3b7>��й�ȣ �нǽ� ������ ���� �亯�Դϴ�.</FONT></FONT></TD>
								</TR>

								<tr height=25>
								<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2><FONT class=C66>*</FONT>&nbsp;<FONT class=C55>�� ��</FONT></TD> 
									</td> 
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2>
										<input  style="FONT-SIZE: 12px"name=Name size=17 MaxLength=8  CLASS=txtfld value="<%=RS_E("name")%>"> 
										<FONT class=c3><FONT color=#47b3b7>�Ǹ��� 
						�Է��Ͻʽÿ�.</FONT></FONT>
									</td>  
								</tr>  
									
								<tr height=25>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2>&nbsp;&nbsp;<FONT class=C55>�ֹε�Ϲ�ȣ</FONT></TD> 
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><FONT class=C55> 
									<%=RS_E("jumin1")%>   
									- <%=RS_E("jumin2")%></font>  
										
									</td>  
								</tr>
								
								<tr height=25>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2>&nbsp;&nbsp;<FONT class=C55>�������</FONT></TD> 
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><FONT class=C55> 
									<input  style="FONT-SIZE: 12px"name=birth_yy  MaxLength=4 size=6 value="<%=RS_E("birth_yy")%>" CLASS=txtfld OnKeypress="onlyNumber()" readonly>��  
											<SELECT name=birth_mm style="FONT-SIZE: 12px; WIDTH: 55px">  
												  <OPTION <% if RS_E("birth_mm")=01 then %>Selected <%end if%> value=01>01</OPTION>
												  <OPTION <% if RS_E("birth_mm")=02 then %>Selected <%end if%> value=02>02</OPTION>
												  <OPTION <% if RS_E("birth_mm")=03 then %>Selected <%end if%> value=03>03</OPTION>
												  <OPTION <% if RS_E("birth_mm")=04 then %>Selected <%end if%> value=04>04</OPTION> 
												  <OPTION <% if RS_E("birth_mm")=05 then %>Selected <%end if%> value=05>05</OPTION> 
												  <OPTION <% if RS_E("birth_mm")=06 then %>Selected <%end if%> value=06>06</OPTION> 
												  <OPTION <% if RS_E("birth_mm")=07 then %>Selected <%end if%> value=07>07</OPTION> 
												  <OPTION <% if RS_E("birth_mm")=08 then %>Selected <%end if%> value=08>08</OPTION>
												  <OPTION <% if RS_E("birth_mm")=09 then %>Selected <%end if%> value=09>09</OPTION> 
												  <OPTION <% if RS_E("birth_mm")=10 then %>Selected <%end if%> value=10>10</OPTION> 
												  <OPTION <% if RS_E("birth_mm")=11 then %>Selected <%end if%> value=11 readonly>11</OPTION> 
												  <OPTION <% if RS_E("birth_mm")=12 then %>Selected <%end if%> value=12>12</OPTION> 
											</SELECT>��  
											<SELECT name=birth_dd style="FONT-SIZE: 12px; WIDTH: 55px">  
											<OPTION <% if RS_E("birth_dd")=01 then %>Selected <%end if%>value=01>01</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=02 then %>Selected <%end if%>value=02>02</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=03 then %>Selected <%end if%>value=03>03</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=04 then %>Selected <%end if%>value=04>04</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=05 then %>Selected <%end if%>value=05>05</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=06 then %>Selected <%end if%>value=06>06</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=07 then %>Selected <%end if%>value=07>07</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=08 then %>Selected <%end if%>value=08>08</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=09 then %>Selected <%end if%>value=09>09</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=10 then %>Selected <%end if%>value=10>10</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=11 then %>Selected <%end if%>value=11>11</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=12 then %>Selected <%end if%>value=12>12</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=13 then %>Selected <%end if%>value=13>13</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=14 then %>Selected <%end if%>value=14>14</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=15 then %>Selected <%end if%>value=15>15</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=16 then %>Selected <%end if%>value=16>16</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=17 then %>Selected <%end if%>value=17>17</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=18 then %>Selected <%end if%>value=18>18</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=19 then %>Selected <%end if%>value=19>19</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=20 then %>Selected <%end if%>value=20>20</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=21 then %>Selected <%end if%>value=21>21</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=22 then %>Selected <%end if%>value=22>22</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=23 then %>Selected <%end if%>value=23>23</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=24 then %>Selected <%end if%>value=24>24</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=25 then %>Selected <%end if%>value=25>25</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=26 then %>Selected <%end if%>value=26>26</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=27 then %>Selected <%end if%>value=27>27</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=28 then %>Selected <%end if%>value=28>28</OPTION>
			  <OPTION <% if RS_E("birth_dd")=29 then %>Selected <%end if%>value=29>29</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=30 then %>Selected <%end if%>value=30>30</OPTION> 
			  <OPTION <% if RS_E("birth_dd")=31 then %>Selected <%end if%>value=31>31</OPTION> 
											</SELECT>�� &nbsp; 
			<INPUT type=radio value=1 <% If RS_E("birth_gbn")=1 Then %>Checked <% end if %> name=birth_gbn>��� 
			<INPUT 
            type=radio value=2 <% If RS_E("birth_gbn")=2 Then %>Checked <%End if %>name=birth_gbn>����
			  
									</font></td>  
								</tr>  

								<TR height=25>
					  <TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 ><FONT 
						class=C66>*</FONT>&nbsp;<FONT class=C55>��ȥ����</FONT></TD>
					  <TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><FONT 
						class=C55><INPUT type=radio value=1 <% IF RS_E("ismarry")=1 Then %>CHECKED 
					<%end if%> name=ismarry>��ȥ 
				<INPUT type=radio value=2 <% If RS_E("ismarry")=2 Then %>CHECKED 
					<%End if%>name=ismarry>��ȥ</FONT> </TD>
						</TR>

						<tr height=25>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2><FONT class=C66>*</FONT>&nbsp;<FONT class=C55>�� ��</FONT></TD>
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2>
										<input size=55 name=address value="<%=RS_E("address")%>"  CLASS=txtfld>
										
									</td> 
								</tr> 


								<tr height=25>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2><FONT class=C66>*</FONT>&nbsp;<FONT class=C55>��ȭ��ȣ</FONT></TD>
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><FONT class=C55> 
									<input  style="FONT-SIZE: 12px"name=tel1_1 size=4 MaxLength=4 value="<%=RS_E("tel1_1")%>" CLASS=txtfld >   
									- <input  style="FONT-SIZE: 12px"name=tel1_2 size=4 MaxLength=4 value="<%=RS_E("tel1_2")%>" CLASS=txtfld > - <input  style="FONT-SIZE: 12px"name=tel1_3 size=4 MaxLength=4 value="<%=RS_E("tel1_3")%>" CLASS=txtfld ></font>
									<FONT class=C55><INPUT type=radio value=1 <% IF RS_E("whereTel1")=1 Then %>Checked<%End if%> name=whereTel1>���� 
				<INPUT type=radio value=2 <% If RS_E("whereTel1")=2 Then %> Checked<%end if%> name=whereTel1>����</font>
									</td>  
									</tr>  
									  
									<tr height=25>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2>&nbsp;&nbsp;<FONT class=C55>�޴���</FONT></TD>
									</td>  
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><FONT class=C55>  
									<input  style="FONT-SIZE: 12px" size=4 MaxLength=4 name=hp1 value="<%=RS_E("hp1")%>" CLASS=txtfld>   
									- <input  style="FONT-SIZE: 12px" size=4 MaxLength=4 value="<%=RS_E("hp2")%>" CLASS=txtfld name=hp2> - <input  style="FONT-SIZE: 12px" size=4 MaxLength=4 value="<%=RS_E("hp3")%>" CLASS=txtfld name=hp3></font>  
									</td>  
								</tr>  

								<tr height=25> 
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2><FONT class=C66>*</FONT>&nbsp;<FONT class=C55>�� ��</FONT></TD>
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2>
										<SELECT NAME="job"> 
					<OPTION <% if RS_E("job")="����л�" then %>Selected <%end if%>>�л�</OPTION>  
					<OPTION <% if RS_E("job")="���л�" then %>Selected <%end if%>>���л�</OPTION>   
					<OPTION <% if RS_E("job")="��ǻ��/���ͳ�" then %>Selected <%end if%>>��ǻ��/���ͳ�</OPTION>  
					<OPTION <% if RS_E("job")="���" then %>Selected <%end if%>>���</OPTION>  
					<OPTION <% if RS_E("job")="������" then %>Selected <%end if%>>������</OPTION>  
					<OPTION <% if RS_E("job")="����" then %>Selected <%end if%>>����</OPTION>  
					<OPTION <% if RS_E("job")="���񽺾�" then %>Selected <%end if%>>���񽺾�</OPTION>   
					<OPTION <% if RS_E("job")="����" then %>Selected <%end if%>>����</OPTION>   
					<OPTION <% if RS_E("job")="����/����/�����" then %>Selected <%end if%>>����/����/�����</OPTION>   
					<OPTION <% if RS_E("job")="�����" then %>Selected <%end if%>>�����</OPTION>  
					<OPTION <% if RS_E("job")="����" then %>Selected <%end if%>>����</OPTION>  
					<OPTION <% if RS_E("job")="�Ƿ�" then %>Selected <%end if%>>�Ƿ�</OPTION>  
					<OPTION <% if RS_E("job")="����" then %>Selected <%end if%>>����</OPTION>   
					<OPTION <% if RS_E("job")="�Ǽ���" then %>Selected <%end if%>>�Ǽ���</OPTION>   
					<OPTION <% if RS_E("job")="������" then %>Selected <%end if%>>������</OPTION>  
					<OPTION <% if RS_E("job")="�ε����" then %>Selected <%end if%>>�ε����</OPTION>   
					<OPTION <% if RS_E("job")="��۾�" then %>Selected <%end if%>>��۾�</OPTION>   
					<OPTION <% if RS_E("job")="��/��/��/�����" then %>Selected <%end if%>>��/��/��/�����</OPTION>   
					<OPTION <% if RS_E("job")="����" then %>Selected <%end if%>>����</OPTION>   
					<OPTION <% if RS_E("job")="����" then %>Selected <%end if%>>����</OPTION>  
					<OPTION <% if RS_E("job")="��Ÿ" then %>Selected <%end if%>>��Ÿ</OPTION>  
										</SELECT> 
										&nbsp; 
										 
										 
										</td> 
								</tr> 
								
								
								
								
								

								<tr height=25>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2><FONT class=c66>*</FONT>&nbsp;<FONT class=C55>E-Mail</FONT></TD>
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><input type="text" name="email" size="25" maxlength="40" value="<%=RS_E("email")%>"><FONT class=c3><FONT color=#47b3b7>   
									  ��)redmaster@oyesmall.net</FONT></FONT></td> 
								</tr> 
							</Table>  
							</div>  
					</td>  
					</tr>  
					
				</table> </TD>
				
				</TR></TBODY></TABLE>
				<BR>
				<Div align=center>
				<input type="button" value="�������� "  onclick="write_ok();" class="button"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="�� ��"   class="button">
				</Div></Form>
			
 <BR><BR></TD></TR></TBODY></TABLE>
<Center><!--#include file="../shop/main_shopbottom.asp"--><BR><BR>
</CENTER>
</BODY>
</HTML>
<%End IF%>