
<!---#include file="../dbconn.asp"--->

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