
<!---#include file="../admin/dbconn.asp"--->
<!--#include file="../cookie.asp"--->
<%
		SQL = "Select userID,Passwd From tbl_Temp Where SessionID ="&oyes_order&" "
		Set RS = DB.Execute (SQL)
		
		IF RS.EOF Then
			Response.write "<Script Language=JavaScript>"
			Response.write "alert('�˼��մϴ�. \n\n������ ���������� �����ϰ����ؼ� ������ ������ �����Դϴ�.\n \n�ٽ� �α��� �� �ֽʽÿ� ^^');"
			Response.write "location.href='../shop/shop_main.asp;"
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

			g_count = RS3.RecordCount

		'	pix = 697+ (70 * g_count) - 70
			pix = 677+ (70 * g_count) - 70

	'	response.write pix
%>
<HTML><HEAD><TITLE>OyesMall �� ���Ű��� ȯ���մϴ�</TITLE>
<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>

<SCRIPT language=JavaScript>
<!--
function MM_showHideLayers() { //v3.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
    obj.visibility=v; }
}

function fnMove() {
	    document.frmMain.receive_name.value = document.frmMain.name.value;
      
            document.frmMain.receive_addr1.value = document.frmMain.addr1.value;
          
            document.frmMain.receive_tel.value = document.frmMain.tel.value;
}



function fnCheck() {
		

                
                        if (document.frmMain.receive_name.value == ""){
	                    alert("������ ������ �Է��ϼ���.");
	                    return;
                	

                

	                if (document.frmMain.receive_addr1.value == ""){
	                    alert("������ �ּҸ� �Է��ϼ���.");
	                    return;
	                }
	             
	                if (document.frmMain.receive_tel.value == ""){
	                    alert("������ ��ȭ��ȣ�� �Է��ϼ���.");
	                    return;
	                }
                }

                if (document.frmMain.paymethod[0].checked == true){
                    if (trim(document.frmMain.cardno.value) == "") {
                        alert("ī�� ��ȣ�� �Է��� �ּ���.")
                        return;
                    }
                }else  if (document.frmMain.paymethod[1].checked == true) {
                    if (trim(document.frmMain.paidman.value) == "") {
                        alert("�Ա��ڸ��� �Է��� �ּ���.")
                        return;
                    }
                }else{
                    if (trim(document.frmMain.paidman2.value) == "") {
                        alert("�Ա��ڸ��� �Է��� �ּ���.")
                        return;
                    }

		    if (trim(document.frmMain.cardno2.value) == "") {
		    	alert("ī���ȣ�� �Է��� �ּ���.");
			return;
		    }
                }

                document.frmMain.action = "./cart_pay.asp";
                document.frmMain.submit();

}
 function trim(strText) {
		        while (strText.substring(0,1) == ' ')
		            strText = strText.substring(1, strText.length);


		        while (strText.substring(strText.length-1,strText.length) == ' ')
		            strText = strText.substring(0, strText.length-1);

		       return strText;
    		}
    		function fnPost() {
                window.open('popup.asp','fnPost','width=420,height=250,scrollbars=1,resizable=yes');
      		}
//-->
</SCRIPT>

<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 
onload="MM_showHideLayers('L1','','show','L2','','hide','L3','','hide')" 
border="0" marginheight="0" marginwidth="0">

<SCRIPT language=JavaScript>
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
</SCRIPT>

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
          <TD width=17 height=25>&nbsp;</TD>
          <TD class=tk height=25>�����Ȳ : Shopping Cart &gt; ����ϱ� &gt; 
            <B>�����ϱ�</B> &gt; ����Ȯ��</TD></TR>
        <TR bgColor=#eeeeee>
          <TD height=45>&nbsp;</TD>
          <TD class=tk height=25><FONT color=#4c69a7><B><%=RS2("name")%></B>�Բ��� �����ϱ�� �� 
            ��ǰ�Դϴ�.<BR>�Ʒ��� ������ ä��� �� <B>�����ϱ�</B>�� ������ ������ 
        �̷�����ϴ�.</FONT></TD></TR></TBODY></TABLE>
      <SCRIPT language=javascript>
