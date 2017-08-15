<?
   
   include "../dbconn.php";       // dconn.php 파일을 불러옴
   $id = $_POST['id'];
   $passwd = $_POST['passwd'];
   $name = $_POST['name'];
   $sex = $_POST['sex'];
   $phone1 = $_POST['phone1'];
   $phone2 = $_POST['phone2'];
   $phone3 = $_POST['phone3'];
   $address = $_POST['phone4'];


   $sql = "select * from member where id='$id'";
   $result = mysql_query($sql, $connect);
   $exist_id = mysql_num_rows($result);

   if($exist_id) {
     echo("
           <script>
             window.alert('해당 아이디가 존재합니다.')
             history.go(-1)
           </script>
         ");
         exit;
   }

   $regist_day = date("Y-m-d (H:i)");  // 현재의 '년-월-일-시-분'을 저장
   $ip = $REMOTE_ADDR;         // 방문자의 IP 주소를 저장
   
   if ($phone1 && $phone2 && $phone3)
       $tel = $phone1."-".$phone2."-".$phone3;
   else
       $tel = "";

   $sql = "insert into member(id, passwd, name, sex, tel, address) ";
   $sql .= "values('$id', '$passwd', '$name', '$sex', '$tel', '$address')";

   // 레코드 삽입 명령
   mysql_query($sql, $connect);  // $sql 에 저장된 명령 실행

   mysql_close();                // DB 연결 끊기
   
   Header("Location:login_form.html");  // login_form.html 로 이동
?>

   
