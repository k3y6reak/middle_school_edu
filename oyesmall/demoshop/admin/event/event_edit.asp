 


<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->
<%

	Num = Request("Num")
	page = Request("page")

	Sql = "Select * From banner Where Num="&Num

	Set Rs = Server.CreateObject("ADODB.RecordSet")

	Rs.Open Sql , Db


	
%>





<html>
<head>
<title>�� �� OyesMall Event Goods Edit-Page �� ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">
				
		<Script Language="JavaScript">
				<!--
				function write_ok() 
					{
						
					
						if ( document.banner.b_name.value == "" ) 
							{
								alert("Event ��ǰ���� ���ž��� ^^");
								document.banner.b_name.focus();
								return false;
							}
					
								
						
				document.banner.submit();
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
							<TD>&nbsp; &nbsp; <FONT face=���� size=2><B>Event ��ǰ ���� ������</B></FONT></TD>
							<TD align=middle width=150 bgColor=#222222><FONT face=����><B>�� ǰ �� ��</B></FONT>
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
		 
		 <TD vAlign=top align=left>&nbsp;&nbsp;OyesMall�� Event ��ǰ�� �����ϴ� ���Դϴ�. 
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
									<form name=banner method=post action="./event_edit_ok.asp" >
										<INPUT type=hidden value="<%=num%>" name=num>
										<input type=hidden value="<%=page%>" name=page>
										
										<TBODY>
										
										<TR>
											<TD width=120 bgColor="#4A494A">&nbsp;
												<IMG src="../image/icon_orange.gif"><B>Category</B></TD>
											<TD><input style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:145px;background:#C5C5C5" value="<%=RS("cate")%>" readonly></TD>
										</TR>
										

										<TR>
											<TD bgColor="#4A494A">&nbsp;
												<IMG src="../image/icon_orange.gif">&nbsp;Event Name</TD>
											<TD><INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:145px;background:#C5C5C5" name=b_name value=<%=RS("b_name")%>> </TD>
										</TR>

										<TR>
											<TD bgColor="#4A494A">&nbsp;
												<IMG src="../image/icon_orange.gif">&nbsp;�� õ</TD>
											<TD><INPUT type=checkbox name=mainimage value=1 <%IF RS("mainimage") = "1" Then%>checked<%End IF%>>Shop Main Image&nbsp;&nbsp;<INPUT type=checkbox name=top3 value=1 <%IF RS("top3") = "1" Then%>checked<%End IF%>>Top Best 3 Event&nbsp;&nbsp;
													<INPUT type=checkbox name=category_top value=1 <%IF RS("category_top") = "1" Then%>checked<%End IF%>>Top Main Event&nbsp;&nbsp
													<INPUT type=checkbox name=nomi value=2 <%IF RS("nomi") = "2" Then%>checked<%End IF%>>Category Top Event<BR><BR>&nbsp;<B>>>&nbsp;Shop Main Image :</B>&nbsp; Main Page�� Top �̹��� �Դϴ�.<BR>&nbsp;<B>>>Top Best 3 Event :</B>&nbsp; Main Page�� �����ʿ� ��ġ�ϴ� �̺�Ʈ �Դϴ�.<BR>&nbsp;<B>>>Top Main Event :</B>&nbsp;ī�װ����� Event ��ǰ�߿��� Main �������� ���� ��ǰ�� �ǹ��մϴ�.<BR>&nbsp;<B>>>Category Top Event :</B>&nbsp;�ش� ī�װ��� Main �̹����� �ǹ� �մϴ�.<BR>(<font color=orange>��͵� �������� ������ �� ��ǰ�� �ش� ī�װ��� Enevt ��ǰ���θ� ���� �ֽ��ϴ�.</font>)</TD>
										</TR>
										
										<TR>
											<TD bgColor="#4A494A">&nbsp;
												<IMG src="../image/icon_orange.gif">&nbsp;�׸�����</B></TD>
											<TD>
												<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="100%" bgColor=#efefef borderColorLight=#999966 border=1>
													<TBODY>
													<TR>
														<TD align=left width=120>&nbsp;���� �̹���</TD>
														<TD><INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100%;background:#C5C5C5" maxLength=90   name=image1 type=file> </TD>
														
													</TR>
										
													<TR>
														<TD align=left width=120 >&nbsp;Ȯ�� �̹���</TD>
														<TD> <INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100%;background:#C5C5C5"  maxLength=90   name=image2 type=file> </TD>
														
													</TR>
													</TBODY>
												</TABLE>
											</TD>
										</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</Tbody>
					</Table>
											</Div>
		
		<BR>	
			
		<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
				<TBODY>
					<TR>
						<TD align="middle" height="1">
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
			<TBODY>
				<TR>
					<TD align=middle height=40>
						<input type="button" style="width:15%;" class=button2  value="��������" onclick="write_ok()">&nbsp;&nbsp;
						<input type="reset" style="width:15%;" class=button2  value="�ٽþ���" >
					</td>
				</TR>
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






		

