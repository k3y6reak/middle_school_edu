
<!--#include file = "./function.asp"--->

<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->
asdf

<%

Dim DirectoryPath
DirectoryPath = Server.MapPath("upload_File") '������ ����� �������� ���

Dim abc, oFile
Set abc = Server.CreateObject("ABCUpload4.XForm")

	name = abc("name")
	email = abc("email")
	title = abc("title")
	content = abc("content")
	pwd = abc("pwd")
	ref = abc("ref")
	r_step = abc("r_step")
	reforder = abc("reforder")
	ReadCount = 0
	coding = abc("coding")
	home = abc("home")
	tank = abc("tank")

	abc.AbsolutePath = True
	Set oFile = abc("file_up")(1)


Dim strFileName, FileSize, FileType, strFileWholePath

'�������� ���� ���ε带 ó���ϴ� �κ�
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
        oFile.Save strFileWholePath
    End if
End if
'���� ���ε� ó�� �Ϸ�..


'response.Write "aaaccaabbb"
'response.end

	postdate = date()
	
	pwd = Replace(pwd,"'","''")
	name = Replace(name,"'","''")
	email = Replace(email,"'","''")
	home = Replace(home,"'","''")

'	Response.Write name
'	response.end
	
	Title = Replace(title,"'","''")
	Title = replace(Title,"&","&amp;")
	Title = replace(Title,">","&gt;")
	Title = replace(Title,"<","&lt;")
	
	name = replace(name, chr(34), "&#34;") 
	Title = replace(Title, chr(34), "&#34;") 

	content = Replace(content,"'","''")
	
	IF name = "redmaster" and pwd = "redscorpio" Then

			master = "1"
	Else 
			master = "0"
	End IF

	Content = ConvertToSQL(Content)
	
	
	Select Case Coding
	
		Case "html"

			Content = CStr(Content)
			
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
	        

	IF abc("num") <> "" Then
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
	DB.Close
	Set Rs = Nothing
	Set DB = Nothing

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
            countFileName = countFileName + 1 '���ϸ� ���ڸ� ���� ���ο� ���� �̸� ����
            strFileName = strName & "(" & countFileName & ")." & strExt
            strFileWholePath = DirectoryPath & "\" & strFileName
        Else
            bExist = False
        End If
    Loop
    GetUniqueName = strFileWholePath
End Function


%>
ok
