<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->
<%
	gourl = Request("gourl")
	

%>
<HTML>
	<HEAD><TITLE>OyesMall 에 오신것을 환영합니다</TITLE>

<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>



<style type="text/css"> 

.button{
		height:20;padding-top:1pt ;BORDER-RIGHT: #000000 1px solid;Font-family:"Tahoma"; BORDER-TOP: #000000 1px solid; FONT-SIZE: 12px; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; background-color:#47b3b7; FONT-FAMILY: bold;color:#ffffff ; border-color:#42B2B5 ; width:10%
}
</STYLE>


<SCRIPT language=javascript>
<!--
function go_reg() {
  location.href="../login/login_agree.asp";

}

function go_lost() {
location.href="../account/lost_member.asp";

}

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
	else if(frmMain.passwd.value == "") {
        alert("비밀번호를 입력하세요");
        frmMain.passwd.focus();
        return;
    }
    document.frmMain.submit();
}

function setFocus() {
    if(frmMain.user_id.value == "") {
        frmMain.user_id.focus();
    } else {
        frmMain.passwd.focus();
    }
    return;
}
//-->
</SCRIPT>

<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<META http-equiv=Content-Type content="text/html; charset=ks_c_5601-1987">
<LINK href="./login.files/style2.css" type=text/css rel=StyleSheet>

</HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginwidth="0" marginheight="0"><!----------top--------------->
<!--#include file="../shop/shop_maintop.asp"-->
						
<BR><BR>
<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width="340" border=0>
  <TBODY>
  <TR bgColor=#7a9abe>
    <TD><IMG height=62 src="Login.files/login_title01.gif" width=340></TD></TR>
  <TR>
    <TD align=middle><BR>
      <TABLE cellSpacing=0 cellPadding=3 border=0>
        <FORM name=frmMain action="./login_check.asp" method=post>
		<Input type=hidden name=from value=0>
		<input type=hidden name="gourl" value="<%=gourl%>">
        <TBODY>
        <TR>
          <TD><IMG height=13 src="Login.files/id.gif" width=61></TD>
          <TD><INPUT class=textbox style="WIDTH: 130px" tabIndex=10 
            name=user_id > </TD>
          <TD>&nbsp;</TD></TR>
        <TR>
          <TD><IMG height=13 src="Login.files/password.gif" width=61> </TD>
          <TD vAlign=bottom><INPUT class=textbox 
            onkeypress=javascript:isEnter(this); style="WIDTH: 130px" 
            tabIndex=20 type=password name=passwd > </TD>
          <TD><A href="javascript:chkForm();"><IMG height=21 alt=로그인하기 
            src="Login.files/btn_login.gif" width=75 border=0></A></TD></TR>
       </FORM></TBODY></TABLE><BR></TD></TR>
  <TR bgColor=#e4e4e4>
    <TD align=middle>
      <TABLE cellSpacing=0 cellPadding=1 border=0>
        <TBODY>
        <TR>
          <TD height=5></TD>
          <TD></TD></TR>
        <TR>
          <TD class=tk>OyesMall회원으로 가입하시려면</TD>
          <TD><A href="javascript:go_reg();"><IMG height=21 alt=무료회원가입 
            src="Login.files/btn_join.gif" width=120 vspace=4 
border=0></A></TD></TR>
        <TR>
          <TD class=tk>ID나 비밀번호를 잊으셨나요?</TD>
          <TD><A href="javascript:go_lost();"><IMG height=21 alt="ID/비밀번호 분실" 
            src="Login.files/btn_lostid.gif" width=120 vspace=4 
        border=0></A></TD></TR></TBODY></TABLE><BR></TD></TR></TBODY></TABLE></CENTER>
				<BR><BR><BR><BR>

<Center><!--#include file="../shop/main_shopbottom.asp"--></CENTER></BODY></HTML>

