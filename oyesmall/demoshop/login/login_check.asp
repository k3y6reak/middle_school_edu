
<%@ Language=VBScript %> 
<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->
<% 

'On Error Resume Next

UserID = Request.Form("User_ID") 
PassWD = Request.Form("PassWD") 

gourl = Request("gourl")


	strSQL="SELECT * FROM Members WHERE user_id = '"& UserID &"' and passwd = '"& PassWD &"' " 

	
	set rs = DB.execute(strSQL) 


	if not rs.eof then 

						
'				response.write(Userid)
'				response.write(passwd)
'				response.write(oyes_order)
				Userid = rs(1)
				Passwd = rs(2)

						strSQL3="INSERT tbl_temp(sessionID, userID,passwd) VALUES ("& oyes_order &",'"& Userid &"','"& Passwd &"')" 
			
						DB.execute(strSQL3) ' 현제 sessionID값과 userID 값을 tbl_temp 테이블에 저장합니다..

									
					IF gourl = "" Then
						Response.Redirect "../shop/shop_main.asp"
					ElseIF gourl = "1" Then
						Response.Redirect"../shopping_cart/Cart_payment.asp"
					End IF

				Else
%>

	<script language=javascript> 
	alert("등록되지 않은 ID 이거나 비밀번호가 일치하지 않습니다."); 
	history.back(); 
	</script> 

<%
		End IF
		
		RS.Close
		DB.Close

		Set RS = Nothing
		Set DB = Nothing
%>