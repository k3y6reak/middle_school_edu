
<%
		page = request("page")

		If page = "" Then
			page = 1
		End If

		SQL_N = "select count(num) as recCount from notice"
		Set RS_N = Db.Execute(SQL_N)

		recordCount = RS_N(0)
		
		pagesize = 3

		
		pagecount = int((recordCount-1)/pagesize) +1

		
		SQL_N = "Select Top " & pagesize & " * From notice "
		SQL_N = SQL_N & " where num not in "
		SQL_N = SQL_N & "(Select Top " & (int(Page - 1) * pagesize) & " num From notice"
		SQL_N = SQL_N & " Order By num DESC) order by num desc" 


		Set RS_N = Db.Execute(SQL_N)

		
		
%>				

 <% IF image = "" Then %>
		  <TR height=60>
		<%  IF NOT RS_N.EOF Then%>
		<TD class=tgn vAlign=top>
		<%
				
		
					nCount = 1

					While Not RS_N.Eof and nCount <= 3
		
						branch = RS_N("branch")

						Select Case branch
							Case "1"
								kind = "[news]"
							Case "2"
								kind = "[event]"
						End Select
			%>
			<IMG src="../shop_image/btn_nemo_main.gif" > 
		  <A href="../shop/shop_notice_list.asp?n_open=<%=RS_N("num")%>"><%=kind%>&nbsp;<%=RS_N("title")%></A><BR>
		 <%
				RS_N.MoveNext

				nCount = nCount + 1

				Wend
				
				Set RS_N = Nothing
	      %>				
		
		</TD>
		<%Else%>
		<TD class=tgn vAlign=top height=40 align=center>공지사항에 등록된 글이 없습니다.</TD>
		<%End IF%>

		</TR>

<% Else %>
	
		 <TR height=60>
		 <%  IF NOT RS_N.EOF Then%>

		<TD class=tgn vAlign=top>
		<%
				
		
					nCount = 1

					While Not RS_N.Eof and nCount <= 3
		
						branch = RS_N("branch")

						Select Case branch
							Case "1"
								kind = "[news]"
							Case "2"
								kind = "[event]"
						End Select
			%>
			<IMG src="../shop_image/btn_nemo_<%=image%>.gif" > 
		  <A href="../shop/shop_notice_list.asp?n_open=<%=RS_N("num")%>"><%=kind%>&nbsp;<%=RS_N("title")%></A><BR>
		 <%
				RS_N.MoveNext

				nCount = nCount + 1

				Wend

				Set RS_N = Nothing
	      %>				
		
		</TD>
		<%Else%>
		<TD class=tgn vAlign=top height=40 align=center>공지사항에 등록된 글이 없습니다.</TD>
		<%End IF%>

		</TR>
<%End IF%>