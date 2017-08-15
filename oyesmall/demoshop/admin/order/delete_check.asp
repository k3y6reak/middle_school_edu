
	<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->

<%
Num = Request("Num")
page = Request("page")

order_num = Request("order_num")

	
IF order_num <> "" Then
	SQL = "Delete seller Where order_num='"& order_num &"' "
	
	DB.Execute (SQL)
	
	SQL2 = "Delete sell_man Where order_num='"& order_num &"' "
	DB.Execute (SQL2)

ElseIF num <> "" Then 
	Ch = request("chk").count 
	if Ch <> 0 then 
	i = 1
	for i = 1 to Ch  

	'SQL = "Delete From seller
	sql = "Delete From sell_man Where num ='"& request("chk")(i) &"'"

	db.Execute sql
	next
	end if 
End IF


DB.Close
Set DB = Nothing
%>
<Html>
	<Body background="../image/satan.gif">
<Script Language="JavaScript">
	alert("삭제 되었습니다");
	location.href="./order_list.asp?page=<%=page%>";
</Script>
</body>
</html>

<%
	
	End IF
%>
