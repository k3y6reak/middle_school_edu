<!---#include file="../admin/dbconn.asp"--->
<!--#include file="../cookie.asp"--->
<%
		r_name = Request("receive_name")
		r_addr = Request("receive_addr1")
		r_tel = Request("receive_tel")

		r_cardno = Request("cardno")			'카드 결제
		r_effect_y = Request("effect_year")
		r_effect_m = Request("effect_month")
		r_quota = Request("quota")

		r_bank = Request("bankcode")			'은행 결제
		r_paidman = Request("paidman")

		r_bank2 = Request("bankcode2")    '카드와 은행 결제
		r_paidman2 = Request("paidman2")
		r_bank_amt = Request("bank_amt2")
		r_cardno2 = Request("cardno2")
		r_effect_y2 = Request("effect_year2")
		r_effect_m2 = Request("effect_month2")
		r_quota2 = Request("quota2")
		r_card_amt = Request("card_amt2")

		r_pay_amt = Request("pay_amt")

		paymethod = Request("paymethod")
		
	'	response.Write r_paidman2&"<br>"
	'	response.Write r_quota2&"<BR>"
	'	response.Write r_bank_amt
	'	response.Write r_cardno2
	'	response.End
		Select case r_bank
			case "100"
				bank1 = "온라인입금 - 국민은행 (700-7777-7070 ), (주)OyesMall"
			case "101"
				bank1 = "온라인입금 - 조흥은행(700-7777-7070 ), (주)OyesMall"
			case "102"
				bank1 = "온라인입금 - 제일은행(700-7777-7070 ), (주)OyesMall"
			case "103"
				bank1 = "온라인입금 - 신한은행(700-7777-7070 ), (주)OyesMall"
			case "104"
				bank1 = "온라인입금 - 농협(700-7777-7070 ), (주)OyesMall"
		End Select

		Select case r_bank2
			case "100"
				bank2 = "온라인입금 - 국민은행 (700-7777-7070 ), (주)OyesMall"
			case "101"
				bank2 = "온라인입금 - 조흥은행(700-7777-7070 ), (주)OyesMall"
			case "102"
				bank2 = "온라인입금 - 제일은행(700-7777-7070 ), (주)OyesMall"
			case "103"
				bank2 = "온라인입금 - 신한은행(700-7777-7070 ), (주)OyesMall"
			case "104"
				bank2 = "온라인입금 - 농협(700-7777-7070 ), (주)OyesMall"
		End Select
		
		SQL = "Select userID,Passwd From tbl_Temp Where SessionID ="&oyes_order&" "
		Set RS = DB.Execute (SQL)
		
		IF RS.EOF Then
			Response.write "<Script Language=JavaScript>"
			Response.write "alert('죄송합니다. \n\n고객님의 정보유출을 방지하가위해서 세션이 끝어진 상태입니다.\n \n다시 로그인 해 주십시오 ^^');"
			Response.write "location.href='../shop/shop_main.asp';"
			Response.write "</Script>"
		Else
		passwd = RS("passwd")
		user_id = RS("userID")

		SQL_M = "Select * From Members Where user_id='"&user_id&"' and Passwd='"&passwd&"'"
		Set RS2 = DB.Execute (SQL_M)
		Point = RS2("point")
		

		SQL_Bag = "Select A.g_name, A.g_com, A.color, A.or_p, A.sphoto, A.ca1, A.g_code, B.good_ea From Goods A, Shop_cart B Where B.SessionID="&oyes_order&" And B.Good_code = A.g_code"
		Set RS3 = Server.CreateObject("ADODB.RecordSet")

			RS3.Open SQL_Bag, DB, 1

