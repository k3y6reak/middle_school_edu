<!--#include file="../session.asp"-->
<%
	on Error resume next
		Response.Expires = 0
		Server.ScriptTimeOut = 7200

	m_send = Request("m_send")
	m_to = Request("m_to")

	m_to = Replace(m_to,"'","''")

	title = request.form("title")
	title = replace(title,"&","&amp;")
	title = replace(title,"<","&lt;")
	title = replace(title,">","&gt;")
	title=replace(title,"'","''")

	content = request.form("content")
	content = replace(content,"'","''")
	content = replace(content,"&","&amp;")
	content = replace(content,"<","&lt;")
	content = replace(content,">","&gt;")
	content = replace(content,chr(13),"<br>")

'response.write content
'response.end

	SET ObjMail = Server.CreateObject("CDONTS.Newmail")
		Objmail.From = m_send
		Objmail.To = m_to
		Objmail.Subject = title
		Objmail.body = content
		Objmail.bodyFormat = 1
		Objmail.MailFormat = 1
		Objmail.send
	SET Objmail = Nothing

		Response.write "<script language='javascript'>"
		Response.write "alert('메일을 발송하였습니다. ^^');"
		Response.write "location.href='javascript:self.close()';"
		Response.write "</script>"
%>
