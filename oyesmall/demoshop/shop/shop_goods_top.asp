<% response.expires = 0 %>
<%
	'	Top = Request("top")

		Select Case Cate1
			Case "Men"
				g_cate = "1"
				image = ("men")
			Case "Women"
				g_cate = "2"
				image = ("women")
			Case "Kids&Baby"
				g_cate = "3"
				image = ("kids")
			Case "Home&Office"
				g_cate = "4"
				image = ("home")
			Case "Electronics"
				g_cate = "5"
				image = ("electronics")
			Case "Books&Media"
				g_cate = "6"
				image = ("book")
			Case "Leisure&Sports"
				g_cate = "7"
				image = ("leisure")
			Case "Hobby"
				g_cate = "8"
				image = ("hobby")
			Case "Luxury"
				g_cate = "9"
				image = ("luxury")
		End Select

		

%>
<HTML><HEAD><TITLE>OyesMall 에 오신것을 환영합니다</TITLE>

<META http-equiv=Content-Type content="text/html; charset=ks_c_5601-1987">
<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>

<!-- 상단 메뉴 시작 -->
<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<SCRIPT language=javascript>
<!--
preload('cat_1off','../shop_image/cat_<%=image%>_1off.gif')
preload('cat_1on' ,'../shop_image/cat_<%=image%>_1on.gif')

preload('cat_2off','../shop_image/cat_<%=image%>_2off.gif')
preload('cat_2on' ,'../shop_image/cat_<%=image%>_2on.gif')

preload('cat_3off','../shop_image/cat_<%=image%>_3off.gif')
preload('cat_3on' ,'../shop_image/cat_<%=image%>_3on.gif')

preload('cat_4off','../shop_image/cat_<%=image%>_4off.gif')
preload('cat_4on' ,'../shop_image/cat_<%=image%>_4on.gif')

preload('cat_5off','../shop_image/cat_<%=image%>_5off.gif')
preload('cat_5on' ,'../shop_image/cat_<%=image%>_5on.gif')

preload('cat_6off','../shop_image/cat_<%=image%>_6off.gif')
preload('cat_6on' ,'../shop_image/cat_<%=image%>_6on.gif')

preload('cat_7off','../shop_image/cat_<%=image%>_7off.gif')
preload('cat_7on' ,'../shop_image/cat_<%=image%>_7on.gif')

preload('cat_8off','../shop_image/cat_<%=image%>_8off.gif')
preload('cat_8on' ,'../shop_image/cat_<%=image%>_8on.gif')

preload('cat_9off','../shop_image/cat_<%=image%>_9off.gif')
preload('cat_9on' ,'../shop_image/cat_<%=image%>_9on.gif')

function fnTxtOver(i) {
    strtemp = eval("lmenu"+i);
    strtemp_img = eval("lmenu_img"+i);

    strtemp.style.background="#EEEEEE";
    strtemp_img.src="../shop_image/arrow_<%=image%>.gif";
    return;
}

function fnTxtOut(i) {
    strtemp = eval("lmenu"+i);
    strtemp_img = eval("lmenu_img"+i);

    strtemp.style.background="#DBDBDB";
    strtemp_img.src="../shop_image/arrow_gray.gif";
    return;
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
    var logwin
    logwin = window.open(theURL,winName,features);
    logwin.focus();
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</SCRIPT>

<TABLE cellSpacing=0 cellPadding=0 align=center border=0>
  <TBODY>
  <TR>
    <TD>
      <!--#include file="./top.asp"--></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR vAlign=top>
                <TD height=51><A 
                  href="./shop_topview.asp?top=1"><IMG 
                  height=28 src="../shop_image/cat_<%=image%>_1off.gif" width=67 
                  border=0 name=cat_1></A></TD>
                <TD><A 
                  href="./shop_topview.asp?top=2"><IMG 
                  height=28 src="../shop_image/cat_<%=image%>_2off.gif" width=71 
                  border=0 name=cat_2></A></TD>
                <TD><A 
                  href="./shop_topview.asp?top=3"><IMG 
                  height=28 src="../shop_image/cat_<%=image%>_3off.gif" width=88 
                  border=0 name=cat_3></A></TD>
                <TD><A 
                  href="./shop_topview.asp?top=4"><IMG 
                  height=28 src="../shop_image/cat_<%=image%>_4off.gif" width=95 
                  border=0 name=cat_4></A></TD>
                <TD><A 
                  href="./shop_topview.asp?top=5"><IMG 
                  height=28 src="../shop_image/cat_<%=image%>_5off.gif" width=86 
                  border=0 name=cat_5></A></TD>
                <TD><A 
                  href="./shop_topview.asp?top=6"><IMG 
                  height=28 src="../shop_image/cat_<%=image%>_6off.gif" width=97 
                  border=0 name=cat_6></A></TD>
                <TD><A 
                  href="./shop_topview.asp?top=7"><IMG 
                  height=28 src="../shop_image/cat_<%=image%>_7off.gif" width=103 
                  border=0 name=cat_7></A></TD>
                <TD><A 
                  href="./shop_topview.asp?top=8"><IMG 
                  height=28 src="../shop_image/cat_<%=image%>_8off.gif" width=66 
                  border=0 name=cat_8></A></TD>
                <TD><A 
                  href="./shop_topview.asp?top=9"><IMG 
                  height=28 src="../shop_image/cat_<%=image%>_9off.gif" width=74 
                  border=0 name=cat_9></A></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <!--#include file = "menu.asp"--></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
