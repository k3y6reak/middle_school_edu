<?
   session_start();

   include "../dbconn.php";
$num = $_GET['num'];
$page = $_GET['page'];
$passwd = $_POST['passwd'];
$userid = $_GET['id'];

   $sql = "select passwd from freeboard where num=$num";
   $result = mysql_query($sql, $connect);
   $row = mysql_fetch_array($result); // �ش� ���ڵ� ������ 

   // $passwd : ����ڰ� passwd_form.php ȭ�鿡�� �Է��� �� 
   // $row[passwd] : DB�� ����ִ� �� 
   if ($passwd != $row[passwd] and $userid != "admin")   
  // �����ڰ� �ƴϰ� ��й�ȣ�� Ʋ����
   {
      echo("
           <script>
             window.alert('��й�ȣ�� Ʋ���ϴ�.')
             //history.go(-1)
           </script>
          ");
      exit;
   }
   else
   {
      $sql = "delete from freeboard where num = $num";
      mysql_query($sql, $connect);

      mysql_close();
      Header("Location:list.php?page=$page");
   }

?>


