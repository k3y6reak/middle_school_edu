<!---#include file="../admin/dbconn.asp"--->
<%
		login_id = Request("login_id")
%>
<HTML><HEAD><TITLE>OyesMall 에 오신것을 환영합니다</TITLE>
<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>

<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 border="0" marginheight="0" 
marginwidth="0"><A name=top><!-- 상단 메뉴 -->


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
<SCRIPT language=javascript>
		function isEnter(tObj) {
			if(event.keyCode == 13) {
				if(tObj.value == "") {
					alert("Password를 입력하세요");
					tObj.focus();
					return;
				}
				if(frmMain.user_id.value == "") {
					alert("ID를 입력하세요");
					frmMain.user_id.focus();
					return;
				}
				document.frmMain.submit();
			}
		}
		function chkForm() {
			if(frmMain.user_id.value == "") {
				alert("ID를 입력하세요");
				frmMain.user_id.focus();
				return;
			}
			if(frmMain.passwd.value == "") {
				alert("Password를 입력하세요");
				frmMain.passwd.focus();
				return;
			}
			document.frmMain.submit();
		}
	</SCRIPT>
<!--#include file="../shop_about/about_top.asp"-->

<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=747 border=0>
  <TBODY>
  <TR>
    <!--#include file="../shop/shop_left.asp"-->
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <FORM name=form2>
        <TBODY>
        <TR>
          <TD><IMG height=26 src="../shop_image/myaccount.gif" 
          width=153></TD>
          </TR></FORM></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR bgColor=#d7d7d7>
          <TD class=lm style="PADDING-LEFT: 20px" height=25><A 
            href="../shop/shop_main.asp">home</A> &gt; <%IF loginmen = "2" Then%><A 
            href="./login2.asp"><%Else%><A Href="./profile.asp"><%End IF%>my account</A></TD></TR>
        <TR bgColor=#eeeeee>
          <TD class=lm style="PADDING-LEFT: 20px" bgColor=#efefef 
        height=4></TD></TR></TBODY></TABLE><BR><BR>
     
       <TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD width=19><IMG height=21 alt="" src="../shop_image/tb_1_g.gif" 
            width=19 border=0></TD>
          <TD style="PADDING-LEFT: 4px; PADDING-TOP: 5px" width=150 
          bgColor=#47b3b7><FONT class=w><B>OyesMall Log in</B></FONT></TD>
          <TD width=5><IMG height=21 alt="" src="../shop_image/tb_2_g.gif" width=5 
            border=0></TD>
          <TD width=441></TD></TR>
        <TR>
          <TD bgColor=#cdcdcd colSpan=4 height=1></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#cdcdc border=0>
        <TBODY>
        <TR>
		<% IF Request("s_url") = ""  Then %>
          <FORM name=frmMain action="./login_check2.asp" method=post>
		<%Else%>
			<FORM name=frmMain action="./login_check2.asp" method=post>
		<%End IF%>
		  <INPUT type=hidden name=from value=1>
		  
          <TD style="PADDING-LEFT: 6px" align=middle width=92 
            bgColor=#f3f2f2><FONT class=c5>사용자 ID</FONT></TD>
          <TD style="PADDING-LEFT: 4px" width=523 bgColor=white><IMG height=4 
            src="../shop_image/trans(1).gif"><BR><% IF  login_id <> "" Then%><INPUT 
            style="FONT-SIZE: 12px; WIDTH: 202px" tabIndex=10 size=1 
             name=user_id value="<%=login_id%>"><%Else%><INPUT 
            style="FONT-SIZE: 12px; WIDTH: 202px" tabIndex=10 size=1 
             name=user_id ><%End IF%><BR><IMG height=4 
            src="../shop_image/trans(1).gif"><BR></TD></TR>
        <TR>
          <TD style="PADDING-LEFT: 6px" align=middle bgColor=#f3f2f2><FONT 
            class=c5>비밀번호</FONT></TD>
          <TD style="PADDING-LEFT: 4px" bgColor=white><IMG height=4 
            src="../shop_image/trans(1).gif"><BR><INPUT 
           
            style="FONT-SIZE: 12px; WIDTH: 202px" tabIndex=20 type=password 
            size=1 name=passwd><BR><IMG height=4 
            src="../shop_image/trans(1).gif"><BR></TD></FORM></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD height=10></TD></TR>
        <TR>
          <TD><A href="javascript:chkForm()"><IMG height=21 alt="" 
            src="../shop_image/btn_login.gif" width=63 border=0></A></TD></TR>
        <TR>
          <TD height=55></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD width=19><IMG height=21 alt="" src="../shop_image/tb_1_g.gif" 
            width=19 border=0></TD>
          <TD style="PADDING-LEFT: 4px; PADDING-TOP: 5px" width=150 
          bgColor=#47b3b7><FONT class=w><B>OyesMall Access</B></FONT></TD>
          <TD width=5><IMG height=21 alt="" src="../shop_image/tb_2_g.gif" width=5 
            border=0></TD>
          <TD width=441></TD></TR>
        <TR>
          <TD bgColor=#cdcdcd colSpan=4 height=1></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD colSpan=3 height=15></TD></TR>
        <TR>
          <TD width=15><IMG height=10 alt="" src="../shop_image/bu_arrow02.gif" 
            width=12 border=0></TD>
          <TD colSpan=2><FONT class=c6>OyesMall ID 가 없으신 분은 회원가입을 해주시기 
            바랍니다.</FONT></TD></TR>
        <TR>
          <TD colSpan=3 height=15></TD></TR>
        <TR>
          <TD width=15></TD>
          <TD width=305>
            <TABLE cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR>
                <TD><FONT class=c5 style="LINE-HEIGHT: 20px">OyesMall 회원으로 
                  가입하시려면..</FONT></TD></TR>
              <TR>
                <TD><A 
                  href="../login/login_agree.asp"><IMG 
                  height=47 alt="" src="../shop_image/btn_member_join.gif" width=187 
                  border=0></A></TD></TR></TBODY></TABLE></TD>
          <TD width=295>
            <TABLE cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR>
                <TD><FONT class=c5 style="LINE-HEIGHT: 20px">ID/비밀번호를 
                  분실했다면?</FONT></TD></TR>
              <TR>
                <TD><A 
                  href="../account/lost_member.asp"><IMG 
                  height=47 alt="" src="../shop_image/btn_loss.gif" width=187 
                  border=0></A></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD height=200></TD></TR></TBODY></TABLE>
      
   
      <BR><BR></TD></TR></TBODY></TABLE>
	  <!--#include file="../shop/main_shopbottom.asp"-->
	  </CENTER></BODY></HTML>
