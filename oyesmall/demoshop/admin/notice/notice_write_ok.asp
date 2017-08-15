
<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->
<%
		title = Request("title")
		content = Request("content")
		coding = Request("coding")
		branch = Request("branch")
		postdate = Date()
		
		Title = Replace(title,"'","''")
		Title = replace(Title,"&","&amp;")
		Title = replace(Title,">","&gt;")
		Title = replace(Title,"<","&lt;")

		content = replace(content,"'","''")
		
		IF Request("coding") = "Text" Then
			content=replace(content,"'","''")
			content = replace(content,"&","&amp;")
			content = replace(content,"<","&lt;")
			content = replace(content,">","&gt;")
		End IF
			

		SQL = "Insert notice(title,content,coding,branch,postdate) values ('"&title&"','"&content&"','"&coding&"','"&branch&"','"&postdate&"')"
		DB.Execute (SQL)

		Response.Redirect "./notice_list.asp"

		DB.Close
		Set DB = Nothing
	End IF
%>
