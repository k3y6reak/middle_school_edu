<%
	IF	Request.Cookies("MemLog")("cmemlogon") <> "yes" then
			Response.Redirect "./admin_login.asp"
	Else
	
			admingubun = Request.Cookies("MemLog")("admingubun")

	End IF
%>
