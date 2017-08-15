<!--#include file="./dbconn.asp"-->
<%


adminid = Replace(Trim(Request("adminid")),"'","''")
adminpwd = Replace(Trim(Request("adminpwd")),"'","''")

Set RS = Server.CreateObject("ADODB.RecordSet")

SQL ="select adminid,adminpwd,gubun from admin_tb where adminid ='"& adminid &"' And adminpwd='"& adminpwd &"' "

RS.Open SQL,DB,1

	IF RS.Eof Or RS.Bof Then
%>
	<script language=javascript> 

	window.alert("관리자에게 문의 하세요.."); 

	history.back(); 

	</script> 
<%
	Else
		Response.Cookies("MemLog")("cmemlogon") = "yes"
		Response.Cookies("MemLog")("admingubun")= RS("gubun")
		Response.Cookies("MemLog").expires = date + 1
		
		RS.Close
		
		yester =date() - 1
		
		DB.Execute ("Delete from tbl_temp where writedate <='"&yester&"'")
		
		DB.Execute ("Delete from shop_cart where cartdate <='"&yester&"'")
	'	Response.End
		
		Response.Redirect "./admin_top.asp"
		
	End IF

DB.Close
Set RS = Nothing
Set DB = Nothing
%>
