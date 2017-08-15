
<!---#include file="../dbconn.asp"--->

<!--#include file="../master.asp"-->
<%
		Server.ScriptTimeOut = 720000
		ea = Request("ea")
	

		


		'response.write ea 
		'response.end

		Set FSO = CreateObject("Scripting.FileSystemObject")
		Set MU = Server.CreateObject("ABCUpload4.XForm")
		Set theProgress = Server.CreateObject("ABCUpload4.XProgress")
		MU.OverWrite = true
		MU.AbsolutePath = true
		MU.MaxUploadSize = 1024 * 1024 * 50
		MU.ID = Request.QueryString("ID")



		
		
		

	

		For i=1 to ea
							
					name = MU("name")(i)
					
					title = MU("title")(i)
							
					category = MU("category")(i)
					

					name = replace(name,"'","''")
					title = replace(title,"'","''")
				
					Set AA = MU("mp3")(i)

						If AA.FileExists then
							
								
								Room = Server.MapPath("/music") & "\music\"& category &"\"
								

							'	Response.Write Room 
							'	Response.end
								If Not FSO.FolderExists(Room) then
									FSO.CreateFolder(Room)
								End If

								
								
								FilePath= AA.RawFilePath
								FileName = Mid(FilePath, InstrRev(FilePath, "\")+1)
								FileStartName = Mid(FileName, 1, Instr(FileName, ".")-1) 
								FileEndName = Mid(FileName, InstrRev(FileName, ".")+1)
							'	FileSize =AA.RawLength
								
								strFileSize = AA.Length
								intKbyte = 1024 
								intMbyte = 1024 * 1024 
								If Len(strFileSize) > 6 Then
									strSize = Round((strFileSize / intMbyte), 2) & " Mb"
								ElseIf Len(strFileSize) > 3 Then 
									strSize = Round((strFileSize / intKbyte), 2) & " Kb"
								Else
									strSize = strFileSize & " byte"
								End if


								L_name = Room & FileName
							    
								'Response.Write Room &"<br>"
								'Response.write L_name
								'Response.end
								'AA.save L_name
								


								Flag = True
								nCount = 0

								While Flag 
										If FSO.FileExists(L_name) then
												nCount = nCount + 1
												FileName = FileStartName & "_"& nCount &"." & FileEndName
												L_name = Room & FileName


										Else
												Flag = False
										End if
								Wend

								' FileSize Checking.. (업로드 파일 한꺼번에 모두 체킹..!!)
								theProgress.ID = Request.QueryString("ID")
								LastFileSize = theProgress.BytesTotal
								JS_LastFileSize = Round(theProgress.BytesTotal / 1024, 1)

								If LastFileSize < 100000000 then
										AA.Save L_name
									
								Else
										Response.write "<Script Language=JavaScript>"
										Response.write "alert('업로드 용량을 초과하셨습니다..T_T\n\n모든 파일의 합계가 100M를 넘을 수 없습니다.\n\n현재 업로드한 파일의 용량 : "&JS_LastFileSize&"KB');"
										Response.write "location.href='./JukeBox_ea.asp';"
										Response.write "</Script>"
								End if

						End if

		FileName = Replace(FileName,"'","''")

		
		Sql = "Insert juke("
		Sql = Sql &"name,"
		Sql = Sql &"title,"
		Sql = Sql &"mp3,"
		Sql = Sql &"filesize,"
		Sql = Sql &"category,"
		Sql = Sql &"fileroom,"
		Sql = Sql &"postdate"
		Sql = Sql &")"
		Sql = Sql &"values"
		Sql = Sql &"('"
		Sql = Sql &name&"','"
		Sql = Sql &title&"','"
		Sql = Sql &FileName&"','"
		Sql = Sql &strSize&"','"
		Sql = Sql &category&"','"
		Sql = Sql &room&"',getdate()"
	'	Sql = Sql &getdate()"
		Sql = Sql &")"
		
	'	Response.write Sql
	'	Response.end
		
		DB.Execute Sql
		Next

	

		DB.Close
		
		Set MU = Nothing

		Set DB = Nothing

		Set FSO = Nothing
		
		Response.write "<Script Language=JavaScript>"
		Response.write "alert('업로드가 모두 잘 되었습니다..^^*\n\n현재 업로드한 파일의 용량 : "&JS_LastFileSize&"KB');"
		Response.write "location.href='./JukeBox_list.asp';"
		Response.write "</Script>"
		
		

	End IF
%>