<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->

<%
		user_id = Request("user_id")
		passwd = Request("passwd")


		SQL = "Delete From members Where user_id='"& user_id &"' And passwd='"& passwd &"' "

		DB.Execute SQL

		SQL2 = "DELETE FROM tbl_Temp WHERE userID='"& user_id &"'" 

		DB.Execute(SQL2) 

		Session.Abandon 

		Response.write "<script language='javascript'>"
		Response.write "alert('ȸ������ ��� ������ ���� �Ǿ����ϴ�.');"
		Response.write "location.href='../shop/shop_main.asp';"
		Response.write "</script>"
%>
