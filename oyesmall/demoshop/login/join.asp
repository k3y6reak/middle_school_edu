<!---#include file="../cookie.asp"--->
<HTML>
	<HEAD><TITLE>OyesMall 에 오신것을 환영합니다</TITLE>



<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>
<script language="JavaScript">
var ISSIGNUPOPTION = "Signup";

function isBelow14( scn1, scn2 )
{
    today = new Date();
    ThisYear = today.getYear();
    ThisMonth = today.getMonth()+1;
    ThisDay = today.getDate();

    if ( scn2.substring( 0, 1 ) == '1' || scn2.substring( 0, 1 ) == '2' )
        UserBirthYear = 1900 + parseInt( scn1.substring( 0, 2 ), 10 );
    else
        UserBirthYear = 2000 + parseInt( scn1.substring( 0, 2 ), 10 );
    
    userBirthMonth = parseInt( scn1.substring( 2, 4 ), 10 );
    userBirthDay = parseInt( scn1.substring( 4, 6 ), 10 );

    yearDiff = ThisYear - UserBirthYear;
    monthDiff = ThisMonth - userBirthMonth;
    dayDiff = ThisDay - userBirthDay;
    
    if ( yearDiff == 14 ) // 년도 차이가 14이면 滿나이 check!!
    {
        if ( monthDiff < 0 ) // 만 14세 이하!~
            return true;
        else if ( monthDiff == 0 )
            if ( dayDiff < 0 ) // 만 14세 이하!~
                return true;
        else
            return false;
    }
    else if ( yearDiff < 14 )
        return true;
    else
        return false;
    
}

