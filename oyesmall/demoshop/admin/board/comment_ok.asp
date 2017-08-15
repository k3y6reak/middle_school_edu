


<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->
<%
		
		num = Request("num")
		page = Request("page")
		
		
		co_name = Trim(Request("co_name"))
		co_pass = Trim(Request("co_pass"))
		co_content = Request("co_content")

		co_name = Replace(co_name,"'","''")
		co_pass = Replace(co_pass,"'","''")
		co_content = replace(co_content,"'","''")

		co_name = replace(co_name, chr(34), "&#34;") 
		co_pass = replace(co_pass, chr(34), "&#34;") 
		
		co_content = replace(co_content,"&","&amp;")
		co_content = replace(co_content,">","&gt;")
		co_content = replace(co_content,"<","&lt;")
		
		
		master = "1"
		
		SQL = "Insert into comment ("
		SQL = SQL&"num,"
		SQL = SQL&"co_name,"
		SQL = SQL&"co_pass,"
		SQL = SQL&"master,"
		SQL = SQL&"co_content"
		SQL = SQL&")"
		SQL = SQL&"values"
		SQL = SQL&"('"
		SQL = SQL&num&"','"
		SQL = SQL&co_name&"','"
		SQL = SQL&co_pass&"','"
		SQL = SQL&master&"','"
		SQL = SQL&co_content&"'"
		SQL = SQL&")"

	'	Response.Write SQL
	'	Response.End

		DB.Execute (SQL)
	
		Response.Redirect "list.asp?page="&int(page)&"&b_num="&num 
		
		End IF

		DB.Close

		Set DB = Nothing

		
%>
