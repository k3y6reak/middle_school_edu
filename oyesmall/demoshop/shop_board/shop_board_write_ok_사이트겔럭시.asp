
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

if Len(ImageFile) > 0 then									'÷�������� ���� ���� ���ε�

strDirectory = "upload_file"								'������ ������ ����Ǵ� ��ġ

															'���� ���ϸ��� ���� ��� ó�� ����(�ø��� ���ϸ� �ڿ� �Ϸù�ȣ�� �־��ش�.)
attach_file = UploadForm("ImageFile").FilePath				'����� ������ �̸��� ��´�.

FileName1 = Mid(attach_file, InstrRev(attach_file, "") + 1) '���ϸ��� ��´�.
strName = Mid(FileName1, 1, Instr(FileName1, ".") - 1)		'Ȯ���ڸ� ������ ���ϸ��� ��´�.
strExt = Mid(FileName1, Instr(FileName1, ".") + 1)			'Ȯ���ڸ� ��´�.
bExist = True												'�켱 �����̸��� ������ �����Ѵٰ� ����
strFileName = strDirectory & strName & "." & strExt			'������ ������ ������ �̸��� ����
countFileName = 0											'������ ������ ��� �̸� �ڿ� ���� ���ڸ� ������.

Do While bExist												'�켱 �ִٰ� ������.
	If (FSO.FileExists(strFileName)) Then					'���� �̸��� ������ ���� ��
		countFileName = countFileName + 1					'���ϸ� ���ڸ� ���� ���ο� ���� �̸� ����
		FileName1 = strName & "_" & countFileName & "." & strExt
		strFileName = strDirectory & FileName1
	Else													'���� �̸��� ������ ���� ��
		bExist = False
															'������ �������� �����Ƿ�.
	End If
Loop
															'���� ���ϸ��� ���� ��� ó�� ���� ��
	UploadForm("ImageFile").SaveAs strFileName				'������ ������ �����Ѵ�.
end if


if Len(SoundFile) > 0 then									'÷�������� ���� ���� ���ε�

	strDirectory = "upload_file"							'������ ������ ����Ǵ� ��ġ
															'���� ���ϸ��� ���� ��� ó�� ����(�ø��� ���ϸ� �ڿ� �Ϸù�ȣ�� �־��ش�.)
	attach_file = UploadForm("SoundFile").FilePath			'����� ������ �̸��� ��´�.

	FileName2 = Mid(attach_file, InstrRev(attach_file, "") + 1) '���ϸ��� ��´�.
	strName = Mid(FileName2, 1, Instr(FileName2, ".") - 1)	'Ȯ���ڸ� ������ ���ϸ��� ��´�.
	strExt = Mid(FileName2, Instr(FileName2, ".") + 1)		'Ȯ���ڸ� ��´�.
	bExist = True											'�켱 �����̸��� ������ �����Ѵٰ� ����
	strFileName = strDirectory & strName & "." & strExt		'������ ������ ������ �̸��� ����
	countFileName = 0										'������ ������ ��� �̸� �ڿ� ���� ���ڸ� ������.

	Do While bExist											'�켱 �ִٰ� ������.
		If (FSO.FileExists(strFileName)) Then				'���� �̸��� ������ ���� ��
			countFileName = countFileName + 1				'���ϸ� ���ڸ� ���� ���ο� ���� �̸� ����
			FileName2 = strName & "_" & countFileName & "." & strExt
			strFileName = strDirectory & FileName2
		Else												'���� �̸��� ������ ���� ��
			bExist = False
															'������ �������� �����Ƿ�.
		End If
	Loop
															'���� ���ϸ��� ���� ��� ó�� ���� ��
	UploadForm("SoundFile").SaveAs strFileName				'������ ������ �����Ѵ�.

	set FSO = Nothing
	set UploadForm = Nothing
end if

%> 