function confirm14()
{
    if ( !confirm( "▶OyesMall 쇼핑몰에서는 만 14세 미만의 어린이가 회원 가입을 신청하는 경우,\n　부모님(또는 법정대리인)의 허락을 받아야 합니다.\n▶부모님(또는 법정대리인)의 허락을 받으셨습니까?" ) )
    {
        alert( "죄송합니다. 부모님(또는 법정대리인)의 허락을 받고 다시 신청해 주십시오." );
        return false;
    }
    
    return true;
}


  // ****************************************************************************************
  // Validate the entries placed on the CreatePersonalAccount form.  If the user entere invalid 
  // entries they will be redirected to the page and notified of their
  // erroneous ways
  function ValidateInputs()
  {
    // validate the inputs
  
	var bRetNo;
	  
    bRetNo = false;
	
	

	if (ISSIGNUPOPTION != "Edit") {
    if ( Validateuser_id(document.EntryForm.user_id.value) == false )
    {
		alert( "사용자 아이디를 정확하게 입력하십시오." );
		document.EntryForm.user_id.focus();
		return bRetNo;
	}

	strTemp = document.EntryForm.Password.value;
    if (IsPassword(strTemp) == false ) 
    {
		if ( strTemp.length >= 4 && strTemp.length <= 8  ) 
    	{
			alert( "귀하가 입력하신 비밀번호는 비밀번호 도용의 우려가 있어\n 허용하지 않으니 다른 비밀번호를 입력하시기 바랍니다." );
    	}
    	else {
			alert( "비밀번호를 정확하게 입력하십시오." );
    	}
		document.EntryForm.Password.focus();
		return bRetNo;
	}
    
    strTemp = document.EntryForm.PasswordAgain.value;
    if  (IsPassword(strTemp) == false ) 
    {
		alert( "비밀번호 확인을 정확하게 입력하십시오." );
		document.EntryForm.PasswordAgain.focus();
		return bRetNo;
    }

    // test to see if passwords match
    if ( document.EntryForm.Password.value != document.EntryForm.PasswordAgain.value )
    {
		alert( "비밀번호와 비밀번호 확인이 일치하지 않습니다. 정확하게 입력하십시오." );
		document.EntryForm.Password.focus();
		return bRetNo;
    }

	if (document.EntryForm.passwd_q.value=="")
			{
			alert( "비밀번호 힌트를 선택하세요." ); 
			document.EntryForm.passwd_q.focus();
			return bRetNo;
		}

	if (document.EntryForm.passwd_a.value=="")
			{
			alert( "비밀번호 답변을 입력하십시오." ); 
			document.EntryForm.passwd_a.focus();
			return bRetNo;
		}

	
	document.EntryForm.FullName.value.trim;
    if ( document.EntryForm.FullName.value.length == 0 )
    {
		alert( "이름을 정확하게 입력하십시오." );
		document.EntryForm.FullName.focus();
		return bRetNo;
    }
	
//	if ( "" != "internal" )
//	{
		if (document.EntryForm.RegNo.value=="")
			{
			alert( "주민등록번호를 입력하십시오" ); 
			document.EntryForm.RegNo.focus();
			return bRetNo;
		}

		if (document.EntryForm.RegNo2.value=="")
			{
			alert( "주민등록번호 뒷자리를 입력하십시오" ); 
			document.EntryForm.RegNo2.focus();
			return bRetNo;
		}
		
	
//	}

	if ( document.EntryForm.Address.value.length == 0 )
	{
		alert( "주소를 입력하지 않았습니다. [주소찾기] 버튼을 눌러서 주소를 입력하여 주십시오." );
		document.EntryForm.Action.focus();
		return bRetNo;
	}
	
	if (  ( document.EntryForm.Phone.value.length == 0 ) ||
	      ( IsKRPhoneNumber(document.EntryForm.Phone.value) == false ) ||
	      ( IsValidDDD( document.EntryForm.Phone.value ) == false )
	   ) 
	{
		alert( "지역번호를 정확하게 입력하십시오.\n2000.07.02부터 변경된 지역번호를 참고하십시오." );
		document.EntryForm.Phone.focus();
		return bRetNo;
	}
   
	if (( document.EntryForm.Phone2.value.length == 0 ) || ( IsKRPhoneNumber(document.EntryForm.Phone2.value) == false ))
	{
		alert( "전화번호 국번을 정확하게 입력하십시오." );
		document.EntryForm.Phone2.focus();
		return bRetNo;
	}

	if (( document.EntryForm.Phone3.value.length == 0 ) || ( IsKRPhoneNumber(document.EntryForm.Phone3.value) == false ))
	{
		alert( "전화번호를 정확하게 입력하십시오." );
		document.EntryForm.Phone3.focus();
		return bRetNo;
	}

	if ( document.EntryForm.HandPhone.value.length != 0 )
	{
		if ( IsKRPhoneNumber(document.EntryForm.HandPhone.value) == false )
		{
			alert( "핸드폰을 정확하게 입력하십시오.");
			document.EntryForm.HandPhone.focus();
			return bRetNo;
		}
	}
   
	if ( document.EntryForm.HandPhone2.value.length != 0 )
	{
		if ( IsKRPhoneNumber(document.EntryForm.HandPhone2.value) == false )
		{
			alert( "핸드폰 국번을 정확하게 입력하십시오." );
			document.EntryForm.HandPhone2.focus();
			return bRetNo;
		}
	}
   
	if ( document.EntryForm.HandPhone3.value.length != 0 )
	{
		if ( IsKRPhoneNumber(document.EntryForm.HandPhone3.value) == false )
		{
			alert( "핸드폰번호를 정확하게 입력하십시오." );
			document.EntryForm.HandPhone3.focus();
			return bRetNo;
		}
	}

	


	// 직업 기입여부 체크
		str = document.EntryForm.Profession.value;
	if(str == "") 
	{
		alert("직업을 선택해야 합니다.");
	    document.EntryForm.Profession.focus();
		return bRetNo;
	}

   // 이메일 주소 검사
    if (!check_mail(document.EntryForm.MainEmail))
    {
                alert('보내는사람 메일주소가 형식에 맞지 않습니다.');
                document.EntryForm.MainEmail.focus();
                return bRetNo; 
    }

  

    
 } 

}
//정확한 지역번호인지 check ( 2000.07.02기준 ) by ssolee
function IsValidDDD( obj )
{
    arrayDDD = new Array(16);

    if ( obj == '031' || obj == '033' || obj == '02' || obj == '032' ||
         obj == '041' || obj == '043' || obj == '042' || obj == '054' ||
         obj == '053' || obj == '063' || obj == '055' || obj == '052' ||
         obj == '062' || obj == '051' || obj == '061' || obj == '064' 
       )
        return true;
    else
        return false;
}

