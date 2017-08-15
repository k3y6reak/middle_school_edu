<!---#include file="../admin/dbconn.asp"--->
<!--#include file="../cookie.asp"--->
<TABLE cellSpacing=0 cellPadding=0 width=747 border=0>
        <TBODY>
        <TR>
          <TD height=23></TD></TR>
        <TR>
          <TD>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD><A href="../shop/shop_main.asp"><IMG height=37 
                  src="../shop_image/title_wizshop1.gif" width=130 
                  border=0></A><IMG height=17 
                  src="../shop_image/title_wizshop2.gif" width=123></TD>
                <TD vAlign=bottom align=right>
                  <TABLE cellSpacing=0 cellPadding=1 border=0>
                    <TBODY>
                    <TR>
                      <TD class=top><IMG height=11 
                        src="../shop_image/top_menu1.gif" width=13></TD>
                      <TD class=top>
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
						%>
					  <A href="../login/login2.asp">login<%Else%><A href="../login/logout.asp">logout<%End If%></A></TD>
                      <TD class=top><IMG height=11 
                        src="../shop_image/top_menu_line.gif" width=7></TD>
                      <TD class=top><IMG height=11 
                        src="../shop_image/top_menu2.gif" width=13></TD>
                      <TD class=top><A 
                        href="../account/profile.asp">my account</A></TD>
                      <TD class=top><IMG height=11 
                        src="../shop_image/top_menu_line.gif" width=7></TD>
                      <TD class=top><IMG height=11 
                        src="../shop_image/top_menu3.gif" width=13></TD>
                      <TD class=top><A 
                        href="../shopping_cart/cart_list.asp">shopping 
                        cart</A></TD>
                      <TD class=top><IMG height=11 
                        src="../shop_image/top_menu_line.gif" width=7></TD>
                      <TD class=top><IMG height=11 
                        src="../shop_image/top_menu4.gif" width=11></TD>
                      <TD class=top><A 
                        href="../shop_board/shop_board_list.asp">Q&A</A></TD>
                      <TD align=right width=85> <A 
                        onmouseover="MM_swapImage('Image1','','../shop_image/top_menu_wizwid1.gif',1)" 
                        onmouseout=MM_swapImgRestore() 
                        href="../admin/admin_top.asp"><IMG height=18 alt="Admin으로 가기"   src="../shop_image/top_menu_wizwid.gif" width=99 border=0  name=Image1></A></TD></TR></TBODY></TABLE>

		<SCRIPT language=javascript>
			function admin()
					{
					alert('RED Zoned에 입장하시려면 먼저 회원가입을 하시던가 아니면\n\n ID는 admin PassWord 는 guest 로 입장해 주시기 바랍니다.^^ ');
					}
		</SCRIPT>