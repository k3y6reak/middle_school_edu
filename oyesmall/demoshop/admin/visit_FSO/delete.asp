
<%@ Language=VBScript %>
<%
on error resume next
Set fs = CreateObject("Scripting.FileSystemObject")

	fileno = Request("no")
	passwd = Request("pwd")
	
if passwd="1234" then
	fs.DeleteFile(Server.MapPath("dat_file/"&fileno & ".dat"))
%>

<script>
	alert("<%= fileno%>번 방명록이 삭제 되었습니다!");
		location="list.asp";
</script>

<%else%>

<script>
	alert("비밀번호가 일치하지 않습니다.");
		location = "list.asp";
</script>

<%end if%>