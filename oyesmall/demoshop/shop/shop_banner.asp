
<!---#include file="../admin/dbconn.asp"--->
<% 
		Top = Request("top")


		Set RS = Server.CreateObject("ADODB.RecordSet")	
		
		
%>
<SCRIPT language=javascript>
			function event_mall()
					{
					alert('Event Mall 은 Open 준비중 입니다.\n\n곧 Open 하겠습니다.@^.^@');
					}
		</SCRIPT>
<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=0 
            width="100%" borderColorLight=#cccccc border=1>
              <TBODY>
              <TR align=middle bgColor=#dbdbdb>
                <TD><IMG height=12 src="../shop_image/title_m_eventmall.gif" 
                  width=62 vspace=4></TD></TR>
			  <%
				SQL_m = "Select image1,image2,cate From banner Where cate='"& image &"' and nomi=0 and top3 <>1 Order By num Asc"
				RS.Open SQL_m, DB, 1
				IF Not RS.EOF Then

				Count = 1
				While Not RS.EOF and Count <= 10
				 
			 %>
              <TR>
                <TD width=134 height=50><A 
                  href="javascript:event_mall();"><IMG 
                  alt=기획전배너 src="http://<%=site%>/demoshop/admin/event_image/<%=RS("cate")%>/<%=RS("image1")%>" width=134 
                  border=0 hright="50"></A></TD></TR>
				<%
					RS.MoveNext
					count = count +1
					Wend
					
					Else
					Response.Write "<TR><TD width=134 height=50>오늘의 Event 상품은 없습니다.</TD></TR>"
					
					End IF
					RS.Close
				%>
              </TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD height=4></TD></TR></TBODY></TABLE>
