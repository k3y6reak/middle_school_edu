
<!--METADATA TYPE="typelib" NAME="ADODB Type Library"
FILE="C:\Program Files\Common Files\SYSTEM\ADO\msado15.dll" -->

<!--#include file = "./function.asp"--->

<!---#include file="../admin/dbconn.asp"--->

<%
	Dim DirectoryPath
	DirectoryPath = Server.MapPath("upload_file") '������ ����� �������� ���

	Dim abc, oFile
	Set abc = Server.CreateObject("ABCUpload4.XForm")

'	response.Write "gpgp"
'	response.end
'	num = Reguest("num")
	name = abc.item("name")
	email = abc.item("email")
	title = abc.item("title")
	content = abc.item("content")
	pwd = abc.item("pwd")
	ref = abc.item("ref")
	r_step = abc.item("r_step")
	reforder = abc.item("reforder")
	ReadCount = 0
	coding = abc.item("coding")
	home = abc.item("home")
	tank = abc.item("tank")

'	response.write name & "<br>"
'	response.write email & "<br>"
'	response.write title & "<br>"
'	response.write content & "<br>"
'	response.write pwd & "<br>"
'	response.write ref & "<br>"
'	response.write r_step & "<br>"
'	response.write reforder & "<br>"
'	response.write coding & "<br>"
'	response.write home & "<br>"
'	response.write tank & "<br>"
'	response.end


	postdate = date()
	
	abc.AbsolutePath = True
	Set oFile = abc("file_up")(1)

	Dim strFileName, FileSize, FileType, strFileWholePath




'                response.write FileType
'		response.end
		
                If oFile.FileExists Then 
		strFileName = oFile.SafeFileName
		FileSize = oFile.Length
		FileType = oFile.FileType





                if oFile.Length > 4096000 then
			Response.Write "<script language=javascript>"
			Response.Write "alert(""4M �̻��� �������� ������ ���ε��Ͻ� �� �����ϴ�"");"
			Response.Write "history.back();"
			Response.Write "</script>"
			Response.end
		else
			strFileWholePath = GetUniqueName(strFileName, DirectoryPath)
			response.write strFileWholePath
	'		response.end
			oFile.Save strFileWholePath
		End if
	End if
	'���� ���ε� ó�� �Ϸ�..
	
	if FileSize = "" then
		FileSize = 0
	end if

	pwd = Replace(pwd,"'","''")
	name = Replace(name,"'","''")
	email = Replace(email,"'","''")
	home = Replace(home,"'","''")

'	Response.Write name
'	response.end
'	Title = ConvertTohtml(title)
'	Title = Replace(title,"'","''")
'	Title = replace(Title,"&","&amp;")
'	Title = replace(Title,">","&gt;")
'	Title = replace(Title,"<","&lt;")
	
'	name = replace(name, chr(34), "&#34;") 
'	Title = replace(Title, chr(34), "&#34;") 

'	content = ConvertTohtml(content)
'	content = Replace(content,"'","''")
'	content = replace(content ,"&","&amp;")
'	content = replace(content ,">","&gt;")
'	content = replace(content ,"<","&lt;")
	



	IF name = "RedMaster" and pwd = "redscorpio" Then

			master = "1"
	Else 
			master = "0"
	End IF

	Content = ConvertToSQL(Content)
	
	
	Select Case Coding
	
		Case "html"

			Content = CStr(Content)
			Content = Replace(content,Chr(13)&Chr(10),"")			
		Case "text"
		
			Content = CStr(Content)
			Content = ConvertToHTML(Content)
	
	End Select	
	
	SQL = "Select Max(num) From board"

	Set RS = Server.CreateObject("ADODB.RecordSet")
	RS.Open SQL,DB

	IF IsNull(RS(0)) Then
	num=1
	Else
	num=RS(0)+1
	End If
	        


	IF abc.item("num") <> "" Then
		ref = Cint(ref)
		r_step = Cint(r_step)
		reforder = Cint(reforder)
	
		Sql2 = "Update board Set r_step = r_step + 1"
		Sql2 = Sql2 &"Where ref ="&ref&" And r_step >"&r_step
		DB.Execute Sql2

		r_step = r_step + 1
		reforder = reforder + 1
	
	Else
		ref = num 
		r_step = 0
		reforder = 0
	End IF

	Sql = "Insert Into board("
	Sql = Sql&"name,"
	Sql = Sql&"email,"
	Sql = Sql&"title,"
	Sql = Sql&"content,"
	Sql = Sql&"postdate,"
	'Sql = Sql &"editdate,"
	Sql = Sql&"readcount,"
	Sql = Sql&"coding,"
	Sql = Sql&"pwd,"
'	Sql = Sql&"num,"
	Sql = Sql&"ref,"
	Sql = Sql&"r_step,"
	Sql = Sql&"reforder,"
	Sql = Sql&"home,"
	Sql = Sql&"master,"
	Sql = Sql&"tank,"
	Sql = Sql&"b_filename,"
	Sql = Sql&"b_filesize"
	Sql = Sql&")"
	Sql = Sql&"Values"
	Sql = Sql&"('"
	Sql = Sql&name&"','"
	Sql = Sql&email&"','"
	Sql = Sql&title&"','"
	Sql = Sql&content&"',GetDate(),'"
	Sql = Sql&readcount&"','"
	Sql = Sql&coding&"','"
	Sql = Sql&pwd&"','"
'	Sql = Sql&num&"','"
	Sql = Sql&ref&"','"
	Sql = Sql&r_step&"','"
	Sql = Sql&reforder&"','"
	Sql = Sql&home&"','"
	Sql = Sql&master&"','"
	Sql = Sql&tank&"','"
	Sql = Sql&strFileName&"',"
	Sql = Sql&FileSize&")"
'	Sql = Sql&")"
'	response.write Sql
'	response.end
	DB.Execute Sql
	
	RS.Close
	Set Rs = Nothing

	Response.Redirect "./shop_board_list.asp"



'����ũ�� ���ϰ�ι� �����̸��� ���� �Լ�
Function GetUniqueName(byRef strFileName, DirectoryPath)

    Dim strName, strExt
    ' Ȯ���ڸ� ������ ���ϸ��� ��´�.
    strName = Mid(strFileName, 1, InstrRev(strFileName, ".") - 1) 
 strExt = Mid(strFileName, InstrRev(strFileName, ".") + 1)

    Dim fso
    Set fso = Server.CreateObject("Scripting.FileSystemObject")

    Dim bExist : bExist = True 
    '�켱 �����̸��� ������ �����Ѵٰ� ����
    Dim strFileWholePath : strFileWholePath = DirectoryPath & "\" & strName & "." & strExt 
    '������ ������ ������ �̸�(������ �������� ���) ����
    Dim countFileName : countFileName = 0 
    '������ ������ ���, �̸� �ڿ� ���� ���ڸ� ������.

    Do While bExist ' �켱 �ִٰ� ������.
        If (fso.FileExists(strFileWholePath)) Then ' ���� �̸��� ������ ���� ��
            countFileName = countFileName + 1 '���ϸ��� ���ڸ� ���� ���ο� ���� �̸� ����
            strFileName = strName & "(" & countFileName & ")." & strExt
            strFileWholePath = DirectoryPath & "\" & strFileName
        Else
            bExist = False
        End If
    Loop
    GetUniqueName = strFileWholePath
End Function
%>