

<!-- #include file = "./include/dbconnect.asp" -->
<!-- #include file = "./include/function.asp" -->

<%

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
p_over		= request ("p_over")

'contents 변수에 받아온 데이터를 배열로 변환한다
contentsView		= split(contents,"_^_")

'설문제목의 길이가 150 이상일 때 자름
p_title = CutLeft(p_title,150)

'중복선택이 체크되어있지 않을 때 0 값을 넣는다
if len(p_over) = 0 then

	p_over = 0	

end if

'설문 문항의 갯수만큼 돌면서, 값을 넣는다
for i = 0 to ubound(contentsView) - 1

	select case cint(i)

	case 0 p_q1 = CutLeft(contentsView(i),50)
	case 1 p_q2 = CutLeft(contentsView(i),50)
	case 2 p_q3 = CutLeft(contentsView(i),50)
	case 3 p_q4 = CutLeft(contentsView(i),50)
	case 4 p_q5 = CutLeft(contentsView(i),50)
	case 5 p_q6 = CutLeft(contentsView(i),50)
	case 6 p_q7 = CutLeft(contentsView(i),50)
	case 7 p_q8 = CutLeft(contentsView(i),50)
	case 8 p_q9 = CutLeft(contentsView(i),50)

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
p_q6		= CheckWord(p_q6)
p_q7		= CheckWord(p_q7)
p_q8		= CheckWord(p_q8)
p_q9		= CheckWord(p_q9)

sql = "insert into poll(p_name,p_title,p_qcount,p_over,p_date,p_q1,p_q2,p_q3,p_q4,p_q5,p_q6,p_q7,p_q8,p_q9,p_q1_count,p_q2_count,p_q3_count,p_q4_count,p_q5_count,p_q6_count,p_q7_count,p_q8_count,p_q9_count,p_vote_count,p_total_count) values('"&p_name&"','"&p_title&"',"&p_qcount&","&p_over&",getdate(),'"&p_q1&"','"&p_q2&"','"&p_q3&"','"&p_q4&"','"&p_q5&"','"&p_q6&"','"&p_q7&"','"&p_q8&"','"&p_q9&"',0,0,0,0,0,0,0,0,0,0,0)"
db.execute sql

response.redirect "./include/message.asp?code=makePoll"

%>