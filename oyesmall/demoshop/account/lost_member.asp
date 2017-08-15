<!---#include file="../admin/dbconn.asp"--->


<HTML>
	<HEAD><TITLE>OyesMall 에 오신것을 환영합니다</TITLE>



<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>
<Script Language="JavaScript">
				<!--
				function lost_id()	 //ID를 잃었을 경우
					{
						
						if ( document.frmID.name.value == "" ) 
							{
								alert("이름을 입력해 주세요 ^^");
								document.frmID.name.focus();
								return false;
							}
						if ( document.frmID.jumin1.value == "" ) 
							{
								alert("주민등록번호를 입력해 주세요 ^^");
								document.frmID.jumin1.focus();
								return false;
							}
						if ( document.frmID.jumin2.value == "" ) 
							{
								alert("주민등록번호 뒷자리를 입력해 주세요 ^^");
								document.frmID.jumin2.focus();
								return false;
							}
				document.frmID.submit();
				}

				
				//-->
		</Script>
		<Script Language="JavaScript">
		function pw_lost()		//비밀번호를 잃었을 경우
					{
						
						if ( document.frmPass.user_id.value == "" ) 
							{
								alert("ID을 입력해 주세요 ^^");
								document.frmPass.user_id.focus();
								return false;
							}
						if ( document.frmPass.jumin1.value == "" ) 
							{
								alert("주민등록번호를 입력해 주세요 ^^");
								document.frmPass.jumin1.focus();
								return false;
							}
						if ( document.frmPass.jumin2.value == "" ) 
							{
								alert("주민등록번호 뒷자리를 입력해 주세요 ^^");
								document.frmPass.jumin2.focus();
								return false;
							}
				document.frmPass.submit();
				}
					</Script>
<style type="text/css"> 

.button{
		height:20;padding-top:1pt ;BORDER-RIGHT: #000000 1px solid;Font-family:"Tahoma"; BORDER-TOP: #000000 1px solid; FONT-SIZE: 12px; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; background-color:#47b3b7; FONT-FAMILY: tahoma,arial ;color:#ffffff ; border-color:#42B2B5 ;  width :100
}
</STYLE>



<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<META http-equiv=Content-Type content="text/html; charset=ks_c_5601-1987">
<LINK href="./style3.css" type=text/css rel=StyleSheet>

</HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginwidth="0" marginheight="0"><!----------top--------------->
<!--#include file="../shop/shop_maintop.asp"-->
<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=747 border=0>
  <TBODY>
  <TR>
    <!--#include file="../shop/shop_left.asp"-->
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
 
        <TBODY>
        <TR>
          <TD>&nbsp;&nbsp;<IMG height=26 src="../shop_image/myaccount.gif" 
          width=153></TD>
          </TR></TBODY></TABLE>						
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR bgColor=#d7d7d7>
          <TD class=lm style="PADDING-LEFT: 20px" height=25><A 
            href="../shop/shop_main.asp">home</A> &gt; <%IF loginmen = "2" Then%><A 
            href="./login2.asp"><%Else%><A Href="./profile.asp"><%End IF%>my account</A> </TD></TR>
        <TR bgColor=#eeeeee>
          <TD class=lm style="PADDING-LEFT: 20px" bgColor=#efefef 
        height=4></TD></TR></TBODY></TABLE>
		<BR>
	<TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD height=5>
            <FORM name=frmID action="./memberlost_id.asp" method=post>
			
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD colSpan=4 height=12></TD></TR>
              <TR>
                <TD width=19><IMG height=21 alt="" src="../shop_image/tb_1_g.gif" 
                  width=19 border=0></TD>
                <TD style="PADDING-LEFT: 4px; PADDING-TOP: 5px" width=141 
                bgColor=#47b3b7><FONT class=w><B>사용자 ID 
                  분실</B>&nbsp;&nbsp;</FONT></TD>
                <TD width=5><IMG height=21 alt="" src="../shop_image/tb_2_g.gif" 
                  width=5 border=0></TD>
                <TD></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!------ history end ----------->
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#cdcdc border=0>
        <TBODY>
        <TR style="PADDING-TOP: 4px">
          <TD style="PADDING-LEFT: 6px" align=middle width=92 
            bgColor=#f3f2f2><FONT class=c55>이름</FONT></TD>
          <TD style="PADDING-LEFT: 4px" width=523 bgColor=white><INPUT 
            style="FONT-SIZE: 12px; WIDTH: 202px" maxLength=50 size=30 
            name=name>&nbsp;ex) 레드락</TD></TR>
        <TR style="PADDING-TOP: 4px">
          <TD style="PADDING-LEFT: 6px" align=middle bgColor=#f3f2f2><FONT 
            class=c55>주민등록번호</FONT></TD>
          <TD style="PADDING-LEFT: 4px" bgColor=white><INPUT 
            style="FONT-SIZE: 12px" maxLength=6 size=6 name=jumin1>&nbsp;-&nbsp; 
            <INPUT  style="FONT-SIZE: 12px" maxLength=7 
            size=7 name=jumin2>&nbsp;ex)701101-1010100 </TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD  height=10></TD></TR>
        <TR>
          <TD align=center ><Input type=button value="확 인" class=button Onclick="lost_id();">&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset value="재입력" class=button></TD></TR>
        <TR>
          <TD colSpan=2 height=30></TD></TR></TBODY></TABLE></FORM>


      <FORM name=frmPass action="./memberlost_pw.asp" method=post>
	  
      <TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD colSpan=4 height=12></TD></TR>
        <TR>
          <TD width=19><IMG height=21 alt="" src="../shop_image/tb_1_g.gif" 
            width=19 border=0></TD>
          <TD style="PADDING-LEFT: 4px; PADDING-TOP: 5px" width=141 
          bgColor=#47b3b7><FONT class=w><B>사용자 비밀번호 
          분실</B>&nbsp;&nbsp;</FONT></TD>
          <TD width=5><IMG height=21 alt="" src="../shop_image/tb_2_g.gif" 
            width=5 border=0></TD>
          <TD></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#cdcdc border=0>
        <TBODY>
        <TR style="PADDING-TOP: 4px">
          <TD style="PADDING-LEFT: 6px" align=middle width=92 
            bgColor=#f3f2f2><FONT class=c55>아이디</FONT></TD>
          <TD style="PADDING-LEFT: 4px" width=523 bgColor=white><INPUT 
            style="FONT-SIZE: 12px; WIDTH: 202px" size=30 name=user_id></TD></TR>
        <TR style="PADDING-TOP: 4px">
          <TD style="PADDING-LEFT: 6px" align=middle bgColor=#f3f2f2><FONT 
            class=c55>주민등록번호</FONT></TD>
          <TD style="PADDING-LEFT: 4px" bgColor=white><INPUT 
            style="FONT-SIZE: 12px" maxLength=6 size=6 name=jumin1>&nbsp;-&nbsp; 
            <INPUT  style="FONT-SIZE: 12px" maxLength=7 
            size=7 name=jumin2></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD  height=10></TD></TR>
        <TR>
          <TD align=center ><Input type=button value="확 인" class=button Onclick="pw_lost();">&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset value="재입력" class=button></TD></TR>
        <TR>
          <TD colSpan=2 height=300></TD></TR></TBODY></TABLE></FORM></TD></TR></TBODY></TABLE>
			
</TD></TR></TBODY></TABLE>
<Center><!--#include file="../shop/main_shopbottom.asp"--><BR><BR>
</CENTER>
</BODY>
</HTML>
