

<!---#include file="../admin/dbconn.asp"--->
<!--#include file="../cookie.asp"--->
<% 
		'Response.Write oyes_order
		Top = Request("Top")
		IF top = "" Then
		 Top = "1" 
		End IF
			
		SQL = "Select A.g_name, A.g_com, A.color, A.or_p, A.sphoto, A.ca1, A.g_code, B.good_ea From Goods A, Shop_cart B Where B.SessionID="&oyes_order&" And B.Good_code = A.g_code"
	
	'	Response.Write SQL
	'	Response.End
		
		Set Cart = DB.Execute(SQL)		

%>

<HTML><HEAD><TITLE>OyesMall 에 오신것을 환영합니다</TITLE>
<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>
<SCRIPT language=javascript src="../shop_file/number_cnt_list.js"></SCRIPT>
<SCRIPT language=javascript>
<!---
	

	function buy() {
		if (document.form_cart.cart_sno0.value == "") {
			alert("\n 구매할 상품이 없습니다.");
		} else {
			document.form_cart.action = "./CheckCart.asp";
			document.form_cart.submit();
		}
		return;
	}

	function chklogin() {
		window.open('/wizshop/login/login_popup.asp?url=/wizshop/ShopCart/payment.asp&top=0','Login','width=340,height=250');
	}


	function fnRedirection() {
		location.href="../";
		return;
	}


//--->
</SCRIPT>

<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 border="0" marginheight="0" 
marginwidth="0"><!-- 상단 메뉴 시작 -->

