<%
	email = Request("email")
%>
<HTML><HEAD><TITLE>OyesMall �� ���Ű��� ȯ���մϴ�</TITLE>
<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>

		

		<Script Language="JavaScript">
				<!--
				function submit_ok() 
					{
						
						if (!check_mail(document.mailing.m_send))
							{
										alert('�����ּҰ� ���Ŀ� ���� �ʽ��ϴ�.');
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

					function check_mail(cg) {
	emailEx1 = /[^@]+@[A-Za-z0-9_\-]+\.[A-Za-z]+/;
	emailEx2 = /[^@]+@[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z]+/;
	emailEx3 = /[^@]+@[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z]+/;

	if(emailEx1.test(cg.value)) return true;
	if(emailEx2.test(cg.value)) return true;
	if(emailEx3.test(cg.value)) return true;

	return false;
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
							<IMG src="../shop_image/i_title.gif">&nbsp;<B>FROM.</B></font></TD>
					</TR>
					
					<TR>
						<TD  height=27>&nbsp;
							E-Mail</B></TD>
						<TD>&nbsp;&nbsp;<Input type=text name=m_send size=25></TD>
					</TR>

					<TR>
						<TD  height=27 colspan=2>&nbsp;
							<IMG src="../shop_image/i_title.gif">&nbsp;<B>TO.</B></font></TD>
						
					</TR>
					
					<TR>
						<TD height=27>&nbsp;
							E-Mail</B></TD>
						<TD>&nbsp;&nbsp;<Input type=text name=m_to size=25 value="<%=email%>" readonly></TD>
					</TR>
					</TBODY>
				</Table>
				
				<BR>
				
				<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
					<TBody>
					

					<TR>
						<TD >&nbsp;<IMG src="../shop_image/i_title.gif">&nbsp;
							�� ��</B></TD>
						<TD>&nbsp;&nbsp;<INPUT style="WIDTH: 200" maxLength=50 name=title> </TD>
					</TR>

					<TR>
						
						<TD colspan=2 align=center>
							<TEXTAREA class=minput style="OVERFLOW: auto;WIDTH: 95%" name=content rows=12 wrap=hard cols=60 ></TEXTAREA> 
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