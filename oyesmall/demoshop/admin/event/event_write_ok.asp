
	<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->

<%
		Server.ScriptTimeOut = 720000
		ea = Request("ea")

		Set FSO = CreateObject("Scripting.FileSystemObject")
		Set MU = Server.CreateObject("ABCUpload4.XForm")
		
		MU.OverWrite = true
		MU.AbsolutePath = true

		MU.ID = Request.QueryString("ID")
					cate = MU("cate")  '파일이 들어가는 곳
		For i=1 to ea
					
					mainimage = MU("mainimage")
					name = MU("b_name")(i)
					nomi = MU("nomi")(i)
					top3 = MU("top3")(i)
					category_top = MU("category_top")(i)
					name = replace(name,"'","''")
					
				

					Set AA = MU("image1")(i)
					Set BB = MU("image2")(i)

						If AA.FileExists then
							
								
								b_room1 = Server.MapPath("../") &"\event_image\" & cate&"\"

								If Not FSO.FolderExists(b_room1) then
									FSO.CreateFolder(b_room1)
								End If

								A_Path= AA.RawFilePath
								a_name = Mid(A_Path, InstrRev(A_Path, "\")+1)
								FileStartName = Mid(a_name, 1, Instr(a_name, ".")-1) 
								FileEndName = Mid(a_name, InstrRev(a_name, ".")+1)
								L_name = b_room1 & a_name
							    
								Flag = True
								nCount = 0

								While Flag 
										If FSO.FileExists(L_name) then
												nCount = nCount + 1
												a_name = FileStartName & "_"& nCount &"." & FileEndName
												L_name = b_room1 & a_name
										Else
												Flag = False
										End if
								Wend
							AA.save L_name
						End if

					If BB.FileExists then
							
								
								b_room = Server.MapPath("../") &"\event_image\" & cate&"\"

								If Not FSO.FolderExists(b_room) then
									FSO.CreateFolder(b_room)
								End If

								B_Path= BB.RawFilePath
								b_name = Mid(B_Path, InstrRev(B_Path, "\")+1)
								FileStartName = Mid(b_name, 1, Instr(b_name, ".")-1) 
								FileEndName = Mid(b_name, InstrRev(b_name, ".")+1)
								L_name = b_room & b_name
							    
								Flag = True
								nCount = 0

								While Flag 
										If FSO.FileExists(L_name) then
												nCount = nCount + 1
												b_name = FileStartName & "_"& nCount &"." & FileEndName
												L_name = b_room & b_name
										Else
												Flag = False
										End if
								Wend
							BB.save L_name
						Else
							BB = Null
						End if

	

		
		Sql = "Insert banner("
		Sql = Sql &"b_name,"
		Sql = Sql &"nomi,"
		Sql = Sql &"cate,"
		Sql = Sql &"b_room,"
		Sql = Sql &"image1,"
		Sql = Sql &"image2,"
		Sql = Sql &"top3,"
		Sql = Sql &"mainimage,"
		Sql = Sql &"category_top"
		Sql = Sql &")"
		Sql = Sql &"values"
		Sql = Sql &"('"
		Sql = Sql &name&"','"
		Sql = Sql &nomi&"','"
		Sql = Sql &cate&"','"
		Sql = Sql &b_room1&"','"
		Sql = Sql &a_name&"','"
		Sql = Sql &b_name&"','"
		Sql = Sql &top3&"','"
		Sql = Sql &mainimage&"','"
		Sql = Sql &category_top&"'"
		Sql = Sql &")"
		

	
		DB.Execute Sql
		Next

	

		DB.Close
		
		Set MU = Nothing

		Set DB = Nothing

		Set FSO = Nothing
		
		Response.write "<Script Language=JavaScript>"
		Response.write "alert('업로드가 모두 잘 되었습니다..^^');"
		Response.write "location.href='./event_list.asp';"
		Response.write "</Script>"
		
		

	End IF
%>
