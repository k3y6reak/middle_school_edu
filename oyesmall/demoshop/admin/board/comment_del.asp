

<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->
<%
		num = Request("num")
		co_seq = Request("co_seq")
		page = Request("page")

		SQL = "Delete From comment Where co_seq ="&co_seq&" "

		DB.Execute SQL

		DB.Close

		Set DB = Nothing

%>
<Html>
	<Body background="../image/satan.gif">
<Script Language="JavaScript">
	alert("삭제 되었습니다");
	location.href="./list.asp?page=<%=page%>&b_num=<%=num%>";
</Script>
</body>
</html>

<%

	End IF
%>