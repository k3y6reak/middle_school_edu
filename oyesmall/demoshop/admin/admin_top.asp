
<!---#include file="dbconn.asp"--->
<!---#include file="./session2.asp"--->
<%	

	num = Request("num")

	page = request("page")

	If page = "" Then
		page = 1
	End If


%>		

<html>
<head>
<title>◇ ◆ OyesMall ADMIN_MODE◆ ◇</title>
<LINK href="./image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="./image/style2.css" type="text/css" rel="STYLESHEET">
<script language="JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>

<body bgcolor="#000000" text="FFFFFF" leftMargin=0  topMargin=0 marginwidth="0" marginheight="0">
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 bgcolor=#000000>
  <TBODY>
  <TR >
	<TD width=10></TD>
    <TD vAlign=top align=left height="39"><IMG src="./image/oyesmall_rogo.gif"></TD>
    <TD vAlign=bottom align=right height="39"><A href="./myshop.asp" ><IMG alt=마이샵가기 src="./image/menu_oyesmall.gif" 
      border=0></A><A 
      href="./admin_top.asp"><IMG alt=처음화면 src="./image/menu_main.gif" 
      border=0></A> </TD>
  </TR>
  <TR >
	<TD width=10></TD>
      <TD vAlign=center align=right colspan=2><DIV id=Clock 
      style="FONT-SIZE: 12px; COLOR: ffffff; FONT-FAMILY: 엔터+영원10;"></DIV>
      <SCRIPT language=javascript src="./note/time.js"></SCRIPT>
    </TR></TBODY>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
	<TBODY>
  <tr>
    <td >&nbsp;</td>
  </tr></TBODY>
</table>
<table width="100%" border="0" height="90%" bgcolor=#000000>
  <tr>
    <td height="100%" width="17%" valign=top>
      <!--#include file="admin_left.asp" -->
    </td>
    <td height="100%" width="83%" valign=top>


	<!----list start---->
	<BODY bgColor=#d8d4b6 topMargin=0 marginheight="0" marginwidth="0">
