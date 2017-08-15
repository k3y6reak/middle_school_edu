
<%@ Language=VBScript %> 
<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->

<% 

UserID = Request.Form("User_ID") 

PassWD = Request.Form("PassWD") 


			
			
		strSQL="INSERT tbl_temp(sessionID, userID,passwd) VALUES ("& oyes_order &",'"& Userid &"','"& Passwd &"')" 
		DB.execute(strSQL) ' 현제 sessionID값과 userID 값을 tbl_temp 테이블에 저장합니다..

		Response.Redirect "../shop/shop_main.asp"

		DB.Close

		Set DB = nothing
					
%>


