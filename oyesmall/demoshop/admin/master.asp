

<%
		IF	Request.Cookies("MemLog")("cmemlogon") <> "yes" then

				Response.Redirect "../admin_login.asp"
		Else
		
				admingubun = Request.Cookies("MemLog")("admingubun")

		End IF
	
		IF admingubun  < 2  Then
			
			Response.write "<script language='javascript'>"
			Response.write "alert('����� REDMASTER ���� �ƴϱ���.\n\n�˼��մϴ�. ����� ���� �ѷ����⸸ �Ҽ��ֽ��ϴ�..^^');"
			Response.write "history.go(-1);"
			Response.write "</script>" 
		Else
%>