<TABLE  cellSpacing="1" cellPadding=0 width="100%" border=0 bgcolor="#4A494A">
  <TBODY>
  <TR>
    <TD>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" bgcolor=#000000   border=0><TBODY>
        <TR>
          <TD align=center width=100>
			<Table border="0" cellSpacing="3" cellPadding="3" bgcolor="#000000">
												<TR>
													<TD align="center">
			<img src="./image/reddevil.jpg" border=0 width=100 onClick="MM_openBrWindow('./image/reddevil.jpg','','width=360,height=600')"></TD></TR>
			</Table></TD>
          <Td align=center><BR>
            <TABLE cellSpacing=0 cellPadding=0 width="98%" border=1 bordercolor="#222222">
              <TBODY>
             <TR>
				<Td align=center>
					<Table width="100%" cellSpacing="0" cellPadding="3" border="0">
						<TR height=30>
							
				<TD bgcolor=#222222 >&nbsp;<img src="./image/icon_ani2.gif" border=0 ALIGN="absmiddle">&nbsp;<B><font size=3>Notice</font></B></TD>
			</TR>
              <TR>
                
                <TD vAlign=top align=left>
				<%
					SQL2 = "select count(num) as recCount from notice"
					Set Rs_n = Db.Execute(SQL2)

					recordCount = Rs_n(0)
					
					pagesize = 10

					
					pagecount = int((recordCount-1)/pagesize) +1

					
					SQL2 = "Select Top " & pagesize & " * From notice "
					SQL2 = SQL2 & " where num not in "
					SQL2 = SQL2 & "(Select Top " & (int(Page - 1) * pagesize) & " num From notice"
					SQL2 = SQL2 & " Order By num DESC) order by num desc" 


					Set Rs_n = Db.Execute(SQL2)
				 %>    
			
					

                  <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0 bgcolor=#000000>
                    <TBODY>
					<%
						IF NOT RS_n.EOF Then
						
						Count = 5

						While Not Rs_n.Eof and Count >0

						branch = RS_n("branch")

						Select Case branch
							Case "1"
								cate = "[news]"
							Case "2"
								cate = "[event]"
						End Select
					%>
                   <Tr onMouseOver="this.style.background='#313031'" onMouseOut="this.style.background='#000000'"  height=20>
                      <TD  align=left ><IMG src="./image/icon01.gif"><A 
                        href="./notice/notice_list.asp?n_open=<%=RS_n("num")%>"><font color=#CC3333><%=cate%></Font>&nbsp;<%=RS_n("title")%></a><% IF DateDiff("h",RS_n("postdate"),Now()) < 24 Then %>&nbsp;<IMG 
                        height=10 alt="오늘 올라 왔네요..." src="./image/new_bbs.gif" width=28 border=0><%End IF%>
                        </TD>
					</TR>
                    
					
                   
					<%
							Rs_n.MoveNext

							Count = Count - 1

							Wend

					
							IF Count >0 Then

								For i=1 to Count
					
								Next
							End IF
					
							Else
					%>
					<TR >
                      <TD vAlign=top align=left ><IMG src="./image/icon01.gif">공지사항에 등록된 글이 없습니다. ^^</TD>
					</TR>
                    
					<TR>
                      <TD vAlign=top align=left  background="./image/dot.gif"><IMG src="./image/blank.gif"></TD>
					</TR>
					<TR >
                      <TD vAlign=top align=left ><IMG src="./image/icon01.gif">&nbsp;</TD>
					</TR>
                    
					<TR>
                      <TD vAlign=top align=left  background="./image/dot.gif"><IMG src="./image/blank.gif"></TD>
					</TR>
					<TR >
                      <TD vAlign=top align=left ><IMG src="./image/icon01.gif">&nbsp;</TD>
					</TR>
                    
					<TR>
                      <TD vAlign=top align=left  background="./image/dot.gif"><IMG src="./image/blank.gif"></TD>
					</TR>
					<TR >
                      <TD vAlign=top align=left ><IMG src="./image/icon01.gif">&nbsp;</TD>
					</TR>
                    
					<TR>
                      <TD vAlign=top align=left  background="./image/dot.gif"><IMG src="./image/blank.gif"></TD>
					</TR>
					<TR >
                      <TD vAlign=top align=left ><IMG src="./image/icon01.gif">&nbsp;</TD>
					</TR>
                    
					<TR>
                      <TD vAlign=top align=left  background="./image/dot.gif"><IMG src="./image/blank.gif"></TD>
					</TR>
					<%
						End IF
						RS_n.Close
						Set RS_n = Nothing
					%>
					</TBODY>
				</TABLE>
				
				</TD>
                
			
		</TR>
            
		
	   </TBODY>
	 </TABLE>
	 </TD>
	 </TR>
	 </Table><!--------공지사항 외곽 둥근라인 끝-------------->
	 <BR>
	 </TD>
	</TR>
	</TBODY>
</TABLE>
</TD>
</TR>
</TBODY>
				  
</TABLE>

<BR>


