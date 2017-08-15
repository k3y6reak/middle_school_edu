
<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->
<%
	num = Request("num")

	page=Request("page")

		SQL_co = "Delete from comment Where num="&num
		DB.Execute (SQL_co)

		SQL_re = "Delete From board Where ref="&num
		DB.Execute (SQL_re)

		SQL = "Delete From board Where num="&num
		DB.Execute SQL

		



	DB.Close

	Set DB = Nothing
%>

<Html>
	<Body background="../image/satan.gif">
<Script Language="JavaScript">
	alert("삭제 되었습니다");
	location.href="./list.asp?page=<%=page%>";
</Script>
</body>
</html>

<%

	End IF
%>
