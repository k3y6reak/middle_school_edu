
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
	alert("<%= fileno%>�� ������ ���� �Ǿ����ϴ�!");
		location="list.asp";
</script>

<%else%>

<script>
	alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		location = "list.asp";
</script>

<%end if%>