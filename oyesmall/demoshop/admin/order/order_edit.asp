
	<!---#include file="../dbconn.asp"--->
	<!--#include file="../master.asp"-->
<%
		order_num = Request("order_num")
		page = Request("page")
		state = Request("state")

	

		SQL = "Update sell_man Set state="&state&" Where order_num="&order_num&" "

		DB.Execute SQL

		Response.Redirect "./order_list.asp?page="&page&" "

		DB.Close
		Set DB = Nothing
	End IF
%>