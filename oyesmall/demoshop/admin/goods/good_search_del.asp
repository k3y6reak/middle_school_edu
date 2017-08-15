



<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->

<%
		Num = Request("Num")
		page = Request("page")

		Ch = request("chk").count 
		if Ch <> 0 then 
		i = 1
		for i = 1 to Ch  
		
		SQL2 = "Select * From goods Where num ='" & request("chk")(i) &"'"
	
		Set RS = DB.Execute (SQL2)
		
		FilePath1 = RS("Rooms") & RS("sphoto")
		FilePath2 = RS("Rooms") & RS("bphoto")
		FilePath3 = RS("Rooms") & RS("cphoto")

	'	Response.Write FilePath1
	'	Response.End

		Set FSO = CreateObject("Scripting.FileSystemObject")

			IF FSO.FileExists(FilePath1) Then
				FSO.DeleteFile(FilePath1)
			End IF

			IF FSO.FileExists(FilePath2) Then
				FSO.DeleteFile(FilePath2)
			End IF

			IF FSO.FileExists(FilePath3) Then
				FSO.DeleteFile(FilePath3)
			End IF


		
		sql = "Delete From goods Where num ='" & request("chk")(i) &"'"

		db.Execute sql
		next
		end if 
%>
<Html>
	<Body background="../image/satan.gif">
<Script Language="JavaScript">
	alert("삭제 되었습니다");
	location.href="./goods_search.asp/";
</Script>
</body>
</html>
<%
	Set FSO = Nothing
	RS.Close
	DB.Close
	Set RS = Nothing
	Set DB = Nothing
	End IF
%>



