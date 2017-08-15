<!---#include file="../admin/dbconn.asp"--->
<!--#include file="../cookie.asp"--->
<%
		g_code = Request("g_code")
		top = Request("top")
		
		SQL = "Delete From Shop_cart Where good_code="&g_code&" And SessionID="&oyes_order&" "

		DB.Execute SQL
		
		Response.Redirect "./Cart_list.asp?top="&top&" "
%>
