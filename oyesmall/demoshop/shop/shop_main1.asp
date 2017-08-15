<!--#include file="../admin/dbconn.asp"-->

<% 
		Set RS = Server.CreateObject("ADODB.RecordSet")		
%>



<HTML>
	<HEAD>
		<TITLE>OyesMall 에 오신것을 환영합니다</TITLE>
		<META http-equiv="Content-Type" content="text/html; charset=ks_c_5601-1987">
		<LINK href="../shop_file/sample.css" type="text/css" rel="stylesheet">
			<LINK href="../shop_file/cat_layer.css" type="text/css" rel="stylesheet">
				<LINK href="../shop_file/style.css" type="text/css" rel="stylesheet">
					<SCRIPT language="javascript" src="../shop_file/roll_over.js"></SCRIPT>

					<!-- 상단 메뉴 시작 -->
					<META content="MSHTML 6.00.2600.0" name="GENERATOR">
	</HEAD>
	<BODY bgColor="#ffffff" leftMargin="0" topMargin="0" border="0" marginheight="0" marginwidth="0">
		<!--#include file="./shop_maintop.asp"-->
		<!-- 상단 메뉴 끝 --> <!-- 메인 페이지 시작 -->
<script language="JavaScript1.2">
<!--

var x =0
var y=0
drag = 0
move = 0
window.document.onmousemove = mouseMove
window.document.onmousedown = mouseDown
window.document.onmouseup = mouseUp
window.document.ondragstart = mouseStop
function mouseUp() {
move = 0
}
function mouseDown() {
if (drag) {
clickleft = window.event.x - parseInt(dragObj.style.left)
clicktop = window.event.y - parseInt(dragObj.style.top)
dragObj.style.zIndex += 1
move = 1
}
}
function mouseMove() {
if (move) {
dragObj.style.left = window.event.x - clickleft
dragObj.style.top = window.event.y - clicktop
}
}
function mouseStop() {
window.event.returnValue = false
}
function Show(divid) {
di

vid.filters.blendTrans.apply(); 
divid.style.visibility = "visible"; 
divid.filters.blendTrans.play(); 
}
function Hide(divid) {
divid.filters.blendTrans.apply();
divid.style.visibility = "hidden";
divid.filters.blendTrans.play(); 
} 
//-->
		</script>

<!--
		<div id="Notice" style="position:absolute; left:5; top:5; width:200; z-index:5; filter:revealTrans(transition=23,duration=0.5) blendTrans(duration=0.5); border-width:1px; border-style:none;" onmouseover="dragObj=Notice; drag=1;move=0" onmouseout="drag=0">
			<table border="0" cellpadding="2" cellspacing="0" width="400" bgcolor="#94AAD6" style="font-family:굴림; font-size:9pt">
				<tr>
					<td>
						<img src="../shop_image/dhtml23.gif">
					</td>
				</tr>
				<tr>
					<td style="padding:7" height="200">
						<Font color="#000000"><img src="../shop_image/popicon.gif" border="0"> Oyesmall.Net 도메인 사실분 연락바랍니다.
							<BR>
							<BR>
							<img src="../shop_image/popicon.gif" border="0"> 이 쇼핑몰은 실제로 운영되는 사이트가 아닌 제 개인적인 
							필요에
							<BR>
							&nbsp;&nbsp;&nbsp;&nbsp;의해서 만든 DEMO 사이트 입니다. 그래서 상품을 주문하셔도
							<BR>
							&nbsp;&nbsp;&nbsp;&nbsp;물품이 배송되지 않습니다. ^^
							<BR>
							
							<BR>
							<img src="../shop_image/popicon.gif" border="0"> 관리자모드를 보시려면 본 사이트의 우측 상단에 위치한
							<BR>
							&nbsp;&nbsp;&nbsp;&nbsp;<B><font color="red" size="3">RedZone</font></B> 을 
							클릭하시면 관리자모드 페이지로 이동합니다.^^
							<BR>
							<BR>
							<img src="../shop_image/popicon.gif" border="0"> 이 쇼핑몰은 실제로 운영되고 있는 사이트의 디자인을 
							참조하였습
							<BR>
							&nbsp;&nbsp;&nbsp;&nbsp;니다. ^^</Font>
					</td>
					</td>
				</tr>
				<tr>
					<td align="right" style="padding:7">
						<a href="javascript:void(Hide(Notice))"><font color="white">close</font></a>
					</td>
				</tr>
			</table>
		</div>
