
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
		alert("<%= fileno%>�� ������ ���� �Ǿ����ϴ�!");
			location="list.asp";
	</script>
	</body>
</html>
<%else%>

<Html>
	<Body background="../image/satan.gif">
	<script>
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			location = "list.asp";
	</script>
	</body>
</html>

<%
		end if
		DB.Close
		Set DB = Nothing
%>

