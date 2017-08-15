
<!---#include file="../admin/dbconn.asp"--->
<!--#include file="../cookie.asp"--->
<%
	Top_1 = Request("top")
	G_code1 = Request("g_code")
	EA_1 = Request("ea")

	
	SQL = "Select SessionID,Good_code,Good_ea From Shop_cart Where Good_code="&G_code1&" And SessionID="&oyes_order&" "
	
'	Response.Write SQL
'	Response.End

	Set RS = DB.Execute (SQL)

			IF RS.EOF Then
				SQL_Cart = "Insert Into shop_cart ("
				SQL_Cart = SQL_Cart &"SessionID,"
				SQL_Cart = SQL_Cart &"Good_code,"
				SQL_Cart = SQL_Cart &"Good_ea"
				SQL_Cart = SQL_Cart &") Values ('"
				SQL_Cart = SQL_Cart &oyes_order&"','"
				SQL_Cart = SQL_Cart &G_code1&"','"
				SQL_Cart = SQL_Cart &EA_1&"'"
				SQL_Cart = SQL_Cart &")"
				
			

				DB.Execute (SQL_Cart)
				Response.Write SQL_Cart
			Else
				EA_ADD = EA_1 + RS("Good_ea")
				SQL_Cart2 = "Update shop_cart Set Good_ea ="&EA_ADD&" Where Good_code="&G_code1&" "
					
				DB.Execute (SQL_Cart2)
				Response.Write SQL_Cart2
			End IF

	RS.Close
	DB.Close
	
	Set RS = Nothing
	Set DB = Nothing

	 Response.Redirect "./cart_list.asp?Top="&Top_1&" "
%>
