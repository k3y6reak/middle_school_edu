


<!--#include file = "./function.asp"--->

<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->


<%
	
	Set uploadform = Server.CreateObject("ABCUpload4.XForm")
	
		uploadform.OverWrite = True
		uploadform.AbsolutePath = True
		
		'Server.ScriptTimeout = 900

		
	ca1 = uploadform("ca1")
	ca2 = uploadform("ca2")
	ca3 = uploadform("ca3")
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
'	g_col = uploadform("g_col")
'	g_row = uploadform("g_row")
'	g_wid = uploadform("g_wid")
	point = uploadform("point")
	r_ea = uploadform("r_ea")
'	ea = uploadform("ea")
	feature = uploadform("feature")
	coding = uploadform("coding")
	Content = uploadform("Content")
	postdate = date()
	editdate = date()
	feature = replace(feature,"'","''")
	feature = replace(feature,"&","&amp;")
	feature = replace(feature,"<","&lt;")
	feature = replace(feature,">","&gt;")

'	Response.write point
'	Response.end
	
	

	
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
	
	

	'파일명 추출
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
	Sql = "Insert goods("
	Sql = Sql &"ca1,"
	Sql = Sql &"ca2,"
	Sql = Sql &"ca3,"
	Sql = Sql &"g_code,"
	Sql = Sql &"g_name,"
	Sql = Sql &"g_com,"
	Sql = Sql &"or_p,"
	Sql = Sql &"Weekly_Best,"
	Sql = Sql &"color,"
	Sql = Sql &"Best_Choice,"
	Sql = Sql &"m_choice,"
	Sql = sql &"choice,"
	Sql = Sql &"point,"
	Sql = Sql &"event_2,"
	Sql = Sql &"r_ea,"
	Sql = Sql &"sphoto,"
	Sql = Sql &"bphoto,"
	Sql = Sql &"cphoto,"
	Sql = Sql &"coding,"
	Sql = Sql &"feature,"
	Sql = Sql &"Content"
	Sql = Sql &")"
	Sql = Sql &"values"
	Sql = Sql &"('"
	Sql = Sql &ca1&"','"
	Sql = Sql &ca2&"','"
	Sql = Sql &ca3&"','"
	Sql = Sql &g_code&"','"
	Sql = Sql &g_name&"','"
	Sql = Sql &g_com&"','"
	Sql = Sql &or_p&"','"
	Sql = Sql &Weekly_Best&"','"
	Sql = Sql &color&"','"
	Sql = Sql &Best_Choice&"','"
	Sql = Sql &m_choice&"','"
	Sql = Sql &choice&"','"
	Sql = Sql &point&"','"
	Sql = Sql &event_2&"','" 
	Sql = Sql &r_ea&"','"
	Sql = Sql &s_name&"','"
	Sql = Sql &b_name&"','"
	Sql = Sql &c_name&"','"
	Sql = Sql &coding&"','"
	Sql = sql &feature&"','"
	Sql = Sql &Content&"'"
	Sql = sql &")"



	DB.Execute Sql


	'데이터베이스 닫기
	DB.Close

	'데이터베이스 해제
	Set FSO = Nothing 
	Set Db = Nothing
	Set uploadform = Nothing

	Response.Redirect "./goods_list.asp" 



	End IF
%>