<!--//�����ݾ� �ڵ����
	function fnReCal() {
		var str_pay_amt_int, str_bank_amt2, str_result, number
		str_pay_amt_int = document.frmMain.pay_amt_int.value;
		str_bank_amt2 = document.frmMain.bank_amt2.value;
		str_result = parseInt(str_pay_amt_int) - parseInt(str_bank_amt2);

		number = "1234567890"
		for(i = 0; i < document.frmMain.bank_amt2.value.length; i++) {
			if (-1 == number.indexOf(document.frmMain.bank_amt2.value.charAt(i))) {
				alert("���ڸ� �Է��ϼ���");
				document.frmMain.bank_amt2.value = "";
				document.frmMain.card_amt2.value = str_pay_amt_int;
				return;
			}
		}

		if(document.frmMain.bank_amt2.value == "") {
			document.frmMain.card_amt2.value = str_pay_amt_int;
			return;
		}

		if(str_result < 0) {
			alert("\n��� ������ �ʰ��Ͽ����ϴ�.    ");
			document.frmMain.bank_amt2.value = str_pay_amt_int;
			document.frmMain.card_amt2.value = 0;
		} else {
			document.frmMain.card_amt2.value = str_result;
		}
		return;
	}
-->
</SCRIPT>

      <TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <FORM name=frmMain method=post>
          <TD width=25 height=30><INPUT type=hidden value=0 name=top> <IMG 
            height=10 src="../shop_image/icon_t.gif" width=20></TD>
          <TD><IMG height=14 src="../shop_image/sale_01.gif" 
        width=56></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=2 width="95%" border=0>
        <TBODY>
        <TR align=middle>
          <TD class=tk width=100 bgColor=#e1ecfd height=24><FONT 
            color=#192642>��ǰ</FONT></TD>
          <TD class=tk width=280 bgColor=#e1ecfd><FONT 
            color=#192642>�귣���/��ǰ��</FONT></TD>
          <TD class=tk width=60 bgColor=#e1ecfd><FONT 
          color=#192642>����</FONT></TD>
          <TD class=tk width=60 bgColor=#e1ecfd><FONT 
          color=#192642>����</FONT></TD>
          <TD class=tk width=60 bgColor=#e1ecfd><FONT 
          color=#192642>�հ�</FONT></TD></TR>
        <TR bgColor=#83a0c0>
          <TD colSpan=6 height=1></TD></TR>
		 <% While Not RS3.EOF %>
        <TR>
          <TD align=middle><A 
            href="../shop/shop_goodsview.asp?g_code=<%=RS3("g_code")%>"><IMG 
            height=50 src="http://<%=site%>/demoshop/admin/mall_image/<%=RS3("ca1")%>/<%=RS3("sphoto")%>" width=50 vspace=4 
            border=0></A></TD>
          <TD class=ti style="PADDING-LEFT: 10px"><A 
             href="../shop/shop_goodsview.asp?g_code=<%=RS3("g_code")%>"><%=RS3("g_com")%>
            <BR><%=RS3("g_name")%></A> <BR><%IF RS3("Color") = "" Then %>&nbsp;<%Else%> (Color:&nbsp;<%=RS3("Color")%>) <%End IF%></TD>
          <TD class=tk align=right><%=FormatNumber(RS3("or_p"),0)%>&nbsp;��</TD>
          <TD class=tk align=middle><%=RS3("good_ea")%></TD>
          <TD class=tk style="PADDING-RIGHT: 10px" 
