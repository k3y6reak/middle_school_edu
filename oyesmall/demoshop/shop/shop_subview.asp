<!---#include file="../admin/dbconn.asp"--->

<% 
		Top = Request("top")
		
		page = request("page")

		If page = "" Then
			page = 1
		End If

		Set RS = Server.CreateObject("ADODB.RecordSet")		
%>

<!--#include file="./shop_top.asp"--><!-- 상단 메뉴 끝 --><!-- 메인 페이지 시작 -->
<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=747 border=0>
  <TBODY>
  <TR><!-- 왼쪽 메뉴 시작 -->
   <!--#include file="./shop_categoryleft.asp"-->
   <!-- 왼쪽 메뉴 끝 -->
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <FORM name=frmBrandSite>
        <TBODY>
        <TR>
          <TD>
            <TABLE cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR>
                <TD><IMG alt="" src="../shop_image/<%=image%>_title1.gif" border=0></TD>
                <TD><IMG height=26 src="../shop_image/<%=image%>_title_dot.gif" 
                width=14></TD>
                <TD style="PADDING-BOTTOM: 3px" vAlign=bottom><FONT 
                  face="Arial, 굴림" size=2><B><FONT 
                  color=<% IF Top = 1 Then%>#7d664e<% ElseIF Top=2 Then%>#896273<%ElseIF Top=3 Then%>#40659b<%ElseIF Top=4 Then%>#70774d<%ElseIF Top=5 Then%>#367175<%ElseIF Top=6 Then%>#526e92<%ElseIF Top=7 Then%>#4b7430<%ElseIF Top=8 Then%>#856ea0<%Else%>#838271<%End IF%>><%
									c_step = Request("step")
									SQL_c = "Select c_title From Category Where ref="&Top&" and step="&c_step&" AND lev=1 order by ref asc, step asc"
									RS.Open SQL_c, DB, 1
									subcate = RS("c_title")
									RS.Close
							  %><%=subcate%></FONT></B></FONT></TD></TR></TBODY></TABLE></TD>
         </TR></FORM></TBODY></TABLE><!-- 편집할 부분 --><!-- 세부 카테고리 -->
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR bgColor=<% IF Top = 1 Then%>#d3c8ba<% ElseIF Top=2 Then%>#DECFD6<%ElseIF Top=3 Then%>#D6E7F7<%ElseIF Top=4 Then%>#DEDFC6<%ElseIF Top=5 Then%>#D6EBEF<%ElseIF Top=6 Then%>#CED7E7<%ElseIF Top=7 Then%>#D6EBCE<%ElseIF Top=8 Then%>#E7DBF7<%Else%>#D6CBBD<%End IF%>>
          <TD class=lm height=3></TD></TR>
        <TR bgColor=<% IF Top = 1 Then%>#f0ece8<% ElseIF Top=2 Then%>#F7EBEF<%ElseIF Top=3 Then%>#F7F7FF<%ElseIF Top=4 Then%>#F7F3E7<%ElseIF Top=5 Then%>#EFFBFF<%ElseIF Top=6 Then%>#E7EFF7<%ElseIF Top=7 Then%>#EFFBEF<%ElseIF Top=8 Then%>#F7EFFF<%Else%>#F7EFEF<%End IF%>>
          <TD style="PADDING-LEFT: 15px">
            <TABLE class=to cellSpacing=0 cellPadding=4 border=0>
              <TBODY>
              <TR>
                <TD class=overbg>
				<% 
						SQL_tail = "Select c_title,step From Category Where ref="&Top&" AND lev=2 and step Like'"&c_step&"%' order by ref asc, step asc"
					'	response.Write SQL_tail
						'response.End
						RS.Open SQL_tail, DB, 1
					
						Tnum=RS.recordcount
						
						IF Not RS.EOF Then
							tailcount = 1
							While Not RS.EOF 
					%>
						<A 
					  href="./shop_tailview.asp?top=<%=Top%>&step=<%=c_step%>&tail=<%=RS("step")%>"><%=RS("c_title")%></A><% IF Tnum <> tailcount Then%>&nbsp;|&nbsp;
					  <%
							End IF
							RS.MoveNext
							tailcount = tailcount + 1
							Wend
							
							Else
						%>
							<font color=#CC3333><%=subcate%></Font> 에 대한 세부 카테고리가 없습니다.^^
						<%
							End IF 
							RS.Close
						%>
				
                </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!-- 세부 카테고리 끝 --><BR><IMG 
      src="../shop_image/title_bestchoice_long.gif"><BR>
      <TABLE cellSpacing=0 cellPadding=2 width=550 border=0>
        <TBODY>
        <TR><!-- Best Choice -->
			<%
					SQL_Best = "Select sphoto,g_com,or_p,ca1,g_code From Goods Where Ca1='"& Cate &"' and Ca2 Like '"&subcate&"%' And best_choice=1 Order By num Asc" 
				'	response.write SQL_Best&"<br>"
					
					RS.Open SQL_Best, DB, 1
				'	response.write RS("g_com")
				'	response.End
					IF Not RS.EOF Then
						count3 = 1
						While Not RS.EOF and count3 <=4
			%>
			<TD class=ti vAlign=top align=middle>
            <TABLE cellSpacing=4 cellPadding=0 border=0>
              <TBODY>
              <TR bgColor=#cccccc>
                <TD><A 
                  href="./shop_goodsview.asp?g_code=<%=RS("g_code")%>&Top=<%=Top%>"><IMG 
                  height=130 src="http://<%=site%>/demoshop/admin/mall_image/<%=RS("ca1")%>/<%=RS("sphoto")%>"
                  width=130 border=0></A></TD></TR></TBODY></TABLE><A 
             href="./shop_goodsview.asp?g_code=<%=RS("g_code")%>&Top=<%=Top%>"><%=RS("g_com")%></A><BR><B><%=FormatNumber(RS("or_p"),0)%>원</B> 
          </TD>
          <%
				RS.MoveNext
				count3 = count3 + 1
				Wend
				
				Else
			%>
				<TD class=ti vAlign=top align=middle>
					<TABLE cellSpacing=4 cellPadding=0 border=0>
					  <TBODY>
					  <TR >
						<TD align=center height=50> <font color=#CC3333><%=subcate%></Font>의 Best Choice 상품이 없습니다.</TD>
					  </TR>
					  </Tbody>
					  </Table>
				</TD>
			<%
				End IF
				RS.Close
			%>
		  </TR></TBODY></TABLE><!-- Best Choice end --><BR>
		  <%
			SQL_Good = "select count(num) as recCount from goods"
			Set g_ca = Db.Execute(SQL_Good)

			recordCount = g_ca(0)
			
			pagesize = 20

			
			pagecount = int((recordCount-1)/pagesize) +1

			
			SQL_Good = "Select Top " & pagesize & " * From goods "
			SQL_Good = SQL_Good & " where Ca1 Like '"&Cate&"%' and Ca2 Like '"&subcate&"%' and num not in "
			SQL_Good = SQL_Good & "(Select Top " & (int(Page - 1) * pagesize) & " num From goods"
			SQL_Good = SQL_Good & " where Ca1 Like '"&Cate&"%' and Ca2 Like '"&subcate&"%' "
			SQL_Good = SQL_Good & " Order By num Asc) order by num Asc" 


			Set g_ca = Db.Execute(SQL_Good)
			

			T_page = Pagecount
	
			%>
      <TABLE cellSpacing=0 cellPadding=0 width=90 border=0>
        <TBODY>
        <TR>
          <TD class=tgn width="70%"><%=cate%> &gt;<B> <%=subcate%> 
          </B></TD>
          <TD class=tgn align=right width="30%">&nbsp;</TD></TR>
        <TR>
          <TD class=tgn colSpan=2><IMG height=4 
            src="../shop_image/line_long_dot.gif" width=566></TD></TR><!-- 이전/다음 보기 -->
        <TR align=middle>
          <TD class=tgn colSpan=2 height=22><%
						intStart = int((page-1)/10)*10 + 1					
						intEnd = intStart + 9
					%>
					<% If intstart = 1 Then %>
					<IMG height=14 alt=이전페이지로 hspace=4 src="../shop_image/btn_prev1.gif" width=35 border=0>
						
					<% Else %>
						<A Href="./shop_subview.asp?top=<%=top%>&step=<%=c_step%>&page=<%=intstart-1%>"><IMG height=14 alt=이전페이지로 
            hspace=4 src="../shop_image/btn_prev1.gif" width=35 border=0></A>
					<% End IF %>

					<% For i=intstart to intend 
						
						IF i = int(page) Then 

							Response.Write "<Font Color=Red Size=3>"&i&"</Font>"
						Else
						%> <A Href="./shop_subview.asp?top=<%=top%>&step=<%=c_step%>&page=<%=i%>"> [<%=i%>]</a> 
					<%
						End if

						If int(intstart) =int(t_page) then  
							exit for
						end if
						intstart=intstart+1

					   Next
					 
					%>
					<% If intstart = T_page Then %>
						
					<IMG 
            height=14 alt=다음페이지로 hspace=4 src="../shop_image/btn_next1.gif" width=35 
            border=0>
					<% else %>
						<A Href="./shop_subview.asp?top=<%=top%>&step=<%=c_step%>&page=<%=intend+1%>"><IMG 
            height=14 alt=다음페이지로 hspace=4 src="../shop_image/btn_next1.gif" width=35 
            border=0></A>
					<% End If%> </TD><!-- 이전/다음 보기 끝 --></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=2 border=0><!-- 상품화면 시작 -->
        <TBODY>
        <TR>
          <TD>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
				<%
						IF Not g_ca.EOF Then

							col = 5
							All = 20

							While Not g_ca.EOF OR All<1

							IF col < 1 Then
								col = 5
				%>
				</TR>
				<TR>

			<%End IF%>

                <TD class=ti vAlign=top align=middle width=105>
					  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
							<TBODY>
							<TR>
							  <TD align=middle height=95><A 
								href="./shop_goodsview.asp?g_code=<%=g_ca("g_code")%>&Top=<%=Top%>"><IMG 
								height=90 src="http://<%=site%>/demoshop/admin/mall_image/<%=g_ca("ca1")%>/<%=g_ca("sphoto")%>" width=90 
								border=0 vspave="4"></A></TD>
							</TR>
							<TR>
							  <TD vAlign=top align=middle height=42><A 
						href="./shop_goodsview.asp?g_code=<%=g_ca("g_code")%>&Top=<%=Top%>"><%=g_ca("g_com")%><BR>
						<%
							If Len(g_ca("g_name")) > 20 then
									Response.write Left(g_ca("g_name"), 20) & ".."
							Else
									Response.write g_ca("g_name")
							End if
					%></A></TD>
							</TR>
							<TR>
							  <TD class=ti align=middle><B><%=FormatNumber(g_ca("or_p"),0)%>원</B></TD>
							</TR>
							</TBODY>
					  </TABLE>
				</TD>

                <%IF col <> 1 Then%>
						 <TD><IMG height=120 src="../shop_image/line_item.gif"  width=5></TD>
				<%
						End IF
						g_ca.MoveNext
						col = col - 1
						All = All - 1
						Wend
				
					Else 
						response.write "<td align=center height=50>등록된 상품이 없습니다.</td>"
					End IF
					g_ca.Close
					Set g_ca = nothing
				%>

              </TR></TBODY></TABLE></TD></TR><!-- 상품화면 끝 --></TBODY></TABLE><BR></TD></TR></TBODY></TABLE><!-- 하단 Copyright 시작 -->
<TABLE cellSpacing=0 cellPadding=0 width=747 border=0>
  <TBODY>
  <!--#include file="./down.asp"--></TBODY></TABLE><BR><BR><!-- 하단 Copyright 끝 --></CENTER></BODY></HTML>
<%
	Db.Close

	Set Db = Nothing
	
%>