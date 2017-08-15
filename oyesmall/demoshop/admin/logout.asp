<% 
Response.Cookies("MemLog")("cmemlogon") = ""
Response.Cookies("MemLog")("admingubun")= ""

             

Session.Abandon 

Response.write "<script language='javascript'>"
Response.write "alert('REDMASTER ´Ô ¿À´Ã ÀÛ¾÷Àº ¼øÁ¶·Î¿ü³ª¿ä..?^^');"
Response.write "location.href='../shop/shop_main.asp';"
Response.write "</script>"

'Response.Redirect "../shop/shop_main.asp" 

%> 