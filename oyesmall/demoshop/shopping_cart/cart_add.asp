<!---#include file="../admin/dbconn.asp"--->
<!--#include file="../cookie.asp"--->
<%
		g_code = Request("g_code")
		top = Request("top")
	'	EA1 = Request("ea")
	'	Response.Write top
	'	Response.End
		
			SQL = "Update shop_cart Set good_ea = good_ea + 1 Where good_code ="&g_code&" And SessionID ="&oyes_order&" " 

			DB.Execute (SQL)
			
			Response.Redirect "./cart_list.asp?top="&top&" "
%>