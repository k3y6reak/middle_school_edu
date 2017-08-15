<%
	IF	Request.Cookies("MemLog")("cmemlogon") <> "yes" then
			Response.Redirect "../admin_login.asp"
	Else
			admingubun = Request.Cookies("MemLog")("admingubun")

			IF admingubun < "2" Then
%>
			<script language=javascript> 

			alert("당신은 이곳을 보실 권한이 없습니다."); 

			history.back(); 

			</script> 
			
<%
			End IF	
			
	End IF
	
	
%>
