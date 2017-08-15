
<!--METADATA TYPE="typelib" NAME="ADODB Type Library"
FILE="C:\Program Files\Common Files\SYSTEM\ADO\msado15.dll" -->

<!--#include file = "./function.asp"--->

<!---#include file="../admin/dbconn.asp"--->

<% 
Server.ScriptTimeOut = 7200
set UploadForm = Server.CreateObject("SiteGalaxyUpload.Form")

Imagefile = UploadForm("Image_file")
Soundfile = UploadForm("Sound_file")

Set FSO = CreateObject("Scripting.FileSystemObject") 

if Len(ImageFile) > 0 then									'첨부파일이 있을 때만 업로드

strDirectory = "upload_file"								'서버내 파일이 저장되는 위치

															'같은 파일명이 있을 경우 처리 시작(올리는 파일명 뒤에 일련번호를 넣어준다.)
attach_file = UploadForm("ImageFile").FilePath				'저장될 파일의 이름을 얻는다.

FileName1 = Mid(attach_file, InstrRev(attach_file, "") + 1) '파일명을 얻는다.
strName = Mid(FileName1, 1, Instr(FileName1, ".") - 1)		'확장자를 제외한 파일명을 얻는다.
strExt = Mid(FileName1, Instr(FileName1, ".") + 1)			'확장자를 얻는다.
bExist = True												'우선 같은이름의 파일이 존재한다고 가정
strFileName = strDirectory & strName & "." & strExt			'저장할 파일의 완전한 이름을 만듦
countFileName = 0											'파일이 존재할 경우 이름 뒤에 붙일 숫자를 세팅함.

Do While bExist												'우선 있다고 생각함.
	If (FSO.FileExists(strFileName)) Then					'같은 이름의 파일이 있을 때
		countFileName = countFileName + 1					'파일명에 숫자를 붙인 새로운 파일 이름 생성
		FileName1 = strName & "_" & countFileName & "." & strExt
		strFileName = strDirectory & FileName1
	Else													'같은 이름의 파일이 없을 때
		bExist = False
															'파일이 존재하지 않으므로.
	End If
Loop
															'같은 파일명이 있을 경우 처리 시작 끝
	UploadForm("ImageFile").SaveAs strFileName				'파일을 실제로 저장한다.
end if


if Len(SoundFile) > 0 then									'첨부파일이 있을 때만 업로드

	strDirectory = "upload_file"							'서버내 파일이 저장되는 위치
															'같은 파일명이 있을 경우 처리 시작(올리는 파일명 뒤에 일련번호를 넣어준다.)
	attach_file = UploadForm("SoundFile").FilePath			'저장될 파일의 이름을 얻는다.

	FileName2 = Mid(attach_file, InstrRev(attach_file, "") + 1) '파일명을 얻는다.
	strName = Mid(FileName2, 1, Instr(FileName2, ".") - 1)	'확장자를 제외한 파일명을 얻는다.
	strExt = Mid(FileName2, Instr(FileName2, ".") + 1)		'확장자를 얻는다.
	bExist = True											'우선 같은이름의 파일이 존재한다고 가정
	strFileName = strDirectory & strName & "." & strExt		'저장할 파일의 완전한 이름을 만듦
	countFileName = 0										'파일이 존재할 경우 이름 뒤에 붙일 숫자를 세팅함.

	Do While bExist											'우선 있다고 생각함.
		If (FSO.FileExists(strFileName)) Then				'같은 이름의 파일이 있을 때
			countFileName = countFileName + 1				'파일명에 숫자를 붙인 새로운 파일 이름 생성
			FileName2 = strName & "_" & countFileName & "." & strExt
			strFileName = strDirectory & FileName2
		Else												'같은 이름의 파일이 없을 때
			bExist = False
															'파일이 존재하지 않으므로.
		End If
	Loop
															'같은 파일명이 있을 경우 처리 시작 끝
	UploadForm("SoundFile").SaveAs strFileName				'파일을 실제로 저장한다.

	set FSO = Nothing
	set UploadForm = Nothing
end if

%> 