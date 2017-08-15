<?
   include "../dbconn.php";


   $sql = "select passwd from guestbook where num=$num";
   $result = mysql_query($sql, $connect);
   $row = mysql_fetch_array($result);

   if ($passwd == $row[passwd])
   {
      $sql = "delete from guestbook where num = $num";
      mysql_query($sql, $connect);
      Header("Location:guestbook.php?page=$page");
   }
   else
   {
      echo("
           <script>
             window.alert('비밀번호가 틀립니다.')
             history.go(-1)
           </script>
          ");
      exit;
    }

   mysql_close();
?>