function AddChangeData(sOption)
{
	if (ISSIGNUPOPTION == "Edit") {
		var sValue;
		sValue = document.EntryForm.EditValue.value;
		if (sValue.indexOf(" " + sOption + " ") != -1)
		{
	//		alert("' " + sOption + " '" + "은 이미 들어 있습니다 ");
		}
		else
		{
			if (sValue == "") {
				document.EntryForm.EditValue.value = " " + sOption + " ";
			}
			else {
				document.EntryForm.EditValue.value = sValue + sOption + " ";
			}
	//		alert("'" + document.EntryForm.EditValue.value + "'");
		}
	}
}

// Isuser_id returns True if struser_id contains a valid membership account name.  
function Isuser_id(struser_id)
{
	var nIndex;
	var chrCurrent;
	var ascChrCurrent;
	var strInvalid;
	var bReturn;

	bReturn = true;
	
	// for the length of the string...
	for ( nIndex = 0; nIndex < struser_id.length; nIndex++)
	{
		// check each character
		ascChrCurrent = struser_id.charAt(nIndex);
		// user_id should be alphanumeric
		if ( (ascChrCurrent >= '0' && ascChrCurrent <= '9'	) || (ascChrCurrent >= 'a' && ascChrCurrent <= 'z') || (ascChrCurrent >= 'A' && ascChrCurrent <= 'Z') )
		{
			bReturn = true;	
		}
		else
		{
			bReturn = false;
			break;
		}
	}
	
	if ( bReturn && ( ( struser_id.length < 4) || ( struser_id.length > 12 ) ) )
	{
		bReturn = false;
	}
	return bReturn;
}

// 주민등록번호 field 자동이동  
function CheckLength()
{
	if ( document.EntryForm.RegNo.value.length == 6 )
	{
		document.EntryForm.RegNo2.focus();
                return;
	}
}

// 숫자만을 기입받게 하는 방법
function onlyNumber() 
{
   if((event.keyCode<48)||(event.keyCode>57))
      event.returnValue=false;
}

// 전화 번호 검사
function IsKRPhoneNumber(strNumber)
{
	var bRetNo;
	var strClean;
	
	bRetNo = false;
	if (IsInteger(strNumber) == true && strNumber.length >=2 && strNumber.length <= 4) {
		bRetNo = true;
	}
	return bRetNo;		
}

// 패스워드 길이 검사
function IsPassword( strPassword )
{
	var bRetNo;

	// check for all numbers and length  4 and 8
	if ( strPassword.length >= 4 && strPassword.length <= 8  ) 
	{	
		if ((strPassword == document.EntryForm.user_id.value) || (strPassword == "1234") || (strPassword == document.EntryForm.user_id.value + "1234"))
		{
			return false;
		}
		bRetNo = true;
	}
	else
	{
		bRetNo = false;
	}
	return bRetNo;
}

// 아이디 길이 검사
function Validateuser_id(struser_id)
{
	var bRetNo;
	
	bRetNo = true;
	if ( ( struser_id.length <= 0 ) || ( struser_id.length > 12 ) || (Isuser_id(struser_id)  == false ) )
	{
		bRetNo = false;
	}
    return bRetNo;
}

// 주소찾기
function FindAddress(  )
{
   window.open( 'findNewaddr.asp', 'post', 'width=470,height=255,resizable=1,scrollbars=0' );
   return true;	
}

