<%
   Response.Buffer = False
   Response.Expires = 0
 
   Dim strFileName     '// �����̸�
   Dim FileSeq           '// ���Ϲ�ȣ
   Dim strFilePath       '// �����ǰ��
   

  strFileName = Request("strfilename")       '### ���ϸ��� ��û�Ѵ�.

  
  'response.write  strFileName
  'response.end

   strFilePath = Server.mapPath(".") & "\" & Request("f_path") &"\"   '&"\upload_file\"     '###���� ������ ���� ��� ���丮 ����

 

  '//��������Ÿ���� �˼��������� �ϰԵǸ� ������ �ٿ�ε��Ų��.

  '//�ٿ�ε��ų ������ �����Ѵ�.

   Response.ContentType = "application/unknown"
   Response.AddHeader "Content-Disposition","attachment; filename=" & strFileName

 

   '### ADODB.Stream���� ��Ʈ���� �д´�. ###
   Set objStream = Server.CreateObject("ADODB.Stream")
   objStream.Open

   objStream.Type = 1
   objStream.LoadFromFile strFilePath & "\" & strFileName
   strFile = objStream.Read
   Response.BinaryWrite strFile

   Set objStream = Nothing

 

  %>


