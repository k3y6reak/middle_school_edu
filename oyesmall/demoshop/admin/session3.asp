<%
	IF	Request.Cookies("MemLog")("cmemlogon") <> "yes" then
			Response.Redirect "../admin_login.asp"
	Else
			admingubun = Request.Cookies("MemLog")("admingubun")

			IF admingubun < "2" Then
%>
			<script language=javascript> 

			alert("����� �̰��� ���� ������ �����ϴ�."); 

			history.back(); 

			</script> 
			
<%
			End IF	
			
	End IF
	
	
%>
