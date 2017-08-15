<!---#include file="../admin/dbconn.asp"--->
<%
		user_id = Request("user_id")
		jumin1 = Request("jumin1")
		jumin2 = Request("jumin2")

		SQL = "Select passwd_q,name From Members Where user_id='"& user_id &"' And jumin1='"& jumin1 &"' And jumin2='"& jumin2 &"' "

		Set RS_L = DB.Execute (SQL)

		IF RS_L.EOF OR RS_L.BOF Then

			Response.write "<script language='javascript'>"
			Response.write "alert('정보가 존재하지 않습니다. ^^');"
			Response.write "location.href='javascript:history.go(-1)';"
			Response.write "</script>"
		Else
%> 


<HTML>
	<HEAD><TITLE>OyesMall 에 오신것을 환영합니다</TITLE>



<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>


<style type="text/css"> 

.button{
		height:20;padding-top:1pt ;BORDER-RIGHT: #000000 1px solid;Font-family:"Tahoma"; BORDER-TOP: #000000 1px solid; FONT-SIZE: 12px; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; background-color:#47b3b7; FONT-FAMILY: tahoma,arial ;color:#ffffff ; border-color:#42B2B5 ;  width : 70
}
</STYLE>
<Script Language="JavaScript">
				<!--
				function lost_id()	 //ID를 잃었을 경우
					{
						
						if ( document.answer.passwd_a.value == "" ) 
							{
								alert("답변을 입력해 주세요 ^^");
								document.answer.passwd_a.focus();
								return false;
							}
					
				document.answer.submit();
				}

				
				//-->
		</Script>


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
            
			
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
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
                <TD></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!------ history end ----------->
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#cdcdc border=0>
	  <Form name=answer action="./memberlost_pw2.asp" method=post>
		  <Input Type=hidden name=user_id value="<%=user_id%>">
		  <Input Type=hidden name=jumin1 value="<%=jumin1%>">
		  <Input Type=hidden name=jumin2 value="<%=jumin2%>">
        <TBODY>
        <TR style="PADDING-TOP: 4px" height=25>
          <TD style="PADDING-LEFT: 6px" align=middle width=92 
            bgColor=#f3f2f2><FONT class=c55>사용자 ID</FONT></TD>
          <TD style="PADDING-LEFT: 4px" width=523 bgColor=white><%=user_id%></TD></TR>
        <TR style="PADDING-TOP: 4px"height=25>
          <TD style="PADDING-LEFT: 6px" align=middle bgColor=#f3f2f2><FONT 
            class=c55>사용자 이름</FONT></TD>
          <TD style="PADDING-LEFT: 4px" bgColor=white><%=RS_L("name")%></TD></TR>
		 <TR style="PADDING-TOP: 4px"height=25>
          <TD style="PADDING-LEFT: 6px" align=middle bgColor=#f3f2f2><FONT 
            class=c55>질 문</FONT></TD>
          <TD style="PADDING-LEFT: 4px" bgColor=white><%=RS_L("passwd_q")%></TD></TR>
		 <TR style="PADDING-TOP: 4px"height=25>
          <TD style="PADDING-LEFT: 6px" align=middle bgColor=#f3f2f2><FONT 
            class=c55>답 변</FONT></TD>
          <TD style="PADDING-LEFT: 4px" bgColor=white><INPUT 
            style="FONT-SIZE: 12px; WIDTH: 202px" maxLength=50 size=30 
            name=passwd_a>&nbsp;&nbsp;ex) red</TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD  height=10></TD></TR>
        <TR>
          <TD align=center ><Input type=button value="확 인" class=button Onclick="lost_id();">&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset value="재입력" class=button >&nbsp;&nbsp;&nbsp;&nbsp;<input type=button value="뒤 로" class=button Onclick="history.go(-1);"></TD></TR>
        <TR>
          <TD colSpan=2 height=30></TD></TR></TBODY></TABLE>
		  </Form>
		
		<TABLE cellSpacing=1 cellPadding=0 width="95%"  border=0>
			<TBODY>
				<TR>
					<TD>만약 질문에 대한 답변이 기억나지 않으신다면 <Font color=red>RED</Font>MASTER<Font color=orange>(TEL)000-000-000</Font>&nbsp;로 전화주시면 간단한 <BR>질문 확인 후 처리해 드리겠습니다.</TD>
				</TR>
			</TBody>
		</Table>

     </TD></TR></TBODY></TABLE>
			
</TD></TR></TBODY></TABLE>
<Center><!--#include file="../shop/main_shopbottom.asp"--><BR><BR>
</CENTER>
</BODY>
</HTML>
<% 
		End IF

		RS_L.Close
		DB.Close

		Set RS_L = Nothing
		Set DB = Nothing
%>