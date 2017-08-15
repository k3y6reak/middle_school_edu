<?
   include "../dbconn.php";
 
   $sql = "update survey set $singer = $singer + 1";
   mysql_query($sql, $connect);

   mysql_close();

   Header("location:result.php");
?>

