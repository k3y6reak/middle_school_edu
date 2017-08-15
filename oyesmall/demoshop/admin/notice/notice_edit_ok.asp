
<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->
<%
			
		page = Request("page")
		num = Request("num")

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
			
		SQL = "Select * From notice Where num="&num&" "
		
		Set RS = DB.Execute(SQL)

		SQL2 = "Update notice Set title='"&title&"'"
		SQL2 = SQL2 &",content='"&content&"'"
		SQL2 = SQL2 &",coding='"&coding&"'"
		SQL2 = SQL2 &",branch='"&branch&"'"
		SQL2 = SQL2 &"Where num="&num&" "

		DB.Execute (SQL2)
		
		RS.Close
		DB.Close
		Set RS = Nothing
		Set DB = Nothing

		Response.Redirect "./notice_list.asp?page="&page&" "

	End IF
%>