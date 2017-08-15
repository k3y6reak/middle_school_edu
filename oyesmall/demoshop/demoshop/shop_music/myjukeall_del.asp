



<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->

<%
	Num1 = Request("Num")
	page = Request("page")

	
		



		Sql = "Delete From my_juke "

		Db.Execute Sql




%>
<Html>
	<Body background="../image/satan.gif">
<Script Language="JavaScript">
	
	location.href="./jukebox_list.asp?page=<%=page%>";
</Script>
</body>
</html>
