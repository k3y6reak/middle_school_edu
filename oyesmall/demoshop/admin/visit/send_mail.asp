<!--#include file="../dbconn.inc"-->
<!---#include file="../session.asp"--->
<%
	email = Request("email")

	num = Request("num")

	Sql_e = "Select email from visit Where num="&num&" "
	Set EM = DB.Execute(Sql_e)

'	response.write num
'	response.End
%>
<HTML><HEAD><TITLE>OyesMall �� ���Ű��� ȯ���մϴ�</TITLE>
<LINK href="./images/sample.css" type=text/css rel=stylesheet>

		

		<Script Language="JavaScript">
				<!--
				function submit_ok() 
					{
						if ( document.mailing.m_send.value == "" ) 
							{
								alert("������ ����� �ּҸ� �����^^");
								document.mailing.m_send.focus();
								return false;
							}
						if ( document.mailing.m_to.value == "" ) 
							{
								alert("������ �Է��ϼ���\n������� ������ ������ �����ϴ�.");
								document.mailing.m_to.focus();
								return false;
							}
						if ( document.mailing.title.value == "" ) 
							{
								alert("������ �����^^\n���Ͽ� ������ �ʼ� �ƴϰھ��.");
								document.mailing.title.focus();
								return false;
							}
						if ( document.mailing.content.value == "" ) 
							{
								alert("������ �Է��ϼ���\n������� ������ ������ �����ϴ�.");
								document.mailing.content.focus();
								return false;
							}
				document.mailing.submit();
				}
				//-->
		</Script>
		<style>
		
		.button { background-color:#E7E3E7; border:solid 1 #333333; font-family:Tahoma,Verdana; font-size:9pt; color:#000000;width:30%;}
		
</style>
	</Head>

	<Body bgcolor=#EFD3D6 >
			
			<Form name=mailing action="./send_mail_ok.asp" method=post >

				<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
					<TBODY>
					<TR background="../shop_image/trgb.gif">
				<TD align=middle  height=25 align=center colspan=2><FONT 
				  color=#ffffff size=5><I><B>��Send Mail��</B></I></FONT></TD>
			</TR>
					<TR>
						<TD height=27 colspan=2>&nbsp;
							<IMG src="./images/i_title.gif">&nbsp;<B>FROM.</B></font></TD>
					</TR>
					
					<TR>
						<TD  height=27>&nbsp;
							E-Mail</B></TD>
						<TD>&nbsp;&nbsp;<Input type=text name=m_send size=25></TD>
					</TR>

					<TR>
						<TD  height=27 colspan=2>&nbsp;
							<IMG src="./images/i_title.gif">&nbsp;<B>TO.</B></font></TD>
						
					</TR>
					
					<TR>
						<TD height=27>&nbsp;
							E-Mail</B></TD>
						<TD>&nbsp;&nbsp;<Input type=text name=m_to size=25 value=<%=EM("email")%> readonly></TD>
					</TR>
					</TBODY>
				</Table>
				
				<BR>
				
				<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
					<TBody>
					

					<TR>
						<TD >&nbsp;<IMG src="./images/i_title.gif">&nbsp;
							�� ��</B></TD>
						<TD>&nbsp;&nbsp;<INPUT style="WIDTH: 200" maxLength=50 name=title> </TD>
					</TR>

					<TR>
						
						<TD colspan=2 align=center>
							<TEXTAREA class=minput style="WIDTH: 95%" name=content rows=12 wrap=hard cols=60></TEXTAREA> 
						</TD>
					</TR>
					</TBODY>
				</TABLE>
				
				<BR>

				<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
					<TBODY>
						<TR>
							<TD>
								<TABLE height=26 cellSpacing=0 cellPadding=0 width="100%"  border=0>
									<TBODY>
										<TR>
											<TD align=middle><INPUT class=button  type=button value="&nbsp;&nbsp;������&nbsp;&nbsp;" onClick="submit_ok();">&nbsp; 
												<INPUT id=reset1  class=button type=reset value=�ٽþ��� name=reset1> 
											</TD>
										</TR>
									</TBODY>
								</TABLE>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
				</FORM>
		</Body>
</Html>


<%
		EM.Close
		DB.Close

		Set EM = Nothing
		Set DB = Nothing
%>