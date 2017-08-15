<%@ Language=VBScript %>
<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->
<%
	
	
	SQL = "Select SessionID From Tbl_Temp Where SessionID="& oyes_order &" "
	
	Set RS = DB.Execute (SQL)
	
	 IF Not RS.Eof Then 
		Response.Redirect "./Cart_payment.asp"
	 Else
		Response.Redirect "../login/login2.asp?gourl=1"
	 End IF
	 
	 RS.Close
	 
	Set RS = Nothing
	
	DB.Close
	
	Set DB = Nothing
	
%>
