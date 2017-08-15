
<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->
<%
	'	Set Rs = Server.CreateObject("ADODB.RecordSet")

		For Each i in Request("chk")

				Sql = "Select mp3 From juke Where num ="& i &""

				

				Set Rs = Db.Execute(SQL)

				filename = Rs("mp3")
				filename = Replace(filename,"'","''")
			

				SQL = "INSERT INTO my_juke (SessionID, ck, mp3) VALUES "
				SQL = SQL & "("& oyes_order &",'"& i &"','"& filename &"')"
				Db.Execute(SQL)

				'Response.write sql&"<br>"

		Next
		'response.end
	'	RS.Close
		Db.Close
		Set RS = Nothing
		Set Db = Nothing

		Response.Redirect "./jukebox_list.asp"
%>