<!---#include file="../cookie.asp"--->

<%
		num = Request("num")
		co_seq = Request("co_seq")
		page = Request("page")

		

%>
<HTML><HEAD><TITLE>Who is RedMaster..?</TITLE>
<style type="text/css"> 
.input {
	BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: silver; BACKGROUND: none transparent scroll repeat 0% 0%; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: silver; BORDER-TOP-COLOR: silver; LINE-HEIGHT: 100%; BORDER-RIGHT-WIDTH: 0px; BORDER-RIGHT-COLOR: silver
}
.kissofgod-submit {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; FONT-SIZE: 8pt; BORDER-LEFT: 0px; WIDTH: 55px; COLOR: white; LINE-HEIGHT: 100%; BORDER-BOTTOM: 0px; FONT-FAMILY: Tahoma; HEIGHT: 15px; BACKGROUND-COLOR: #000000
}
BODY {
	FONT-SIZE: 9pt; COLOR: #ffffff; LINE-HEIGHT: 160%; FONT-FAMILY: 굴림
}
</style>


</HEAD>

<BODY bgColor=pink leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
	
	<Div align=center>
	
	비밀번호를 입력해 주세요..
      <TABLE width=250 border=0  cellSpacing=1 cellPadding=3 >
        <FORM name=delete action="./comment_del_ok.asp" method=post>
			<input type=hidden name="co_seq" value="<%=co_seq%>">
			<input type=hidden name="page" value="<%=page%>">
			<input type=hidden name="num" value="<%=num%>">
			<TBODY>
			
			<TR height=50 bgcolor="#ffffff" >
				  <TD align=middle background="../shop_image/com_image.jpg"><BR><INPUT class=input type=password maxLength=20 name=co_pass> <BR><BR><INPUT class=kissofgod-submit type=submit value=Delete>　 
					<INPUT class=kissofgod-submit onclick="history.go(-1);" type=button value=Back> 
				  </TD>
			</TR>
			</TBODY>
		</TABLE>
		</FORM>
        </Div>
</BODY>
</HTML>
