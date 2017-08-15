
<!--#include file = "./function.asp"--->

<!---#include file="../dbconn.asp"--->
<!---#include file="../master.asp"--->
<%
	page = Request("page")
	num = Request("num")
	name  = Trim(Request("name"))
	email = Trim(Request("email"))
	home = Trim(Request("home"))
	title = Trim(Request("title"))
	Title = replace(Title, chr(34), "&#34;") 

	tank = Request("tank")
	coding = Request("coding")
	content = Request("content")
'	editdate = date()
	pwd = Request("pwd")
	
	pwd = Replace(pwd,"'","''")
	name = Replace(name,"'","''")
	email = Replace(email,"'","''")
	home = Replace(home,"'","''")

	Title = ConvertToHTML(Title)  
	email = ConvertToHTML(email)  
	
	Title = ConvertToSQL(Title)  
	email = ConvertToSQL(email)   
	Content = ConvertToSQL(Content)  
	
	
	Select Case Coding
	
		Case "html"

			Content = CStr(Content)
			
		Case "text"
		
			Content = CStr(Content)
			Content = ConvertToHTML(Content)
	
	End Select	

	Set RS = Server.CreateObject("ADODB.RecordSet")

	Sql = "Select pwd From board Where Num="&Num

	RS.Open Sql,DB,1
		r_pwd = RS("pwd")
	

	
	
	
	IF pwd = RS("pwd") Then
		
		Sql2 = "Update board Set name='"&name&"'"
		Sql2 = Sql2 &",email='"&email&"'"
		Sql2 = Sql2 &",home='"&home&"'"
		Sql2 = Sql2 &",title='"&title&"'"
		Sql2 = Sql2 &",tank='"&tank&"'"
		Sql2 = Sql2 &",coding='"&coding&"'"
		Sql2 = Sql2 &",content='"&content&"'"
'		Sql2 = Sql2 &",postdate='"&editdate&"'"
		Sql2 = Sql2 &"Where num="&num
	

		DB.Execute(Sql2)

		RS.Close
		DB.Close
		Set Rs = Nothing
		Set Db = Nothing

		Response.Redirect "./list.asp?page="&page
	
	Else 
%>
<HTML>
	<HEAD>
		<META NAME="GENERATOR" Content="Microsoft Visual Studio.NET 7.0">
	</HEAD>
	<Body background="../image/satan.gif">
		<script language="javascript">
			window.alert("비밀번호가 일치하지 않습니다");
			history.go(-1);
		</script>
	</BODY>
</HTML>
<%
End If

End IF
%>


