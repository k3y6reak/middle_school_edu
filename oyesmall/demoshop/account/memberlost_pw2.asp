<!---#include file="../admin/dbconn.asp"--->
<%
		user_id = Request("user_id")
		jumin1 = Request("jumin1")
		jumin2 = Request("jumin2")

		SQL = "Select passwd_q,name From Members Where user_id='"& user_id &"' And jumin1='"& jumin1 &"' And jumin2='"& jumin2 &"' "

		Set RS_L = DB.Execute (SQL)

		IF RS_L.EOF OR RS_L.BOF Then

			Response.write "<script language='javascript'>"
			Response.write "alert('������ �������� �ʽ��ϴ�. ^^');"
			Response.write "location.href='javascript:history.go(-1)';"
			Response.write "</script>"
		Else
%> 


<HTML>
	<HEAD><TITLE>OyesMall �� ���Ű��� ȯ���մϴ�</TITLE>



<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>

<style type="text/css"> 

.button{
		height:20;padding-top:1pt ;BORDER-RIGHT: #000000 1px solid;Font-family:"Tahoma"; BORDER-TOP: #000000 1px solid; FONT-SIZE: 12px; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; background-color:#47b3b7; FONT-FAMILY: tahoma,arial ;color:#ffffff ; border-color:#42B2B5 ;  width : 70
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
					height=4></TD></TR>
				</TBODY>
			</TABLE>
			<BR>
			
			<%
					user_id = Request("user_id")
					jumin1 = Request("jumin1")
					jumin2 = Request("jumin2")
					passwd_a = Request("passwd_a")

					SQL = "Select user_id,name,passwd From Members Where user_id='"&  user_id &"' And jumin1='"& jumin1 &"' And jumin2='"& jumin2 &"' And passwd_a='"& passwd_a &"' "

					Set RS_L = DB.Execute (SQL)

					IF RS_L.EOF OR RS_L.BOF Then

			%> 
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
							<TD style="PADDING-LEFT: 4px; PADDING-TOP: 5px" width=170 
							bgColor=#47b3b7><FONT class=w><B>����� ID/��й�ȣ 
							  �н�</B>&nbsp;&nbsp;</FONT></TD>
							<TD width=5><IMG height=21 alt="" src="../shop_image/tb_2_g.gif" 
							  width=5 border=0></TD>
							<TD></TD></TR>
						</TBODY>
					</TABLE>
					</TD>
					</TR>
				</TBODY>
			</TABLE>
			<BR>
			<TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
				<Tbody>
					<TR>
						<TD><FONT class=c55>
							������ Ʋ�Ƚ��ϴ�.
							<BR>Ȯ���Ͻð� �ٽ� �Է��Ͻñ� �ٶ��ϴ�.
							<BR><BR>E-Mail �ּҳ� ��й�ȣ ��Ʈ / ������ ��Ȯ���� ���� ��쿡�� <Font color=red>RED</font>MASTER <Font color=orange>(TEL)02-0000-0000</Font> <BR>���� �����ֽñ� �ٶ��ϴ�.</Font>
						</TD>
					</TR>
				</Tbody>
			</Table>
			<BR>
		  <TABLE cellSpacing=0 cellPadding=0 border=0>
			<Form name=member action="../login/login_agree.asp" method=post>
				<TBODY>
				<TR>
				  <TD  height=10></TD></TR>
				<TR>
				  <TD align=center ><input type=button value="�� ��" class=button Onclick="history.go(-1);">&nbsp;&nbsp;&nbsp;&nbsp;<Input type=submit value="ȸ������" class=button ></TD></TR>
				<TR>
				  <TD colSpan=2 height=30></TD></TR>
				  </TBODY>
			  </Form>
		 </TABLE>
		  <%Else%>
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
							<TD style="PADDING-LEFT: 4px; PADDING-TOP: 5px" width=170 
							bgColor=#47b3b7><FONT class=w><B>����� ID/��й�ȣ 
							  �н�</B>&nbsp;&nbsp;</FONT></TD>
							<TD width=5><IMG height=21 alt="" src="../shop_image/tb_2_g.gif" 
							  width=5 border=0></TD>
							<TD></TD></TR>
						</TBODY>
					</TABLE>
					</TD>
					</TR>
				</TBODY>
			</TABLE>
			
				<TABLE cellSpacing=1 cellPadding=0 width="95%" bgColor=#cdcdc border=0>
				  <Form name=answer action="./login_check3.asp" method=post>
				  <input type=hidden name=user_id value="<%=RS_L("user_id")%>">
				  <input type=hidden name=passwd value="<%=RS_L("passwd")%>">
					<TBODY>
					<TR style="PADDING-TOP: 4px" height=25>
					  <TD style="PADDING-LEFT: 6px" align=middle width=92 
						bgColor=#f3f2f2><FONT class=c55>����� ID</FONT></TD>
					  <TD style="PADDING-LEFT: 4px" width=523 bgColor=white><%=RS_L("user_id")%></TD></TR>
					<TR style="PADDING-TOP: 4px"height=25>
					  <TD style="PADDING-LEFT: 6px" align=middle bgColor=#f3f2f2><FONT 
						class=c55>PassWord</FONT></TD>
					  <TD style="PADDING-LEFT: 4px" bgColor=white><%=RS_L("passwd")%></TD></TR></TBODY></TABLE>
				  <TABLE cellSpacing=0 cellPadding=0 border=0>
					<TBODY>
					<TR>
					  <TD  height=10></TD></TR>
					<TR>
					  <TD align=center ><Input type=submit value="Ȯ ��" class=button >&nbsp;&nbsp;&nbsp;&nbsp;<input type=button value="�� ��" class=button Onclick="history.go(-1);"></TD></TR>
					<TR>
					  <TD colSpan=2 height=30></TD></TR></TBODY></TABLE>
					  <form>
		  <%End IF%>
		
		

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