
<!---#include file="../cookie.asp"--->
<%
Top1 = Request("top")
Code1 = Request("g_code")

%>
<HTML><HEAD><TITLE>Login</TITLE>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript>
<!--
function go_reg() {
  opener.location.href="../login/login_agree.asp";
  self.close();
}

function go_lost() {
  opener.location.href="../account/lost_member.asp";
  self.close();
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

<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 
onload="self.focus(); setFocus();" border="0" marginheight="0" marginwidth="0">
<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR bgColor=#7a9abe>
    <TD><IMG height=62 src="Login.files/login_title01.gif" width=340></TD></TR>
  <TR>
    <TD align=middle><BR>
      <TABLE cellSpacing=0 cellPadding=3 border=0>
        <FORM name=frmMain action="./login_check.asp" method=post>
		<Input type=hidden name=from value=0>
        <TBODY>
        <TR>
          <TD><IMG height=13 src="Login.files/id.gif" width=61></TD>
          <TD><INPUT class=textbox style="WIDTH: 130px" tabIndex=10 
            name=user_id> </TD>
          <TD>&nbsp;</TD></TR>
        <TR>
          <TD><IMG height=13 src="Login.files/password.gif" width=61> </TD>
          <TD vAlign=bottom><INPUT class=textbox 
            onkeypress=javascript:isEnter(this); style="WIDTH: 130px" 
            tabIndex=20 type=password name=passwd> </TD>
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
        border=0></A></TD></TR></TBODY></TABLE><BR></TD></TR></TBODY></TABLE></CENTER></BODY></HTML>
