<!--#include file="../session.asp"-->
<%
	email = Request("email")
%>
<Html>
	<Head><title>◇ ◆ OyesMall E-mail ◆ ◇</title>

		<STYLE type=text/css>
			SELECT {
				FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: 굴림
			}
			INPUT {
				FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: 굴림
			}
			TEXTAREA {
				FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: 굴림
			}
			OPTION {
				FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: 굴림
			}
			BODY {
				FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: "굴림"; TEXT-DECORATION: none
			}
			A:link {
				COLOR: black; TEXT-DECORATION: none; font-color: #333300
			}
			A:visited {
				COLOR: black; TEXT-DECORATION: none; font-color: #333300
			}
			A:active {
				COLOR: black; TEXT-DECORATION: none; font-color: #333300
			}
			A:hover {
				COLOR: black; TEXT-DECORATION: none; font-color: #cc6600
			}
			TR {
				FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: "굴림"; TEXT-DECORATION: none
			}
			TD {
				FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: "굴림"; TEXT-DECORATION: none
			}
		</STYLE>
		<style>
		
					.button { background-color:#CECF9C; border:solid 1 #333333; font-family:Tahoma,Verdana; font-size:9pt; color:#000000;width:15%;}
					
				</style>
		<style type="text/css"> 
			textarea {
						scrollbar-face-color: #D8D4B6; 
						scrollbar-shadow-color: #333300; 

						scrollbar-highlight-color: #333300; 
						scrollbar-3dlight-color:#333300; 

						scrollbar-darkshadow-color: #D8D4B6; 
						scrollbar-track-color: #D8D4B6; 

						scrollbar-arrow-color: #333300
						} 


		</style>

		<Script Language="JavaScript">
				<!--
				function submit_ok() 
					{
						if (!check_mail(document.mailing.m_send))
							{
										alert('메일주소가 형식에 맞지 않습니다.');
										document.mailing.m_send.focus();
										return false; 
							}
						if ( document.mailing.m_to.value == "" ) 
							{
								alert("내용을 입력하세요\n내용없는 메일을 보낼수 없습니다.");
								document.mailing.m_to.focus();
								return false;
							}
						if ( document.mailing.title.value == "" ) 
							{
								alert("제목을 써야죠^^\n메일에 제목은 필수 아니겠어요.");
								document.mailing.title.focus();
								return false;
							}
						if ( document.mailing.content.value == "" ) 
							{
								alert("내용을 입력하세요\n내용없는 메일을 보낼수 없습니다.");
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
	</Head>

	<Body  bgcolor="#D8D4B6">
			
			<Form name=mailing action="./send_mail_ok.asp" method=post >

				<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="100%" 
					borderColorLight=#999966 border=1 bgcolor="#D8D4B6">
					<TBODY>
					<TR>
						<TD bgColor=#cccc99 height=27 colspan=2>&nbsp;
							<IMG src="../image/icon_orange.gif"><FONT face=돋움 size=2><B>FROM.</B></font></TD>
					</TR>
					
					<TR>
						<TD bgColor=#cccc99 width=140 height=27>&nbsp;
							<IMG src="../image/icon_orange.gif">E-Mail</B></TD>
						<TD><Input type=text name=m_send size=30></TD>
					</TR>

					<TR>
						<TD bgColor=#cccc99 height=27 colspan=2>&nbsp;
							<IMG src="../image/icon_orange.gif"><FONT face=돋움 size=2><B>TO.</B></font></TD>
						
					</TR>
					
					<TR>
						<TD bgColor=#cccc99 width=140 height=27>&nbsp;
							<IMG src="../image/icon_orange.gif">E-Mail</B></TD>
						<TD><Input type=text name=m_to size=30 value="<%=email%>" readonly></TD>
					</TR>
					</TBODY>
				</Table>
				
				<BR>
				
				<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="100%" 
					borderColorLight=#999966 border=1 bgcolor="#D8D4B6">
					<TBody>
					

					<TR>
						<TD bgColor=#cccc99 width=140 >&nbsp;
							<IMG src="../image/icon_orange.gif">제 목</B></TD>
						<TD><INPUT style="WIDTH: 100%" maxLength=50 name=title> </TD>
					</TR>

					<TR>
						<TD bgColor=#cccc99>&nbsp;
							<IMG src="../image/icon_orange.gif">내 용</B></TD>
						<TD>
							<TEXTAREA class=minput style="WIDTH: 100%" name=content rows=12 wrap=hard cols=60></TEXTAREA> 
						</TD>
					</TR>
					</TBODY>
				</TABLE>
				
				<BR>

				<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="100%" 
					borderColorLight=#999966 border=1 bgcolor="#D8D4B6">
					<TBODY>
						<TR>
							<TD>
								<TABLE height=26 cellSpacing=0 cellPadding=0 width="100%" bgColor=#cccc99 border=0>
									<TBODY>
										<TR>
											<TD align=middle><INPUT style="BACKGROUND-COLOR: #ffcc33"  type=button value="&nbsp;&nbsp;보내기&nbsp;&nbsp;" onClick="submit_ok();" class=button>&nbsp; 
												<INPUT id=reset1 style="BACKGROUND-COLOR: #ffcc33" type=reset value=다시쓰기 name=reset1 class=button> 
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