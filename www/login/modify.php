<?
   session_start();

   include "../dbconn.php";       // dconn.php ������ �ҷ���

   $regist_day = date("Y-m-d (H:i)");  // ������ '��-��-��-��-��'�� ����
   $ip = $REMOTE_ADDR;         // �湮���� IP �ּҸ� ����
   
   if ($phone1 && $phone2 && $phone3)
        $tel = $phone1."-".$phone2."-".$phone3;
   else
        $tel = "";

   $sql = "update member set passwd='$passwd', name='$name' , ";
   $sql .= "sex='$sex', tel='$tel', address='$address' where id='$userid'";

   mysql_query($sql, $connect);  // $sql �� ����� ��� ����

   mysql_close();                // DB ���� ����
   
   Header("Location:../main.php");  // main.php �� �̵�
?>

   
