
<!---#include file="../dbconn.asp"--->

<!--#include file="../master.asp"-->
<%
Num = Request("Num")
page = Request("page")


	


Ch = request("chk").count 
if Ch <> 0 then 
i = 1
for i = 1 to Ch  
SQL_co = "Delete from comment Where num='"& request("chk")(i) &"'"
		DB.Execute (SQL_co)

		SQL_re = "Delete From board Where ref='"& request("chk")(i) &"'"
		DB.Execute (SQL_re)

sql = "Delete From board Where num ='"& request("chk")(i) &"'"

db.Execute sql
next
end if 
%>
<Html>
	<Body background="../image/satan.gif">
<Script Language="JavaScript">
	alert("삭제 되었습니다");
	location.href="./list.asp?page=<%=page%>";
</Script>
</body>
</html>

<%

	End IF
%>
