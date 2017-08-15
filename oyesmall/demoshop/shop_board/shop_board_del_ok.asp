

<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->

<%
		num = Request("num")
		
		page = Request("page")
		pwd = Request("pwd")

		SQL = "Select pwd From board Where num="&num
	
		
		Set RS = DB.Execute (SQL)


		
		IF pwd <> RS("pwd") Then
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
	
	비밀번호가 일치하지 않습니다..
      <TABLE width=250 border=0  cellSpacing=1 cellPadding=3 >
			<TBODY>
			<TR height=50 bgcolor="#ffffff" >
				  <TD align=middle background="../shop_image/com_image.jpg"><BR><BR><INPUT class=kissofgod-submit onclick="history.go(-1);" type=button value=Back> 
				  </TD>
			</TR>
			</TBODY>
		</TABLE>
	
        </Div>
</BODY>
</HTML>

<%
		Else
		
		SQL_co = "Delete from comment Where num="&num

		
		DB.Execute (SQL_co)

		

		SQL = "Delete From board Where num="&num
		DB.Execute SQL

		'SQL_re = "Delete From board Where ref="&num

	
		'DB.Execute (SQL_re)

%>
<Html>
	<Body bgcolor=pink>
<Script Language="JavaScript">
	alert("삭제 되었습니다");
	location.href="./shop_board_list.asp?page=<%=page%>";
</Script>
</body>
</html>

<%
	End IF
	
	RS.Close
	DB.Close

	Set RS = Nothing
	Set DB = Nothing
%>