<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>

  <%
		SQL_O = "select count(num) as recCount from sell_man"
		Set RS_O = Db.Execute(SQL_O)

			recordCount = RS_O(0)
			T_mem = Recordcount
			pagesize = 10

		
			pagecount = int((recordCount-1)/pagesize) +1

		
			SQL_O = "Select Top " & pagesize & " * From sell_man "
			SQL_O = SQL_O & " where num not in "
			SQL_O = SQL_O & "(Select Top " & (int(Page - 1) * pagesize) & " num From sell_man"
			SQL_O = SQL_O & " Order By num DESC) order by num desc" 

			'response.write recordcount
			'response.end
			
			Set RS_O = Db.Execute(SQL_O)
	%>	
    <TD vAlign=top align=left width="50%">

		  <table width="100%" border="0" bgcolor="#000000">
			<TBODY>
			<TR>
			  <TD>
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
				  <TBODY>
				  <TR height=20>
					
					<TD >&nbsp; 
					  최&nbsp;신&nbsp;주&nbsp;문&nbsp;현&nbsp;황 <B>[금일 NEW 
						10]</B></TD>
				  </TR>
				  </TBODY>
				 </TABLE>
				</TD>
			</TR>
			</TBODY>
		</TABLE>
		
		
      
		<div align=center>
      <TABLE height=200 cellSpacing=0 cellPadding=0 width="98%" border=0>
			<TBODY>
			<%
			IF Not RS_O.EOF Then
			Count = 1

			While Not RS_O.Eof and Count <= 10
			
			user_id = RS_O("user_id")
			total_p = RS_O("total_p")
			%>
			<Tr onMouseOver="this.style.background='#313031'" onMouseOut="this.style.background='#000000'" valign="top">
				  <TD vAlign=center align=left><IMG src="./image/bullet2.gif">[주문자 ID : <%=user_id%>]</TD>
				  <TD vAlign=center align=right width=100><%=FormatNumber(total_p,0)%>원&nbsp;&nbsp;</TD>
			</TR>
			
			<%
			RS_O.MoveNext

			Count = Count + 1

			Wend
			
			Else
			%>
			<TR>
				<TD vAlign=center align=middle>오늘 주문이 없습니다.<BR></TD>
			</TR>
			<%
			End IF
			
			RS_O.Close
			Set RS_O = Nothing
			%>
		<TR>
	<TD colSpan=2 >
		<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="1">
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</TD>
</TR>
			</TBODY>
		</TABLE>
      </div>
		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
			<TBODY>
			<TR>
				<TD vAlign=center align=left  height=19><B>&nbsp;금일총주문수 : <%=T_mem%> 건</B></TD>
				<TD vAlign=center align=right height=19><FONT 
				color=#333300><B><A 
            	href="./order/order_list.asp">
				<FONT color=#cd6500>more 
				&gt;&gt;</FONT></B></FONT>&nbsp;&nbsp;</A></TD>
			</TR>
			</TBODY>
		</TABLE>

	</TD>

    <TD vAlign=top align=left width="2%">
		<IMG height=1 src="./image/blank.gif" width=1></TD>
    

	<%
		SQL = "select count(num) as recCount from members"
		Set Rs = Db.Execute(SQL)

			recordCount = Rs(0)
			T_mem = Recordcount
			pagesize = 10

		
			pagecount = int((recordCount-1)/pagesize) +1

		
			SQL = "Select Top " & pagesize & " * From members "
			SQL = SQL & " where num not in "
			SQL = SQL & "(Select Top " & (int(Page - 1) * pagesize) & " num From members"
			SQL = SQL & " Order By num DESC) order by num desc" 

			'response.write recordcount
			'response.end
			Set Rs = Db.Execute(SQL)
	%>	

     <TD vAlign=top align=left width="50%"> 
	  <table width="100%" border="0" bgcolor="#000000">
			<TBODY>
			<TR>
			  <TD>
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
				  <TBODY>
				  <TR height=20>
               
                <TD >&nbsp; 
                  회&nbsp;원&nbsp;가&nbsp;입&nbsp;현&nbsp;황 <B>[최신 NEW 
					10]</B></TD>
			  </TR>
			  </TBODY>
			</TABLE>
		  </TD>
		</TR>
		</TBODY>
	  </TABLE>
	  

		<div align=center>
      <TABLE height=200 cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
		<%
			IF Not RS.EOF Then
			Count = 1

			While Not Rs.Eof and Count <= 10
		%>
        <Tr onMouseOver="this.style.background='#313031'" onMouseOut="this.style.background='#000000'" valign="middle" height=25>
          <TD vAlign=top align=left >
			<IMG src="./image/bullet2.gif">
			<A href="mailto:<%=RS("email")%>"><%=RS("name")%></A> 회원님 
            [ID:<%=Rs("user_id")%>/가입일:<%=RS("postdate")%>]</TD>
		</TR>
        
		

		<%
			Rs.MoveNext

			Count = Count + 1

			Wend
	   
				IF Count >0 Then
					N_count = 10 - count
					For i=1 to n_count
		%>
		<TR >
		  <TD vAlign=center align=left><IMG src="./image/bullet2.gif">&nbsp;</TD>
		</TR>
		
		 
		<%
				Next
				End IF
				
				Else
		%>
			<TR>
				<TD vAlign=center align=middle>등록된 상품이 없습니다.<BR></TD>
			</TR>
		<%
			End IF
			
			Set RS = Nothing
		%>
		<TR>
	<TD >
		<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="1">
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</TD>
</TR>
		</TBODY>
	  </TABLE>
