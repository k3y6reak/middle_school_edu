<!---#include file="../admin/dbconn.asp"--->

<% 
		Top = Request("top")


		Set RS = Server.CreateObject("ADODB.RecordSet")		
%>

<!--#include file="./shop_top.asp"--><!-- 상단 메뉴 끝 --><!-- 메인 페이지 시작 -->
<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=747 border=0>
  <TBODY>
  <TR><!-- 왼쪽 메뉴 시작 -->
	<!--#include file="./shop_categoryleft.asp"-->
    <!-- 왼쪽 메뉴 끝 -->
    <TD vAlign=top><!-- 중앙 메뉴 시작 -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
       
        <TBODY>
        <TR>
          <TD><IMG height=26 src="../shop_image/<%=image%>_title1.gif"></TD>
          </TR></TBODY></TABLE><!-- Luxury 기획전 밑 Best seller, Today's Chioce 시작 -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=middle width=478>
		  <%
					SQL_T_image = "Select image1,cate From banner Where cate like '%"&image&"%' and nomi=2 Order By num Asc" 
					RS.Open SQL_T_image, DB, 1
					IF RS.EOF Then
						Response.Write "오늘의 기획상품은 없습니다."
					Else
					T_image = RS("image1")
					T_cate = RS("cate")
					
			%><A href="javascript:top_event();">
		<IMG height=136 alt="" src="http://<%=site%>/demoshop/admin/event_image/<%=T_cate%>/<%=T_image%>" width=476 
            border=0></A> <BR>
			<%
					End IF
					RS.Close
			%>
            <TABLE cellSpacing=0 cellPadding=1 width="95%" border=0>
              <TBODY>
              <TR vAlign=bottom align=middle>
                <TD height=25><IMG height=18 
                  src="../shop_image/title_shoppingguide.gif" width=450></TD></TR>
               <!--#include file="./shop_notice.asp"-->
				</TBODY>
			</TABLE><!-- 쇼핑가이드 끝 --><BR>
				<!--  Weekly Best -->
				<%
					
					SQL_2 = "Select g_code,sphoto,g_name,g_com,or_p,ca1 From Goods Where Ca1= '"& Cate &"' and choice <>1 and event_2 = 0 Order By num Asc"
					
					RS.Open SQL_2, DB, 1
					
				%>
            <TABLE cellSpacing=0 cellPadding=1 width="95%" border=0>
              <TBODY>
              <TR>
                <TD><IMG src="../shop_image/title_weeklybest.gif"></TD></TR></TBODY></TABLE>

		<TABLE cellSpacing=0 cellPadding=2 border=0 width="100%">
				<Tbody>
				<Tr>
					
						<%	line = 4
								All = 21
								IF Not RS.EOF Then
									While Not RS.EOF OR All<1
							
							if line < 1 then
								line = 4
							%>
				
				</TR>
				<TR >
					<% end if %>
						<TD class=ti vAlign=top align=middle width=105>
								
								<Table border=0 cellSpacing=0 cellPadding=2 width="100%">
										<Tbody>
										<Tr>
											<Td align=center valign=top height=92><A Href="./shop_goodsview.asp?g_code=<%=RS("g_code")%>&Top=<%=Top%>"><img src="http://<%=site%>/demoshop/admin/mall_image/<%=RS("ca1")%>/<%=RS("sphoto")%>" border=0  width=90 height=90 ></A></TD>
										</Tr>
										<Tr>
										<Td align=center valign=top height=42><A href="./shop_goodsview.asp?g_code=<%=RS("g_code")%>&Top=<%=Top%>"><%=RS("g_com")%><br><%=RS("g_name")%></A></TD>
										</Tr>
										<Tr>
											<TD class=ti align=middle><B><%=FormatNumber(RS("or_p"),0)%>원</B></TD>
										</Tr>
										</Tbody>
								</Table>
							
						</Td>
						<%IF line <> 1 Then%>
						 <TD><IMG height=120 src="../shop_image/line_item.gif"  width=5></TD>
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
					
				</Tr>
				</Tbody>
		</Table><!--  Weekly Best  End-->
		<!-- MD's Pick 끝 --><BR></TD>
          <TD vAlign=top>
			<!-- 기획전 관리 시작 -->
				<!--#include file="./shop_banner.asp"-->
			<!-- 기획전 관리 끝 -->
            <TABLE cellSpacing=1 cellPadding=3 width="100%" bgColor=#cccccc 
            border=0>
			<!-- Best Seller 시작 -->
              <TBODY>
					<!--#include file="./shop_bestseller.asp"-->
			  <!-- Best Seller 끝 -->
			 
			<!-- Today Choice 시작 -->
              <TR align=middle bgColor=#eeeeee>
                <TD class=tk>Today Choice</TD></TR>
              <TR align=middle bgColor=#ffffff>
                <TD class=ti>
				<%
					
					SQL_3 = "Select sphoto,g_name,g_com,or_p,ca1,g_code From Goods Where Ca1='"& Cate &"' and choice = 1 Order By num Asc"
					
					RS.Open SQL_3, DB, 1
					IF RS.EOF Then
						Response.Write "오늘의 추천상품은 없습니다."
					Else
					sphoto = RS("sphoto")
				
					com = RS("g_com")
					name = RS("g_name")
					price = RS("or_p")
					g_code2 = RS("g_code")
					
				%><A href="./shop_goodsview.asp?g_code=<%=g_code2%>&Top=<%=Top%>"><IMG 
                  height=90 src="http://<%=site%>/demoshop/admin/mall_image/<%=RS("ca1")%>/<%=sphoto%>" width=90 
                  vspace=4 border=0></A><BR><A href="./shop_goodsview.asp?g_code=<%=g_code2%>&Top=<%=Top%>"><%=com%><BR><%=name%></A><BR><B><%=FormatNumber(price,0)%>원</B></TD><% RS.Close 
				  End IF%></TR><!-- Today Choice 끝 --></TBODY></TABLE><!-- Luxury 기획전 밑 Best seller, Today's Chioce 끝 --></TD></TR></TBODY></TABLE><!-- 중앙 메뉴 끝 --></TD></TR></TBODY></TABLE><!-- 하단 Copyright 시작 -->
<TABLE cellSpacing=0 cellPadding=0 width=747 border=0>
  <TBODY>
  <!--#include file="./down.asp"--></TBODY></TABLE><BR><BR><!-- 하단 Copyright 끝 --></CENTER></BODY></HTML>
<%
	Db.Close
	Set RS = Nothing
	Set Db = Nothing
	
%>