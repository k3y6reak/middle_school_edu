<%@ language=vbscript %>
<!---#include file="../admin/dbconn.asp"--->

<%
		
		Top = Request("top")
		
		g_code = Request("g_code")

		Set RS = Server.CreateObject("ADODB.RecordSet")	

		SQL_good = "Select * From Goods Where g_code='"&g_code&"' "
	'	Response.Write SQL_good

		RS.Open SQL_good, DB, 1
		No = RS("num")
		Cate1 = RS("ca1")
		Cate2 = RS("ca2")
		Cate3 = RS("ca3")
		g_com = RS("g_com")
		g_name = RS("g_name")
		price = RS("or_p")
		color = RS("color")
		point = RS("point")
		bphoto = RS("bphoto")
		cphoto = RS("cphoto")
		content = RS("content")
		content = Replace(content,chr(13)&chr(10),chr(13)&chr(10))
		feature = RS("feature")
		Room = "http://"&site&"/demoshop/admin/mall_image/"&RS("ca1")
		
		RS.Close
	
		
%>

<!--#include file="./shop_goods_top.asp"--><!-- 상단 메뉴 끝 --><!-- 메인 페이지 시작 -->
<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=747 border=0>
  <TBODY>
  <TR><!-- 왼쪽 메뉴 시작 -->
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

      <TABLE cellSpacing=0 cellPadding=1 width=135  border=0 bgcolor=<% IF g_cate = 1 Then%>#7d664e<% ElseIF g_cate=2 Then%>#896273<%ElseIF g_cate=3 Then%>#40659b<%ElseIF g_cate=4 Then%>#70774d<%ElseIF g_cate=5 Then%>#367175<%ElseIF g_cate=6 Then%>#526e92<%ElseIF g_cate=7 Then%>#4b7430<%ElseIF g_cate=8 Then%>#856ea0<%Else%>#838271<%End IF%>>
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
          <TD>&nbsp;</TD></TR></FORM></TBODY></TABLE><!-- 검색 부분 끝--><!-- 공통으로 처리할 대,중,소 분류 메뉴 처리 시작 --><A 
      href="./shop_topview.asp?top=<%=g_cate%>"><IMG 
      height=28 src="../shop_image/<%=image%>_title2.gif" width=135 border=0></A><BR>
      <TABLE cellSpacing=0 cellPadding=0 width=135 border=0>
        <TBODY>
		<%
				SQL_m = "Select c_title,step From Category Where ref="&g_cate&" and lev=1 order by ref asc, step asc"
				RS.Open SQL_m, DB, 1
				category2 = RS("step")
				Count = 1
				While Not RS.EOF 
				 
		%>
        <TR >
          <TD width=29 height=20><IMG id=lmenu_img<%=count%> height=6 
            src="../shop_image/arrow_gray.gif" width=29></TD>
          <TD class=lm><A href="./shop_subview.asp?top=<%=g_cate%>&step=<%=RS("step")%>"><%
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
	<BR><IMG height=2 src="../shop_image/line_gray.gif" width=126><BR><A href="javascript:sale();"><IMG 
      height=42 alt="Now On Sale" src="../shop_image/icon_nowonsale.gif" width=130 border=0></A><IMG height=2 src="../shop_image/line_gray.gif" width=126>
	 <BR>
	  <TABLE cellSpacing=0 cellPadding=0 width=135 border=1 bordercolor=#DEDBDE>
		<Tbody>
		<Tr height=167>
			
      <Td><img src="../shop_image/left_menu.gif" border=0 width=131 usemap="#menu"></TD>
		</TR>
		</Tbody>
	</Table>
	<IMG height=2 src="../shop_image/line_gray.gif" width=126>
	 <BR></TD>

	  <map name="menu"> 
  <area shape="rect" coords="5,3,66,84" href="../shop_music/jukebox_list.asp" target="_self" alt="JukeBox" title="JukeBox">
  <area shape="rect" coords="67,4,127,84" href="../shop_board/shop_board_list.asp" target="_self" alt="게시판" title="게시판">
  <area shape="rect" coords="5,85,67,160" href="javascript:visit();" target="_self" alt="방명록" title="방명록">
  <area shape="rect" coords="68,85,128,160" href="../shop/shop_notice_list.asp" target="_self" alt="공지사항" title="공지사항">
