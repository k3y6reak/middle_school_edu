
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
					DB.execute(strSQL) ' ���� sessionID���� userID ���� tbl_temp ���̺� �����մϴ�..

					Response.Redirect "./profile.asp"
					
else
%>
 

   

<script language=javascript> 
alert("��ϵ��� ���� ID �̰ų� ��й�ȣ�� ��ġ���� �ʽ��ϴ�."); 
history.back(); 
</script> 

<%
	end if
	RS.Close
	DB.Close

	Set RS = Nothing
	Set DB = Nothing
%>

