

<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->

<%
	Num1 = Request("num")
	page = Request("page")

	
		


'response.end

		Sql = "Delete From my_juke Where j_num ="&Num1

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