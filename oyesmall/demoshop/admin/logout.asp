<% 
Response.Cookies("MemLog")("cmemlogon") = ""
Response.Cookies("MemLog")("admingubun")= ""

             

Session.Abandon 

Response.write "<script language='javascript'>"
Response.write "alert('REDMASTER �� ���� �۾��� �����ο�����..?^^');"
Response.write "location.href='../shop/shop_main.asp';"
Response.write "</script>"

'Response.Redirect "../shop/shop_main.asp" 

%> 