%>
<html>
<head>
<HTML><HEAD><TITLE>OyesMall 에 오신것을 환영합니다</TITLE>
<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>
<script language="javascript">

	if(navigator.appName != 'Netscape') {
		document.writeln('<OBJECT ID="INIpay" CLASSID="CLSID:41FA8B68-2AF1-11D3-A484-00104B17D707" width=190 height=40');
		document.writeln('CODEBASE="http://wallet.inipay.com/plugin/INIpayPlugin128.cab#Version=1.0.0.4">');
		document.writeln('</OBJECT>');
		document.write("<SCRIP");
		document.write("T LANGUAGE=javascript SRC=http://wallet.inipay.com/plugin/Pay_ie.JS>");
		document.write("</SCRI");
		document.writeln("PT>");
	}

	function PayConfirm(form) {
		var Digit ='1234567890'
		var target = form.icardpwd
		var ipass = form.icardpwd.value
		var icard = form.icardnum.value
		var i

		if (navigator.appName == 'Netscape') ret1 = parent.wallet.MakePayMessage(form);
		else ret1 = MakePayMessage(form);

		if( ret1 == false) {
			alert("지불에 실패하였습니다.");
			return false;
		}

		
		
	}

</script>

<Script language=javascript>
	function pay_ok()
			{
				document.frmMain.submit();
			}

</Script>
</head>
<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" border="0" bgcolor="#ffffff">

<!-- 상단 메뉴 -->


<script language="JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v3.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<!--#include file="../shop_about/about_top.asp"-->
<center>
  <table width="747" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <!--#include file="../shop/shop_left.asp"-->
      <td valign="top" align="center">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	
          <tr>
              <td><img src="../shop_image/payment_title1.gif" width="148" height="26"></td>
           
          </tr>
       
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr bgcolor="#CECECE">
            <td height="25" width="17">&nbsp;</td>
            <td height="25" class="tk">진행상황 : Shopping Cart &gt; 계산하기 &gt; <b>결제하기</b>
              &gt; 결제확인</td>
          </tr>
          <tr bgcolor="#EEEEEE">
            <td height="45">&nbsp;</td>
            <td height="25" class="tk"><font color="#4C69A7"><b><%=RS2("name")%></b>님께서 주문하신 내용입니다.<br>
              맞으면 <b>결제하기</b>를, 수정사항이 있으시면 <b>이전화면</b>을 눌러주세요.
              </font></td>
          </tr>
        </table>
        <table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25" height="30"><img src="../shop_image/icon_t.gif" width="20" height="10"></td>
            <td><img src="../shop_image/sale_01.gif" width="56" height="14"></td>
          </tr>
        </table>
        <table border="0" cellspacing="0" cellpadding="2" width="95%">
          <tr align="center">
          <form name="frmMain" method="post" action="./cart_payment_ok.asp">
		  <input type=hidden name=order_name1 value="<%=RS2("name")%>">
		<input type=hidden name=order_name2 value="<%=r_name%>">
		<input type=hidden name=order_address value="<%=r_addr%>">
		<input type=hidden name=order_tel2 value="<%=r_tel%>">
		<input type=hidden name=order_kind value="<%=paymethod%>">
		
		<% IF paymethod="1" Then %>
			<input type=hidden name=cardno value="<%=r_cardno%>">
		<% ElseIF paymethod="2" Then %>
			<input type=hidden name=bankno value="<%=bank1%>">
			<input type=hidden name=paidman value="<%=r_paidman%>">
		<%Else%>
			<input type=hidden name=bankno value="<%=bank2%>">
			<input type=hidden name=paidman value="<%=r_paidman2%>">
			<input type=hidden name=bank_amt value="<%=r_bank_amt%>">
			<input type=hidden name=cardno value="<%=r_cardno2%>">
			<input type=hidden name=card_amt value="<%=r_card_amt%>">
		<%End IF%>

	  <input type="hidden" name="top" value="0">
            <td bgcolor="#E1ECFD" height="24" width="100" class="tk"><font color="#192642">상품</font></td>
            <td bgcolor="#E1ECFD" class="tk" width="280"><font color="#192642">브랜드명/상품명</font></td>
            <td bgcolor="#E1ECFD" class="tk" width="60"><font color="#192642">가격</font></td>
            <td bgcolor="#E1ECFD" class="tk" width="60"><font color="#192642">수량</font></td>
            <td bgcolor="#E1ECFD" class="tk" width="60"><font color="#192642">합계</font></td>
          </tr>
        <tr bgcolor="#83A0C0">
			<td colspan="6" height="1"></td>
		</tr>
           <% While Not RS3.EOF %>
          <tr>
            
            <td align="center"><a href="../shop/shop_goodsview.asp?g_code=<%=RS3("g_code")%>"><img src="http://<%=site%>/demoshop/admin/mall_image/<%=RS3("ca1")%>/<%=RS3("sphoto")%>" width="50" height="50" border="0" vspace="4"></a></td>
            <td class="ti" style="PADDING-LEFT: 10px">
		<a href="../shop/shop_goodsview.asp?g_code=<%=RS3("g_code")%>">
		<%=RS3("g_com")%>
		<br>
		<%=RS3("g_name")%></a>
		<br>
