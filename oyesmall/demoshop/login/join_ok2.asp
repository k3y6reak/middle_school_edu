
<%@ Language=VBScript %> 
<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->
<% 

UserID = Request.Form("User_ID") 

PassWD = Request.Form("PassWD") 




					strSQL="INSERT tbl_temp(sessionID, userID,passwd) VALUES ("& oyes_order &",'"& Userid &"','"& Passwd &"')" 
					DB.execute(strSQL)
		
					Response.write "<script language='javascript'>"
					Response.write "alert('���� OyesMall �� ã�� �ּż� �����մϴ�. ^^');"
					Response.write "location.href='../shop/shop_main.asp';"
					Response.write "</script>"

					DB.Close

					Set DB = Nothing
%>

 

   


