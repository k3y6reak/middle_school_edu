<!--#include file="../admin/dbconn.asp"-->
<!---#include file="../cookie.asp"--->
<% 


strSQL = "DELETE FROM tbl_Temp WHERE sessionid='"& oyes_order &"'" 

DB.Execute(strSQL) 


set DB = nothing 

             

Session.Abandon 

Response.write "<script language='javascript'>"
Response.write "alert('��ſ� ������ �Ǽ̽��ϱ�?\n\n���� OyesMall �� ã�� �ּż� �����մϴ�.^^');"
Response.write "location.href='../shop/shop_main.asp';"
Response.write "</script>"

'Response.Redirect "../shop/shop_main.asp" 

%> 