// 아이디 중복 검사
function CheckID()
{
	userid = document.EntryForm.user_id.value;
    if ( Validateuser_id(userid) == false )
    {
		alert( "사용자 아이디를 정확하게 입력하십시오." );
		document.EntryForm.user_id.focus();
		return;
	}
   window.open( 'idcheck.asp?user_id=' + userid, 'idcheck', 'width=330,height=195,resizable=1,scrollbars=0' );
   return true;	
}

// 주민등록번호 중복 검사
function CheckRegNo()
{
	var strRegNo1 = document.EntryForm.RegNo.value;
	var strRegNo2 = document.EntryForm.RegNo2.value;
	
	if (id_no_chk(document.EntryForm.RegNo, document.EntryForm.RegNo2) == false) {
		alert( "귀하께서 입력하신 주민등록번호는 정상적인 체계가 아니므로 가입을 위해서는 웹마스터로 문의하여 주시기 바랍니다." ); 
		document.EntryForm.RegNo.focus();
		return false;
	}

	window.open('regcheck.asp?RegNo=' + strRegNo1 + '&RegNo2=' + strRegNo2, 'regcheck', 'width=330,height=260,resizable=1,scrollbars=0');
	return true;	
}

function MoveFocus() 
{
	var strTmp = document.EntryForm.user_id.value
	
	if (strTmp == "") 
	{
		document.EntryForm.user_id.focus();
	}
	return;
}

// ID 찾기 윈도에서 사용하는 함수로, 지정한 값으로 입력텍스트를 채운다.
function Displayid(strRecommender)
{
	document.EntryForm.Recommender.value = strRecommender;
	document.EntryForm.Action2.value = "다시찾기"
	return true;
}

function DisplayAddress(strAddr, strAddrHidden)
{
	document.EntryForm.Address.value= strAddr; 
	document.EntryForm.AddressHidden.value= strAddrHidden; 
	document.EntryForm.Action.value="다시찾기"
	if (ISSIGNUPOPTION == "Edit") {
		AddChangeData('Address');
	}	
	return true;
}

function id_no_chk(obj1,obj2)	{
    str1 = obj1.value ;
    str2 = obj2.value ;
    var li_lastid,li_mod,li_minus,li_last;
    var value0,value1,value2,value3,value4,value5,value6;
    var value7,value8,value9,value10,value11,value12;
    
	if ("" == "internal")
		if (document.EntryForm.RegID.value == "chicshin")
		 	return true;

    if (IsInteger(str1) &&  IsInteger(str2)) {
        li_lastid    = parseFloat(str2.substring(6,7));
        value0  = parseFloat(str1.substring(0,1))  * 2;
        value1  = parseFloat(str1.substring(1,2))  * 3;
        value2  = parseFloat(str1.substring(2,3))  * 4;
        value3  = parseFloat(str1.substring(3,4))  * 5;
        value4  = parseFloat(str1.substring(4,5))  * 6;
        value5  = parseFloat(str1.substring(5,6))  * 7;
        value6  = parseFloat(str2.substring(0,1))  * 8;
        value7  = parseFloat(str2.substring(1,2))  * 9;
        value8  = parseFloat(str2.substring(2,3))  * 2;
        value9  = parseFloat(str2.substring(3,4))  * 3;
        value10 = parseFloat(str2.substring(4,5))  * 4;
        value11 = parseFloat(str2.substring(5,6))  * 5;
        value12 = 0;
        
        value12 = value0+value1+value2+value3+value4+value5+value6+value7+value8+value9+value10+value11+value12 ;
        
        li_mod = value12 %11;
        li_minus = 11 - li_mod;
        li_last = li_minus % 10;
        if (li_last != li_lastid){
            obj2.select();
            obj2.focus();
            return false;
        } else
            return true;
	} else
    obj2.select();
    obj2.focus();
    return false;
}

function IsInteger(st)
{
    if (!IsEmpty(st)){
       for (j=0; j<st.length; j++){
         if (((st.substring(j, j+1) < "0") || (st.substring(j, j+1) > "9")))
	     return false;
       }
    } else {
       return false ;
    }
    return true ;
}

