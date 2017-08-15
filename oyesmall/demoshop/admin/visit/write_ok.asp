
<%@ Language=VBScript %>
<!--#include file="../dbconn.inc"-->
<!---#include file="../session.asp"--->
<%
	name = Request("name")
	e_mail = Request("email")
	home = Request("homepage")
	postdate = date()
	content = Request("content")

	name = Replace(name,"'","''")
	e_mail = Replace(e_mail,"'","''")
	home = Replace(home,"'","''")

	content = Replace(content,"'","''")
	content = replace(content,"&","&amp;")
	content = replace(content,">","&gt;")
	content = replace(content,"<","&lt;")
	
	
	SQL = "Insert into visit(name,email,home,content,postdate) values ('"&name&"','"&e_mail&"','"&home&"','"&content&"','"&postdate&"')"

'	Response.Write SQL
'	response.End

	DB.Execute (SQL)

	DB.Close
	Set DB = Nothing
%>

<script language ="javascript">


	parent.location.href = "list.asp" //여기에서 타겟프레임으로 보냅니다
</script>