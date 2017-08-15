

<!---#include file="../dbconn.asp"--->

<!-- #include file = "./include/function.asp" -->

<%
response.write "dsagas"
'Response.End
dim sql
dim p_name

dim p_title
dim p_qcount
dim contents
dim p_over
dim i
dim p_q1
dim p_q2
dim p_q3
dim p_q4
dim p_q5
dim p_q6
dim p_q7
dim p_q8
dim p_q9
dim contentsView
dim str

p_name		= request ("p_name")

p_title		= request ("p_title")
p_qcount	= request ("p_qcount")
contents	= request ("contents")


'contents 변수에 받아온 데이터를 배열로 변환한다
contentsView		= split(contents,"_^_")

'설문제목의 길이가 150 이상일 때 자름
p_title = CutLeft(p_title,150)



'설문 문항의 갯수만큼 돌면서, 값을 넣는다
for i = 0 to ubound(contentsView) - 1

	select case cint(i)

	case 0 p_q1 = CutLeft(contentsView(i),50)
	case 1 p_q2 = CutLeft(contentsView(i),50)
	case 2 p_q3 = CutLeft(contentsView(i),50)
	case 3 p_q4 = CutLeft(contentsView(i),50)
	case 4 p_q5 = CutLeft(contentsView(i),50)
	case 5 p_q6 = CutLeft(contentsView(i),50)
	

	end select 

next

p_name		= CheckWord(p_name)
p_email		= CheckWord(p_email)
p_pass		= CheckWord(p_pass)
p_title		= CheckWord(p_title)
p_q1		= CheckWord(p_q1)
p_q2		= CheckWord(p_q2)
p_q3		= CheckWord(p_q3)
p_q4		= CheckWord(p_q4)
p_q5		= CheckWord(p_q5)


sql = "insert into poll("
Sql = Sql &"p_name,"
Sql = Sql &"p_title,"
Sql = Sql &"p_qcount,"
Sql = Sql &"p_q1,"
Sql = Sql &"p_q2,"
Sql = Sql &"p_q3,"
Sql = Sql &"p_q4,"
Sql = Sql &"p_q5"
Sql = Sql &")values('"
Sql = Sql &p_name&"','"
Sql = Sql &p_title&"','"
Sql = Sql &p_qcount&"','"
Sql = Sql &p_q1&"','"
Sql = Sql &p_q2&"','"
Sql = Sql &p_q3&"','"
Sql = Sql &p_q4&"','"
Sql = Sql &p_q5&"'"
Sql = Sql &")"

db.execute sql

response.redirect "./include/message.asp?code=makePoll"

%>