function IsEmpty(toCheck)
{
     var chkstr = toCheck + "";
     var is_Space = true ;
     if ( ( chkstr == "") || ( chkstr == null ) )
	   return false ;
     for ( j = 0 ; is_Space &&  ( j < chkstr.length ) ; j++){
	     if( chkstr.substring( j , j+1 ) != " " )
    	       is_Space = false ;
     }
     return ( is_Space );
}

function ValidCheck()	
{
	if (ValidateInputs() == false) return;
	document.EntryForm.submit();
}



// 윈도가 강제로 종료될때 현재 처리중인지의 여부 확인.
function window_onbeforeunload()
{
}

//****************************************************************************
//주민등록번호로 생년월일의 입력텍스트를 채운다.
//****************************************************************************
function RegNochange()
{
	if (EntryForm.RegNo2.value.substring(0,1) < 3)
		EntryForm.BirthDateYear.value = '19' + EntryForm.RegNo.value.substring(0,2)
	else
		EntryForm.BirthDateYear.value = '20' + EntryForm.RegNo.value.substring(0,2);

	if (EntryForm.RegNo.value.substring(2,4) < 10)
		EntryForm.BirthDateMonth.value =  EntryForm.RegNo.value.substring(3,4)
	else
		EntryForm.BirthDateMonth.value =  EntryForm.RegNo.value.substring(2,4);

	if (EntryForm.RegNo.value.substring(4,6) < 10)
		EntryForm.BirthDateDay.value =  EntryForm.RegNo.value.substring(5,6)
	else
		EntryForm.BirthDateDay.value =  EntryForm.RegNo.value.substring(4,6);
}

// 메일주소 검사
function check_mail(cg) {
	emailEx1 = /[^@]+@[A-Za-z0-9_\-]+\.[A-Za-z]+/;
	emailEx2 = /[^@]+@[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z]+/;
	emailEx3 = /[^@]+@[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z]+/;

	if(emailEx1.test(cg.value)) return true;
	if(emailEx2.test(cg.value)) return true;
	if(emailEx3.test(cg.value)) return true;

	return false;
}


</script>
<style type="text/css"> 

.button{
		height:20;padding-top:1pt ;BORDER-RIGHT: #000000 1px solid;Font-family:"Tahoma"; BORDER-TOP: #000000 1px solid; FONT-SIZE: 12px; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; background-color:#47b3b7; FONT-FAMILY: tahoma,arial ;color:#ffffff ; border-color:#42B2B5
}
</STYLE>



<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<META http-equiv=Content-Type content="text/html; charset=ks_c_5601-1987">
<LINK href="./login.files/style2.css" type=text/css rel=StyleSheet>

</HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginwidth="0" marginheight="0"><!----------top--------------->
<!--#include file="../shop/shop_maintop.asp"-->
						<!----------top_end---------------><!------main----------------->
					<!------ 보험 및 배송확인의뢰 ----------->


