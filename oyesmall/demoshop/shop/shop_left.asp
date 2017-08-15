<TD vAlign=top align=middle width=135 bgColor=#dbdbdb><!-- 검색 부분 시작-->
      <SCRIPT>
		<!-- 
			function frmSesrchSubmit() {
				if (document.frmSearch.frmSearchWord.value.length == 0) {
					alert('검색어를 입력해 주세요');
					document.frmSearch.frmSearchWord.focus();
					return false;
				} else {
					document.frmSearch.submit();
				}
			}
		-->
		</SCRIPT>

		<SCRIPT language=javascript>
			function sale()
					{
					alert('Sale 매장은 Open 준비중입니다.\n\n곧 Open 하겠습니다.@^.^@');
					}
		</SCRIPT>

		<SCRIPT language=javaScript>
		<!--
		function visit(){window.open("../admin/visit/list.asp","visit","scrollbars=yes,toolbar=no,location=no,directories=no,status=no,width=590,height=590,resizable=no,menubar=no,top=100,left=204");
		}
		// -->
		</SCRIPT>

      <TABLE cellSpacing=0 cellPadding=1 width=135 bgColor=#939393 border=0>
        <FORM name=frmSearch onsubmit="return  frmSesrchSubmit();"action="../shop/shop_searchresult.asp"
		method=post>
		<INPUT type=hidden value=0 name=searchmode> 
        <TBODY>
        <TR>
          <TD vAlign=bottom align=right><IMG height=18 src="../shop_image/sale_search1.gif" width=90></TD>
          <TD>&nbsp;</TD>
		</TR>
        
		<TR>
          <TD align=right><INPUT class=textbox style="WIDTH: 90px"  name=frmSearchWord> </TD>
          <TD vAlign=bottom><INPUT type=image height=21 width=24 src="../shop_image/sale_search2.gif" border=0></TD>
		</TR>
        
		<TR>
          <TD class=tws vAlign=top align=right><A href="../shop/shop_search.asp"><IMG 
            height=13 alt="Advanced Search" src="../shop_image/advanced_sale.gif"  width=90 border=0></A></TD>
          <TD>&nbsp;</TD>
		</TR>
		</FORM>
		</TBODY>
	</TABLE><!-- 검색 부분 끝--><!-- 공통으로 처리할 분류메뉴 처리 시작 --><A href="../shop_about/shop_guide.asp"><IMG height=26 src="../shop_image/wizshopguide_title2.gif" width=135 
      border=0></A><BR>

      <TABLE cellSpacing=0 cellPadding=0 width=135 border=0>
        <TBODY>
        <TR id=lmenu0 onmouseover="javascript: fnTxtOver('0');" onmouseout="javascript: fnTxtOut('0');">
          <TD width=29 height=20><IMG id=lmenu_img0 height=6 src="../shop_image/arrow_gray.gif" width=29></TD>
          <TD class=lm><A href="../shop_about/shop_indent.asp">주문안내</A></TD>
		</TR>

        <TR id=lmenu1 onmouseover="javascript: fnTxtOver('1');" onmouseout="javascript: fnTxtOut('1');">
          <TD width=29 height=20><IMG id=lmenu_img1 height=6 src="../shop_image/arrow_gray.gif" width=29></TD>
          <TD class=lm><A href="../shop_about/shop_delivery.asp">배송안내</A></TD>
		</TR>

        <TR id=lmenu2 onmouseover="javascript: fnTxtOver('2');" onmouseout="javascript: fnTxtOut('2');">
          <TD width=29 height=20><IMG id=lmenu_img2 height=6  src="../shop_image/arrow_gray.gif" width=29></TD>
          <TD class=lm><A href="../shop_about/shop_charge.asp">요금안내</A></TD>
		</TR>
        
		<TR id=lmenu3 onmouseover="javascript: fnTxtOver('3');" onmouseout="javascript: fnTxtOut('3');">
          <TD width=29 height=20><IMG id=lmenu_img3 height=6  src="../shop_image/arrow_gray.gif" width=29></TD>
          <TD class=lm><A href="../shop_about/shop_return.asp">반품 및 보험안내</A></TD>
		</TR>
        
        <TR id=lmenu6 onmouseover="javascript: fnTxtOver('6');" onmouseout="javascript: fnTxtOut('6');">
			<TD width=29 height=20><IMG id=lmenu_img6 height=6 src="../shop_image/arrow_gray.gif" width=29></TD>
			<TD class=lm><A href="../shop_about/shop_map.asp">OyesMall Map</A></TD>
		</TR>
		</TBODY>
	</TABLE>
	<BR><IMG height=2 src="../shop_image/line_gray.gif" width=126 vspace=4>
	<BR><B><FONT color=#666666><A href="../shop_about/about_shop.asp">About OyesMall</A></FONT></B><IMG height=2 src="../shop_image/line_gray.gif" width=126><BR><A href="javascript:sale();"><IMG height=42 alt="Now On Sale"src="../shop_image/icon_nowonsale.gif" width=130 border=0></A><IMG height=2 src="../shop_image/line_gray.gif" width=126 vspace=4>
	<TABLE cellSpacing=0 cellPadding=0 width=135 border=1 bordercolor=#DEDBDE>
		<Tbody>
		<Tr height=167>
			
      <Td><img src="../shop_image/left_menu.gif" border=0 width=131 usemap="#menu"></TD>
		</TR>
		</Tbody>
	</Table>
	<IMG height=2 src="../shop_image/line_gray.gif" width=126>
	<BR><BR></TD>


<map name="menu"> 
  <area shape="rect" coords="5,3,66,84" href="../shop_music/jukebox_list.asp" target="_self" alt="JukeBox" title="JukeBox">
  <area shape="rect" coords="67,4,127,84" href="../shop_board/shop_board_list.asp" target="_self" alt="게시판" title="게시판">
  <area shape="rect" coords="5,85,67,160" href="javascript:visit();" alt="방명록" title="방명록">
  <area shape="rect" coords="68,85,128,160" href="../shop/shop_notice_list.asp" target="_self" alt="공지사항" title="공지사항">
</map>
