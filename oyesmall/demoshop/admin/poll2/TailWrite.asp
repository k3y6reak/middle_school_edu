<%
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
'
'	설문조사를 등록하고, 관리할 수 있는 프로그램입니다.
'	설치법은 어렵지 않으니깐, 간단설명.txt 파일을 보시고	
'	설치하시면 되겠습니다.
'	사용상 불편함이나, 버그는 아래 메일로 보내세요.
'	도움이 되시길...
'
'	제작자 : 쿠크다스 ( cuqdas@coom.co.kr )
'
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
%>

<!-- #include file="./include/dbconnect.asp" -->
<!-- #include file="./include/function.asp" -->

<%

t_num=request.form("t_num")
t_name=CheckWord(request.form("t_name"))
t_email=CheckWord(request.form("t_email"))
t_content=CheckWord(request.form("t_content"))
t_ip=Request.Servervariables("remote_host")

if t_content <> "" then

	sql="insert into poll_tail(t_num,t_name,t_email,t_content,t_date,t_ip) values("&t_num&",'"&t_name&"','"&t_email&"','"&t_content&"',getdate(),'"&t_ip&"')"
	db.execute sql
	db.close

end if

response.redirect "./View.asp?p_num="&t_num

%>