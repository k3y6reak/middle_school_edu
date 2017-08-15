

<%
		IF	Request.Cookies("MemLog")("cmemlogon") <> "yes" then

				Response.Redirect "../admin_login.asp"
		Else
		
				admingubun = Request.Cookies("MemLog")("admingubun")

		End IF
	
		IF admingubun  < 2  Then
			
			Response.write "<script language='javascript'>"
			Response.write "alert('당신은 REDMASTER 님이 아니군요.\n\n죄송합니다. 당신은 단지 둘러보기만 할수있습니다..^^');"
			Response.write "history.go(-1);"
			Response.write "</script>" 
		Else
%>
