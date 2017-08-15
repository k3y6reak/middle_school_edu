<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->
<%

	num = Request("editnum")
	name = Request("name")
	adminid = Request("adminid")
	email = Request("email")
	adminpwd = Request("adminpwd")
	phone = Request("phone")
	gubun = Request("gubun")

	name = Replace(name,"'","''")
	adminid = Replace(adminid,"'","''")
	email = Replace(email,"'","''")
	adminpwd = Replace(adminpwd,"'","''")

	phone = Replace(phone,"'","''")

	name = replace(name, chr(34), "&#34;") 
	

if len(num) > 0 then
sql = "select * from admin_tb where num ="&num
else
sql = "admin_tb"
end if
set rs=server.CreateObject("adodb.recordset")
	rs.Open sql,db,3,3
	if len(num) > 0 then
	rs.Update
	else
	rs.AddNew
	end if
	rs("name")=name
	rs("adminid")=adminid
	rs("email")=email
	rs("adminpwd")=adminpwd
	rs("phone")=phone
	rs("gubun")=gubun
	rs.UpdateBatch
	rs.Close
	
	DB.Close

	Set RS = Nothing
	Set DB = Nothing


	Response.Redirect "./list.asp"


	End IF
%>