</map>

    <TD vAlign=top><!-- 중앙 메뉴 시작 -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <FORM name=frmBrandSite>
        <TBODY>
        <TR>
          <TD><IMG height=26 src="../shop_image/<%=image%>_title1.gif"></TD>
          </TR></FORM></TBODY></TABLE><!-- Luxury 기획전 밑 Best seller, Today's Chioce 시작 -->
		
		<%
				SQL_3 = "Select step From Category Where ref="&g_cate&" And lev=1 And c_title Like '%"& Cate2 &"%'"

			'	Response.Write SQL_3
			'	Response.End
				RS.Open SQL_3, DB, 1

				sub_step = RS("Step")

				RS.Close
		
				SQL_4 = "Select step From Category Where ref="&g_cate&" And lev=2 And c_title='"& Cate3 &"'"
			'	response.Write SQL_4
			'	response.End
				
				RS.Open SQL_4, DB, 1

				tail_step = RS("Step")

				RS.Close
		%>

     <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR bgColor=#cecece>
          <TD width=17 bgcolor=<% IF g_cate = 1 Then%>#d3c8ba<% ElseIF g_cate=2 Then%>#dccfd7<%ElseIF g_cate=3 Then%>#d7e4f7<%ElseIF g_cate=4 Then%>#dadfc4<%ElseIF g_cate=5 Then%>#d6eaeb<%ElseIF g_cate=6 Then%>#ccd7e3<%ElseIF g_cate=7 Then%>#d5e8c8<%ElseIF g_cate=8 Then%>#e1d9f2<%Else%>#BCB99D<%End IF%> height=22>&nbsp;</TD>
          <TD class=lm bgcolor=<% IF g_cate = 1 Then%>#d3c8ba<% ElseIF g_cate=2 Then%>#dccfd7<%ElseIF g_cate=3 Then%>#d7e4f7<%ElseIF g_cate=4 Then%>#dadfc4<%ElseIF g_cate=5 Then%>#d6eaeb<%ElseIF g_cate=6 Then%>#ccd7e3<%ElseIF g_cate=7 Then%>#d5e8c8<%ElseIF g_cate=8 Then%>#e1d9f2<%Else%>#BCB99D<%End IF%>><A 
            href="./shop_main.asp">home</A> &gt; <A 
            href="./shop_topview.asp?top=<%=g_cate%>"><%=Cate1%></A> 
            &gt; <A 
            href="./shop_subview.asp?top=<%=g_cate%>&step=<%=sub_step%>"><%=Cate2%></A> 
            &gt; <B><A 
            href="./shop_tailview.asp?top=<%=g_cate%>&step=<%=sub_step%>&tail=<%=tail_step%>"><%=Cate3%></A></B></TD></TR>
        <TR bgColor=#eeeeee>
          <TD bgColor=#f0ece8 height=4></TD>
          <TD bgColor=#f0ece8></TD></TR></TBODY></TABLE>
		<SCRIPT language=javascript>
						<!--//
							function fnCheckOk()
									{
										
										document.form_info.submit();
									}

							function chklogin() 
									{
										window.open('../login/login.asp?Top=<%=Top%>&g_code=<%=g_code%>','Login','width=340,height=230');
									}
						-->
						</SCRIPT>

      <TABLE cellSpacing=0 cellPadding=8 width="95%" border=0>
        <FORM name=form_info action="../shopping_cart/cart_set.asp" method=post>
		<INPUT type=hidden value="<%=g_cate%>" name=top> 
		
		<INPUT type=hidden value="<%=g_code%>" name=g_code> 
		
		
        <TBODY>
        <TR>
          <TD width=250><IMG height=250 src="<%=Room%>/<%=bphoto%>" width=250 vspace=4 border=0></TD>
          <TD class=tk vAlign=top><BR><FONT color=#274681 size=3><B><%=g_com%></B></FONT><BR><FONT color=#274681 
            size=3><B><%=g_name%></B></FONT><BR><%=feature%><BR><BR>상품가격&nbsp;:&nbsp;<FONT color=#274681 
            size=2><B><%=FormatNumber(price,0)%>원</B></FONT><BR>적 립 금&nbsp;&nbsp;:&nbsp;<FONT 
            color=#274681 size=2><%=FormatNumber(point,0)%>원</FONT><BR><BR>
            <HR style="COLOR: #cecece" noShade SIZE=1>
            <BR>
            <TABLE cellSpacing=0 width="100%" border=0 cellapdding="0">
              <TBODY>
              <TR>
                <TD width=70>상품코드</TD>
                <TD width=250>: <%=g_code%></TD></TR>
			 <%IF color<>"" Then%>
              <TR>
                <TD width=70>색상</TD>
                <TD>: <%=color%></TD></TR>
			<%End IF%>
              <TR>
                <TD colSpan=2>
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD width=60>주문수량</TD>
                      <TD>: <INPUT readOnly maxLength=5 size=5 value=1 
                        name=ea></TD>
                      <TD>
                        <SCRIPT language=javascript  src="../shop_file/number_cnt.js"></SCRIPT>

                        <TABLE cellSpacing=0 cellPadding=0 border=0>
                          <TBODY>
                          <TR>
                            <TD><A href="javascript:%20num_p();"><IMG 
                              height=13 src="../shop_image/num_p.gif" width=15 
                              border=0></A></TD>
                            <TD rowSpan=2>&nbsp;EA</TD></TR>
                          <TR>
                            <TD><A href="javascript:%20num_m();"><IMG 
                              height=13 src="../shop_image/num_m.gif" width=15 
                              border=0></A></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></FORM></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!-- 이전/다음, 리스트, Shopping Cart, 추천메일 보내기 시작 -->
						
      <TABLE cellSpacing=0 cellPadding=8 width="95%" border=0>
        <TBODY>
        <TR>
          <TD align=middle width=250>
					<TABLE cellSpacing=0 cellPadding=0 width="80%" border=0>
					  <TBODY>
					  <TR>
					  <%
							'이전 목록
							SQL_p = "Select Min(g_code) From Goods Where Ca1='"& cate1 &"' And Ca2='"& cate2 &"'  And Ca3='"& cate3 &"' And g_code > "&g_code&" "

							RS.Open SQL_p, DB, 1
								pre_code = RS(0)
							RS.Close
							
							'다음 목록
							SQL_n = "Select Max(g_code) From Goods Where Ca1='"& cate1 &"' And Ca2='"& cate2 &"'  And Ca3='"& cate3 &"' And g_code < "&g_code&" "

							RS.Open SQL_n, DB, 1
								next_code = RS(0)
							RS.Close

					  %>
						<TD><% IF pre_code <> "" Then%><A 
						  href="./shop_goodsview.asp?top=<%=g_cate%>&g_code=<%=pre_code%>"><IMG 
						  height=15 alt=이전 src="../shop_image/btn_prev.gif" width=43 
						  border=0></A><%Else%><IMG 
						  height=15 alt=이전 src="../shop_image/btn_prev.gif" width=43 
						  border=0><%End IF%></TD>
						<TD align=middle><A 
						  href="./shop_tailview.asp?top=<%=g_cate%>&step=<%=sub_step%>&tail=<%=tail_step%>"><IMG 
						  height=15 alt=리스트 src="../shop_image/btn_list.gif" width=34 
						  border=0></A></TD>
						<TD align=right><% IF next_code <> "" Then%><A 
						  href="./shop_goodsview.asp?top=<%=g_cate%>&g_code=<%=next_code%>"><IMG 
						  height=15 alt=다음 src="../shop_image/btn_next.gif" width=43 
						  border=0></A><%Else%><IMG 
						  height=15 alt=다음 src="../shop_image/btn_next.gif" width=43 
						  border=0><%End IF%></TD>
					</TR>
					</TBODY>
				</TABLE>
			</TD>
          
			<TD class=tk vAlign=bottom>
				<TABLE cellPadding=0 width="100%" border=0 >
				  <TBODY>
				  <TR>
					
					<TD><A href="javascript:%20fnCheckOk();"><IMG height=21 
					  alt="Shopping Cart에 넣기" src="../shop_image/btn_shoppingcart.gif" 
					  width=170 border=0></A></TD>
					<TD width=5>&nbsp;</TD>
					</TR>
				</TBODY>
				</TABLE>
			</TD>
		</TR>
        <TR>
          <TD height=7></TD></TR></TBODY></TABLE><!-- 이전/다음, 리스트, Shopping Cart, 추천메일 보내기 끝 -->
      <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
        <TBODY>
        <TR>
          <TD style="PADDING-LEFT: 20px" vAlign=top>
            <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
              <TBODY>
              <TR>
                <TD vAlign=bottom background="../shop_image/info_bg.gif" colSpan=3 
                height=25><IMG height=9 src="../shop_image/icon_info.gif" 
                  width=17>&nbsp;상세정보</TD></TR>
              <TR>
                <TD>&nbsp;</TD>
                <TD class=tgn><BR>
                 
				<%
						IF cphoto <> "" Then 

				%>
                  <TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=6 
                  width=412 borderColorLight=#babdc9 border=0>
                    <TBODY>
                    <TR>
                      <TD bgColor=#ffffff>
                        <TABLE cellSpacing=0 cellPadding=0 width=380 border=0>
                          <TBODY>
                          <TR>
                            <TD vAlign=top align=left rowSpan=100></TD>
                            <TD vAlign=top align=middle>
                              <TABLE cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                <TR>
                                <TD vAlign=top align=middle><IMG 
                                src="<%=Room%>/<%=cphoto%>" vspace="3" heght="90" 
                                wdth="90"></TD>
                                <TD width=30 
                                rowSpan=2>&nbsp;&nbsp;&nbsp;</TD></TR>
                                <TR>
                                <TD vAlign=bottom align=middle><IMG height=1 
                                src="../shop_image/trans.gif" width=80></TD></TR>
                                <TR>
                                <TD vAlign=bottom align=middle><FONT face=Arial 
                                color=#777777 
                              size=1></FONT></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><BR><%End IF%><%=content%> <BR><BR></TD>
                <TD>&nbsp;</TD></TR>
              
              </TBODY></TABLE><BR><BR></TD>
          <TD vAlign=top width=120>
            <TABLE cellSpacing=1 cellPadding=0 width="100%" bgColor=#cccccc 
            border=0>
              <TBODY>
              <TR align=middle bgColor=#eeeeee>
                <TD class=tk height=20>관련상품</TD></TR>
              <TR align=middle bgColor=#ffffff>
                <TD class=ti>
				<%
						SQL_Same = "Select g_code,sphoto,g_name,g_com,or_p,ca1 From Goods Where Ca3 Like '%"&Cate3&"%'  and num <>"&No&" Order By num Asc"

						RS.Open SQL_Same, DB, 1
						E_No = RS.Recordcount
						IF Not RS.EOF Then
						s_code = RS("g_code")
						
						s_image = RS("sphoto")
							count = 1
							While Not RS.EOF And Count <= 3 
				%><A 
                  href="./shop_goodsview.asp?g_code=<%=RS("g_code")%>"><IMG 
                  height=90 src="http://<%=site%>/demoshop/admin/mall_image/<%=RS("ca1")%>/<%=RS("sphoto")%>" width=90 
                  vspace=4 border=0></A><BR><A 
                  href="./shop_goodsview.asp?g_code=<%=RS("g_code")%>"><%=RS("g_com")%></A><BR><B><%=FormatNumber(RS("or_p"),0)%>원</B><% IF count <> E_No Then%><BR><IMG 
                  height=1 src="../shop_image/line_similar.gif" width=121><BR><%End IF%>
				<%
						Rs.MoveNext

						Count = Count + 1

						Wend

					Else 
						Response.Write "이 상품의 관련상품은 없습니다."
					End IF
					RS.Close
				%>
		</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><BR></TD></TR></TBODY></TABLE><!-- 하단 Copyright 시작 -->
<TABLE cellSpacing=0 cellPadding=0 width=747 border=0>
  <TBODY>
  <!--#include file="./down.asp"--></TBODY></TABLE><BR><BR><!-- 하단 Copyright 끝 --></CENTER></BODY></HTML>
<%
	Db.Close
	Set RS = Nothing
	Set Db = Nothing
	
%>