<TABLE cellSpacing=0 cellPadding=0 align=center border=0>
		<Tbody>
		<Tr>
			<Td>
				 <table border="0" width="650" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" align=center>
					<tr>
						<td bgcolor="#FFFFFF">                       
							<div align="center">
						    <TABLE cellSpacing=0 cellPadding=0 width=615 border=0>
									<TBODY>
									<TR>
										<TD colSpan=4 height=12></TD></TR>
									<TR>
										  <TD width=19><IMG height=21 alt="" src="./login.files/tb_1_g.gif" 
											width=19 border=0></TD>
										  <TD style="PADDING-LEFT: 4px; PADDING-TOP: 5px" width=121 
										  bgColor=#47b3b7><FONT class=w><B>회원가입</B>&nbsp;&nbsp;</FONT></TD>
										  <TD width=5><IMG height=21 alt="" src="./login.files/tb_2_g.gif" 
											width=5 border=0></TD>
										  <TD></TD>
									</TR>
									</TBODY>
							</TABLE>  
								
							<TABLE cellSpacing=1 cellPadding=0 width=615 bgColor=#cdcdc border=0>  
								<TR> 
								<Form Name=EntryForm ID=EntryForm Action="./join_ok.asp" Method=POST>
										<TD style="PADDING-LEFT: 6px" bgColor=#feffeb colSpan=3 
											height=60 ><FONT class=C5>OyesMall에 오신 것을 환영합니다. OyesMall 회원이 되시면 OyesMall 
											Address(미국 주소)를 받게 되며,<BR>이를 이용하여 미국내 쇼핑몰에서도 해외배송에 대한 제약없이 쇼핑하실 수 
											있습니다.<BR>(<FONT class=c6>*</FONT>)표시는 필수 항목이므로 반드시 기재하셔야 
											합니다.<BR></FONT></TD>
							   </TR>

							    <TR>
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>사용자 ID</FONT></TD> 
									 <TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2 ><input  style="FONT-SIZE: 12px"name=user_id MaxLength=12 size=25 value="" CLASS=txtfld><FONT class=c3><FONT color=#47b3b7> 
									(4~12 영문, 숫자)&nbsp;&nbsp; <input type="button" value="ID중복검사" name="CheckRegID" onClick="CheckID()" class="button"></FONT></FONT></td> 
								</tr> 
								
								<tr> 
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>비밀번호</FONT></TD> 
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2>
									<input type=password name=Password MaxLength=8 size=12 value="" CLASS=txtfld><BR><FONT class=c3><FONT color=#47b3b7>(비밀번호는 4~12자이내의 영문자나 숫자이어야 합니다.)</FONT></FONT> </td>
								</Tr>
									
								<Tr>
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>비밀번호 확인</FONT></TD> 
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2> <input type=password name=PasswordAgain MaxLength=8 size=12 value="" CLASS=txtfld> 
									<!input type="password" name="PasswordAgain" MaxLength="8" size="12" Value="">  
									</td>  
								</tr>
								
								<TR>
										  <TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT 
											class=c6>*</FONT>&nbsp;<FONT class=c5>비밀번호 힌트</FONT></TD>
										  <TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><SELECT 
											style="FONT-SIZE: 12px; WIDTH: 202px" name=passwd_q> <OPTION 
											  value="" selected>질문을 선택하세요.</OPTION> <OPTION 
											  value="어머니의 성함은?">어머니의 성함은?</OPTION> <OPTION 
											  value="아버지의 성함은?">아버지의 성함은?</OPTION> <OPTION value="자신의 별명은?">자신의 
											  별명은?</OPTION> <OPTION value="기억에 남는 추억의 장소는?">기억에 남는 추억의 
											  장소는?</OPTION> <OPTION value="가장 여행하고 싶은 나라는?">가장 여행하고 싶은 
											  나라는?</OPTION> <OPTION value="자신의 보물 제1호는?">자신의 보물 제1호는?</OPTION> 
											  <OPTION value="가장 감명깊게 본 영화는?">가장 감명깊게 본 영화는?</OPTION> <OPTION 
											  value="배우자의 생년월일은?(예)1970/05/25">배우자의 생년월일은?(예)1970/05/25</OPTION> 
											  <OPTION value="좋아하는 색깔은?">좋아하는 색깔은?</OPTION></SELECT>&nbsp;&nbsp;<FONT 
											class=c3><FONT color=#47b3b7>비밀번호 분실시 사용될 질문내용입니다.</FONT> 
										</FONT></TD>
								</TR>
								
								<TR>
										  <TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT 
											class=c6>*</FONT>&nbsp;<FONT class=c5>답변</FONT></TD>
										  <TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><INPUT 
											style="FONT-SIZE: 12px" size=32 name=passwd_a> <FONT class=c3><FONT 
											color=#47b3b7>비밀번호 분실시 질문에 대한 답변입니다.</FONT></FONT></TD>
								</TR>

								<tr>
								<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>이 름</FONT></TD> 
									</td> 
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2>
										<input  style="FONT-SIZE: 12px"name=FullName size=17 MaxLength=8 value="" CLASS=txtfld> 
										<FONT class=c3><FONT color=#47b3b7>실명을 
						입력하십시오.</FONT></FONT>
									</td>  
								</tr>  
									
								<tr>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>주민등록번호</FONT></TD> 
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><FONT class=C5> 
									<input  style="FONT-SIZE: 12px"name=RegNo size=6 MaxLength=6 value="" OnChange="javascript:RegNochange()" onkeyup="CheckLength()" OnKeypress="onlyNumber()" CLASS=txtfld>   
									- <input  style="FONT-SIZE: 12px"name=RegNo2 size=7 MaxLength=7 value="" OnKeypress="onlyNumber()" CLASS=txtfld></font>  
										
									</td>  
								</tr>
								
								<tr>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>생년월일</FONT></TD> 
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><FONT class=c5> 
									<input  style="FONT-SIZE: 12px"name=BirthDateYear  MaxLength=4 size=4 value="" CLASS=txtfld OnKeypress="onlyNumber()">년  
											<SELECT NAME="BirthDateMonth" onChange="AddChangeData('BirthDay');">  
											<OPTION VALUE=""> </OPTION>  
											<option VALUE="1">1</OPTION> 
											<option VALUE="2">2</OPTION> 
											<option VALUE="3">3</OPTION> 
											<option VALUE="4">4</OPTION> 
											<option VALUE="5">5</OPTION> 
											<option VALUE="6">6</OPTION> 
											<option VALUE="7">7</OPTION> 
											<option VALUE="8">8</OPTION> 
											<option VALUE="9">9</OPTION> 
											<option VALUE="10">10</OPTION> 
											<option VALUE="11">11</OPTION> 
											<option VALUE="12">12</OPTION> 
											</SELECT>월  
											<SELECT NAME="BirthDateDay" onChange="AddChangeData('BirthDay');">  
											<OPTION VALUE=""> </OPTION>  
											<option VALUE="1">1</OPTION>  
											<option VALUE="2">2</OPTION>  
											<option VALUE="3">3</OPTION>  
											<option VALUE="4">4</OPTION>  
											<option VALUE="5">5</OPTION>  
											<option VALUE="6">6</OPTION>  
											<option VALUE="7">7</OPTION>  
											<option VALUE="8">8</OPTION>  
											<option VALUE="9">9</OPTION>  
											<option VALUE="10">10</OPTION>  
											<option VALUE="11">11</OPTION>  
											<option VALUE="12">12</OPTION>  
											<option VALUE="13">13</OPTION>  
											<option VALUE="14">14</OPTION>  
											<option VALUE="15">15</OPTION>  
											<option VALUE="16">16</OPTION>  
											<option VALUE="17">17</OPTION>  
											<option VALUE="18">18</OPTION>  
											<option VALUE="19">19</OPTION>  
											<option VALUE="20">20</OPTION>  
											<option VALUE="21">21</OPTION>  
											<option VALUE="22">22</OPTION>  
											<option VALUE="23">23</OPTION>  
											<option VALUE="24">24</OPTION>  
											<option VALUE="25">25</OPTION>  
											<option VALUE="26">26</OPTION>  
											<option VALUE="27">27</OPTION>  
											<option VALUE="28">28</OPTION>  
											<option VALUE="29">29</OPTION>  
											<option VALUE="30">30</OPTION>  
											<option VALUE="31">31</OPTION>  
											</SELECT>일  
			<input type=radio Name=SolarLunarStatus value=1 checked>양력  
			<input type=radio Name=SolarLunarStatus value=2 >음력  
			  
									</font></td>  
								</tr>  

								<TR>
					  <TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT 
						class=c6>*</FONT>&nbsp;<FONT class=c5>결혼여부</FONT></TD>
					  <TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><FONT 
						class=c5><INPUT type=radio CHECKED value=1 name=ismarry>미혼 <INPUT 
						type=radio value=2 name=ismarry>기혼</FONT> </TD>
						</TR>

						<tr>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>주 소</FONT></TD>
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2>
										<input size=55 name=Address value="" onFocus="javascript:Action.focus();" CLASS=txtfld>
										<Input size=38 type=hidden name=AddressHidden value="" CLASS=txtfld>
										<input type="button" value="주소찾기" name="Action" onClick="FindAddress()"  class="button"> 
									</td> 
								</tr> 


								<tr>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>전화번호</FONT></TD>
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><FONT class=C5> 
									<input  style="FONT-SIZE: 12px"name=Phone size=4 MaxLength=4 value="" CLASS=txtfld OnKeypress="onlyNumber()">   
									- <input  style="FONT-SIZE: 12px"name=Phone2 size=4 MaxLength=4 value="" CLASS=txtfld OnKeypress="onlyNumber()"> - <input  style="FONT-SIZE: 12px"name=Phone3 size=4 MaxLength=4 value="" CLASS=txtfld OnKeypress="onlyNumber()"></font>
									<FONT class=c5><INPUT type=radio CHECKED value=1 name=whereTel1>자택 
																<INPUT type=radio value=2 name=whereTel1>직장</font>
									</td>  
									</tr>  
									  
									<tr>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25>&nbsp;&nbsp;<FONT class=c5>휴대폰</FONT></TD>
									</td>  
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><FONT class=C5>  
									<input  style="FONT-SIZE: 12px"name=HandPhone size=4 MaxLength=4 value="" CLASS=txtfld OnKeypress="onlyNumber()">   
									- <input  style="FONT-SIZE: 12px"name=HandPhone2 size=4 MaxLength=4 value="" CLASS=txtfld OnKeypress="onlyNumber()"> - <input  style="FONT-SIZE: 12px"name=HandPhone3 size=4 MaxLength=4 value="" CLASS=txtfld OnKeypress="onlyNumber()"></font>  
									</td>  
								</tr>  

								<tr> 
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>직 업</FONT></TD>
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2>
										<SELECT NAME="Profession"> 
											<option value="">직업을 선택하세요.</option>  
											<option value="중학교 이하">중학교 이하</option> 
											<option value="고등학생">고등학생</option> 
											<option value="대학(원)생">대학(원)생</option> 
											<option value="사무직">사무직</option> 
											<option value="기술직">기술직</option> 
											<option value="서비스/판매직">서비스/판매직</option> 
											<option value="생산직">생산직</option> 
											<option value="정보통신 관련직">정보통신 관련직</option> 
											<option value="의료인">의료인</option> 
											<option value="방송/언론인">방송/언론인</option> 
											<option value="법조인">법조인</option> 
											<option value="종교인">종교인</option> 
											<option value="예능/예술인">예능/예술인</option> 
											<option value="전문직">전문직</option> 
											<option value="주 부">주 부</option> 
											<option value="자영업">자영업</option> 
											<option value="농/축/수산업">농/축/수산업</option> 
											<option value="공무원">공무원</option> 
											<option value="교사/교수">교사/교수</option> 
											<option value="비영리단체">비영리단체</option> 
											<option value="무 직">무 직</option> 
											<option value="군 인">군 인</option> 
											<option value="기 타">기 타</option> 
										</SELECT> 
										&nbsp; 
										 
										 
										</td> 
								</tr> 
								
								
								
								
								

								<tr>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>E-Mail</FONT></TD>
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><input type="text" name="MainEmail" size="25" maxlength="40" Value=""><FONT class=c3><FONT color=#47b3b7>   
									  예)redmaster@oyesmall.net</FONT></FONT></td> 
								</tr> 
							</Table>  
							</div>  
					</td>  
					</tr>  
					
				</table> </TD>
				
				</TR></TBODY></TABLE>
				<BR>
				<Div align=center>
				<input type="button" value="회원가입 " name="EndOfForm" ID="EndOfForm" onClick="ValidCheck()" class="button"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="다시작성" name="B1"  class="button">
				</Div></Form><!------main_end-----------------><!--------------bottom------------>
			

<Center><!--#include file="../shop/main_shopbottom.asp"--><BR><BR><!-- 하단 Copyright 끝 --></CENTER></BODY></HTML>