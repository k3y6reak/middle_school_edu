
<%@ Language=VBScript %>

<!---#include file="../dbconn.inc"--->
<%
on error resume next


	fileno = Request("no")
	passwd = Request("pwd")
	
if passwd="redscorpio" then

	SQL = "Delete From visit Where num="&fileno
	DB.Execute SQL
%>
<Html>
	<Body background="../image/satan.gif">
	<script>
		alert("<%= fileno%>번 방명록이 삭제 되었습니다!");
			location="list.asp";
	</script>
	</body>
</html>
<%else%>

<Html>
	<Body background="../image/satan.gif">
	<script>
		alert("비밀번호가 일치하지 않습니다.");
			location = "list.asp";
	</script>
	</body>
</html>

<%
		end if
		DB.Close
		Set DB = Nothing
%>

