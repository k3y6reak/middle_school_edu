

<!---#include file="../dbconn.asp"--->

<%

p_num = request ("p_num")
p_pass = request ("p_pass")



sql = "delete from poll where p_num = "&p_num&""
db.execute sql

sql = "delete from poll_tail where t_num = "&p_num&""
db.execute sql

response.redirect "./include/message.asp?code=DelPoll"

%>