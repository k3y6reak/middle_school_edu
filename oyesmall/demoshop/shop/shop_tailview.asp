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
							  
									Response.Write subcate
								%></FONT></B></FONT></TD></TR></TBODY></TABLE></TD>
         </TR></TBODY></TABLE><!-- 편집할 부분 --><!-- 세부 카테고리 -->
		 <%
				tail = Request("tail")
				SQL_T = "Select c_title From Category Where ref="&Top&" And lev=2 And Step="&tail&" "
				RS.Open SQL_T, DB, 1
				tailcate = RS("c_title")
				RS.Close
		 %>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=middle>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR bgColor=<% IF Top = 1 Then%>#d3c8ba<% ElseIF Top=2 Then%>#DECFD6<%ElseIF Top=3 Then%>#D6E7F7<%ElseIF Top=4 Then%>#DEDFC6<%ElseIF Top=5 Then%>#D6EBEF<%ElseIF Top=6 Then%>#CED7E7<%ElseIF Top=7 Then%>#D6EBCE<%ElseIF Top=8 Then%>#E7DBF7<%Else%>#D6CBBD<%End IF%>>
                <TD class=lm style="PADDING-LEFT: 20px" height=22><A 
                  href="./shop_main.asp">home</A> &gt; <A 
                  href="./shop_topview.asp?top=<%=top%>"><%=cate%> 
                  </A>&gt; <A 
                  href="./shop_subview.asp?top=<%=Top%>&step=<%=c_step%>"><%=subcate%>
                  </A>&gt; <B><%=tailcate%></B></TD><!-- 소분류 출력 추가 -->
              <TR bgColor=<% IF Top = 1 Then%>#f0ece8<% ElseIF Top=2 Then%>#F7EBEF<%ElseIF Top=3 Then%>#F7F7FF<%ElseIF Top=4 Then%>#F7F3E7<%ElseIF Top=5 Then%>#EFFBFF<%ElseIF Top=6 Then%>#E7EFF7<%ElseIF Top=7 Then%>#EFFBEF<%ElseIF Top=8 Then%>#F7EFFF<%Else%>#F7EFEF<%End IF%>>
                <TD style="PADDING-LEFT: 15px">
                  <TABLE class=to cellSpacing=0 cellPadding=4 border=0>
                    <TBODY>
                    <TR>
					    <TD class=overbg>
						<%
							SQL_C = "Select c_title,step From Category Where ref="&Top&" And lev=2 And Step Like'"&c_step&"%' order by ref asc, step asc"
							RS.Open SQL_C, DB, 1

							T_num=RS.recordcount

							tailcount = 1
							While Not RS.EOF
						%><A 
                        href="./shop_tailview.asp?top=<%=top%>&step=<%=c_step%>&tail=<%=RS("step")%>"><%=RS("c_title")%></A><% IF T_num <> tailcount Then%>&nbsp;|&nbsp;<%End IF%>
						 <%
							RS.MoveNext
							tailcount = tailcount + 1
							Wend
							RS.Close

							Set RS = Nothing
						%>
                      </TD></TR></TBODY></TABLE></TD></TR><!-- 소분류 출력 추가 --></TBODY></TABLE><BR>

					  <%
								SQL_Good = "select count(num) from goods where Ca1 Like '"&Cate&"%' and Ca2 Like '"&subcate&"%' And Ca3 Like '"&tailcate&"%'"
								Set RS_Tail = Db.Execute(SQL_Good)

								recordCount = RS_Tail(0)
								
								pagesize = 25

								
								pagecount = int((recordCount-1)/pagesize) +1

								
								SQL_Good = "Select Top " & pagesize & " * From goods "
								SQL_Good = SQL_Good & " where Ca1 Like '"&Cate&"%' and Ca2 Like '"&subcate&"%' And Ca3 Like '"&tailcate&"%' and num not in "
								SQL_Good = SQL_Good & "(Select Top " & (int(Page - 1) * pagesize) & " num From goods"
								SQL_Good = SQL_Good & " where Ca1 Like '"&Cate&"%' and Ca2 Like '"&subcate&"%' And Ca3 Like '"&tailcate&"%' "
								SQL_Good = SQL_Good & " Order By num Asc) order by num Asc" 


								Set RS_Tail = Db.Execute(SQL_Good)
								

								T_page = Pagecount
	
						%>


            <TABLE style="PADDING-LEFT: 20px" cellSpacing=0 cellPadding=0  width="100%" border=0>
              <TBODY>
              <TR>
                <TD width=130>&nbsp;</TD>
                <TD class=tgn align=middle><%
						intStart = int((page-1)/10)*10 + 1					
						intEnd = intStart + 9
					%>
					<% If intstart = 1 Then %>
					<IMG height=14 alt=이전페이지로 hspace=4 src="../shop_image/btn_prev1.gif" width=35 border=0>
						
					<% Else %>
						<A Href="./shop_tailview.asp?top=<%=top%>&step=<%=c_step%>&tail=<%=tail%>&page=<%=intstart-1%>"><IMG height=14 alt=이전페이지로 
            hspace=4 src="../shop_image/btn_prev1.gif" width=35 border=0></A>
					<% End IF %>

					<% For i=intstart to intend 
						
						IF i = int(page) Then 

							Response.Write "<Font Color=Red Size=3>"&i&"</Font>"
						Else
						%> <A Href="./shop_tailview.asp?top=<%=top%>&step=<%=c_step%>&tail=<%=tail%>&page=<%=i%>"> [<%=i%>]</a> 
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
						<A Href="./shop_tailview.asp?top=<%=top%>&step=<%=c_step%>&tail=<%=tail%>&page=<%=intend+1%>"><IMG 
            height=14 alt=다음페이지로 hspace=4 src="../shop_image/btn_next1.gif" width=35 
            border=0></A>
					<% End If%> </TD><!-- 이전/다음 보기 끝 -->
                <TD align=right width=150>
                </TD>
			</TR>
			</TBODY>
		</TABLE>

            <TABLE cellSpacing=0 cellPadding=1 border=0>
              <TBODY>
              <TR><!-- 상품화면 시작 -->
                <TD>
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>

                    <TR>
						<%
								IF Not RS_Tail.EOF Then

									col = 5
									All = 25

									While Not RS_Tail.EOF OR All<1

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
										  href="./shop_goodsview.asp?g_code=<%=RS_Tail("g_code")%>&Top=<%=Top%>"><IMG 
										  height=90 
										  src="http://<%=site%>/demoshop/admin/mall_image/<%=RS_Tail("ca1")%>/<%=RS_Tail("sphoto")%>" width=90 border=0>
										  </A></TD>
									</TR>
								    <TR>
										<TD vAlign=top align=middle height=42><A 
										   href="./shop_goodsview.asp?g_code=<%=RS_Tail("g_code")%>&Top=<%=Top%>"><%=RS_Tail("g_com")%><BR><%
											If Len(RS_Tail("g_name")) > 20 then
													Response.write Left(RS_Tail("g_name"), 20) & ".."
											Else
													Response.write RS_Tail("g_name")
											End if
											%></A></TD>
									  </TR>
									  <TR>
										<TD class=ti 
									  align=middle><B><%=FormatNumber(RS_Tail("or_p"),0)%>원</B></TD>
									  </TR>
									  </TBODY>
								  </TABLE>
							 </TD>

							 <%IF col <> 1 Then%>
									 <TD><IMG height=120 src="../shop_image/line_item.gif"  width=5></TD>
							<%
									End IF
									
									RS_Tail.MoveNext
									col = col - 1
									All = All - 1
									Wend
							
								Else 
									response.write "<td align=center height=150>등록된 상품이 없습니다.</td>"
								End IF
								RS_Tail.Close

								Set RS_tail = Nothing
							%>
						</TR>

				</TBODY>
			</TABLE>
		</TD>
		</TR><!-- 상품화면 끝 -->
		</TBODY>
		</TABLE>

				<BR><!-- 이전/다음 보기 -->
            <TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
              <TBODY>
              <TR align=middle>
                <TD class=tgn align=middle><%
						intStart = int((page-1)/10)*10 + 1					
						intEnd = intStart + 9
					%>
					<% If intstart = 1 Then %>
					<IMG height=14 alt=이전페이지로 hspace=4 src="../shop_image/btn_prev1.gif" width=35 border=0>
						
					<% Else %>
						<A Href="./shop_tailview.asp?top=<%=top%>&step=<%=c_step%>&tail=<%=tail%>&page=<%=intstart-1%>"><IMG height=14 alt=이전페이지로 
            hspace=4 src="../shop_image/btn_prev1.gif" width=35 border=0></A>
					<% End IF %>

					<% For i=intstart to intend 
						
						IF i = int(page) Then 

							Response.Write "<Font Color=Red Size=3>"&i&"</Font>"
						Else
						%> <A Href="./shop_tailview.asp?top=<%=top%>&step=<%=c_step%>&tail=<%=tail%>&page=<%=i%>"> [<%=i%>]</a> 
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
						<A Href="./shop_tailview.asp?top=<%=top%>&step=<%=c_step%>&tail=<%=tail%>&page=<%=intend+1%>"><IMG 
            height=14 alt=다음페이지로 hspace=4 src="../shop_image/btn_next1.gif" width=35 
            border=0></A>
					<% End If%></TD><!-- 이전/다음 보기 끝 --></TR></TBODY></TABLE><BR></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!-- 하단 Copyright 시작 -->
<TABLE cellSpacing=0 cellPadding=0 width=747 border=0>
  <TBODY>
  <!--#include file="./down.asp"--></TBODY></TABLE><BR><BR><!-- 하단 Copyright 끝 --></CENTER></BODY></HTML>
<%
	Db.Close

	Set Db = Nothing
	
%>