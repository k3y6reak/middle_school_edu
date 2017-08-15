<!---#include file="../admin/dbconn.asp"--->
<!---#include file="../cookie.asp"--->
<%

	Sql = "select user_id,passwd from members where user_id='" & request("user_id") & "'"
	Set rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open sql,db,1
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


<SCRIPT language=javaScript>
<!--
function login()
				{
					document.m_login.submit();
				}
// -->
</SCRIPT>

<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<META http-equiv=Content-Type content="text/html; charset=ks_c_5601-1987">
<LINK href="./login.files/style2.css" type=text/css rel=StyleSheet>

</HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginwidth="0" marginheight="0"><!----------top--------------->
<!--#include file="../shop/shop_maintop.asp"-->
						

<TABLE cellSpacing=0 cellPadding=0 align=center border=0>
		<Tbody>
		<Tr>
			<Td>
				 <table border="0" width="650" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" align=center>
					<tr>
						<td bgcolor="#FFFFFF">                       
							<div align="center">
						    <TABLE cellSpacing=0 cellPadding=0 width="70%" border=0>
									<TBODY>
									<TR>
										<TD colSpan=4 height=12></TD></TR>
									<TR>
										  <TD width=19><IMG height=21 alt="" src="./login.files/tb_1_g.gif" 
											width=19 border=0></TD>
										  <TD style="PADDING-LEFT: 4px; PADDING-TOP: 5px" width=121 
										  bgColor=#47b3b7><FONT class=w><B>축하합니다</B>&nbsp;&nbsp;</FONT></TD>
										  <TD width=5><IMG height=21 alt="" src="./login.files/tb_2_g.gif" 
											width=5 border=0></TD>
										  <TD></TD>
									</TR>
									</TBODY>
							</TABLE>  
								
							<TABLE cellSpacing=1 cellPadding=0 width="70%" bgColor=#cdcdc border=0>  
								<TR> 
								<Form Name=m_login  Action="./join_ok2.asp" Method=POST>
								<input type=hidden name=user_id value=<%=Request("user_id")%> >
								<input type=hidden name=passwd value=<%=Request("passwd")%> >
										<TD style="PADDING-LEFT: 6px" bgColor=#feffeb colSpan=3 height=60 align=center>
											<FONT class=C5>OyesMall회원이 되신것을 진심으로 축하합니다.<br>Oyesmall에서는 미국내 직수입 상품들을 직접 쇼핑하실 수 있습니다.</FONT></TD>
							   </TR>

							    <TR>
									<TD style="PADDING-LEFT: 6px;width:40%" bgColor=#f3f2f2 height=27><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>사용자 ID</FONT></TD> 
									 <TD style="PADDING-LEFT: 4px" bgColor=white ><FONT class=c3><FONT color=#47b3b7><%=Request("user_id")%> 
									</FONT></FONT></td> 
								</Tr>

								<TR>
									<TD style="PADDING-LEFT: 6px;width:40%" bgColor=#f3f2f2 height=27><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>PassWord</FONT></TD> 
									 <TD style="PADDING-LEFT: 4px" bgColor=white ><FONT class=c3><FONT color=#47b3b7><%=Request("passwd")%> 
									</FONT></FONT></td> 
								</Tr>
							</Table>  
							</div>  
					</td>  
					</tr>  
					
				</table> 
			</TD>
		</TR>
		</TBODY>
 </TABLE>
				<BR>
				<Div align=center>
				<input type="button" value="Login"  onClick="login();" class="button"> 
				</Div></Form><!------main_end-----------------><!--------------bottom------------>
				<BR><BR>

<Center><!--#include file="../shop/main_shopbottom.asp"--></CENTER></BODY></HTML>
