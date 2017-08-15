<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->
<%

	
	sql = "select user_id from members where user_id='" & request("user_id") & "'"
	
	set result = db.Execute(sql)
	
	if not result.eof then

%>
<script language="javascript">
alert("이미 존재하는 아이디 입니다. 다시 기입해주세요");
history.back();
</script>

<%  
	else
	
	user_id = request("user_id")
	passwd = request("Password")
	passwd1 = request("passwd1")
	passwd_q = Request("passwd_q")
	passwd_a = Request("passwd_a")
	name = request("FullName")
	jumin1 =  request("RegNo")
	jumin2 = request("RegNo2")
	birth_yy = request("BirthDateYear")
	birth_mm = request("BirthDateMonth")
	birth_dd = request("BirthDateDay")
	birth_gbn = request("SolarLunarStatus")
	ismarry = request("ismarry")
	
	address = request("address")
	
	tel1_1 = request("Phone")
	tel1_2 = request("Phone2")
	tel1_3 = request("Phone3")
	whereTel1 = request("whereTel1")
	tel2_1 = request("tel2_1")
	tel2_2 = request("tel2_2")
	tel2_3 = request("tel2_3")
	whereTel2 = request("whereTel2")
	hp1 = request("HandPhone")
	hp2 = request("HandPhone2")
	hp3 = request("HandPhone3")
	job = request("Profession")
	receiveType = request("receiveType")
	point = 0
	email = request("MainEmail")
	postdate = date()
	editdate = date()

'	user_id = Trim(user_id)
'	passwd = Trim(passwd)
'	name = Trim(name)
'	email = Trim(email)


	Sql = "insert members("
		Sql = Sql &"user_id,"
		Sql = Sql &"passwd,"
		Sql = Sql &"passwd1,"
		Sql = Sql &"passwd_q,"
		Sql = Sql &"passwd_a,"
		Sql = Sql &"name,"
		Sql = Sql &"jumin1,"
		Sql = Sql &"jumin2,"
		Sql = Sql &"birth_yy,"
		Sql = Sql &"birth_mm,"
		Sql = Sql &"birth_dd,"
		Sql = Sql &"birth_gbn,"
		Sql = Sql &"ismarry,"
		Sql = Sql &"point,"
		Sql = Sql &"address,"
	
		Sql = Sql &"tel1_1,"
		Sql = Sql &"tel1_2,"
		Sql = Sql &"tel1_3,"
		Sql = Sql &"whereTel1,"
		Sql = Sql &"tel2_1,"
		Sql = Sql &"tel2_2,"
		Sql = Sql &"tel2_3,"
		Sql = Sql &"whereTel2,"
		Sql = Sql &"hp1,"
		Sql = Sql &"hp2,"
		Sql = Sql &"hp3,"
		Sql = Sql &"job,"
		Sql = Sql &"receiveType,"
		
		Sql = Sql &"email,"
		Sql = Sql &"postdate,"
		Sql = Sql &"editdate"
		Sql = Sql &")"
		
		Sql = Sql &"values"
		Sql = Sql &"('"
		Sql = Sql &user_id&"','"
		Sql = Sql &passwd&"','"
		Sql = Sql &passwd1&"','"
		Sql = Sql &passwd_q&"','"
		Sql = Sql &passwd_a&"','"
		Sql = Sql &name&"','"
		Sql = Sql &jumin1&"','"
		Sql = Sql &jumin2&"','"
		Sql = Sql &birth_yy&"','"
		Sql = Sql &birth_mm&"','"
		Sql = Sql &birth_dd&"','"
		Sql = Sql &birth_gbn&"','"
		Sql = Sql &ismarry&"','"
		Sql = Sql &point&"','"
		Sql = Sql &address&"','"
	
		Sql = Sql &tel1_1&"','"
		Sql = Sql &tel1_2&"','"
		Sql = Sql &tel1_3&"','"
		Sql = Sql &whereTel1&"','"
		Sql = Sql &tel2_1&"','"
		Sql = Sql &tel2_2&"','"
		Sql = Sql &tel2_3&"','"
		Sql = Sql &whereTel2&"','"
		Sql = Sql &hp1&"','"
		Sql = Sql &hp2&"','"
		Sql = Sql &hp3&"','"
		Sql = Sql &job&"','"
		Sql = Sql &receiveType&"','"
		
	
		Sql = Sql &email&"','"
		Sql = Sql &postdate&"','"
		Sql = Sql &editdate&"'"
		Sql = Sql &")" 

'		response.write Sql
'		response.end
'for i=1 to 100
		Db.Execute Sql
'next
		End if

		Db.Close

		Set Db = Nothing

'		str_from = "redmaster@oyesmall.net"
'		str_subject = name &"님의 회원가입을 축하드립니다.^^"
'		str_to = email
		
'		Set FSO = CreateObject("Scripting.FileSystemObject")
'		Set mailFSO = FSO.OpenTextFile("C:\oyesmall\login\join_email.asp") '업로드 할때는 경로를 바꾸어준다
'		ok_mail = mailFSO.ReadAll
'		str_tomail = ok_mail
		
	
'				Set objmail = Server.CreateObject("CDONTS.NewMail")
'						objmail.from = str_from
'						objmail.to = str_to
'						objmail.subject = str_subject
'						objmail.body = str_tomail
'						objMail.BodyFormat = 0
'						objMail.MailFormat = 0
'						objmail.send
'				Set objmail = nothing
	
'		mailFSO.Close
'		Set mailFSO = Nothing
'		FSO.Close
'		Set FSO = Nothing

		Response.Redirect "./join_success.asp?user_id="&user_id&"&passwd="&passwd&" "

%>


<center>ok</center>
