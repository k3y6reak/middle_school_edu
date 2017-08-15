
<!---#include file="../dbconn.asp"--->


<%
		Num = Request("Num")
		page = Request("page")

		Ch = request("chk").count 
		if Ch <> 0 then 
		i = 1
		for i = 1 to Ch  
		
			
		sql = "Delete From admin_tb Where num ='" & request("chk")(i) &"'"

		db.Execute sql
		next
		end if 

		DB.Close
		Set DB = Nothing
%>
<Html>
	<Body background="../image/satan.gif">
<Script Language="JavaScript">
	alert("삭제 되었습니다");
	location.href="./list.asp?page=<%=page%>";
</Script>
</body>
</html>