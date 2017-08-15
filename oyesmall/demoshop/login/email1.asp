<%
		name = Request("name")
		email = Request("email")
'Response.Write name
'response.End
		str_from = "redmaster@oyesmall.net"
		str_subject = name &"님의 회원가입을 축하드립니다.^^"
		str_to = email
		
		Set FSO = CreateObject("Scripting.FileSystemObject")
		Set mailFSO = FSO.OpenTextFile("C:\oyesmall\demoshop\login\email2.asp") '업로드 할때는 경로를 바꾸어준다
		ok_mail = mailFSO.ReadAll
		str_tomail = ok_mail
		
	
				Set objmail = Server.CreateObject("CDONTS.NewMail")
						objmail.from = str_from
						objmail.to = str_to
						objmail.subject = str_subject
						objmail.body = str_tomail
						objMail.BodyFormat = 0
						objMail.MailFormat = 0
						objmail.send
				Set objmail = nothing
	
		mailFSO.Close
		Set mailFSO = Nothing
	'	FSO.Close
		Set FSO = Nothing

'		Response.Redirect "./join_success.asp?user_id="&user_id&"&passwd="&passwd&" "

%>
<center>ok</center>
