
<%@ Language=VBScript %> 
<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->
<% 

UserID = Request.Form("User_ID") 
PassWD = Request.Form("PassWD") 


strSQL="SELECT * FROM Members WHERE user_id = '"& UserID &"' and passwd = '"& PassWD &"'" 

set rs = DB.execute(strSQL) 


if not rs.eof then 

				
				Userid = rs(1)
				Passwd = rs(2)
'				response.write(oyes_order)
'				response.end

					strSQL="INSERT tbl_temp(sessionID, userID,passwd) VALUES ("& oyes_order &",'"& Userid &"','"& Passwd &"')" 
					DB.execute(strSQL) ' 현제 sessionID값과 userID 값을 tbl_temp 테이블에 저장합니다..

					Response.Redirect "./profile.asp"
					
else
%>
 

   

<script language=javascript> 
alert("등록되지 않은 ID 이거나 비밀번호가 일치하지 않습니다."); 
history.back(); 
</script> 

<%
	end if
	RS.Close
	DB.Close

	Set RS = Nothing
	Set DB = Nothing
%>