//-->
		<CENTER>
			<LINK href="style.css" type="text/css" rel="stylesheet">
				<TABLE cellSpacing="0" cellPadding="0" width="747" border="0">
					<TBODY>
						<TR>
							<TD vAlign="top" align="middle" width="135" bgColor="#dbdbdb"> <!-- 검색 부분 시작-->
								<TABLE cellSpacing="0" cellPadding="1" width="135" bgColor="#07276f" border="0">
									<SCRIPT language="javascript">
        <!--
            function frmSearchSubmit() {
                if (document.frmSearch.frmSearchWord.value.length == 0) {
                    alert('검색어를 입력해 주세요');
                    document.frmSearch.frmSearchWord.focus();
					return false;
                } else {
                    document.frmSearch.submit();
                }
            }
        //-->
        </SCRIPT>
									<SCRIPT language="javascript">
			function event_best()
					{
					alert('Best Top 3 Event Mall 은 Open 준비중 입니다.\n\n곧 Open 하겠습니다.@^.^@');
					}
		</SCRIPT>
									<SCRIPT language="javascript">
			function sale()
					{
					alert('Sale 매장은 Open 준비중입니다.\n\n곧 Open 하겠습니다.@^.^@');
					}
		</SCRIPT>
									<SCRIPT language="javascript">
			function top_event()
					{
					alert('기획상품 Mall은 Open 준비중입니다.\n\n곧 Open 하겠습니다.@^.^@');
					}
		</SCRIPT>
									<SCRIPT language="javaScript">
		<!--
		function visit(){window.open("../admin/visit/list.asp","visit","scrollbars=yes,toolbar=no,location=no,directories=no,status=no,width=590,height=590,resizable=no,menubar=no,top=100,left=204");
		}
		// -->
		</SCRIPT>
									<FORM name="frmSearch" onsubmit="return frmSearchSubmit();" action="../shop/shop_searchresult.asp" method="post">
										<INPUT type="hidden" value="0" name="searchmode">
										<TBODY>
											<TR>
												<TD vAlign="bottom" align="right">
													<IMG height="18" src="../shop_image/main_search1.gif" width="90">
												</TD>
												<TD>
													&nbsp;
												</TD>
											</TR>
											<TR>
												<TD vAlign="top" align="right">
													<INPUT class="textbox" style="WIDTH: 90px" name="frmSearchWord">
												</TD>
												<TD vAlign="bottom">
													<INPUT type="image" height="21" width="24" src="../shop_image/main_search2.gif" border="0">
												</TD>
											</TR>
											<TR>
												<TD class="tws" vAlign="top" align="right">
													<A href="./shop_search.asp"><IMG height="13" alt="Advanced Search" src="../shop_image/advanced_main.gif" width="90" border="0"></A>
												</TD>
												<TD>
													&nbsp;
												</TD>
											</TR>
											<TR align="middle">
												<TD class="tws" vAlign="top" colSpan="2">
													<IMG height="1" src="../shop_image/line_main_blue.gif" width="128">
													<BR>
													<A href="javascript:sale();"><IMG height="42" alt="Now On Sale" src="../shop_image/icon_nowonsale1.gif" width="130" border="0"></A>
													<BR>
													<IMG height="1" src="../shop_image/line_main_blue.gif" width="128">
													<BR>
												</TD>
											</TR>
											<TR align="middle">
												<TD class="tws" vAlign="top" colSpan="2">
													<TABLE cellSpacing="0" cellPadding="1" border="0">
														<TBODY>
															<TR>
																<TD height="9">
																</TD>
															</TR>
															<TR>
																<TD>
																	<IMG height="17" src="../shop_image/btn_main_arrow01.gif" width="26"><A href="../shop_about/shop_guide.asp"><IMG height="17" alt="" src="../shop_image/link_wizshopguide.gif" width="102" border="0"></A>
																</TD>
															</TR>
															<TR>
																<TD>
																	<IMG height="17" src="../shop_image/btn_main_arrow01.gif" width="26"><A href="../shop_about/shop_charge.asp"><IMG height="17" alt="" src="../shop_image/link_feeinfo.gif" width="102" border="0"></A>
																</TD>
															</TR>
															<TR>
																<TD>
																	<IMG height="17" src="../shop_image/btn_main_arrow01.gif" width="26"><A href="../shop_about/shop_delivery.asp"><IMG height="17" alt="" src="../shop_image/link_trackinginfo0.gif" width="102" border="0"></A>
																</TD>
															</TR>
															<TR>
																<TD height="9">
																</TD>
															</TR>
														</TBODY>
													</TABLE>
												</TD>
											</TR>
									</FORM>
					</TBODY>
				</TABLE>
				<TABLE cellSpacing="0" cellPadding="1" width="130" border="0">
					<TBODY>
						<%
				SQL_m = "Select image1,cate From banner Where  top3 = 1 Order By num Asc"
				RS.Open SQL_m, DB, 1
				IF Not RS.EOF Then

				Count = 1
				While Not RS.EOF and Count <= 3
				 
		 %>
						<TR>
							<TD align="middle">
								<A href="javascript:event_best();"><IMG src="http://<%=site%>/demoshop/admin/event_image/<%=RS("cate")%>/<%=RS("image1")%>" border="0"></A>
							</TD>
						</TR>
						<TR>
							<TD align="middle">
								<IMG height="7" src="../shop_image/line_dot_left.gif" width="128">
							</TD>
						</TR>
						<%
				RS.MoveNext
				count = count +1
				Wend
				
				Else
				Response.Write "<TR><TD width=134 height=50>오늘의 Event 상품은 없습니다.</TD></TR>"
				
				End IF
				RS.Close
		%>
					</TBODY>
				</TABLE>
				<BR>
				<IMG height="2" src="../shop_image/line_gray.gif" width="126">
				<TABLE cellSpacing="0" cellPadding="0" width="135" border="1" bordercolor="#DEDBDE">
					<Tbody>
						<Tr height="167">
							<Td>
								<img src="../shop_image/left_menu.gif" border="0" width="131" usemap="#menu">
							</Td>
						</Tr>
					</Tbody>
				</TABLE>
				<IMG height="2" src="../shop_image/line_gray.gif" width="126">
				<BR>
				<BR>
				<map name="menu">
					<area shape="rect" coords="5,3,66,84" href="../shop_music/jukebox_list.asp" target="_self" alt="JukeBox" title="JukeBox">
					<area shape="rect" coords="67,4,127,84" href="../shop_board/shop_board_list.asp" target="_self" alt="게시판" title="게시판">
					<area shape="rect" coords="5,85,67,160" href="javascript:visit();" alt="방명록" title="방명록">
					<area shape="rect" coords="68,85,128,160" href="../shop/shop_notice_list.asp" target="_self" alt="공지사항" title="공지사항">
				</map><IMG height="60" src="../shop_image/verisign.gif" width="97">
				<BR>
				</TD>
				<TD vAlign="top">
					<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
						<TBODY>
							<TR>
								<TD vAlign="top" align="middle" width="476">
									<TABLE height="182" cellSpacing="0" cellPadding="0" width="476" border="0">
										<TBODY>
											<TR>
												<TD vAlign="top" align="middle" width="100%">
													<%
								SQL_T_image = "Select image1,cate From banner Where mainimage = 1 Order By num Asc" 
								RS.Open SQL_T_image, DB, 1
								IF RS.EOF Then
									Response.Write "오늘의 기획상품은 없습니다."
								Else
								T_image = RS("image1")
								
								
						%>
													<A href="javascript:top_event();"><IMG src="http://<%=site%>/demoshop/admin/event_image/<%=RS("cate")%>/<%=T_image%>" width="476" border="0"></A>
													<BR>
													<%
								End IF
								RS.Close
						%>
												</TD>
											</TR>
										</TBODY>
									</TABLE>
									<TABLE cellSpacing="0" cellPadding="2" width="100%" bgColor="#f9bed0" border="0">
										<TBODY>
											<TR>
												<TD class="top" align="right" height="24">
													&nbsp;
												</TD>
											</TR>
										</TBODY>
									</TABLE>
									<TABLE cellSpacing="0" cellPadding="1" width="95%" border="0">
										<TBODY>
											<TR vAlign="bottom" align="middle">
												<TD height="35">
													<IMG height="19" src="../shop_image/title_m_wizshopnews.gif" width="450">
												</TD>
											</TR>
											<!--#include file="./shop_notice.asp"-->
										</TBODY>
									</TABLE>
									<TABLE cellSpacing="0" cellPadding="1" width="95%" border="0">
										<TBODY>
											<TR vAlign="bottom">
												<TD height="35">
													<IMG height="19" src="../shop_image/title_m_bestchoice.gif" width="450">
												</TD>
											</TR>
										</TBODY>
									</TABLE>
									<TABLE cellSpacing="0" cellPadding="1" border="0">
										<TBODY>
											<TR>
												<%	
		
												SQL_2 = "Select g_code,sphoto,g_name,g_com,or_p,ca1 From Goods Where best_choice = 1 Order By num Asc"
												
												RS.Open SQL_2, DB, 1
															line = 4
															All = 21
												IF Not RS.EOF Then
												
												While Not RS.EOF OR All<1
													
														if line < 1 then
															line = 4
															
															Response.Write "</tr><tr>"
														
														End IF
												 %>
												<TD class="ti" vAlign="top" align="middle" width="105">
													<Table border="0" cellSpacing="0" cellPadding="2" width="100%">
														<Tbody>
															<Tr>
																<Td align="center" valign="top" height="92">
																	<A Href="./shop_goodsview.asp?g_code=<%=RS("g_code")%>"><img src="http://<%=site%>/demoshop/admin/mall_image/<%=RS("ca1")%>/<%=RS("sphoto")%>" border="0" vspave="4" width="90" height="90"></A>
																</Td>
															</Tr>
															<Tr>
																<Td align="center" valign="top" height="42">
																	<A href="./shop_goodsview.asp?g_code=<%=RS("g_code")%>">
																		<%=RS("g_com")%>
																		<br>
																		<%=RS("g_name")%>
																	</A>
																</Td>
															</Tr>
															<Tr>
																<TD class="ti" align="middle">
																	<B>
																		<%=FormatNumber(RS("or_p"),0)%>
																		원</B>
																</TD>
															</Tr>
														</Tbody>
													</Table>
												</TD>
												<%IF line <> 1 Then%>
												<TD>
													<IMG height="120" src="../shop_image/line_item.gif" width="5">
												</TD>
												<%
												End IF
								Rs.MoveNext
								line = line - 1
								All = All - 1

								Wend
						
								Else 
									response.write "<td align=center >Weekly Best 상품이 없습니다.</td>"
								End IF
								RS.Close
							%>
											</TR>
										</TBODY>
									</TABLE>
									<BR>
								</TD>
								<TD vAlign="top" align="middle"> <!-- 기획전 관리 시작 -->
									<!--#include file="./main_shop_banner.asp"-->
									<TABLE cellSpacing="1" cellPadding="3" width="100%" bgColor="#cccccc" border="0"> <!-- Best Seller 시작 -->
										<TBODY>
											<!--#include file="./shop_bestseller.asp"--></TBODY>
									</TABLE>
									<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
										<TBODY>
											<TR>
												<TD height="4">
												</TD>
											</TR>
										</TBODY>
									</TABLE>
									<TABLE cellSpacing="1" cellPadding="3" width="100%" bgColor="#cccccc" border="0">
										<TBODY>
											<TR align="middle" bgColor="#eeeeee">
												<TD class="tk">
													Today Choice
												</TD>
											</TR>
											<TR align="middle" bgColor="#ffffff">
												<TD class="ti">
													<%
					
						SQL_3 = "Select sphoto,g_name,g_com,or_p,ca1,g_code From Goods Where Ca1='"& Cate &"' and m_choice = 1 Order By num Asc"
						
						RS.Open SQL_3, DB, 1
						IF RS.EOF Then
							Response.Write "오늘의 추천상품은 없습니다."
						Else
							sphoto = RS("sphoto")
						
							com = RS("g_com")
							name = RS("g_name")
							price = RS("or_p")
				
							
					%>
													<A href="./shop_goodsview.asp?g_code=<%=RS("g_code")%>"><IMG height="90" src="http://<%=site%>/demoshop/admin/mall_image/<%=RS("ca1")%>/<%=sphoto%>" width="90" vspace="4" border="0"></A>
													<BR>
													<A href="./shop_goodsview.asp?g_code=<%=RS("g_code")%>">
														<%=com%>
														<BR>
														<%=name%>
													</A>
													<BR>
													<B>
														<%=FormatNumber(price,0)%>
														원</B>
												</TD>
												<%
													RS.Close
													End IF
												%>
											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR></TBODY></TABLE> 
			<!--#include file="./main_shopbottom.asp"-->
		</CENTER>
	</BODY>

</HTML>
<%
	Db.Close
	Set RS = Nothing
	Set Db = Nothing
	
%>
1234