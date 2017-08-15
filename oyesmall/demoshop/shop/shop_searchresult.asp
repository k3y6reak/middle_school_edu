<!---#include file="../admin/dbconn.asp"--->

<% 
		page = Request("page")
	
			IF Page = "" Then
				Page = 1
			End IF
		Top = Request("top")
		search_m = Request("searchmode")
	'	response.Write Search_m
	'	response.End
		s_word = Request("s_word")
		s_category = Request("s_category") 'ca1

		Select case s_category
			Case "1"
				c_good = "Men"
			Case "2"
				c_good = "Women"
			Case "3"
				c_good = "Kids&Baby"
			Case "4"
				c_good = "Home&Office"
			Case "5"
				c_good = "Electronics"
			Case "6"
				c_good = "Books&Media"
			Case "7"
				c_good = "Leisure&Sports"
			Case "8"
				c_good = "Hobby"
			Case "9"
				c_good = "Luxury"
		End Select
			
		s_brand = Request("s_brand")  'g_com
				
		price_s = Request("price_s")
		price_e = request("price_e")

		

	'	Set RS = Server.CreateObject("ADODB.RecordSet")
	
%>
<HTML><HEAD><TITLE>OyesMall 에 오신것을 환영합니다</TITLE>
<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>


<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 border="0" marginheight="0" 
marginwidth="0"><!-- 상단 메뉴 시작 -->
<!--#include file="./shop_maintop.asp"-->
<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=747 border=0>
  <TBODY>
  <TR>
    <!--#include file="./shop_left.asp"-->
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=middle>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              
              <TBODY>
              <TR>
                <TD><IMG height=26 src="../shop_image/advancedsearch_title1.gif" 
                  width=169></TD>
                </TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD vAlign=top align=middle>
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR bgColor=#d7d7d7>
                      <TD class=lm style="PADDING-LEFT: 20px" height=22><A 
                        href="./shop_main.asp">home</A> &gt; 
                        <B>Advanced Search</B></TD></TR>
                     <TR bgColor=#eeeeee>
                      <TD class=lm style="PADDING-LEFT: 20px" bgColor=#efefef 
                      height=4></TD>
					  </TR>
					 </TBODY>
					</TABLE>
					<BR>
					<table width="95%" border="0" cellspacing="0" cellpadding="0">
					<% IF search_m = 1 Then %>
					<% 
						Set Rs = Server.CreateObject("ADODB.Recordset")

						sql_query = ""
						'키워드로만 검색 했을 경우
						If s_word <> "" then 
							sql_query = sql_query & "g_name Like '%"& s_word &"%' or g_com like '%"& s_word &"%'"
						End If
						
						'카테고리로 검색했을 경우
						If s_category <> "" then 
							If s_word <> "" then
								sql_query = sql_query & " and ca1 Like '%"& c_good &"%'"
							Else
								sql_query = sql_query & "ca1 Like '%"& c_good &"%'"
							End if
						End If

						'Brand 로 검색했을 경우..
						If s_brand <> "" then 
							If s_word <> "" then
								sql_query = sql_query & " and g_com Like '%"& s_brand &"%'"
							Elseif s_category <> "" then
								sql_query = sql_query & " and g_com Like '%"& s_brand &"%'"
							Else
								sql_query = sql_query & "g_com Like '%"& s_brand &"%'"
							End if
						End If
						
						'상품가격으로 검색했을 경우...
						If price_s <> "" or price_e <> "" then 
							If s_word <> "" then
								sql_query = sql_query & " and or_p between "& price_s &" AND "& price_e
							Elseif s_category <> "" then
								sql_query = sql_query & " and or_p between "& price_s &" AND "& price_e
							Elseif s_brand <> "" then
								sql_query = sql_query & " and or_p between "& price_s &" AND "& price_e
							Else
								sql_query = sql_query & " or_p between "& price_s &" AND "& price_e
							End if
						End If

						'쿼리실행
						sql_query = "Select * from goods where "& sql_query &" order by num desc"

					'	response.write sql_query&"<br>"
						'response.End
						Set RS_B = Server.CreateObject("ADODB.RecordSet")
						RS_B.pagesize=10
						RS_B.Open sql_query, DB, 1
						T_page = RS_B.pagecount
						No2 = RS_B.recordcount
				'		response.Write No
						

						
				%>
                <tr valign="bottom">
                  <td class="tk">&nbsp;
        
                      <font color="#4973B1"><b><%IF Request("s_category") = "" Then%>all Category<%Else%><%=c_good%><%End IF%></font></b>의 상품,
                    
                      <font color="#4973B1"><b><%IF Request("s_brand") = "" Then%>all Brand<%Else%><%=s_brand%><%End IF%></font></b>의 상품,
                    
                      <font color="#4973B1"> <b><%IF Request("price_e") = 99999999999 Then%>모든 가격대<%Else%><%=price_s%>원 이상 <%=price_e%>원 미만<%End IF%></b></font></b>의 상품이
                    

                      <font color="#4973B1"> <b><%=No2%></b></font> 건 검색되었습니다.
        

                  </td>
                </tr>
                <tr>
                  <td><img src="../shop_image/line_long_dot.gif" width="566" height="4">
                  </td>
                </tr>
              </table>
        

              <!-- 검색된 MD 추천 상품 리스트 시작 -->

              <BR>
			  <% IF RS_B.EOF OR RS_B.BOF Then %>
				<table width="95%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="tk" height="25">검색된 상품의 총목록입니다.</td>
                  <td class="tk" height="25" align=right>&nbsp;</td>
                 
                    </select>
                  </td>
                </tr>
              </table>
              <table border="0" cellspacing="0" cellpadding="1" width="95%">
                <tr bgcolor="#E1ECFD">
                  <td height="22" width="30" class="tk" align="center" valign="bottom">번호</td>
                  <td valign="bottom" width="60" class="tk" align="center"><font color="#192642">상품</font></td>
                  <td class="tk" width="190" align="center" valign="bottom"><font color="#192642">브랜드명/상품명</font></td>
                  <td class="tk" width="60" align="center" valign="bottom"><font color="#192642">가격</font></td>
                  <td class="tk" width="230" align="center" valign="bottom"><font color="#192642">상품정보</font></td>
                </tr>
                <tr bgcolor="#83A0C0">
                  <td colspan="5" height="1"></td>
                </tr>
                <tr>
                  <td colspan="5" height="3"></td>
                </tr >
                <tr height=60>
                  <td align="center" colspan=5 >검색된 상품이 없습니다.</td>
                </tr>
				<tr bgcolor="#E1ECFD">
                  <td align="center" colspan="5" height="4"></td>
                </tr>
                <tr bgcolor="#83A0C0">
                  <td align="center" colspan="5" height="1"></td>
                </tr>
              </table>

              <!-- 검색결과 하단 페이징 시작 -->
              <table width="95%" border="0" cellspacing="0" cellpadding="2">
                <tr>
                  <td width="175">
                        <a href="./shop_search.asp"><img src="../shop_image/btn_re_search.gif" width="102" height="21" border="0" alt="다시검색하기" vspace="4"></a></td>
				  <td align="center" class="tgn">&nbsp;</td>
                  <td align="right" width="175">&nbsp;</td>
                </tr>
     
              </table>
			  <% Else %>
              <table width="95%" border="0" cellspacing="0" cellpadding="2">
                <tr>
                  <td class="tk"> 검색된 상품 중 <font color="#333333"><b>&quot;<font color=red>RED</Font>의 추천상품&quot;</b></font> 목록에 포함되는 상품입니다.</td>
                </tr>
              </table>
              <table border="0" cellspacing="0" cellpadding="1" width="95%">
                <tr bgcolor="#E1ECFD">
                  <td height="22" width="30" class="tk" align="center" valign="bottom">번호</td>
                  <td valign="bottom" width="60" class="tk" align="center"><font color="#192642">상품</font></td>
                  <td class="tk" width="190" align="center" valign="bottom"><font color="#192642">브랜드명/상품명</font></td>
                  <td class="tk" width="60" align="center" valign="bottom"><font color="#192642">가격</font></td>
                  <td class="tk" width="230" align="center" valign="bottom"><font color="#192642">상품정보</font></td>
                </tr>
                <tr bgcolor="#83A0C0">
                  <td colspan="5" height="1"></td>
                </tr>
                <tr>
                  <td colspan="5" height="3"></td>
                </tr>
				<%
					
					SQL_3 = "Select sphoto,g_name,g_com,or_p,ca1,g_code,feature From Goods Where Ca1 Like '"&c_good&"%' and choice = 1 Order By num Asc"
					
					RS.Open SQL_3, DB, 1
					IF  Not RS.EOF Then
					
					
				'	RS.Close
					No = RS.Recordcount
			
						R_Count = 1

						While Not RS.Eof and R_Count <= 3

						sphoto = RS("sphoto")
						Room = "http://"& site &"/demoshop/admin/mall_image/"&RS("ca1")
						com = RS("g_com")
						name = RS("g_name")
						price = RS("or_p")
						feature = RS("feature")
						g_code2 = RS("g_code")

				%>
                <tr>
                  <td align="center"><%=R_count%>
	
                  </td>
                  <td align="center"><A href="./shop_goodsview.asp?g_code=<%=g_code2%>"><img src="<%=room%>/<%=sphoto%>" width="50" height="50" border="0"></a></td>
                  <td class="ti" style="PADDING-LEFT: 10px"><A href="./shop_goodsview.asp?g_code=<%=g_code2%>"><%=com%>/<%=name%></a></td>
                  <td align="right" class="tk" style="PADDING-RIGHT: 5px" ><%=FormatNumber(price,0)%>원</td>
                  <td class="tk" style="PADDING-LEFT: 10px" width="230"><%=feature%></td>
                </tr>
				<%IF R_count <> No Then %>
				<tr>
                  <td align="center" colspan="5"><img src="../shop_image/line_long_dot.gif" width="566" height="4"></td>
                </tr>
				<% 
						End IF
						RS.Movenext
						R_count = R_count + 1
						Wend
						RS.Close
						
					Else
				%>
				<tr>
                  <td align="center" colspan=5 height=50><font color=red>RED</Font>의 추천상품은 없습니다.</TD>
				 </TR>
                <%End IF%>
                <tr bgcolor="#E1ECFD">
                  <td align="center" colspan="5" height="4"></td>
                </tr>
                <tr bgcolor="#83A0C0">
                  <td align="center" colspan="5" height="1"></td>
                </tr>
              </table>

              
              <table width="95%" border="0" cellspacing="0" cellpadding="2">
                <tr>
                  <td></td>
                </tr>
              </table>
              

			
              
              <BR><BR>
              <table width="95%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="tk" height="25">검색된 상품의 총목록입니다.</td>
                  <td class="tk" height="25" align=right>총 <b><%=T_page%></b> 페이지</td>
                 
                    </select>
                  </td>
                </tr>
              </table>
              <table border="0" cellspacing="0" cellpadding="1" width="95%">
                <tr bgcolor="#E1ECFD">
                  <td height="22" width="30" class="tk" align="center" valign="bottom">번호</td>
                  <td valign="bottom" width="60" class="tk" align="center"><font color="#192642">상품</font></td>
                  <td class="tk" width="190" align="center" valign="bottom"><font color="#192642">브랜드명/상품명</font></td>
                  <td class="tk" width="60" align="center" valign="bottom"><font color="#192642">가격</font></td>
                  <td class="tk" width="230" align="center" valign="bottom"><font color="#192642">상품정보</font></td>
                </tr>
                <tr bgcolor="#83A0C0">
                  <td colspan="5" height="1"></td>
                </tr>
                <tr>
                  <td colspan="5" height="3"></td>
                </tr>
                
				<%
						Count = 1

						While Not RS_B.Eof 

					   Number = No2 - count + 1
				%>
                <tr>
                  <td align="center"><%=Number%></td>
                  <td align="center"><A href="./shop_goodsview.asp?g_code=<%=RS_B("g_code")%>"><img src= "http://<%=site%>/demoshop/admin/mall_image/<%=RS_b("ca1")%>/<%=RS_b("sphoto")%>" width="50" height="50" border="0"></a></td>
                  <td class="ti" style="PADDING-LEFT: 10px"><A href="./shop_goodsview.asp?g_code=<%=RS_B("g_code")%>"><%=RS_B("g_com")%> /<%=RS_B("g_name")%></a></td>
                  <td align="right" class="tk" style="PADDING-RIGHT: 5px" ><%=FormatNumber(RS_B("or_p"),0)%>원</td>
                  <td class="tk" style="PADDING-LEFT: 10px" width="230"><%=RS_B("feature")%></td>
                </tr>
				<% IF count <> No2 Then %>
                <tr><td align="center" colspan="5"><img src="../shop_image/line_long_dot.gif" width="566" height="4"></td></tr>
				<%
						End IF
						RS_B.MoveNext

						Count = Count + 1

						Wend
				
				%>
                <tr bgcolor="#E1ECFD">
                  <td align="center" colspan="5" height="4"></td>
                </tr>
                <tr bgcolor="#83A0C0">
                  <td align="center" colspan="5" height="1"></td>
                </tr>
              </table>
			  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                <tr>
                  <td width="175">
                        <a href="./shop_search.asp"><img src="../shop_image/btn_re_search.gif" width="102" height="21" border="0" alt="다시검색하기" vspace="4"></a></td>
				  <td align="center" class="tgn">&nbsp;</td>
                  <td align="right" width="175">&nbsp;</td>
                </tr>
     
              </table>
			  <%
					End IF
					
					Else
						search_word = Request("frmSearchWord")
						Set Rs = Server.CreateObject("ADODB.Recordset")

						sql_query = "Select * from goods where g_name Like '%"& search_word &"%' or g_com Like '%"& search_word &"%' order by num desc"

					'	response.write sql_query&"<br>"
						'response.End
						Set RS_B = Server.CreateObject("ADODB.RecordSet")
						RS_B.pagesize=10
						RS_B.Open sql_query, DB, 1
						T_page = RS_B.pagecount
						No2 = RS_B.recordcount
				'		response.Write No
						

						
				%>
                <tr valign="bottom">
                  <td class="tk" >&nbsp;검색어 <font color="#4973B1"><b>"<%=search_word%>"</font></b>로<font color="#4973B1"> <b><%=No2%></b></font> 건 검색되었습니다.
        

                  </td>
                </tr>
                <tr>
                  <td><img src="../shop_image/line_long_dot.gif" width="566" height="4">
                  </td>
                </tr>
              </table>
        

              <!-- 검색된 MD 추천 상품 리스트 시작 -->

              <BR>
			  <% IF RS_B.EOF OR RS_B.BOF Then %>
				<table width="95%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="tk" height="25">검색된 상품의 총목록입니다.</td>
                  <td class="tk" height="25" align=right>&nbsp;</td>
                 
                    </select>
                  </td>
                </tr>
              </table>
              <table border="0" cellspacing="0" cellpadding="1" width="95%">
                <tr bgcolor="#E1ECFD">
                  <td height="22" width="30" class="tk" align="center" valign="bottom">번호</td>
                  <td valign="bottom" width="60" class="tk" align="center"><font color="#192642">상품</font></td>
                  <td class="tk" width="190" align="center" valign="bottom"><font color="#192642">브랜드명/상품명</font></td>
                  <td class="tk" width="60" align="center" valign="bottom"><font color="#192642">가격</font></td>
                  <td class="tk" width="230" align="center" valign="bottom"><font color="#192642">상품정보</font></td>
                </tr>
                <tr bgcolor="#83A0C0">
                  <td colspan="5" height="1"></td>
                </tr>
                <tr>
                  <td colspan="5" height="3"></td>
                </tr >
                <tr height=60>
                  <td align="center" colspan=5 >검색된 상품이 없습니다.</td>
                </tr>
				<tr bgcolor="#E1ECFD">
                  <td align="center" colspan="5" height="4"></td>
                </tr>
                <tr bgcolor="#83A0C0">
                  <td align="center" colspan="5" height="1"></td>
                </tr>
              </table>

              <!-- 검색결과 하단 페이징 시작 -->
              <table width="95%" border="0" cellspacing="0" cellpadding="2">
                <tr>
                  <td width="175">
                        <a href="./shop_search.asp"><img src="../shop_image/btn_re_search.gif" width="102" height="21" border="0" alt="다시검색하기" vspace="4"></a></td>
				  <td align="center" class="tgn">&nbsp;</td>
                  <td align="right" width="175">&nbsp;</td>
                </tr>
     
              </table>
			  <% Else %>
              <table width="95%" border="0" cellspacing="0" cellpadding="2">
                <tr>
                  <td class="tk"> 검색된 상품 중 <font color="#333333"><b>&quot;<font color=red>RED</Font>의 추천상품&quot;</b></font> 목록에 포함되는 상품입니다.</td>
                </tr>
              </table>
              <table border="0" cellspacing="0" cellpadding="1" width="95%">
                <tr bgcolor="#E1ECFD">
                  <td height="22" width="30" class="tk" align="center" valign="bottom">번호</td>
                  <td valign="bottom" width="60" class="tk" align="center"><font color="#192642">상품</font></td>
                  <td class="tk" width="190" align="center" valign="bottom"><font color="#192642">브랜드명/상품명</font></td>
                  <td class="tk" width="60" align="center" valign="bottom"><font color="#192642">가격</font></td>
                  <td class="tk" width="230" align="center" valign="bottom"><font color="#192642">상품정보</font></td>
                </tr>
                <tr bgcolor="#83A0C0">
                  <td colspan="5" height="1"></td>
                </tr>
                <tr>
                  <td colspan="5" height="3"></td>
                </tr>
				<%
					
					SQL_3 = "Select sphoto,g_name,g_com,or_p,ca1,g_code,feature From Goods Where Ca1 Like '"&c_good&"%' and choice = 1 Order By num Asc"
					
					RS.Open SQL_3, DB, 1
					IF  Not RS.EOF Then
					
					
				'	RS.Close
					No = RS.Recordcount
				
						R_Count = 1

						While Not RS.Eof and R_Count <= 3

						sphoto = RS("sphoto")
						Room = "http://"& site &"/demoshop/admin/mall_image/"&RS("ca1")
						com = RS("g_com")
						name = RS("g_name")
						price = RS("or_p")
						feature = RS("feature")
						g_code2 = RS("g_code")

				%>
                <tr>
                  <td align="center"><%=R_count%>
	
                  </td>
                  <td align="center"><A href="./shop_goodsview.asp?g_code=<%=g_code2%>"><img src="<%=room%>/<%=sphoto%>" width="50" height="50" border="0"></a></td>
                  <td class="ti" style="PADDING-LEFT: 10px"><A href="./shop_goodsview.asp?g_code=<%=g_code2%>"><%=com%>/<%=name%></a></td>
                  <td align="right" class="tk" style="PADDING-RIGHT: 5px" ><%=FormatNumber(price,0)%>원</td>
                  <td class="tk" style="PADDING-LEFT: 10px" width="230"><%=feature%></td>
                </tr>
				<%IF R_count <> No Then %>
				<tr>
                  <td align="center" colspan="5"><img src="../shop_image/line_long_dot.gif" width="566" height="4"></td>
                </tr>
				<% 
						End IF
						RS.Movenext
						R_count = R_count + 1
						Wend
						RS.Close

						Set RS = Nothing
				
					Else
				%>
				<tr>
                  <td align="center" colspan=5 height=50><font color=red>RED</Font>의 추천상품은 없습니다.</TD>
				 </TR>
                <%End IF%>
                <tr bgcolor="#E1ECFD">
                  <td align="center" colspan="5" height="4"></td>
                </tr>
                <tr bgcolor="#83A0C0">
                  <td align="center" colspan="5" height="1"></td>
                </tr>
              </table>

              
              <table width="95%" border="0" cellspacing="0" cellpadding="2">
                <tr>
                  <td></td>
                </tr>
              </table>
              

			
              
              <BR><BR>
              <table width="95%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="tk" height="25">검색된 상품의 총목록입니다.</td>
                  <td class="tk" height="25" align=right>총 <b><%=T_page%></b> 페이지</td>
                 
                    </select>
                  </td>
                </tr>
              </table>
              <table border="0" cellspacing="0" cellpadding="1" width="95%">
                <tr bgcolor="#E1ECFD">
                  <td height="22" width="30" class="tk" align="center" valign="bottom">번호</td>
                  <td valign="bottom" width="60" class="tk" align="center"><font color="#192642">상품</font></td>
                  <td class="tk" width="190" align="center" valign="bottom"><font color="#192642">브랜드명/상품명</font></td>
                  <td class="tk" width="60" align="center" valign="bottom"><font color="#192642">가격</font></td>
                  <td class="tk" width="230" align="center" valign="bottom"><font color="#192642">상품정보</font></td>
                </tr>
                <tr bgcolor="#83A0C0">
                  <td colspan="5" height="1"></td>
                </tr>
                <tr>
                  <td colspan="5" height="3"></td>
                </tr>
                
				<%
						Count = 1

						While Not RS_B.Eof 

					   Number = No2 - count + 1
				%>
                <tr>
                  <td align="center"><%=Number%></td>
                  <td align="center"><A href="./shop_goodsview.asp?g_code=<%=RS_B("g_code")%>"><img src= "http://<%=site%>/demoshop/admin/mall_image/<%=RS_B("ca1")%>/<%=RS_b("sphoto")%>" width="50" height="50" border="0"></a></td>
                  <td class="ti" style="PADDING-LEFT: 10px"><A href="./shop_goodsview.asp?g_code=<%=RS_B("g_code")%>"><%=RS_B("g_com")%> /<%=RS_B("g_name")%></a></td>
                  <td align="right" class="tk" style="PADDING-RIGHT: 5px" ><%=FormatNumber(RS_B("or_p"),0)%>원</td>
                  <td class="tk" style="PADDING-LEFT: 10px" width="230"><%=RS_B("feature")%></td>
                </tr>
				<% IF count <> No2 Then %>
                <tr><td align="center" colspan="5"><img src="../shop_image/line_long_dot.gif" width="566" height="4"></td></tr>
				<% 
						End IF

						RS_B.MoveNext

						Count = Count + 1

						Wend
						RS_B.Close
						Set RS_B = Nothing
				%>
                <tr bgcolor="#E1ECFD">
                  <td align="center" colspan="5" height="4"></td>
                </tr>
                <tr bgcolor="#83A0C0">
                  <td align="center" colspan="5" height="1"></td>
                </tr>
              </table>
            
              <table width="95%" border="0" cellspacing="0" cellpadding="2">
                <tr>
                  <td width="175">
                        <a href="./shop_search.asp"><img src="../shop_image/btn_re_search.gif" width="102" height="21" border="0" alt="다시검색하기" vspace="4"></a></td>
				  <td align="center" class="tgn">&nbsp;</td>
                  <td align="right" width="175">&nbsp;</td>
                </tr>
     
              </table>
			  <%
					End IF
					
					End IF
				%>
			
              <!-- 검색결과 하단 페이징 끝 -->

              <br>
            </td>
          </tr>
        </table>
			
      </td>
    </tr>
  </table>

      </td>
    </tr>
  </table>
<!--#include file="./main_shopbottom.asp"--></CENTER>

</BODY></HTML>
<%
	Db.Close

	Set Db = Nothing
	
%>