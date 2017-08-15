<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->

<%
Num = Request("Num")
page = Request("page")

delmode = Request("delmode")

IF delmode <> "" Then

	SQL2 = "Delete From notice Where num="&num&" "

	DB.Execute (SQL2)
Else

	Ch = request("chk").count 
	if Ch <> 0 then 
	i = 1
	for i = 1 to Ch  
	sql = "Delete From notice Where num ='"& request("chk")(i) &"'"

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
	location.href="./notice_list.asp?page=<%=page%>";
</Script>
</body>
</html>
<%

	End IF
%>