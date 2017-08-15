
<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->
<%
	num = request("num")
	page = request("page")


	user_id = request("user_id")
	passwd = request("passwd")

	passwd_q = Request("passwd_q")
	passwd_a = Request("passwd_a")
	name = request("name")

	birth_yy = request("birth_yy")
	birth_mm = request("birth_mm")
	birth_dd = request("birth_dd")
	birth_gbn = request("birth_gbn")
	ismarry = request("ismarry")
	
	address = request("address")
	
	
	tel1_1 = request("tel1_1")
	tel1_2 = request("tel1_2")
	tel1_3 = request("tel1_3")
	whereTel1 = request("whereTel1")
	tel2_1 = request("tel2_1")
	tel2_2 = request("tel2_2")
	tel2_3 = request("tel2_3")
	whereTel2 = request("whereTel2")
	hp1 = request("hp1")
	hp2 = request("hp2")
	hp3 = request("hp3")
	job = request("job")
'	receiveType = request("receiveType")
	
	email = request("email")
	postdate = date()
	editdate = date()


	user_id = Trim(user_id)
	passwd = Trim(passwd)
	name = Trim(name) 
	email = Trim(email)

	



'	Set Rs = Server.CreateObject("ADODB.RecordSet")

'	SQL = "Select * From Members Where user_id='"& user_id &"' And passwd='"& passwd &"' "
	

'	Rs.Open Sql,Db,1

	Sql2 = "Update members Set passwd='"&passwd&"'"

	
	Sql2 = Sql2 &",passwd_q='"&passwd_q&"'"
	Sql2 = Sql2 &",passwd_a='"&passwd_a&"'"
	Sql2 = Sql2 &",name='"&name&"'"
	
	Sql2 = Sql2 &",birth_yy='"&birth_yy&"'"
	Sql2 = Sql2 &",birth_mm='"&birth_mm&"'"
	Sql2 = Sql2 &",birth_dd='"&birth_dd&"'"
	Sql2 = Sql2 &",birth_gbn='"&birth_gbn&"'"
	
	Sql2 = Sql2 &",ismarry='"&ismarry&"'"
	Sql2 = Sql2 &",address='"&address&"'"
	Sql2 = Sql2 &",tel1_1='"&tel1_1&"'"
	Sql2 = Sql2 &",tel1_2='"&tel1_2&"'"
	Sql2 = Sql2 &",tel1_3='"&tel1_3&"'"
	Sql2 = Sql2 &",whereTel1='"&whereTel1&"'"
	Sql2 = Sql2 &",tel2_1='"&tel2_1&"'"
	Sql2 = Sql2 &",tel2_2='"&tel2_2&"'"
	Sql2 = Sql2 &",tel2_3='"&tel2_3&"'"
	Sql2 = Sql2 &",whereTel2='"&whereTel2&"'"
	Sql2 = Sql2 &",hp1='"&hp1&"'"
	Sql2 = Sql2 &",hp2='"&hp2&"'"
	Sql2 = Sql2 &",hp3='"&hp3&"'"
	Sql2 = Sql2 &",job='"&job&"'"
'	Sql2 = Sql2 &",receiveType='"&receiveType&"'"
	Sql2 = Sql2 &",email='"&email&"'"
	Sql2 = Sql2 &",editdate='"&editdate&"'"
	Sql2 = Sql2 &"Where user_id='"& user_id &"' And passwd='"& passwd &"' "

	Db.Execute Sql2
'response.Write SQL2
'response.End

'	Rs.Close

	Db.Close

'	Set Rs = Nothing
	
	Set Db = Nothing

		Response.write "<script language='javascript'>"
		Response.write "alert('회원님의 정보가 수정되었습니다. ^^');"
		Response.write "location.href='./profile.asp';"
		Response.write "</script>"
%>
