
<%@ Language=VBScript %> 
<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->

<% 

UserID = Request.Form("User_ID") 

PassWD = Request.Form("PassWD") 


			
			
		strSQL="INSERT tbl_temp(sessionID, userID,passwd) VALUES ("& oyes_order &",'"& Userid &"','"& Passwd &"')" 
		DB.execute(strSQL) ' ���� sessionID���� userID ���� tbl_temp ���̺� �����մϴ�..

		Response.Redirect "../shop/shop_main.asp"

		DB.Close

		Set DB = nothing
					
%>


