<?
   /* ����ȭ�鿡�� �̸��� �Էµ��� �ʾ����� 
      "�̸��� �Է��ϼ���" �޽��� ���*/

$name = $_POST['name'];
$passwd = $_POST['passwd'];
$subject = $_POST['subject'];
$content = $_POST['content'];
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

   $regist_day = date("Y-m-d (H:i)");  
   // ������ '��-��-��-��-��'�� ����
   $ip = $REMOTE_ADDR;         // �湮���� IP �ּҸ� ����
   

   $sql = "insert into freeboard(name, passwd, subject, 
           content, regist_day, hit, ip) ";
   $sql .= "values('$name', '$passwd', '$subject', '$content', 
                   '$regist_day', 0, '$ip')";      
   // ���ڵ� ���� ���
   
   mysql_query($sql, $connect);  // $sql �� ����� ��� ����

   mysql_close();                // DB ���� ����
   
   Header("Location:list.php");  // list.php �� �̵��մϴ�.
?>

   
