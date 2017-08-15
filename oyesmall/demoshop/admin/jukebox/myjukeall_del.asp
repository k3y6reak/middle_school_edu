




<!---#include file="../dbconn.asp"--->


<%
	Num1 = Request("Num")
	page = Request("page")

	
		



		Sql = "Delete From my_juke "

		Db.Execute Sql

		DB.Close

		Set DB = Nothing



%>
<Html>
	<Body background="../image/satan.gif">
<Script Language="JavaScript">
	
	location.href="./jukebox_list.asp?page=<%=page%>";
</Script>
</body>
</html>