<%IF RS3("Color") = "" Then %>&nbsp;<%Else%> (Color:&nbsp;<%=RS3("Color")%>) <%End IF%>
	    </td>
            <td align="right" class="tk"><%=FormatNumber(RS3("or_p"),0)%>&nbsp;원</td>
            <td align="center" class="tk"><%=RS3("good_ea")%></td>
            <td align="right" class="tk" style="PADDING-RIGHT: 10px"><%g_price = RS3("or_p") * RS3("good_ea")%>
		  <%=FormatNumber(g_price,0)%>&nbsp;원</td>
          </tr>
          <tr>
            <td align="center" colspan="5"><img src="../shop_image/line_long_dot.gif" width="566" height="1"></td>
          </tr>
         <%
				Total_P = Total_P + g_price
				RS3.MoveNext
				Wend
			%>
        </table>
        <table width="95%" border="0" cellspacing="0" cellpadding="0" bgcolor="#F3F3F3">
          <tr>
       
            <td height="30">&nbsp;</td>
            <td width="80" align="right">상품총액 : </td>
            <td align="center" width="120">
              <input id=text name="cart_amt" value="<%=FormatNumber(Total_P,0)%>" style="background-color:#F2F2F2;color:#33517D;width:70px;font-size:12px;font-weight:bold;border:0;text-align:right;"> 원</td>
          </tr>
       <!--   <tr>
            <td>&nbsp;</td>
            <td align="right">- 포인트점수 : </td>
            <td align="center">
              <input id=text name="coupon_amt" value="<%=point%>" style="background-color:#F2F2F2;color:#33517D;width:70px;font-size:12px;font-weight:bold;border:0;text-align:right;"> 원</td>
     
          </tr>--->
          <tr>
            <td>&nbsp;</td>
            <td colspan="2" align="center">
              <hr noshade size="1" width="95%">
            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
			  <%
					' T_Price = Total_P - point  포인트 점수를 이용할시에는 주석 풀기...
					T_Price = Total_P
			  %>
            <td align="right">총결제금액 : </td>
            <td align="center">
			<input type=hidden name=order_total value=<%=T_price%>>
              <input id=text name="pay_amt" value="<%=FormatNumber(T_Price,0)%>" style="background-color:#F2F2F2;color:#33517D;width:70px;font-size:12px;font-weight:bold;border:0;text-align:right;">
              </a>원</td>
          </tr>
          <tr>
            <td height="1" bgcolor="#DCDCDC"></td>
            <td bgcolor="#DCDCDC"></td>
            <td bgcolor="#DCDCDC"></td>
          </tr>
        </table>
        <br>
        
        <table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25" height="30"><img src="../shop_image/icon_t.gif" width="20" height="10"></td>
            <td><img src="../shop_image/sale_02.gif" width="76" height="14"></td>
          </tr>
        </table>
        <table width="95%" border="0" cellspacing="1" cellpadding="5" bgcolor="#DCDCDC">
          <tr>

            <td bgcolor="#F3F3F3" align="center" width="80">이름</td>
            <td bgcolor="#FFFFFF">
            <input id=text name="receive_name"  value="<%=r_name%>" style="background-color:#FFFFFF;color:#000000;width:150px;font-size:12px;border:0;text-align:left;" readonly>
            </td>
          </tr>
          <tr>
            <td bgcolor="#F3F3F3" align="center">주소</td>
            <td bgcolor="#FFFFFF"> <%=r_addr%></td>
            
            <input type="hidden" name="receive_addr" value="<%=r_addr%>">
          </tr>
          <tr>
            <td bgcolor="#F3F3F3" align="center">연락처</td>
            <td bgcolor="#FFFFFF"><input id=text name="receive_tel"  value="<%=r_tel%>" style="background-color:#FFFFFF;color:#000000;width:200px;font-size:12px;border:0;text-align:left;" readonly></td>
          </tr>
        </table>
        <br>
        <table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25" height="30"><img src="../shop_image/icon_t.gif" width="20" height="10"></td>
            <td><img src="../shop_image/sale_03.gif" width="55" height="14"></td>
          </tr>
        </table>
        <% IF paymethod=1 Then %>
		  <table width="95%" border="0" cellspacing="1" cellpadding="5" bgcolor="#DCDCDC">
	          <tr>
	            <td bgcolor="#F3F3F3" align="center" width="80">결제방법</td>
	            <td bgcolor="#FFFFFF"><b>신용카드 - <%=r_cardno%></b></td>
	          </tr>
	          <tr>
	            <td bgcolor="#F3F3F3" align="center">할부기간</td>
	            <td bgcolor="#FFFFFF"><%=r_quota%> 개월 </td>
	          </tr>
	          <tr>
	            <td bgcolor="#F3F3F3" align="center">결제금액</td>
	            <td bgcolor="#FFFFFF"><%=r_pay_amt%> 원</td>
	          </tr>
	        </table>
		<% ElseIF paymethod=2 Then %>
         <table width="95%" border="0" cellspacing="1" cellpadding="5" bgcolor="#DCDCDC">
	          <tr>
	          
	            <td bgcolor="#F3F3F3" align="center" width="80">결제방법</td>
	            <td bgcolor="#FFFFFF"><%=bank1%></td>
	          </tr>
	          <tr>
	            <td bgcolor="#F3F3F3" align="center">결제금액</td>
	            <td bgcolor="#FFFFFF"><%=r_pay_amt%> 원</td>
	          </tr>
		</table>
		<% Else %>
		 <table width="95%" border="0" cellspacing="1" cellpadding="5" bgcolor="#DCDCDC">
	          <tr>
	         
	            <td bgcolor="#F3F3F3" align="center" width="80">결제방법</td>
	            <td bgcolor="#FFFFFF"><%=bank2%></td>
	          </tr>
	          <tr>
	            <td bgcolor="#F3F3F3" align="center">결제금액</td>
	            <td bgcolor="#FFFFFF"><%=FormatNumber(r_bank_amt,0)%> 원</td>
	          </tr>
		</table><br>
	        <table width="95%" border="0" cellspacing="1" cellpadding="5" bgcolor="#DCDCDC">
	          <tr>
	            <td bgcolor="#F3F3F3" align="center" width="80">결제방법</td>
	            <td bgcolor="#FFFFFF">신용카드 - <%=r_cardno2%></td>
	          </tr>
	          <tr>
	            <td bgcolor="#F3F3F3" align="center">할부기간</td>
	            <td bgcolor="#FFFFFF"><%=r_quota2%> 개월
		    </td>
	          </tr>
	          <tr>
	            <td bgcolor="#F3F3F3" align="center">결제금액</td>
	            <td bgcolor="#FFFFFF"><%=FormatNumber(r_card_amt,0)%>원</td>
	          </tr>
	        </table>
		<%End IF%>
        <table width="95%" border="0" cellspacing="0" cellpadding="5">
          <tr align="right">
            <td height="46"><a href="javascript:pay_ok();"><img src="../shop_image/btn_pay.gif" width="80" height="21" border="0" alt="결제하기"></a>
              <a href="javascript: history.go(-1);"><img src="../shop_image/btn_back2.gif" width="79" height="21" border="0" alt="돌아가기"></a>
            </td>
           
           
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <!--#include file="../shop/main_shopbottom.asp"-->
</center>
</body>
</Html>
<%End IF%>