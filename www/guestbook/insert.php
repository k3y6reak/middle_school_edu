<?

  $name = $_GET['name'];
  $passwd = $_GET['passwd'];
  $content = $_GET['content'];

   if(!$name) {
     echo("
	   <script>
	     window.alert('�̸��� �Է��ϼ���.')
	     history.go(-1)
	   </script>
	 ");
	 exit;
   }
   
   if(!$passwd) {
     echo("
	   <script>
	     window.alert('��й�ȣ�� �Է��ϼ���.')
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
   
   $regist_day = date("Y-m-d (H:i)");  
   // ������ '��-��-��-��-��'�� �����մϴ�.
   $ip = $REMOTE_ADDR;         
   // �湮���� IP �ּҸ� �����մϴ�.
   
   include "../dbconn.php";

   $sql = "insert into guestbook(name, passwd, content, regist_day, ip) ";
   $sql .= "values('$name', '$passwd', '$content', '$regist_day', '$ip')";
   
   mysql_query($sql, $connect);

   mysql_close();
   
   Header("Location:guestbook.php");  // guestbook.php �� �̵��մϴ�.
?>