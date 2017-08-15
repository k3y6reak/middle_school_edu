<!--#include file="../admin/dbconn.asp"-->
<!---#include file="../cookie.asp"--->
<% 


strSQL = "DELETE FROM tbl_Temp WHERE sessionid='"& oyes_order &"'" 

DB.Execute(strSQL) 


set DB = nothing 

             

Session.Abandon 

Response.write "<script language='javascript'>"
Response.write "alert('즐거운 쇼핑이 되셨습니까?\n\n저희 OyesMall 을 찾아 주셔서 감사합니다.^^');"
Response.write "location.href='../shop/shop_main.asp';"
Response.write "</script>"

'Response.Redirect "../shop/shop_main.asp" 

%> 