</div>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=center align=left  height=19><B>&nbsp;전체회원수 : <% response.write t_mem%> 명</B></TD>
          <TD vAlign=center align=right  height=19><FONT 
            color=#333300><B><A 
            href="./member/member_list.asp"><FONT 
            color=#cd6500>more 
			&gt;&gt;</FONT></B></FONT>&nbsp;&nbsp;</A></TD>
		</TR>

		</TBODY>
	  </TABLE>


	  </TD>
	</TR>
	</TBODY>
</TABLE>

<BR>

<%
		SQL = "select count(num) as recCount from goods"
		Set Rs = Db.Execute(SQL)

			recordCount = Rs(0)
			T_good = Recordcount

			pagesize = 10

		
			pagecount = int((recordCount-1)/pagesize) +1

		
			SQL = "Select Top " & pagesize & " * From goods "
			SQL = SQL & " where num not in "
			SQL = SQL & "(Select Top " & (int(Page - 1) * pagesize) & " num From goods"
			SQL = SQL & " Order By num DESC) order by num desc" 

			'response.write recordcount
			'response.end
			Set Rs = Db.Execute(SQL)
	%>

<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD vAlign=top align=left width="50%"> 
	  <table width="100%" border="0" bgcolor="#000000">
			<TBODY>
			<TR>
			  <TD>
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
				  <TBODY>
				  <TR height=20>
                <TD>												&nbsp;최&nbsp;신&nbsp;등&nbsp;록&nbsp;&nbsp;상&nbsp;품&nbsp;
					<B>[최신 NEW 10]</B></TD>
			  </TR>
			  </TBODY>
			</TABLE>
			</TD>
		</TR>
		</TBODY>
	  </TABLE>
			
	  
		
      <div align=center>
      <TABLE height=200 cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
		<%
			IF Not RS.EOF Then
			Count = 1

			While Not Rs.Eof and Count <= 10
		%>
        <Tr onMouseOver="this.style.background='#313031'" onMouseOut="this.style.background='#000000'" valign="top">
          <TD vAlign=center align=left><IMG src="./image/bullet2.gif"><%=RS("g_name")%></TD>
          <TD vAlign=center align=right width=100><%=FormatNumber(RS("or_p"),0)%>원&nbsp;&nbsp;</TD>
		</TR>
       
		
		<%
			Rs.MoveNext

			Count = Count + 1

			Wend
	    
			Else
		%>
			<TR>
				<TD vAlign=center align=middle>등록된 상품이 없습니다.<BR></TD>
			</TR>
		<%
			End IF
			
			Set RS = Nothing
		%>
		<TR>
	<TD colspan=2>
		<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="1">
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</TD>
</TR>
		</TBODY>
	  </TABLE>
