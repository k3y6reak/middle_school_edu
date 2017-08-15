



<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->

<%
		Num = Request("Num")
		page = Request("page")

		
		
		SQL2 = "Select * From banner Where num ="&num
	
		Set RS = DB.Execute (SQL2)
		
		FilePath1 = RS("b_room") & RS("image1")
		FilePath2 = RS("b_room") & RS("image2")
	

	'	Response.Write FilePath1
	'	Response.End

		Set FSO = CreateObject("Scripting.FileSystemObject")

			IF FSO.FileExists(FilePath1) Then
				FSO.DeleteFile(FilePath1)
			End IF

			IF FSO.FileExists(FilePath2) Then
				FSO.DeleteFile(FilePath2)
			End IF

		Set FSO = Nothing
		
		sql = "Delete From banner Where num ="&num

		db.Execute sql
	
%>
<Html>
	<Body background="../image/satan.gif">
<Script Language="JavaScript">
	alert("삭제 되었습니다");
	location.href="./event_list.asp?page=<%=page%>";
</Script>
</body>
</html>

<%
	RS.Close
	DB.Close

	Set RS = Nothing
	Set DB = Nothing
	End IF
%>


