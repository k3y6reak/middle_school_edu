
<!--#include file = "./function.asp"--->

<!---#include file="../dbconn.asp"--->
<!---#include file="../master.asp"--->
<%
	
'	num = Reguest("num")
	name = Request("name")
	email = Request("email")
	title = Request("title")
	content = Request("content")
	pwd = Request("pwd")
	ref = Request("ref")
	r_step = Request("r_step")
	reforder = Request("reforder")
	ReadCount = 0
	coding = Request("coding")
	home = Request("home")
	tank = Request("tank")
	postdate = date()


	pwd = Replace(pwd,"'","''")
	name = Replace(name,"'","''")
	email = Replace(email,"'","''")
	home = Replace(home,"'","''")

	Title = Replace(title,"'","''")
	Title = replace(Title,"&","&amp;")
	Title = replace(Title,">","&gt;")
	Title = replace(Title,"<","&lt;")

	name = replace(name, chr(34), "&#34;") 
	Title = replace(Title, chr(34), "&#34;") 

	content = Replace(content,"'","''")

	master = "1"
	
	

	Content = ConvertToSQL(Content)
	
	
	Select Case Coding
	
		Case "html"

			Content = CStr(Content)
			
		Case "text"
		
			Content = CStr(Content)
			Content = ConvertToHTML(Content)
	
	End Select	
	
	SQL = "Select Max(num) From board"

	Set RS = Server.CreateObject("ADODB.RecordSet")
	RS.Open SQL,DB

	IF IsNull(RS(0)) Then
	num=1
	Else
	num=RS(0)+1
	End If
	        


	IF Request("num") <> "" Then
		ref = Cint(ref)
		r_step = Cint(r_step)
		reforder = Cint(reforder)
	
		Sql2 = "Update board Set r_step = r_step + 1"
		Sql2 = Sql2 &"Where ref ="&ref&" And r_step >"&r_step
		DB.Execute Sql2

		r_step = r_step + 1
		reforder = reforder + 1
	
	Else
		ref = num 
		r_step = 0
		reforder = 0
	End IF

	Sql = "Insert Into board("
	Sql = Sql&"name,"
	Sql = Sql&"email,"
	Sql = Sql&"title,"
	Sql = Sql&"content,"
	Sql = Sql&"postdate,"
	'Sql = Sql &"editdate,"
	Sql = Sql&"readcount,"
	Sql = Sql&"coding,"
	Sql = Sql&"pwd,"
	Sql = Sql&"num,"
	Sql = Sql&"ref,"
	Sql = Sql&"r_step,"
	Sql = Sql&"reforder,"
	Sql = Sql&"home,"
	Sql = Sql&"master,"
	Sql = Sql&"tank"
	Sql = Sql&")"
	Sql = Sql&"Values"
	Sql = Sql&"('"
	Sql = Sql&name&"','"
	Sql = Sql&email&"','"
	Sql = Sql&title&"','"
	Sql = Sql&content&"',GetDate(),'"
	Sql = Sql&readcount&"','"
	Sql = Sql&coding&"','"
	Sql = Sql&pwd&"','"
	Sql = Sql&num&"','"
	Sql = Sql&ref&"','"
	Sql = Sql&r_step&"','"
	Sql = Sql&reforder&"','"
	Sql = Sql&home&"','"
	Sql = Sql&master&"','"
	Sql = Sql&tank&"'"
	Sql = Sql&")"
'	response.write Sql
'	response.end
	DB.Execute Sql

	RS.Close
	DB.Close
	Set Rs = Nothing
	Set DB = Nothing

	Response.Redirect "list.asp"

End IF

%>
ok