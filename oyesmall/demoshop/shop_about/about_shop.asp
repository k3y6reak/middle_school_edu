<!---#include file="../admin/dbconn.asp"--->
<% 
		Set RS = Server.CreateObject("ADODB.RecordSet")		
%>

<HTML><HEAD><TITLE>OyesMall 에 오신것을 환영합니다</TITLE>
<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>

<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 border="0" marginheight="0" 
marginwidth="0"><!-- 상단 메뉴 -->
<SCRIPT language=javascript>
<!--


//109이벤트땜에 어쩔수 없이 추가..ㅜ-ㅜ
function open109(url) {
    window.open("/event/wizshopopen/order_info.asp?url=" + url,"order", "status=no,menubar=no,resizable=no,width=350, height=262,resizable=no,menubar=no,top=90,left=300");
}
//-->
</SCRIPT>

<SCRIPT language=JavaScript>
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
</SCRIPT>
<!--#include file="./about_top.asp"-->

<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=747 border=0>
  <TBODY>
  <TR>
   <!--#include file="../shop/shop_left.asp"-->
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        
        <TBODY>
        <TR>
          <TD><IMG height=26 src="../shop_image/aboutwizshop_title1.gif" width=153></TD>
         </TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR bgColor=#d7d7d7>
          <TD class=lm style="PADDING-LEFT: 20px" height=25><A 
            href="../shop/shop_main.asp">home</A> &gt; <B>about 
            OyesMall</B></TD></TR>
        <TR bgColor=#eeeeee>
          <TD class=lm style="PADDING-LEFT: 20px" bgColor=#efefef 
        height=4></TD></TR></TBODY></TABLE><BR><BR>
      <TABLE cellSpacing=0 cellPadding=0 width="90%" border=0>
        <TBODY>
        <TR>
          <TD class=tk vAlign=top><IMG height=190 src="../shop_image/help01.gif" 
            width=190></TD>
          <TD class=tk vAlign=top><IMG height=34 
            src="../shop_image/about_title1.gif" width=249 vspace=5><BR><BR><IMG 
            height=16 src="../shop_image/title_wizshopservice.gif" width=359 
            vspace=7><BR>OyesMall ID를 사용하여 직접 외국사이트에서 결제해야 하는<BR>불편함을 없애고, 
            OyesMall내에서 One-stop Shopping을 할 수<BR>있도록 도와드리는 혁신적이고도 편리한 
            서비스입니다.<BR>이제 국내 쇼핑몰을 이용하듯이 해외쇼핑을 하실 수 있습니다.<BR>OyesMall은 해외사이트 쇼핑 시 
            따르는 모든 어려움을 해소해<BR>드릴 것입니다. 더 이상 망설일 필요가 없습니다<BR><BR><IMG height=16 
            src="../shop_image/title_substitution.gif" width=359 
            vspace=7><BR>OyesMall에서 물건을 구매하시는 것은 원하시는 상품의 구입 및<BR>국내로의 수입을 
            OyesMall에 구매대행을 의뢰하시는 것과 같습니다.<BR>해외 사이트 쇼핑시 따르는 많은 어려움을 OyesMall가 대신 
            해결해<BR>드리고 개인통관에 따르는 여러 가지 세제상의 혜택은 그대로 <BR>누리시게 되기 때문에 고객의 이익이 최대한 
            보장됩니다.</TD></TR>
        </TBODY></TABLE><BR><BR>
      <TABLE cellSpacing=0 cellPadding=0 width="85%" border=0>
        <TBODY>
        
        
        
        <TR>
          <TD align=middle bgColor=#cccccc height=1></TD>
          <TD bgColor=#cccccc></TD></TR>
        <TR>
          <TD vAlign=top align=middle><IMG height=60 
            src="../shop_image/icon_luxury.gif" width=70 vspace=5 border=0></TD>
          <TD class=tk><IMG height=14 src="../shop_image/t_luxury.gif" width=76 
            vspace=5 border=0><BR>명품 브랜드별로 상품을 보실 수 있습니다.<BR>국내 쇼핑몰에 없는 
            WizShop만의 Luxury 상품들과 만나보세요.<BR>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD>&nbsp;</TD>
                <TD width=20><IMG height=10 src="../shop_image/icon_orange.gif" 
                  width=12></TD>
                <TD class=tk width=130><A 
                  href="../shop/shop_topview.asp?top=9">Luxury 
                  Mall 바로가기</A></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD align=middle bgColor=#cccccc height=1></TD>
          <TD bgColor=#cccccc></TD></TR>
        </TBODY></TABLE>
	  <BR><BR></TD></TR></TBODY></TABLE><!--#include file="../shop/main_shopbottom.asp"--></CENTER>
	  </BODY></HTML>
<%
	Db.Close

	Set Db = Nothing
	
%>