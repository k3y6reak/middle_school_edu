<?
   session_start();

   if(!$userid) {
      echo("
	   <script>
	     window.alert('�α��� �� ����ϼ���.')
	     history.go(-1)
	   </script>
	   ");	
      exit;
   }
   
   if(!$subject) {
      echo("
	   <script>
	     window.alert('������ �Է��ϼ���.')
	     history.go(-1)
	   </script>
	   ");
       exit;
   }
   
   if(!$content) {
      echo("
	   <script>
	     window.alert('������ �Է��ϼ���.')
	     history.go(-1)
	   </script>
	   ");
      exit;
   }
   
   include "../dbconn.php";

   $regist_day = date("Y-m-d (H:i)");  // ������ '��-��-��-��-��'�� ����
   $ip = $REMOTE_ADDR;         // �湮���� IP �ּҸ� ����


   if($upfile_name) 
   {
      if ( file_exists("data/$upfile_name") ){
        echo("
	   <script>
	     window.alert('������ ���ϰ� ������ �̸��� �����մϴ�.');
	     history.go(-1)
	   </script>
	   ");
         exit;
      }

      if( !$upfile) {
         echo("
	   <script>
	     window.alert
             ('���ε� ���� ����� ������ �뷮(2M)�� �ʰ��մϴ�.');
	     history.go(-1)
	   </script>
           ");
         exit;
      }

      if( strlen($upfile_size) < 7 ) {
         $filesize = sprintf("%0.2f KB", $upfile_size/1000);
      }
      else
      {
         $filesize = sprintf("%0.2f MB", $upfile_size/1000000);
      }

      if( !copy($upfile, "data/$upfile_name") )
      {
         echo("
	   <script>
	     window.alert
             ('������ ������ ���丮�� �����ϴµ� �����߽��ϴ�.');
	     history.go(-1)
	   </script>
           ");
         exit;
      }
         
      if ( !unlink($upfile) ) {
         echo("
	   <script>
	     window.alert('�ӽ������� �����ϴµ� �����߽��ϴ�.');
	     history.go(-1)
	   </script>
           ");
         exit;
      }
   }

   if (!$num) 
   {
      $depth = 0;   // depth, ord �� 0���� �ʱ�ȭ
      $ord = 0;

     // ���ڵ� ���� ���
      $sql = "insert into down_board
              (depth, ord, id, name, subject,";
      $sql .= "content, regist_day, hit, ip, filename, filesize) ";
      $sql .= "values($depth, $ord, '$userid', '$username', 
                      '$subject',";
      $sql .= "'$content', '$regist_day', 0, '$ip', '$upfile_name', 
               '$filesize')";    
      mysql_query($sql, $connect);  // $sql �� ����� ��� ����

      // �ֱ� auto_increment �ʵ�(num) �� ��������
      $sql = "select last_insert_id()"; 
      $result = mysql_query($sql, $connect);
      $row = mysql_fetch_array($result);
      $auto_num = $row[0]; 
 
      // group_num �� ������Ʈ 
      $sql = "update down_board set group_num = $auto_num 
              where num=$auto_num";
      mysql_query($sql, $connect);
   }
   else
   {
      // �θ� �� ��������
      $sql = "select * from down_board where num = $num";
      $result = mysql_query($sql, $connect);
      $row = mysql_fetch_array($result);

      // �θ� �۷� ���� group_num, depth, ord �� ����
      $group_num = $row[group_num];
      $depth = $row[depth] + 1;
      $ord = $row[ord] + 1;

      $sql = "update down_board set ord = ord + 1
             where group_num = $row[group_num] and ord > $row[ord]";
      mysql_query($sql, $connect);  

      $sql = "insert into down_board(group_num, depth, ord, id, name,
              subject,";
      $sql .= "content, regist_day, hit, ip, filename, filesize) ";
      $sql .= "values($group_num, $depth, $ord, '$userid', '$username',
                      '$subject',";
      $sql .= "'$content', '$regist_day', 0, '$ip', '$upfile_name','$filesize')";

      mysql_query($sql, $connect);  // $sql �� ����� ��� ����
   }
   mysql_close();                // DB ���� ����
   
   Header("Location:list.php?page=$page");  // list.php �� �̵��մϴ�.
?>