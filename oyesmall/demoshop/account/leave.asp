<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->
<% 
		SQL_LOG = "Select sessionID From tbl_temp Where SessionID ="&oyes_order&" "
		Set Lo = DB.Execute (SQL_LOG)
		IF Not Lo.EOF then 
			loginmen = "1"
		Else
			loginmen = "2"
		End IF
		Lo.Close
		Set Lo = Nothing
		
		IF loginmen = "2" Then 
					Response.write "<script language='javascript'>"
					Response.write "alert('���� �α����� �� �ּ���. ^^');"
					Response.write "location.href='./login2.asp'"
					Response.write "</script>"
			

		Else

		
		SQL = "Select userID,passwd From tbl_Temp Where SessionID="& oyes_order &" " 

		Set RS_M = Server.CreateObject("ADODB.RecordSet")
		
		RS_M.Open SQL, DB, 1
			user_id = RS_M("userID")
			passwd = RS_M("passwd")
		RS_M.Close

		SQL2 = "Select * From Members Where user_id='"& user_id &"' And passwd='"& passwd &"' "

		Set RS_E = DB.Execute (SQL2)
		

%>

<HTML>
	<HEAD><TITLE>OyesMall �� ���Ű��� ȯ���մϴ�</TITLE>



<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>

<style type="text/css"> 

.button{
		height:20;padding-top:1pt ;BORDER-RIGHT: #000000 1px solid;Font-family:"Tahoma"; BORDER-TOP: #000000 1px solid; FONT-SIZE: 12px; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; background-color:#47b3b7; FONT-FAMILY: tahoma,arial ;color:#ffffff ; border-color:#42B2B5 ;  width : 100;
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
           
			
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD colSpan=4 height=12></TD></TR>
              <TR>
                <TD width=19><IMG height=21 alt="" src="../shop_image/tb_1_g.gif" 
                  width=19 border=0></TD>
                <TD style="PADDING-LEFT: 4px; PADDING-TOP: 5px" width=141 
                bgColor=#47b3b7><FONT class=w><B>����</B>&nbsp;&nbsp;</FONT></TD>
                <TD width=5><IMG height=21 alt="" src="../shop_image/tb_2_g.gif" 
                  width=5 border=0></TD>
                <TD></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!------ history end ----------->
      <TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#cdcdcd border=0>
        <TBODY>
        <TR>
          <TD style="PADDING-LEFT: 6px" bgColor=#feffeb height=60><FONT class=c55 style="LINE-HEIGHT: 20px">OyesMall ȸ�����񽺸� �����Ͻðڽ��ϱ�? <BR>���� 
            ȸ���Բ��� �ֹ��Ͻ� ��ǰ�� ������̶�� ��ǰ�� ���ɹ����� �Ŀ� ������ �����մϴ�. <BR><%=RS_E("name")%>�Բ��� �ο����� ID <%=RS_E("user_id")%> �� ������ �Բ� �� �̻� 
            ����Ͻ� �� �����ϴ�. <BR>���ο� ID�� �ޱ� ���Ͻø� �ٽ� ȸ�������� ���ּž� �մϴ�. 
        </FONT></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
	  <Form name=leave action="./leave_ok.asp" method=post>
	  <input type=hidden name=user_id value="<%=RS_E("user_id")%>">
	  <input type=hidden name=passwd value="<%=RS_E("passwd")%>">
        <TBODY>
        <TR>
          <TD height=15></TD></TR>
        <TR>
          <TD><FONT class=c5 style="COLOR: #ff9900">���� �����Ͻðڽ��ϱ�? 
            <BR><BR></FONT></TD></TR>
        <TR>
          <TD><input type=submit value="���������ϱ�" class=button></TD></TR>
        <TR>
          <TD height=30></TD></TR></TBODY></Form></TABLE>


     

      </TD></TR></TBODY></TABLE>
			
</TD></TR></TBODY></TABLE>
<Center><!--#include file="../shop/main_shopbottom.asp"--><BR><BR>
</CENTER>
</BODY>
</HTML>
<%End IF%>
