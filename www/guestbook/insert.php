<?

  $name = $_GET['name'];
  $passwd = $_GET['passwd'];
  $content = $_GET['content'];

   if(!$name) {
     echo("
	   <script>
	     window.alert('이름을 입력하세요.')
	     history.go(-1)
	   </script>
	 ");
	 exit;
   }
   
   if(!$passwd) {
     echo("
	   <script>
	     window.alert('비밀번호를 입력하세요.')
	     history.go(-1)
	   </script>
	 ");
	 exit;
   }
   
   if(!$content) {
     echo("
	   <script>
	     window.alert('내용을 입력하세요.')
	     history.go(-1)
	   </script>
	 ");
	 exit;
   }
   
   $regist_day = date("Y-m-d (H:i)");  
   // 현재의 '년-월-일-시-분'을 저장합니다.
   $ip = $REMOTE_ADDR;         
   // 방문자의 IP 주소를 저장합니다.
   
   include "../dbconn.php";

   $sql = "insert into guestbook(name, passwd, content, regist_day, ip) ";
   $sql .= "values('$name', '$passwd', '$content', '$regist_day', '$ip')";
   
   mysql_query($sql, $connect);

   mysql_close();
   
   Header("Location:guestbook.php");  // guestbook.php 로 이동합니다.
?>