



<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->

<%
		Num = Request("Num")
		page = Request("page")

		
	
		SQL2 = "Select * From juke Where num ="&num
	
		Set RS = DB.Execute (SQL2)
		
		FilePath1 = RS("fileroom") & RS("mp3")

		

		Response.Write FilePath1
	'	Response.End

		Set FSO = CreateObject("Scripting.FileSystemObject")

			IF FSO.FileExists(FilePath1) Then
				FSO.DeleteFile(FilePath1)
			End IF



		
		sql = "Delete From juke Where num ="&num

		db.Execute sql

		Db.Close
	
	Set FSO = Nothing
	Set RS = Nothing
	Set Db = Nothing
	
%>
<Html>
	<Body background="../image/satan.gif">
<Script Language="JavaScript">
	alert("삭제 되었습니다");
	location.href="./jukebox_list.asp?page=<%=page%>";
</Script>
</body>
</html>

<%

	End IF
%>


