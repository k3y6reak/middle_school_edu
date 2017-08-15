
<%@ Language=VBScript %>
<%
Set fs = CreateObject("Scripting.FileSystemObject")

	lastfile = Server.MapPath("dat_file/last.dat")
	
'	response.write lastfile
'	response.end

	filecount = fs.OpenTextFile(lastfile, 1, true).ReadAll
	filecount = filecount + 1
	fs.CreateTextFile(lastfile, true).Write(filecount)

	name = Request("name")
	e_mail = Request("email")
	home = Request("homepage")
	postdate = now()
	comments = Request("comment")
	
'	Response.Write name
'	Response.end

Set gb = fs.CreateTextFile(Server.MapPath("dat_file/" & filecount & ".dat"), true)

	gb.WriteLine(name)
	gb.WriteLine(e_mail)
	gb.WriteLine(home)
	gb.WriteLine(postdate)
	gb.Write(comments)

	gb.Close
Set fs = nothing
%>

<script language ="javascript">


	parent.location.href = "list.asp" //여기에서 타겟프레임으로 보냅니다
</script>