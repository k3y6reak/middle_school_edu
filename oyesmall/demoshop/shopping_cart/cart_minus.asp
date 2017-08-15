<!---#include file="../admin/dbconn.asp"--->
<!--#include file="../cookie.asp"--->
<%
		g_code = Request("g_code")
		top = Request("top")
	'	EA1 = Request("ea")
	'	Response.Write g_code
	'	Response.End
		
		SQL_1 = "Select good_ea From shop_cart Where SessionID ="&oyes_order&" And good_code="&g_code&" " 
		Set RS = DB.Execute(SQL_1)
		ea = 	RS("good_ea")
	'	Response.Write Ea
	'	Response.End
		IF  ea >=1 Then

			SQL = "Update shop_cart Set good_ea = good_ea - 1 Where good_code ="&g_code&" And SessionID ="&oyes_order&" " 

			DB.Execute (SQL)

			Response.Redirect "./cart_list.asp?top="&top&" "

		Else

		Response.write "<script language='javascript'>"
		Response.write "alert('최소한 1개 이상은 선택하셔야 합니다. ^^');"
		Response.write "location.href='javascript:history.go(-1)';"
		Response.write "</script>"

	    End IF
		
%>