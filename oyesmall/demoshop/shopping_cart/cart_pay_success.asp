
<html>
<head>
<HTML><HEAD><TITLE>OyesMall �� ���Ű��� ȯ���մϴ�</TITLE>
<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>
<script language="javascript">

	if(navigator.appName != 'Netscape') {
		document.writeln('<OBJECT ID="INIpay" CLASSID="CLSID:41FA8B68-2AF1-11D3-A484-00104B17D707" width=190 height=40');
		document.writeln('CODEBASE="http://wallet.inipay.com/plugin/INIpayPlugin128.cab#Version=1.0.0.4">');
		document.writeln('</OBJECT>');
		document.write("<SCRIP");
		document.write("T LANGUAGE=javascript SRC=http://wallet.inipay.com/plugin/Pay_ie.JS>");
		document.write("</SCRI");
		document.writeln("PT>");
	}

	function PayConfirm(form) {
		var Digit ='1234567890'
		var target = form.icardpwd
		var ipass = form.icardpwd.value
		var icard = form.icardnum.value
		var i

		if (navigator.appName == 'Netscape') ret1 = parent.wallet.MakePayMessage(form);
		else ret1 = MakePayMessage(form);

		if( ret1 == false) {
			alert("���ҿ� �����Ͽ����ϴ�.");
			return false;
		}

		
		
	}

</script>
</head>
<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" border="0" bgcolor="#ffffff">

<!-- ��� �޴� -->


<script language="JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v3.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<!--#include file="../shop_about/about_top.asp"-->
<center>
  <table width="747" border="0" cellspacing="0" cellpadding="0">
    <tr>
       <!--#include file="../shop/shop_left.asp"-->
      <td valign="top" align="center">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	
          <tr>
              <td><img src="../shop_image/cart_success.gif" width="148" height="26"></td>
           
          </tr>
       
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr bgcolor="#CECECE">
            <td height="25" width="17">&nbsp;</td>
            <td height="25" class="tk">�����Ȳ : Shopping Cart &gt; ����ϱ� &gt; �����ϱ� &gt; <B>���ſϷ�</B></td>
          </tr>
          
        </table>
		<BR><BR><BR><BR>
    
        <table border="0" cellspacing="0" cellpadding="2" width="95%">
          <tr align="center">
          <form name="frmMain" method="post" >
       
	  <input type="hidden" name="top" value="0">
            <td bgcolor="#E1ECFD" height="24" width="100%" class="tk">&nbsp;</TD>
          </tr>
        <tr bgcolor="#83A0C0">
			<td  height="1"></td>
		</tr>
         
        </table>
		<table border="0" cellspacing="0" cellpadding="2" width="95%">
          <tr align="center" height=80>
				<TD><Font color=orange><B> ��ǰ�� ���Ű� �Ϸ� �Ǿ����ϴ�.</B></font><BR><BR><B>[<A href="../shop/shop_main.asp">��������...</a>]</B></TD>
			</TR>
		</Table>
        <table width="95%" border="0" cellspacing="0" cellpadding="0" bgcolor="#F3F3F3">
          <tr>
       
            <td height="30" align=center>&nbsp;</td>
            
          </tr>
          
          <tr>
            <td height="1" bgcolor="#DCDCDC"></td>
          
          </tr>
        </table>
        <br>
        
        
        
      </td>
    </tr>
  </table>
  <!--#include file="../shop/main_shopbottom.asp"-->
</center>
</body>
</Html>