align=right><%g_price = RS3("or_p") * RS3("good_ea")%>
		  <%=FormatNumber(g_price,0)%>&nbsp;��</TD></TR>
        <TR>
          <TD align=middle colSpan=5><IMG height=1 
            src="../shop_image/line_long_dot.gif" width=566></TD></TR>
			<%
				Total_P = Total_P + g_price
				RS3.MoveNext
				Wend
			%>
			</TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="95%" bgColor=#f3f3f3 border=0>
        <TBODY>
        <TR>
          <TD height=30>&nbsp;</TD>
          <TD width=70>&nbsp;</TD>
          <TD align=right width=80>��ǰ�Ѿ� : </TD>
          <TD align=middle width=120><INPUT id=text 
            style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; FONT-WEIGHT: bold; FONT-SIZE: 12px; BORDER-LEFT: 0px; WIDTH: 70px; COLOR: #33517d; BORDER-BOTTOM: 0px; BACKGROUND-COLOR: #f2f2f2; TEXT-ALIGN: right" 
            value="<%=FormatNumber(Total_P,0)%>" name=cart_amt> ��</TD></TR>
   <!--     <TR>
          <TD height=10>&nbsp;</TD>
          <TD width=70>&nbsp;</TD>
          <TD align=right>- ����Ʈ���� : </TD>
          <TD align=middle><INPUT id=text 
            style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; FONT-WEIGHT: bold; FONT-SIZE: 12px; BORDER-LEFT: 0px; WIDTH: 70px; COLOR: #33517d; BORDER-BOTTOM: 0px; BACKGROUND-COLOR: #f2f2f2; TEXT-ALIGN: right" 
            value="<%=FormatNumber(point,0)%>" name=coupon_amt> ��</TD><INPUT type=hidden 
          name=coupon_serial_no> <INPUT type=hidden value=N name=coupon_new> 
          <INPUT type=hidden value=20842 name=frmCatalog_id> </TR> -->
        <TR>
          <TD>&nbsp;</TD>
          <TD align=middle colSpan=3>
            <HR width=250 noShade SIZE=1>
          </TD></TR>
        <TR>
          <TD>&nbsp;</TD>
          <TD>&nbsp;</TD>
		 <%
			' T_Price = Total_P - point  ����Ʈ ������ �̿��ҽÿ��� �ּ� Ǯ��...
			 T_Price = Total_P
		 %>
          <TD align=right>�Ѱ����ݾ� : </TD>
          <TD align=middle><A style="CURSOR: hand" 
            href="http://www.wizwid.com/wizshop/ShopCart/payment.asp?top=0#"><!-- SCRIPT ERROR END --><INPUT 
            type=hidden value="<%=T_Price%>" name=pay_amt_int> <INPUT id=text 
            style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; FONT-WEIGHT: bold; FONT-SIZE: 12px; BORDER-LEFT: 0px; WIDTH: 70px; COLOR: #33517d; BORDER-BOTTOM: 0px; BACKGROUND-COLOR: #f2f2f2; TEXT-ALIGN: right" 
            value="<%=FormatNumber(T_Price,0)%>" name=pay_amt> </A>��</TD></TR>
        <TR>
          <TD bgColor=#dcdcdc height=1></TD>
          <TD bgColor=#dcdcdc></TD>
          <TD bgColor=#dcdcdc></TD>
          <TD bgColor=#dcdcdc></TD></TR></TBODY></TABLE><BR>
      <TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD width=25 height=30><IMG height=10 src="../shop_image/icon_t.gif" 
            width=20></TD>
          <TD><IMG height=14 src="../shop_image/sale_02.gif" 
        width=76></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=1 cellPadding=3 width="95%" bgColor=#dcdcdc border=0>
        <TBODY>
       
        <TR bgColor=#ffffff>
          <TD class=tk>
            <TABLE cellSpacing=0 cellPadding=8 border=0>
              <TBODY>
              <TR>
                <TD align=right width=220>
                  <TABLE cellSpacing=0 cellPadding=2 width=240 border=0>
				
                    <TBODY>
                    <TR align=middle>
                      <TD class=tk colSpan=2><B>�� ����</B></TD> </TR>
                    <TR>
                      <TD class=tk align=right>������ : </TD>
                      <TD><INPUT class=textbox disabled value="<%=RS2("name")%>" 
                        name=name> </TD></TR>
                    
                    <TR>
                      <TD class=tk align=right>�� �� : </TD>
                      <TD><INPUT class=textbox disabled size=27 
                        value="<%=RS2("address")%> " name=addr1> </TD></TR>
                   
                    <TR>
                      <TD class=tk align=right>����ó : </TD>
                      <TD><INPUT class=textbox disabled size=27 
                        value="<%=RS2("tel1_1")%>-<%=RS2("tel1_2")%>-<%=RS2("tel1_3")%>" name=tel> </TD></TR></TBODY></TABLE></TD>
                <TD align=middle width=40><A href="javascript:fnMove();"><IMG 
                  height=37 src="../shop_image/sale_confirm.gif" width=35 
                  border=0></A> </TD>
                <TD align=right>
                  <TABLE cellSpacing=0 cellPadding=2 width=240 border=0>
                    <TBODY>
                    <TR align=middle>
                      <TD class=tk colSpan=2><B>����� ����</B></TD></TR>
                    <TR>
                      <TD class=tk align=right>������ : </TD>
                      <TD class=tk><INPUT class=textbox size=19 
                        name=receive_name>
                      </TD></TR>
                  
                    <TR>
                      <TD class=tk align=right>�� �� : </TD>
                      <TD><INPUT class=textbox size=27 name=receive_addr1> 
                    </TD></TR>
                    
                    <TR>
                      <TD class=tk align=right>����ó : </TD>
                      <TD><INPUT class=textbox size=27 name=receive_tel> 
                    </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>&nbsp;&nbsp;&nbsp;&nbsp;<FONT 
            color=#4c69a7>�� ��ǰ ������� �ֹ� �� ������ �����Ͻ� ��� ���� "Ȯ��"��ư�� 
            ��������.</FONT><BR>&nbsp;&nbsp;&nbsp;&nbsp;<FONT color=#4c69a7>�� �ݵ�� 
            �����ΰ� ���� ����� �� �ִ� ����ó (��, ����, �ڵ���) �� �Է��� �ֽñ� 
        �ٶ��ϴ�.</FONT><BR><BR></TD></TR>

       </TBODY></TABLE><BR>
      <TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD width=25 height=30><IMG height=10 src="../shop_image/icon_t.gif" 
            width=20></TD>
          <TD><IMG height=14 src="../shop_image/sale_03.gif" 
        width=55></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="95%" border=0>
        <TBODY>
        <TR>
          <TD>
            <TABLE cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <TR>
               <td width="117" height="23" background="../shop_image/pay_01.gif" align="center" class="tk" style="PADDING-TOP: 2px">
                    <input type="radio" name="paymethod" value = "1" onClick="MM_showHideLayers('L1','','show','L2','','hide','L3','','hide')" checked>
                    <font color="#003366"><b>�ſ�ī��</b></font> </td>
                  <td width="131" background="../shop_image/pay_02.gif" align="center" class="tk" style="PADDING-TOP: 2px">
                    <input type="radio" name="paymethod" value="2" onClick="MM_showHideLayers('L1','','hide','L2','','show','L3','','hide')">
                    <font color="#003366"><b>�¶��� �Ա�</b></font> </td>
                  <td width="175" background="../shop_image/pay_03.gif" align="center" class="tk" style="PADDING-TOP: 2px">
                    <input type="radio" name="paymethod" value="3" onClick="MM_showHideLayers('L1','','hide','L2','','hide','L3','','show')">
                    <font color="#003366"><b>�ſ�ī�� + �¶����Ա�</b></font></td></TR></TBODY></TABLE>
            <DIV id=L1 
           style="position:absolute; left:document.body.scrollLeft-342px; top:<%=pix%>px; width:580px; height:150px; z-index:11; visibility: hidden">
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width=1 bgColor=#dcdcdc></TD>
                <TD>
                  <TABLE cellSpacing=0 cellPadding=5 width="100%" 
                  bgColor=#f8f8f8 border=0>
                    <TBODY>
                    <TR>
                      <TD height=1></TD>
                      <TD bgColor=#dcdcdc></TD></TR>
                    <TR>
                      <TD class=tk vAlign=bottom align=right width=106 
                        height=40>ī���ȣ : </TD>
                      <TD class=tk vAlign=bottom><INPUT class=textbox size=30 
                        name=cardno> ��) 1234567890123456</TD></TR>
                    <TR>
                      <TD class=tk align=right>��ȿ�Ⱓ : </TD>
                      <TD class=tk><SELECT class=textbox name=effect_year> 
                          <OPTION value=01 selected>2001</OPTION> <OPTION 
                          value=02>2002</OPTION> <OPTION value=03>2003</OPTION> 
                          <OPTION value=04>2004</OPTION> <OPTION 
                          value=05>2005</OPTION> <OPTION value=06>2006</OPTION> 
                          <OPTION value=07>2007</OPTION> <OPTION 
                          value=08>2008</OPTION> <OPTION value=09>2009</OPTION> 
                          <OPTION value=10>2010</OPTION> <OPTION 
                          value=11>2011</OPTION> <OPTION 
                        value=12>2012</OPTION></SELECT> / <SELECT class=textbox 
                        name=effect_month> <OPTION value=01 
                          selected>01</OPTION> <OPTION value=02>02</OPTION> 
                          <OPTION value=03>03</OPTION> <OPTION 
                          value=04>04</OPTION> <OPTION value=05>05</OPTION> 
                          <OPTION value=06>06</OPTION> <OPTION 
                          value=07>07</OPTION> <OPTION value=08>08</OPTION> 
                          <OPTION value=09>09</OPTION> <OPTION 
                          value=10>10</OPTION> <OPTION value=11>11</OPTION> 
                          <OPTION value=12>12</OPTION></SELECT> </TD></TR>
                    <TR>
                      <TD class=tk vAlign=top align=right height=35>�ҺαⰣ : </TD>
                      <TD class=tk vAlign=top><SELECT class=textbox 
                          name=quota> <OPTION value=00 selected>�Ͻú�</OPTION> 
                          <OPTION value=03>3����</OPTION> <OPTION 
                          value=04>4����</OPTION> <OPTION value=05>5����</OPTION> 
                          <OPTION value=06>6����</OPTION> <OPTION 
                          value=07>7����</OPTION> <OPTION value=08>8����</OPTION> 
                          <OPTION value=09>9����</OPTION> <OPTION 
                          value=10>10����</OPTION> <OPTION value=11>11����</OPTION> 
                          <OPTION value=12>12����</OPTION></SELECT> </TD></TR>
                    <TR>
                      <TD bgColor=#dcdcdc colSpan=2 
                  height=1></TD></TR></TBODY></TABLE></TD>
                <TD width=1 bgColor=#dcdcdc></TD></TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
              <TBODY>
              <TR align=right>
                <TD height=46><A href="javascript:fnCheck()"><IMG height=21 
                  src="../shop_image/btn_paynext.gif" width=80 border=0></A> <!--a href="wiz_cart_list.asp?top=0"--><A 
                  href="javascript:%20history.go(-1);"><IMG height=21 
                  src="../shop_image/btn_cancel3.gif" width=79 border=0></A> 
              </TD></TR></TBODY></TABLE></DIV>
            <DIV id=L2 
            style="position:absolute; left:document.body.scrollLeft-342px; top:<%=pix%>px; width:580px; height:150px; z-index:11; visibility: hidden">
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width=1 bgColor=#dcdcdc></TD>
                <TD>
                  <TABLE cellSpacing=0 cellPadding=5 width="100%" 
                  bgColor=#ffffff border=0>
                    <TBODY>
                    <TR>
                      <TD width=106 bgColor=#dcdcdc height=1></TD>
                      <TD width=120 bgColor=#ffffff></TD>
                      <TD bgColor=#dcdcdc></TD></TR></TBODY></TABLE>
                  <TABLE cellSpacing=0 cellPadding=5 width="100%" 
                  bgColor=#ffffff border=0>
                    <TBODY>
                    <TR>
                      <TD class=tk vAlign=bottom align=right height=40>���༱�� : 
                      </TD>
                      <TD class=tk vAlign=bottom><SELECT name=bankcode> 
                          <OPTION value=100 selected>��������[700-7777-7070][(��)OyesMall]</OPTION> <OPTION 
                          value=101>��������[700-7777-7070][(��)OyesMall]</OPTION> 
                          <OPTION value=102>��������[700-7777-7070][(��)OyesMall]</OPTION> <OPTION 
                          value=103>��������[700-7777-7070][(��)OyesMall]</OPTION> 
                          <OPTION 
                          value=104>����[700-7777-7070][(��)OyesMall]</OPTION></SELECT> 
                      </TD></TR>
                    <TR>
                      <TD class=tk align=right>�Ա��ڸ� : </TD>
                      <TD class=tk><INPUT class=textbox size=30 name=paidman> 
                      </TD>
                    <TR>
                      <TD class=tk 
                        colSpan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <FONT color=#4c69a7>�Ա��ڸ��� ���� �Աݽ� ǥ��Ǵ� ����� �ݵ�� ��ġ�ؾ� 
                        �մϴ�.</FONT><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT 
                        color=#cb6b04>(�ּ�3���̳��� �ݵ�� �Ա��ϼž� �մϴ�)</FONT></TD></TR>
                    <TR bgColor=#dcdcdc>
                      <TD colSpan=2></TD></TR></TBODY></TABLE></TD>
                <TD width=1 bgColor=#dcdcdc></TD></TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
              <TBODY>
              <TR align=right>
                <TD height=46><A href="javascript:fnCheck()"><IMG height=21 
                  src="../shop_image/btn_paynext.gif" width=80 border=0></A> <!--a href="wiz_cart_list.asp?top=0"--><A 
                  href="javascript:%20history.go(-1);"><IMG height=21 
                  src="../shop_image/btn_cancel3.gif" width=79 border=0></A> 
              </TD></TR></TBODY></TABLE></DIV>
            <DIV id=L3 
            style="position:absolute; left:document.body.scrollLeft-342px; top:<%=pix%>px; width:580px; height:150px; z-index:11; visibility: hidden">
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width=1 bgColor=#dcdcdc></TD>
                <TD>
                  <TABLE cellSpacing=0 cellPadding=5 width="100%" 
                  bgColor=#ffffff border=0>
                    <TBODY>
                    <TR>
                      <TD width=236 bgColor=#dcdcdc height=1></TD>
                      <TD width=165 bgColor=#ffffff></TD>
                      <TD bgColor=#dcdcdc></TD></TR></TBODY></TABLE>
                  <TABLE cellSpacing=0 cellPadding=5 width="100%" 
                  bgColor=#ffffff border=0>
                    <TBODY>
                    <TR>
                      <TD class=tk vAlign=bottom align=right height=40>���༱�� : 
                      </TD>
                      <TD class=tk vAlign=bottom><SELECT name=bankcode2> 
                          <OPTION value=100 selected>��������[700-7777-7070][(��)OyesMall]</OPTION> <OPTION 
                          value=101>��������[700-7777-7070][(��)OyesMall]</OPTION> 
                          <OPTION value=102>��������[700-7777-7070][(��)OyesMall]</OPTION> <OPTION 
                          value=103>��������[700-7777-7070][(��)OyesMall]</OPTION> 
                          <OPTION 
                          value=104>����[700-7777-7070][(��)OyesMall]</OPTION></SELECT> 
                      </TD></TR>
                    <TR>
                      <TD class=tk align=right>�Ա��ڸ� : </TD>
                      <TD class=tk><INPUT class=textbox size=30 name=paidman2> 
                      </TD>
                    <TR>
                      <TD class=tk align=right>���ұݾ� : </TD>
                      <TD class=tk><INPUT class=textbox 
                        onkeyup="javascript: fnReCal();" name=bank_amt2> �� 