<!--#include file="../shop_about/about_top.asp"-->
<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=747 border=0>
  <TBODY>
  <TR>
    <!--#include file="../shop/shop_left.asp"-->
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
         
          <TD><IMG height=26 src="../shop_image/sale_title1.gif"></TD>
         </TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR bgColor=#cecece>
          <TD height=3></TD>
          <TD></TD></TR>
        <TR bgColor=#eeeeee>
          <TD height=45>&nbsp;</TD>
          <TD class=tk height=25><FONT color=#4c69a7>상품은 24시간 동안 
            저장됩니다.<BR>구매하실 물건을 체크하시면 총결제금액이 자동으로 변경됩니다.<BR>구매를 완료하셨더라도 주문량이 많은 
            경우 미국 내 쇼핑몰에서 상품이 품절되는 경우가 발생할 수 있습니다.<BR>&gt;&gt;<A 
            href="../shop_about/shop_indent.asp#g">사후 
            품절처리 안내 자세히 보기</A></FONT></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD width=25 height=30><IMG height=10 src="../shop_image/icon_t.gif" 
            width=20></TD>
          <TD><IMG height=14 src="../shop_image/sc_01.gif" 
      width=56></TD></TR></TBODY></TABLE><!-- 고객 선택 상품 리스트-->
      <TABLE cellSpacing=0 cellPadding=2 width="95%" border=0>
        <TBODY>
        <TR vAlign=bottom align=middle>
          <FORM name=form_cart method=post>
          <TD class=tk width=100 bgColor=#e1ecfd height=24><FONT 
            color=#192642>상품</FONT></TD>
          <TD class=tk width=250 bgColor=#e1ecfd><FONT 
            color=#192642>브랜드명/상품명</FONT></TD>
          <TD class=tk width=60 bgColor=#e1ecfd><FONT 
          color=#192642>가격</FONT></TD>
          <TD class=tk width=60 bgColor=#e1ecfd><FONT 
          color=#192642>수량</FONT></TD>
          <TD class=tk width=60 bgColor=#e1ecfd><FONT 
          color=#192642>합계</FONT></TD>
          <TD class=tk width=30 bgColor=#e1ecfd><FONT 
          color=#192642>삭제</FONT></TD></TR>
        <TR bgColor=#83a0c0>
          <TD colSpan=6 height=1></TD></TR>
		  <%IF Cart.EOF Then%>
		  <TR height=100>
			<TD align=middle colspan=6><font color=orange> 고객님의 Shopping Cart 에 저장된 항목이 없습니다.</font></TD>
		  </TR>
		   </TBODY></TABLE>
        <TABLE cellSpacing=0 cellPadding=0 width="95%" bgColor=#f3f3f3 border=0>
        <TBODY>
        <TR>
          <TD class=tk align=right height=27>상품총액 : </TD>
          <TD class=tk align=middle width=120><FONT 
            color=#00366><B><%=FormatNumber(Total_P,0)%></B></FONT> 원</TD></TR>
        <TR>
          <TD bgColor=#dcdcdc height=1></TD>
          <TD bgColor=#dcdcdc></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=5 width="95%" border=0>
        <TBODY>
        <TR align=right>
          <TD height=46><A 
            href="../shop/shop_topview.asp?top=1"><IMG 
            height=21 alt="계속 쇼핑하기" src="../shop_image/btn_shopping.gif" width=106 
            border=0></A>  </TD></FORM></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>

		  <%
				Else
				
				 While Not Cart.EOF 
		%>
        <TR>
          <TD align=middle><INPUT type=hidden value=545203 name=cart_sno0> <A 
            href="../shop/shop_goodsview.asp?g_code=<%=Cart("g_code")%>"><IMG 
            height=90 src="http://<%=site%>/demoshop/admin/mall_image/<%=Cart("ca1")%>/<%=Cart("sphoto")%>" width=90 vspace=4 
            border=0></A></TD>
          <TD class=ti style="PADDING-LEFT: 10px"><A 
            href="../shop/shop_goodsview.asp?g_code=<%=Cart("g_code")%>"><%=Cart("g_com")%> <BR><%=Cart("g_name")%></A><BR><%IF Cart("Color") = "" Then %>&nbsp;<%Else%> (Color:&nbsp;<%=Cart("Color")%>) <%End IF%></TD>
          <TD class=tk align=right><%=FormatNumber(Cart("or_p"),0)%>&nbsp;원</TD>
          <TD class=tk align=right>
            <TABLE cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR>
                <TD><INPUT maxLength=5 size=3 value="<%=Cart("good_ea")%>" name=ea></TD>
                <TD>
                  <TABLE cellSpacing=0 cellPadding=0 border=0>
                    <TBODY>
                    <TR>
                      <TD><A href="./cart_add.asp?g_code=<%=Cart("g_code")%>&top=<%=top%>"><IMG height=13 
                        src="../shop_image/num_p.gif" width=15 border=0></A></TD></TR>
                    <TR>
                      <TD><A href="./cart_minus.asp?g_code=<%=Cart("g_code")%>&top=<%=top%>"><IMG height=13 
                        src="../shop_image/num_m.gif" width=15 
                    border=0></A></TD></TR>
				
				
				</TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
          <TD class=tk align=right><%g_price = Cart("or_p") * Cart("good_ea")%>
		  <%=FormatNumber(g_price,0)%>&nbsp;원</TD>
		  
          <TD align=middle><A href="./cart_del.asp?g_code=<%=Cart("g_code")%>&top=<%=Top%>"><IMG 
            height=11 alt=삭제하기 src="../shop_image/icon_del.gif" width=11 
            border=0></A></TD></TR>
        <TR>
          <TD align=middle colSpan=6><IMG height=1 
            src="../shop_image/line_long_dot.gif" width=566></TD></TR>
		<%
					Total_P = Total_P + g_price
					Cart.MoveNext
					Wend
		%>
		
        <!-- humm --></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="95%" bgColor=#f3f3f3 border=0>
        <TBODY>
        <TR>
          <TD class=tk align=right height=27>상품총액 : </TD>
          <TD class=tk align=middle width=120><FONT 
            color=#00366><B><%=FormatNumber(Total_P,0)%></B></FONT> 원</TD></TR>
        <TR>
          <TD bgColor=#dcdcdc height=1></TD>
          <TD bgColor=#dcdcdc></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=5 width="95%" border=0>
        <TBODY>
        <TR align=right>
          <TD height=46><A 
            href="../shop/shop_topview.asp?top=<%=Top%>"><IMG 
            height=21 alt="계속 쇼핑하기" src="../shop_image/btn_shopping.gif" width=106 
            border=0></A> <A href="javascript:buy();"><IMG height=21 alt=결제하기 
            src="../shop_image/btn_pay.gif" width=80 border=0></A> </TD></FORM></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
			
			<!--#include file="../shop/main_shopbottom.asp"--></CENTER></BODY></HTML>
<%
	End IF
	DB.Close


	Set DB = Nothing
	
%>