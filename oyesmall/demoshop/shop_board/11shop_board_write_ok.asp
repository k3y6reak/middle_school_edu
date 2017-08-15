
<!--#include file = "./function.asp"--->

<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->
asdf

<%

Dim DirectoryPath
DirectoryPath = Server.MapPath("upload_File") '파일이 저장될 로컬폴더 경로

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

'실제적인 파일 업로드를 처리하는 부분
If oFile.FileExists Then 

    strFileName = oFile.SafeFileName
    FileSize = oFile.Length
    FileType = oFile.FileType
    if oFile.Length > 4096000 then
        Response.Write "<script language=javascript>"
        Response.Write "alert(""4M 이상의 사이즈인 파일은 업로드하실 수 없습니다"");"
        Response.Write "history.back();"
        Response.Write "</script>"
        Response.end
    else
        strFileWholePath = GetUniqueName(strFileName, DirectoryPath)
        oFile.Save strFileWholePath
    End if
End if
'파일 업로드 처리 완료..


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


'유니크한 파일경로및 파일이름을 얻어내는 함수
Function GetUniqueName(byRef strFileName, DirectoryPath)

    Dim strName, strExt
    ' 확장자를 제외한 파일명을 얻는다.
    strName = Mid(strFileName, 1, InstrRev(strFileName, ".") - 1) 
         strExt = Mid(strFileName, InstrRev(strFileName, ".") + 1)

    Dim fso
    Set fso = Server.CreateObject("Scripting.FileSystemObject")

    Dim bExist : bExist = True 
    '우선 같은이름의 파일이 존재한다고 가정
    Dim strFileWholePath : strFileWholePath = DirectoryPath & "\" & strName & "." & strExt 
    '저장할 파일의 완전한 이름(완전한 물리적인 경로) 구성
    Dim countFileName : countFileName = 0 
    '파일이 존재할 경우, 이름 뒤에 붙일 숫자를 세팅함.

    Do While bExist ' 우선 있다고 생각함.
        If (fso.FileExists(strFileWholePath)) Then ' 같은 이름의 파일이 있을 때
            countFileName = countFileName + 1 '파일명에 숫자를 붙인 새로운 파일 이름 생성
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
