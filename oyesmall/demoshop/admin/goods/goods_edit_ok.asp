



<!--#include file = "./function.asp"--->

<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->

<%
	page = Request("page")


	
 
	Set uploadform = Server.CreateObject("ABCUpload4.XForm")

		uploadform.OverWrite = True
		uploadform.AbsolutePath = True
		


	ca1 =  uploadform("ca1")	
	num = uploadform("num")
	g_code = uploadform("g_code")
	g_name = uploadform("g_name")
	g_com = uploadform("g_com")
	or_p = uploadform("or_p")

	color = uploadform("color")
	Best_Choice = uploadform("Best_Choice")
	Weekly_Best = uploadform("Weekly_Best")
	m_choice = uploadform("m_choice")
	choice = uploadform("choice")
	event_2 = uploadform("event_2")
	point = uploadform("point")

	r_ea = uploadform("r_ea")
	feature = uploadform("feature")
	coding = uploadform("coding")
	Content = uploadform("Content")
	
	

	feature = replace(feature,"'","''")
	feature = replace(feature,"&","&amp;")
	feature = replace(feature,"<","&lt;")
	feature = replace(feature,">","&gt;")
	
	Content = ConvertToSQL(Content)
	
	
	Select Case Coding
	
		Case "html"

			Content = CStr(Content)
			
		Case "text"
		
			Content = CStr(Content)
			Content = ConvertToHTML(Content)
	
	End Select	

	'FSO 객체의 인스턴스 생성
	Set FSO = CreateObject("Scripting.FileSystemObject")
	
	Set AA = uploadform("sphoto")(1)

	Set BB = uploadform("bphoto")(1)

	Set CC = uploadform("cphoto")(1)


	
		If AA  = ""  then
			AA = null
		Else
			Rooms1 = Server.MapPath("../") &"\mall_image\" & ca1&"\"
		'	response.Write Room1
		'	response.End
				If Not FSO.FolderExists(Rooms1) then
					FSO.CreateFolder(Rooms1)
				End If
				
			s_path =AA.RawFilePath
			s_name = Mid(s_path,InstrRev(s_path,"\")+1)
			FileStartName = Mid(s_name, 1, Instr(s_name, ".")-1) 
			FileEndName = Mid(s_name, InstrRev(s_name, ".")+1)

		
			s_photo = Rooms1 & s_name
			
									Flag = True
									nCount = 0

									While Flag 
											If FSO.FileExists(s_photo) then
													nCount = nCount + 1
													s_name = FileStartName & "_"& nCount &"." & FileEndName
													s_photo = Rooms1 & s_name


											Else
													Flag = False
											End if
									Wend
			AA.Save s_photo
		End If
	
		If BB  = ""  then
			BB = null
		Else
			Rooms = Server.MapPath("../") &"\mall_image\" & ca1&"\"
			
				If Not FSO.FolderExists(Rooms) then
					FSO.CreateFolder(Rooms)
				End If
				
			b_path =BB.RawFilePath
			b_name = Mid(b_path,InstrRev(b_path,"\")+1)
			FileStartName = Mid(b_name, 1, Instr(b_name, ".")-1) 
			FileEndName = Mid(b_name, InstrRev(b_name, ".")+1)
			b_photo = Rooms & b_name
			
									Flag = True
									nCount = 0

									While Flag 
											If FSO.FileExists(b_photo) then
													nCount = nCount + 1
													b_name = FileStartName & "_"& nCount &"." & FileEndName
													b_photo = Rooms & b_name


											Else
													Flag = False
											End if
									Wend


				BB.Save b_photo
		End If
	
		If CC  = ""  then
			CC = null
		Else
			Rooms = Server.MapPath("../") &"\mall_image\" & ca1&"\"
			
				If Not FSO.FolderExists(Rooms) then
					FSO.CreateFolder(Rooms)
				End If
				
			c_path =CC.RawFilePath
			c_name = Mid(c_path,InstrRev(c_path,"\")+1)
			FileStartName = Mid(c_name, 1, Instr(c_name, ".")-1) 
			FileEndName = Mid(c_name, InstrRev(c_name, ".")+1)
			c_photo = Rooms & c_name
			
									Flag = True
									nCount = 0

									While Flag 
											If FSO.FileExists(c_photo) then
													nCount = nCount + 1
													c_name = FileStartName & "_"& nCount &"." & FileEndName
													c_photo = Rooms & c_name


											Else
													Flag = False
											End if
									Wend


				CC.Save c_photo
		End If

	
	
	
	

	'데이터베이스 처리
	Sql2 = "Update goods Set g_code='"&g_code&"'"
	Sql2 = Sql2 &",g_name='"&g_name&"'"
	Sql2 = Sql2 &",g_com='"&g_com&"'"
	Sql2 = Sql2 &",or_p='"&or_p&"'"

	Sql2 = Sql2 &",color='"&color&"'"
	Sql2 = Sql2 &",Best_Choice='"&Best_Choice&"'"
	Sql2 = Sql2 &",Weekly_Best='"&Weekly_Best&"'"
	Sql2 = sql2 &",m_choice='"&m_choice&"'"
	Sql2 = Sql2 &",point='"&point&"'"
	Sql2 = Sql2 &",choice='"&choice&"'"
	Sql2 = Sql2 &",event_2='"&event_2&"'"
	Sql2 = Sql2 &",r_ea='"&r_ea&"'"

    IF AA <> "" Then
		Sql2 = Sql2 &",sphoto='"&s_name&"'"
	End IF
	
	IF BB <> ""  Then
		Sql2 = Sql2 &",bphoto='"&b_name&"'"
	End IF
	
	IF CC <> "" Then
		Sql2 = Sql2 &",cphoto='"&c_name&"'"
	End IF


	Sql2 = Sql2 &",coding='"&coding&"'"
	Sql2 = Sql2 &",feature='"&feature&"'"
	Sql2 = Sql2 &",content='"&content&"'"
	Sql2 = Sql2 &"Where num="&num
	


	'데이터베이스 실행
	DB.Execute (Sql2)



	DB.Close

	'데이터베이스 해제
	Set FSO = Nothing 
	
	Set Db = Nothing
	Set uploadform = Nothing

	Response.Redirect "./goods_view.asp?num="&num


	End IF
%>
