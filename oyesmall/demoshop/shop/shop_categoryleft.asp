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
		<SCRIPT language=javascript>
			function top_event()
					{
					alert('기획상품 Mall은 Open 준비중입니다.\n\n곧 Open 하겠습니다.@^.^@');
					}
		</SCRIPT>
		
		<SCRIPT language=javaScript>
		<!--
		function visit(){window.open("../admin/visit/list.asp","visit","scrollbars=yes,toolbar=no,location=no,directories=no,status=no,width=590,height=590,resizable=no,menubar=no,top=100,left=204");
		}
		// -->
		</SCRIPT>
		<%
			Select Case Top
				Case "1"
				strcolor = "#7d664e"
				Case "2"
				strcolor = "#896273"
				Case "3"
				strcolor = "#40659b"
				Case "4"
				strcolor = "#70774d"
				Case "5"
				strcolor = "#367175"
				Case "6"
				strcolor = "#526e92"
				Case "7"
				strcolor = "#4b7430"
				Case "8"
				strcolor = "#856ea0"
				Case Else
				strcolor = "#838271"
			End Select
				
		%>
      <TABLE cellSpacing=0 cellPadding=1 width=135  border=0 bgcolor="<%=strcolor%>">
        <FORM name=frmSearch onsubmit="return frmSesrchSubmit();" 
        action="../shop/shop_searchresult.asp" method=post>
		<INPUT type=hidden value=0 name=searchmode>
        <TBODY>
        <TR>
          <TD vAlign=bottom align=right><IMG height=18 
            src="../shop_image/<%=image%>_search1.gif" width=90></TD>
          <TD>&nbsp;</TD></TR>
        <TR>
          <TD align=right><INPUT class=textbox style="WIDTH: 90px" 
            name=frmSearchWord> </TD>
          <TD vAlign=bottom><INPUT type=image height=21 width=24 
            src="../shop_image/<%=image%>_search2.gif" border=0></TD></TR>
        <TR>
          <TD class=tws vAlign=top align=right><A 
            href="./shop_search.asp"><IMG 
            height=13 alt="Advanced Search" 
            src="../shop_image/advanced_<%=image%>.gif" width=90 border=0></A></TD>
          <TD>&nbsp;</TD>
		</TR>
		</FORM>
		</TBODY>
	</TABLE>
	<A href="./shop_topview.asp?top=<%=Top%>"><IMG height=28 src="../shop_image/<%=image%>_title2.gif" width=135 border=0></A><BR>
      <TABLE cellSpacing=0 cellPadding=0 width=135 border=0>
        <TBODY>
		<%
				SQL_m = "Select c_title,step From Category Where ref="&Top&" and lev=1 order by ref asc, step asc"
				RS.Open SQL_m, DB, 1
				Count = 1
				While Not RS.EOF 
				 
		%>
        <TR id=lmenu<%=count%> onmouseover="javascript: fnTxtOver('<%=count%>');" 
        onmouseout="javascript: fnTxtOut('<%=count%>');">
          <TD width=29 height=20><IMG id=lmenu_img<%=count%> height=6 
            src="../shop_image/arrow_gray.gif" width=29></TD>
          <TD class=lm><A href="./shop_subview.asp?top=<%=Top%>&step=<%=RS("step")%>"><%
							If Len(RS("c_title")) > 13 then
									Response.write Left(RS("c_title"), 13) & ".."
							Else
									Response.write RS("c_title")
							End if
					%> </A></TD>
		</TR>
        
			<%
					RS.MoveNext
					count = count +1
					Wend
					RS.Close
			%>
		</TBODY>
	</TABLE>
	<IMG height=2 src="../shop_image/line_gray.gif" width=126><BR><A href="javascript:sale();"><IMG 
      height=42 alt="Now On Sale" src="../shop_image/icon_nowonsale.gif" width=130 border=0></A><IMG height=2 src="../shop_image/line_gray.gif" width=126>
	 
	 <TABLE cellSpacing=0 cellPadding=0 width=135 border=1 bordercolor=#DEDBDE>
		<Tbody>
		<Tr height=167>
			
      <Td><img src="../shop_image/left_menu.gif" border=0 width=131 usemap="#menu"></TD>
		</TR>
		</Tbody>
	</Table>
	<IMG height=2 src="../shop_image/line_gray.gif" width=126>
	<BR><BR>
	</TD>

<map name="menu"> 
  <area shape="rect" coords="5,3,66,84" href="../shop_music/jukebox_list.asp" target="_self" alt="JukeBox" title="JukeBox">
  <area shape="rect" coords="67,4,127,84" href="../shop_board/shop_board_list.asp" target="_self" alt="게시판" title="게시판">
  <area shape="rect" coords="5,85,67,160" href="javascript:visit();" alt="방명록" title="방명록">
  <area shape="rect" coords="68,85,128,160" href="../shop/shop_notice_list.asp" target="_self" alt="공지사항" title="공지사항">
</map>