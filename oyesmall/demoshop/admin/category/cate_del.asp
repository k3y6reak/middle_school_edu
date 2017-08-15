



<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->

<%
		c_no = Request("c_no")
		page = Request("page")
		Ref =  Request("Ref")
		lev = Request("lev")
		c_step = Request("step")

		

		IF lev = 0  Then

			For i = lev To 2

				Sql_1 = "Delete From category Where Ref = "&Ref&" and lev = "&i&" "

				DB.Execute (Sql_1)

			Next

		ElseIF lev = 1 Then
		
				
                Sql_2 = "Delete From Category Where Ref = "&Ref&" and lev = 1 and step = "&c_step&" "
				DB.Execute (Sql_2)
			'					Response.Write Sql_2&"<br>"

				For BB=1 To 9
					CC = c_step&BB
					Sql_3 = "Delete From Category Where Ref = "&Ref&" and lev = 2 and step = "&CC&" "
			'	Response.write Sql_3&"<br>"
					
					DB.Execute (Sql_3)
				Next

				
			'		Response.end

				
			Else
				Sql = "Delete From Category Where c_no = "&c_no&" "
				DB.Execute Sql
			End IF
%>
<Html>
	<Body background="../image/satan.gif">
<Script Language="JavaScript">
	alert("삭제 되었습니다");
	location.href="./cate_list.asp?page=<%=page%>";
</Script>
</body>
</html>

<%

	End IF
%>