</TD></TR>
                    <TR>
                      <TD class=tk 
                        colSpan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <FONT color=#4c69a7>�Ա��ڸ��� ���� �Աݽ� ǥ��Ǵ� ����� �ݵ�� ��ġ�ؾ� 
                        �մϴ�.</FONT><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT 
                        color=#cb6b04>(�ּ�3���̳��� �ݵ�� �Ա��ϼž� �մϴ�)</FONT></TD></TR>
                    <TR align=middle>
                      <TD class=tk colSpan=2>
                        <HR width="80%" noShade SIZE=1>
                      </TD></TR>
                    <TR>
                      <TD class=tk vAlign=bottom align=right>ī���ȣ : </TD>
                      <TD class=tk vAlign=bottom><INPUT class=textbox size=30 
                        name=cardno2> ��) 1234567890123456</TD></TR>
                    <TR>
                      <TD class=tk align=right>��ȿ�Ⱓ : </TD>
                      <TD class=tk><SELECT class=textbox name=effect_year2> 
                          <OPTION value=01 selected>2001</OPTION> <OPTION 
                          value=02>2002</OPTION> <OPTION value=03>2003</OPTION> 
                          <OPTION value=04>2004</OPTION> <OPTION 
                          value=05>2005</OPTION> <OPTION value=06>2006</OPTION> 
                          <OPTION value=07>2007</OPTION> <OPTION 
                          value=08>2008</OPTION> <OPTION value=09>2009</OPTION> 
                          <OPTION value=10>2010</OPTION> <OPTION 
                          value=11>2011</OPTION> <OPTION 
                        value=12>2012</OPTION></SELECT> / <SELECT class=textbox 
                        name=effect_month2> <OPTION value=01 
                          selected>01</OPTION> <OPTION value=02>02</OPTION> 
                          <OPTION value=03>03</OPTION> <OPTION 
                          value=04>04</OPTION> <OPTION value=05>05</OPTION> 
                          <OPTION value=06>06</OPTION> <OPTION 
                          value=07>07</OPTION> <OPTION value=08>08</OPTION> 
                          <OPTION value=09>09</OPTION> <OPTION 
                          value=10>10</OPTION> <OPTION value=11>11</OPTION> 
                          <OPTION value=12>12</OPTION></SELECT> </TD></TR>
                    <TR>
                      <TD class=tk align=right>�ҺαⰣ : </TD>
                      <TD class=tk><SELECT class=textbox name=quota2> 
                          <OPTION value=00 selected>�Ͻú�</OPTION> <OPTION 
                          value=03>3����</OPTION> <OPTION value=04>4����</OPTION> 
                          <OPTION value=05>5����</OPTION> <OPTION 
                          value=06>6����</OPTION> <OPTION value=07>7����</OPTION> 
                          <OPTION value=08>8����</OPTION> <OPTION 
                          value=09>9����</OPTION> <OPTION value=10>10����</OPTION> 
                          <OPTION value=11>11����</OPTION> <OPTION 
                          value=12>12����</OPTION></SELECT> </TD></TR>
                    <TR>
                      <TD class=tk align=right>���ұݾ� : </TD>
                      <TD class=tk><INPUT class=textbox readOnly 
                        name=card_amt2> �� </TD></TR>
                    <TR bgColor=#dcdcdc>
                      <TD colSpan=2></TD></TR></TBODY></TABLE></TD>
                <TD width=1 bgColor=#dcdcdc></TD></TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
              <TBODY>
              <TR align=right>
                <TD height=46><A href="javascript:fnCheck()"><IMG height=21 
                  src="../shop_image/btn_paynext.gif" width=80 border=0></A> <!--a href="wiz_cart_list.asp?top=0"--><A 
                  href="javascript:%20history.go(-1);"><IMG height=21 
                  src="../shop_image/btn_cancel3.gif" width=79 border=0></A> 
              </TD></TR></TBODY></TABLE></DIV><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR><BR></TD></TR></TBODY></TABLE></TD></TR></FORM></TBODY></TABLE>
			  <!--#include file="../shop/main_shopbottom.asp"-->
			  </CENTER></BODY></HTML>
<%End IF%>