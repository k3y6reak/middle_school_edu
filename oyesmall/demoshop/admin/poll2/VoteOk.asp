<%
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
'
'	�������縦 ����ϰ�, ������ �� �ִ� ���α׷��Դϴ�.
'	��ġ���� ����� �����ϱ�, ���ܼ���.txt ������ ���ð�	
'	��ġ�Ͻø� �ǰڽ��ϴ�.
'	���� �������̳�, ���״� �Ʒ� ���Ϸ� ��������.
'	������ �ǽñ�...
'
'	������ : ��ũ�ٽ� ( cuqdas@coom.co.kr )
'
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
%>

<!-- #include file = "./include/dbconnect.asp" -->

<%

dim sql
dim p_q1_count
dim p_q2_count
dim p_q3_count
dim p_q4_count
dim p_q5_count
dim p_q6_count
dim p_q7_count
dim p_q8_count
dim p_q9_count
dim i
dim p_num
dim p_total_count

p_num = request ("p_num")

p_q1_count = 0
p_q2_count = 0
p_q3_count = 0
p_q4_count = 0
p_q5_count = 0
p_q6_count = 0
p_q7_count = 0
p_q8_count = 0
p_q9_count = 0
p_total_count = 0

for i = 1 to request ("cValue").count

	select case cint(request ("cValue")(i))

	case 1 p_q1_count = 1
	case 2 p_q2_count = 1 
	case 3 p_q3_count = 1
	case 4 p_q4_count = 1
	case 5 p_q5_count = 1
	case 6 p_q6_count = 1
	case 7 p_q7_count = 1
	case 8 p_q8_count = 1
	case 9 p_q9_count = 1

	end select

	p_total_count = p_total_count + 1

next

'��ȸ�� �ߺ� ���� ����
if request.cookies("poll")("p_num")="" then response.cookies("poll")("p_num")=p_num end if
if request.cookies("poll")("p_num1")="" then response.cookies("poll")("p_num1")=0 end if
if request.cookies("poll")("p_num2")="" then response.cookies("poll")("p_num2")=0 end if
if request.cookies("poll")("p_num3")="" then response.cookies("poll")("p_num3")=0 end if
if request.cookies("poll")("ddate")="" then response.cookies("poll")("ddate")="1999-01-02" end if

if cdate(request.cookies("poll")("ddate"))=date and (cdbl(request.cookies("poll")("p_num"))=cdbl(p_num) or cdbl(request.cookies("poll")("p_num1"))=cdbl(p_num) or cdbl(request.cookies("poll")("p_num2"))=cdbl(p_num) or cdbl(request.cookies("poll")("p_num3"))=cdbl(p_num)) then

else

	sql = "update poll set p_q1_count = p_q1_count + "&p_q1_count&",p_q2_count = p_q2_count + "&p_q2_count&",p_q3_count= p_q3_count + "&p_q3_count&",p_q4_count = p_q4_count + "&p_q4_count&",p_q5_count = p_q5_count + "&p_q5_count&",p_q6_count = p_q6_count + "&p_q6_count&",p_q7_count = p_q7_count + "&p_q7_count&",p_q8_count = p_q8_count + "&p_q8_count&",p_q9_count = p_q9_count + "&p_q9_count&",p_total_count = p_total_count + "&p_total_count&",p_vote_count = p_vote_count + 1 where p_num = "&cint(p_num)&""
	db.execute sql
	response.cookies("poll")("ddate")=date
	response.cookies("poll")("p_num3")=request.cookies("poll")("p_num2")
	response.cookies("poll")("p_num2")=request.cookies("poll")("p_num1")
	response.cookies("poll")("p_num1")=request.cookies("poll")("p_num")
	response.cookies("poll")("p_num")=p_num
	response.cookies("poll").expires = #1/1/2010 00:00:00#

end if

response.redirect "./View.asp?p_num="&p_num&""

%>

