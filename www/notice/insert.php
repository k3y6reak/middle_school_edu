<?
   session_start();

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
   
   include "../dbconn.php";       // dconn.php ������ �ҷ���

   $regist_day = date("Y-m-d (H:i)");  // ������ '��-��-��-��-��'�� ����
   $ip = $REMOTE_ADDR;         // �湮���� IP �ּҸ� ����

   // ���ڵ� ���� ���
   $sql = "insert into notice_board(id, name, subject, content, regist_day, hit, ip) ";
   $sql .= "values('$userid', '$username', '$subject', '$content', '$regist_day', 0, '$ip')";    
   
   mysql_query($sql, $connect);  // $sql �� ����� ��� ����

   mysql_close();                // DB ���� ����
   
   Header("Location:list.php");  // list.php �� �̵��մϴ�.
?>