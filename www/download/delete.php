<?
   session_start();

   include "../dbconn.php";
   
   $sql = "select * from down_board where num = $num";   
   $result = mysql_query($sql, $connect);
   $row = mysql_fetch_array($result);

   // �����ڳ� �� �� ������� ���� ����
   if ($userid != "admin" and $userid != $row[id])  
   {
      echo("
	   <script>
             window.alert('���� ������ �����ϴ�.')
             history.go(-1)
	   </script>
           ");
      exit;
   }
   else
   {
      if ($row[filename])
      {
         unlink("data/$row[filename]");
      }

      $sql = "delete from down_board where num = $num";
      mysql_query($sql, $connect);
   }

   mysql_close();

   Header("Location:list.php?page=$page");
?>

