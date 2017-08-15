


<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->
<%
	on Error resume next
		Response.Expires = 0
		Server.ScriptTimeOut = 7200

	coding = Request("coding")
	Ch = Request("chk")
	


	From_mail= "redmaster@oyesmall.net"
	Content = Request("content")
	Title = Request("Title")
	
	Content = Replace(Content,chr(13)&chr(10),"<br>")
	Title = Replace(Title,"&","&amp;")
	Title = Replace(Title,"<","&lt;")
	Title = Replace(Title,">","&gt;")
	

	
	IF Request("Chk") <> "" Then	'선택메일
	
		For Each m in request("chk")
			Sql = "Select email From members Where num="&m
			
			Set RS = DB.Execute(Sql)
			
			To_mail =  RS("email") 
			
			

			set objmail = server.createobject("cdonts.newmail")
			
				objmail.from = From_mail
				objmail.to = To_mail
				objmail.subject = Title
				objmail.body = Content

				Select Case Coding 
					Case "html"
						objmail.bodyformat = 0
						objmail.mailformat = 0
					Case "text"
						objmail.bodyformat = 1
						objmail.mailformat = 1
				End Select	
				
				'메일 전송
				objmail.send

			
			set objmail = nothing
		
		Next
	
	Else	'전체메일
	
			Sql = "Select email From members"
			
			Set RS = DB.Execute (Sql)

			While Not RS.EOF

				Set objmail = Server.CreateObject("CDONTS.NewMail")
						
						objmail.from = From_mail
						objmail.to = RS("email")
						objmail.subject = Title
						objmail.body = Content
						
						Select Case Coding 
							Case "html"
								objmail.bodyformat = 0
								objmail.mailformat = 0
							Case "text"
								objmail.bodyformat = 1
								objmail.mailformat = 1
						End Select	

						objmail.send
				
				Set objmail = nothing

			RS.MoveNext

			Wend
		
				
	End  If
	RS.Close
	Db.Close
	Set RS = Nothing
	Set Db = Nothing
	
		Response.write "<script language='javascript'>"
		Response.write "alert('메일을 발송하였습니다. ^^');"
		Response.write "location.href='./email.asp';"
		Response.write "</script>"

	End IF
%>