<?
    session_start();

    include "../dbconn.php";

    $userid = $_SESSION['userid'];

    $sql = "select * from member where id='$userid'";
    $result = mysql_query($sql, $connect);

    $row = mysql_fetch_array($result);

    $phone = explode("-", $row[tel]);
    $phone1 = $phone[0];
    $phone2 = $phone[1];
    $phone3 = $phone[2];

    mysql_close();
?>
<html>
 <body>
  <head>
    <script>
    function check_input()
   {
      if (!document.member_form.name.value)
      {
          alert("�̸��� �Է��ϼ���");    
          document.member_form.name.focus();
          return;
      }

      if (!document.member_form.passwd.value)
      {
          alert("��й�ȣ�� �Է��ϼ���");    
          document.member_form.passwd.focus();
          return;
      }

      if (!document.member_form.passwd_confirm.value)
      {
          alert("��й�ȣȮ���� �Է��ϼ���");    
          document.member_form.passwd_confirm.focus();
          return;
      }

      if (document.member_form.passwd.value != 
            document.member_form.passwd_confirm.value)
      {
          alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.\n�ٽ� �Է����ּ���.");    
          document.member_form.passwd.focus();
          document.member_form.passwd.select();
          return;
      }

      document.member_form.submit();
   }

   function reset_form()
   {
      document.member_form.name.value = "";
      document.member_form.passwd.value = "";
      document.member_form.passwd_confirm.value = "";
      document.member_form.phone1.value = "";
      document.member_form.phone2.value = "";
      document.member_form.phone3.value = "";
      document.member_form.address.value = "";
      
      document.member_form.name.focus();

      return;
   }

    </script>
     <link rel="stylesheet" href="../style.css" type="text/css">	
  </head>

    <table align=center border="0" cellspacing="0" cellpadding="15" width="718">
        <tr>
          <td><img src="img/member_title.gif"></td>
        </tr>
        <tr>
          <td align=center>
       <form  name=member_form method=post action=modify.php>
    <table border=0 cellspacing=0 cellpadding=0 align=center width="682" >
        <tr>
          <td bgcolor=DEDEDE>
    <table border="0" width=682 cellspacing="1" cellpadding="4">
        <tr>
          <td width=20% bgcolor=#F7F7F7 align=right style=padding-right:6>
               * ���̵� : </td>
          <td bgcolor=#FFFFFF style=padding-left:10><? echo $row[id] ?></td>
        </tr>
        <tr>
          <td bgcolor=#F7F7F7 align=right style=padding-right:6> * �̸� :</td>
          <td bgcolor=#FFFFFF style=padding-left:10>
             <input type=text size=12 class=m_box maxlength=12 name=name 
                    value='<? echo $row[name] ?>'></td>
        </tr>
        <tr>
          <td bgcolor=#F7F7F7 align=right style=padding-right:6>* ��й�ȣ :</td>
          <td bgcolor=#FFFFFF style=padding-left:10><input type=password size=10 
              class=m_box maxlength=10 name=passwd value='<? echo $row[passwd] ?>'> 
          </td>
        </tr>
        <tr>
          <td bgcolor=#F7F7F7 align=right style=padding-right:6> 
             * ��й�ȣ Ȯ�� :</td>
          <td bgcolor=#FFFFFF style=padding-left:10>
             <input type=password size=12 class=m_box maxlength=12 
                    name=passwd_confirm value='<? echo $row[passwd] ?>'> </td>
        </tr>
        <tr>
          <td bgcolor=#F7F7F7 align=right style=padding-right:6>���� :</td>
          <td bgcolor=#FFFFFF style=padding-left:10>
<?
   if ($row[sex]=='M')
 { 
      echo "
            <input type=radio name=sex value='M' checked>��
            <input type=radio name=sex value='W'>��
           ";
 }
      else
    {
      echo "
            <input type=radio name=sex value='M'>��
            <input type=radio name=sex value='W' checked>��
           ";
    }
?>
          </td>
        </tr>
        <tr>
          <td bgcolor=#F7F7F7 align=right style=padding-right:6>�޴���ȭ :</td>
          <td bgcolor=#FFFFFF style=padding-left:10>
             <input type=text size=4 class=m_box name=phone1 maxlength=4
                   value='<? echo $phone1 ?>'>
           - <input type=text size=4 class=m_box name=phone2 maxlength=4 
                   value='<? echo $phone2 ?>'> 
           - <input type=text size=4 class=m_box name=phone3 maxlength=4 
                   value='<? echo $phone3 ?>'>  
          </td>
        </tr>
        <tr>
          <td bgcolor=#F7F7F7 align=right style=padding-right:6 rowspan=3>
                �� �� :</td>
        </tr>
        <tr>
          <td bgcolor=#FFFFFF style=padding-left:10>
             <input type=text size=50 class=m_box name=address 
                   value='<? echo $row[address] ?>'></td>
        </tr>
    </table>
        <!---------- ȸ������ �Է� �� ��--------------->
          </td>
        </tr>
        <tr>
          <td align=right height=60>
            <img src="img/ok.gif" border="0" onclick=check_input()></a>
            <img src="img/reset.gif" border="0" onclick=reset_form()></a></td>
        </tr>
       </form>
    </table>	
          </td>
        </tr>
    </table>
    <!------------- ������ ���̺� �� ---------------->  

          </td>
        </tr>
    </table>
  </body>
</html>