</div>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=center align=left  height=19><B>&nbsp;전체상품수 : <%response.write t_good%> 개</B></TD>
          <TD vAlign=center align=right  height=19><FONT 
            color=#333300><B><A 
            href="./goods/goods_list.asp"><FONT 
            color=#cd6500>more 
			&gt;&gt;</FONT></B></FONT>&nbsp;&nbsp;</A></TD>
		</TR>
		</TBODY>
	 </TABLE>
	</TD>
    <TD vAlign=top align=left width="2%">
		<IMG height=1 src="./image/blank.gif" width=1></TD>
    <TD vAlign=top align=left width="50%"> 
	  <table width="100%" border="0" bgcolor="#000000">
			<TBODY>
			<TR>
			  <TD>
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
				  <TBODY>
				  <TR height=20>
              
                <TD >&nbsp;자&nbsp;유&nbsp;&nbsp;&nbsp;게&nbsp;시&nbsp;판
                  </TD>
			  </TR>
			  </TBODY>
		    </TABLE>
		  </TD>
		 </TR>
		 </TBODY>
	  </TABLE>
	  

      
	  <%
			SQL_B = "select count(num) as recCount from board"
			Set Rs_b = Db.Execute(SQL_B)

				recordCount = Rs_b(0)
				T_mem = Recordcount
				pagesize = 10

			
				pagecount = int((recordCount-1)/pagesize) +1

			
				SQL_b = "Select Top " & pagesize & " * From board "
				SQL_b = SQL_b & " where num not in "
				SQL_b = SQL_b & "(Select Top " & (int(Page - 1) * pagesize) & " num From board"
				SQL_b = SQL_b & " Order By num DESC) order by ref Desc,r_step Asc"

				'response.write recordcount
				'response.end
				Set Rs_b = Db.Execute(SQL_b)
		%>	
	  <div align=center>
      <TABLE height=200 cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
        <%
			IF Not RS_b.EOF Then
			Count = 10

			While Not Rs_b.Eof and Count >0
			W_date = RS_B("postdate")
		%>
		<Tr onMouseOver="this.style.background='#313031'" onMouseOut="this.style.background='#000000'" valign="top">
          <TD vAlign=center align=left><%
											IF RS_B("reforder") > 0 Then
											 AA = RS_B("reforder")
										%>
											<%for i=1 to AA%>&nbsp; <%next%>
											<Img src="./image/list_re.gif" border=0><IMG src="./image/bullet2.gif" border=0>
										<% Else%>
										<IMG src="./image/bullet2.gif">&nbsp;[<%Response.Write Left(W_date, 10) %>]&nbsp;&nbsp;
										<%End IF%><A Href="./board/list.asp?b_num=<%=RS_b("num")%>"><%
						If Len(RS_B("title")) > 20 Then
							Response.Write Left(RS_B("title"),20)&".."
						Else
							Response.Write (RS_B("title"))
						End If
					%>&nbsp;&nbsp;<% IF DateDiff("h",RS_B("postdate"),Now()) < 24 Then %>&nbsp;<IMG 
                        height=10 alt="오늘 올라 왔네요..." src="./image/new1.gif" width=28 border=0><%End IF%></TD>
          
		</TR>
        
        
		<%
			Rs_b.MoveNext

			Count = Count - 1

			Wend
	    
				IF Count >0 Then

					For i=1 to Count
		%>
		<TR >
		  <TD vAlign=center align=left><IMG src="./image/bullet2.gif">&nbsp;</TD>
		</TR>
		
		 
		<%
				Next
				End IF
			
			Else
		%>
			<TR>
				<TD vAlign=center align=middle>등록된 게시물이 없습니다.<BR></TD>
			</TR>
		<%
			End IF
		%>
		<TR>
	<TD >
		<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="1">
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</TD>
</TR>
		</TBODY>
	  </TABLE>
	  </div>
	  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          
          <TD vAlign=center align=right  height=19><FONT 
            color=#333300><B> <A Href="./board/list.asp">
			<FONT color=#cd6500><B>more	&gt;&gt;
				&nbsp;</B></FONT></A></TD>
		</TR>
		</TBODY>
	 </TABLE>
	
	  <% 
			Set RS_b = Nothing 
	  %>
	
 	</TD>
  </TR>
  </TBODY>
</TABLE>


	
	<!----list End------>
	</td>
  </tr>

  <tr>
	<td>&nbsp;</td>
  </tr>
  
</table>

<!---#include file="./down.inc"-->

</BODY>
</HTML>

<%
	Db.Close

	Set Db = Nothing
	
%>

