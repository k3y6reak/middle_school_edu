<%
   Response.Buffer = False
   Response.Expires = 0
 
   Dim strFileName     '// 파일이름
   Dim FileSeq           '// 파일번호
   Dim strFilePath       '// 파일의경로
   

  strFileName = Request("strfilename")       '### 파일명을 요청한다.

  
  'response.write  strFileName
  'response.end

   strFilePath = Server.mapPath(".") & "\" & Request("f_path") &"\"   '&"\upload_file\"     '###현재 파일의 파일 경로 디렉토리 설정

 

  '//문서정의타입을 알수없음으로 하게되면 무조건 다운로드시킨다.

  '//다운로드시킬 파일을 정의한다.

   Response.ContentType = "application/unknown"
   Response.AddHeader "Content-Disposition","attachment; filename=" & strFileName

 

   '### ADODB.Stream으로 스트림을 읽는다. ###
   Set objStream = Server.CreateObject("ADODB.Stream")
   objStream.Open

   objStream.Type = 1
   objStream.LoadFromFile strFilePath & "\" & strFileName
   strFile = objStream.Read
   Response.BinaryWrite strFile

   Set objStream = Nothing

 

  %>


