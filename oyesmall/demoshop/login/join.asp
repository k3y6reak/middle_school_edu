<!---#include file="../cookie.asp"--->
<HTML>
	<HEAD><TITLE>OyesMall �� ���Ű��� ȯ���մϴ�</TITLE>



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
    
    if ( yearDiff == 14 ) // �⵵ ���̰� 14�̸� ػ���� check!!
    {
        if ( monthDiff < 0 ) // �� 14�� ����!~
            return true;
        else if ( monthDiff == 0 )
            if ( dayDiff < 0 ) // �� 14�� ����!~
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
    if ( !confirm( "��OyesMall ���θ������� �� 14�� �̸��� ��̰� ȸ�� ������ ��û�ϴ� ���,\n���θ��(�Ǵ� �����븮��)�� ����� �޾ƾ� �մϴ�.\n���θ��(�Ǵ� �����븮��)�� ����� �����̽��ϱ�?" ) )
    {
        alert( "�˼��մϴ�. �θ��(�Ǵ� �����븮��)�� ����� �ް� �ٽ� ��û�� �ֽʽÿ�." );
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
		alert( "����� ���̵� ��Ȯ�ϰ� �Է��Ͻʽÿ�." );
		document.EntryForm.user_id.focus();
		return bRetNo;
	}

	strTemp = document.EntryForm.Password.value;
    if (IsPassword(strTemp) == false ) 
    {
		if ( strTemp.length >= 4 && strTemp.length <= 8  ) 
    	{
			alert( "���ϰ� �Է��Ͻ� ��й�ȣ�� ��й�ȣ ������ ����� �־�\n ������� ������ �ٸ� ��й�ȣ�� �Է��Ͻñ� �ٶ��ϴ�." );
    	}
    	else {
			alert( "��й�ȣ�� ��Ȯ�ϰ� �Է��Ͻʽÿ�." );
    	}
		document.EntryForm.Password.focus();
		return bRetNo;
	}
    
    strTemp = document.EntryForm.PasswordAgain.value;
    if  (IsPassword(strTemp) == false ) 
    {
		alert( "��й�ȣ Ȯ���� ��Ȯ�ϰ� �Է��Ͻʽÿ�." );
		document.EntryForm.PasswordAgain.focus();
		return bRetNo;
    }

    // test to see if passwords match
    if ( document.EntryForm.Password.value != document.EntryForm.PasswordAgain.value )
    {
		alert( "��й�ȣ�� ��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�. ��Ȯ�ϰ� �Է��Ͻʽÿ�." );
		document.EntryForm.Password.focus();
		return bRetNo;
    }

	if (document.EntryForm.passwd_q.value=="")
			{
			alert( "��й�ȣ ��Ʈ�� �����ϼ���." ); 
			document.EntryForm.passwd_q.focus();
			return bRetNo;
		}

	if (document.EntryForm.passwd_a.value=="")
			{
			alert( "��й�ȣ �亯�� �Է��Ͻʽÿ�." ); 
			document.EntryForm.passwd_a.focus();
			return bRetNo;
		}

	
	document.EntryForm.FullName.value.trim;
    if ( document.EntryForm.FullName.value.length == 0 )
    {
		alert( "�̸��� ��Ȯ�ϰ� �Է��Ͻʽÿ�." );
		document.EntryForm.FullName.focus();
		return bRetNo;
    }
	
//	if ( "" != "internal" )
//	{
		if (document.EntryForm.RegNo.value=="")
			{
			alert( "�ֹε�Ϲ�ȣ�� �Է��Ͻʽÿ�" ); 
			document.EntryForm.RegNo.focus();
			return bRetNo;
		}

		if (document.EntryForm.RegNo2.value=="")
			{
			alert( "�ֹε�Ϲ�ȣ ���ڸ��� �Է��Ͻʽÿ�" ); 
			document.EntryForm.RegNo2.focus();
			return bRetNo;
		}
		
	
//	}

	if ( document.EntryForm.Address.value.length == 0 )
	{
		alert( "�ּҸ� �Է����� �ʾҽ��ϴ�. [�ּ�ã��] ��ư�� ������ �ּҸ� �Է��Ͽ� �ֽʽÿ�." );
		document.EntryForm.Action.focus();
		return bRetNo;
	}
	
	if (  ( document.EntryForm.Phone.value.length == 0 ) ||
	      ( IsKRPhoneNumber(document.EntryForm.Phone.value) == false ) ||
	      ( IsValidDDD( document.EntryForm.Phone.value ) == false )
	   ) 
	{
		alert( "������ȣ�� ��Ȯ�ϰ� �Է��Ͻʽÿ�.\n2000.07.02���� ����� ������ȣ�� �����Ͻʽÿ�." );
		document.EntryForm.Phone.focus();
		return bRetNo;
	}
   
	if (( document.EntryForm.Phone2.value.length == 0 ) || ( IsKRPhoneNumber(document.EntryForm.Phone2.value) == false ))
	{
		alert( "��ȭ��ȣ ������ ��Ȯ�ϰ� �Է��Ͻʽÿ�." );
		document.EntryForm.Phone2.focus();
		return bRetNo;
	}

	if (( document.EntryForm.Phone3.value.length == 0 ) || ( IsKRPhoneNumber(document.EntryForm.Phone3.value) == false ))
	{
		alert( "��ȭ��ȣ�� ��Ȯ�ϰ� �Է��Ͻʽÿ�." );
		document.EntryForm.Phone3.focus();
		return bRetNo;
	}

	if ( document.EntryForm.HandPhone.value.length != 0 )
	{
		if ( IsKRPhoneNumber(document.EntryForm.HandPhone.value) == false )
		{
			alert( "�ڵ����� ��Ȯ�ϰ� �Է��Ͻʽÿ�.");
			document.EntryForm.HandPhone.focus();
			return bRetNo;
		}
	}
   
	if ( document.EntryForm.HandPhone2.value.length != 0 )
	{
		if ( IsKRPhoneNumber(document.EntryForm.HandPhone2.value) == false )
		{
			alert( "�ڵ��� ������ ��Ȯ�ϰ� �Է��Ͻʽÿ�." );
			document.EntryForm.HandPhone2.focus();
			return bRetNo;
		}
	}
   
	if ( document.EntryForm.HandPhone3.value.length != 0 )
	{
		if ( IsKRPhoneNumber(document.EntryForm.HandPhone3.value) == false )
		{
			alert( "�ڵ�����ȣ�� ��Ȯ�ϰ� �Է��Ͻʽÿ�." );
			document.EntryForm.HandPhone3.focus();
			return bRetNo;
		}
	}

	


	// ���� ���Կ��� üũ
		str = document.EntryForm.Profession.value;
	if(str == "") 
	{
		alert("������ �����ؾ� �մϴ�.");
	    document.EntryForm.Profession.focus();
		return bRetNo;
	}

   // �̸��� �ּ� �˻�
    if (!check_mail(document.EntryForm.MainEmail))
    {
                alert('�����»�� �����ּҰ� ���Ŀ� ���� �ʽ��ϴ�.');
                document.EntryForm.MainEmail.focus();
                return bRetNo; 
    }

  

    
 } 

}
//��Ȯ�� ������ȣ���� check ( 2000.07.02���� ) by ssolee
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
	//		alert("' " + sOption + " '" + "�� �̹� ��� �ֽ��ϴ� ");
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

// �ֹε�Ϲ�ȣ field �ڵ��̵�  
function CheckLength()
{
	if ( document.EntryForm.RegNo.value.length == 6 )
	{
		document.EntryForm.RegNo2.focus();
                return;
	}
}

// ���ڸ��� ���Թް� �ϴ� ���
function onlyNumber() 
{
   if((event.keyCode<48)||(event.keyCode>57))
      event.returnValue=false;
}

// ��ȭ ��ȣ �˻�
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

// �н����� ���� �˻�
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

// ���̵� ���� �˻�
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

// �ּ�ã��
function FindAddress(  )
{
   window.open( 'findNewaddr.asp', 'post', 'width=470,height=255,resizable=1,scrollbars=0' );
   return true;	
}

// ���̵� �ߺ� �˻�
function CheckID()
{
	userid = document.EntryForm.user_id.value;
    if ( Validateuser_id(userid) == false )
    {
		alert( "����� ���̵� ��Ȯ�ϰ� �Է��Ͻʽÿ�." );
		document.EntryForm.user_id.focus();
		return;
	}
   window.open( 'idcheck.asp?user_id=' + userid, 'idcheck', 'width=330,height=195,resizable=1,scrollbars=0' );
   return true;	
}

// �ֹε�Ϲ�ȣ �ߺ� �˻�
function CheckRegNo()
{
	var strRegNo1 = document.EntryForm.RegNo.value;
	var strRegNo2 = document.EntryForm.RegNo2.value;
	
	if (id_no_chk(document.EntryForm.RegNo, document.EntryForm.RegNo2) == false) {
		alert( "���ϲ��� �Է��Ͻ� �ֹε�Ϲ�ȣ�� �������� ü�谡 �ƴϹǷ� ������ ���ؼ��� �������ͷ� �����Ͽ� �ֽñ� �ٶ��ϴ�." ); 
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

// ID ã�� �������� ����ϴ� �Լ���, ������ ������ �Է��ؽ�Ʈ�� ä���.
function Displayid(strRecommender)
{
	document.EntryForm.Recommender.value = strRecommender;
	document.EntryForm.Action2.value = "�ٽ�ã��"
	return true;
}

function DisplayAddress(strAddr, strAddrHidden)
{
	document.EntryForm.Address.value= strAddr; 
	document.EntryForm.AddressHidden.value= strAddrHidden; 
	document.EntryForm.Action.value="�ٽ�ã��"
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



// ������ ������ ����ɶ� ���� ó���������� ���� Ȯ��.
function window_onbeforeunload()
{
}

//****************************************************************************
//�ֹε�Ϲ�ȣ�� ��������� �Է��ؽ�Ʈ�� ä���.
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

// �����ּ� �˻�
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
					<!------ ���� �� ���Ȯ���Ƿ� ----------->


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
										  bgColor=#47b3b7><FONT class=w><B>ȸ������</B>&nbsp;&nbsp;</FONT></TD>
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
											height=60 ><FONT class=C5>OyesMall�� ���� ���� ȯ���մϴ�. OyesMall ȸ���� �ǽø� OyesMall 
											Address(�̱� �ּ�)�� �ް� �Ǹ�,<BR>�̸� �̿��Ͽ� �̱��� ���θ������� �ؿܹ�ۿ� ���� ������� �����Ͻ� �� 
											�ֽ��ϴ�.<BR>(<FONT class=c6>*</FONT>)ǥ�ô� �ʼ� �׸��̹Ƿ� �ݵ�� �����ϼž� 
											�մϴ�.<BR></FONT></TD>
							   </TR>

							    <TR>
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>����� ID</FONT></TD> 
									 <TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2 ><input  style="FONT-SIZE: 12px"name=user_id MaxLength=12 size=25 value="" CLASS=txtfld><FONT class=c3><FONT color=#47b3b7> 
									(4~12 ����, ����)&nbsp;&nbsp; <input type="button" value="ID�ߺ��˻�" name="CheckRegID" onClick="CheckID()" class="button"></FONT></FONT></td> 
								</tr> 
								
								<tr> 
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>��й�ȣ</FONT></TD> 
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2>
									<input type=password name=Password MaxLength=8 size=12 value="" CLASS=txtfld><BR><FONT class=c3><FONT color=#47b3b7>(��й�ȣ�� 4~12���̳��� �����ڳ� �����̾�� �մϴ�.)</FONT></FONT> </td>
								</Tr>
									
								<Tr>
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>��й�ȣ Ȯ��</FONT></TD> 
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2> <input type=password name=PasswordAgain MaxLength=8 size=12 value="" CLASS=txtfld> 
									<!input type="password" name="PasswordAgain" MaxLength="8" size="12" Value="">  
									</td>  
								</tr>
								
								<TR>
										  <TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT 
											class=c6>*</FONT>&nbsp;<FONT class=c5>��й�ȣ ��Ʈ</FONT></TD>
										  <TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><SELECT 
											style="FONT-SIZE: 12px; WIDTH: 202px" name=passwd_q> <OPTION 
											  value="" selected>������ �����ϼ���.</OPTION> <OPTION 
											  value="��Ӵ��� ������?">��Ӵ��� ������?</OPTION> <OPTION 
											  value="�ƹ����� ������?">�ƹ����� ������?</OPTION> <OPTION value="�ڽ��� ������?">�ڽ��� 
											  ������?</OPTION> <OPTION value="��￡ ���� �߾��� ��Ҵ�?">��￡ ���� �߾��� 
											  ��Ҵ�?</OPTION> <OPTION value="���� �����ϰ� ���� �����?">���� �����ϰ� ���� 
											  �����?</OPTION> <OPTION value="�ڽ��� ���� ��1ȣ��?">�ڽ��� ���� ��1ȣ��?</OPTION> 
											  <OPTION value="���� ������ �� ��ȭ��?">���� ������ �� ��ȭ��?</OPTION> <OPTION 
											  value="������� ���������?(��)1970/05/25">������� ���������?(��)1970/05/25</OPTION> 
											  <OPTION value="�����ϴ� ������?">�����ϴ� ������?</OPTION></SELECT>&nbsp;&nbsp;<FONT 
											class=c3><FONT color=#47b3b7>��й�ȣ �нǽ� ���� ���������Դϴ�.</FONT> 
										</FONT></TD>
								</TR>
								
								<TR>
										  <TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT 
											class=c6>*</FONT>&nbsp;<FONT class=c5>�亯</FONT></TD>
										  <TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><INPUT 
											style="FONT-SIZE: 12px" size=32 name=passwd_a> <FONT class=c3><FONT 
											color=#47b3b7>��й�ȣ �нǽ� ������ ���� �亯�Դϴ�.</FONT></FONT></TD>
								</TR>

								<tr>
								<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>�� ��</FONT></TD> 
									</td> 
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2>
										<input  style="FONT-SIZE: 12px"name=FullName size=17 MaxLength=8 value="" CLASS=txtfld> 
										<FONT class=c3><FONT color=#47b3b7>�Ǹ��� 
						�Է��Ͻʽÿ�.</FONT></FONT>
									</td>  
								</tr>  
									
								<tr>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>�ֹε�Ϲ�ȣ</FONT></TD> 
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><FONT class=C5> 
									<input  style="FONT-SIZE: 12px"name=RegNo size=6 MaxLength=6 value="" OnChange="javascript:RegNochange()" onkeyup="CheckLength()" OnKeypress="onlyNumber()" CLASS=txtfld>   
									- <input  style="FONT-SIZE: 12px"name=RegNo2 size=7 MaxLength=7 value="" OnKeypress="onlyNumber()" CLASS=txtfld></font>  
										
									</td>  
								</tr>
								
								<tr>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>�������</FONT></TD> 
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><FONT class=c5> 
									<input  style="FONT-SIZE: 12px"name=BirthDateYear  MaxLength=4 size=4 value="" CLASS=txtfld OnKeypress="onlyNumber()">��  
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
											</SELECT>��  
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
											</SELECT>��  
			<input type=radio Name=SolarLunarStatus value=1 checked>���  
			<input type=radio Name=SolarLunarStatus value=2 >����  
			  
									</font></td>  
								</tr>  

								<TR>
					  <TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT 
						class=c6>*</FONT>&nbsp;<FONT class=c5>��ȥ����</FONT></TD>
					  <TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><FONT 
						class=c5><INPUT type=radio CHECKED value=1 name=ismarry>��ȥ <INPUT 
						type=radio value=2 name=ismarry>��ȥ</FONT> </TD>
						</TR>

						<tr>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>�� ��</FONT></TD>
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2>
										<input size=55 name=Address value="" onFocus="javascript:Action.focus();" CLASS=txtfld>
										<Input size=38 type=hidden name=AddressHidden value="" CLASS=txtfld>
										<input type="button" value="�ּ�ã��" name="Action" onClick="FindAddress()"  class="button"> 
									</td> 
								</tr> 


								<tr>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>��ȭ��ȣ</FONT></TD>
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><FONT class=C5> 
									<input  style="FONT-SIZE: 12px"name=Phone size=4 MaxLength=4 value="" CLASS=txtfld OnKeypress="onlyNumber()">   
									- <input  style="FONT-SIZE: 12px"name=Phone2 size=4 MaxLength=4 value="" CLASS=txtfld OnKeypress="onlyNumber()"> - <input  style="FONT-SIZE: 12px"name=Phone3 size=4 MaxLength=4 value="" CLASS=txtfld OnKeypress="onlyNumber()"></font>
									<FONT class=c5><INPUT type=radio CHECKED value=1 name=whereTel1>���� 
																<INPUT type=radio value=2 name=whereTel1>����</font>
									</td>  
									</tr>  
									  
									<tr>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25>&nbsp;&nbsp;<FONT class=c5>�޴���</FONT></TD>
									</td>  
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><FONT class=C5>  
									<input  style="FONT-SIZE: 12px"name=HandPhone size=4 MaxLength=4 value="" CLASS=txtfld OnKeypress="onlyNumber()">   
									- <input  style="FONT-SIZE: 12px"name=HandPhone2 size=4 MaxLength=4 value="" CLASS=txtfld OnKeypress="onlyNumber()"> - <input  style="FONT-SIZE: 12px"name=HandPhone3 size=4 MaxLength=4 value="" CLASS=txtfld OnKeypress="onlyNumber()"></font>  
									</td>  
								</tr>  

								<tr> 
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>�� ��</FONT></TD>
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2>
										<SELECT NAME="Profession"> 
											<option value="">������ �����ϼ���.</option>  
											<option value="���б� ����">���б� ����</option> 
											<option value="����л�">����л�</option> 
											<option value="����(��)��">����(��)��</option> 
											<option value="�繫��">�繫��</option> 
											<option value="�����">�����</option> 
											<option value="����/�Ǹ���">����/�Ǹ���</option> 
											<option value="������">������</option> 
											<option value="������� ������">������� ������</option> 
											<option value="�Ƿ���">�Ƿ���</option> 
											<option value="���/�����">���/�����</option> 
											<option value="������">������</option> 
											<option value="������">������</option> 
											<option value="����/������">����/������</option> 
											<option value="������">������</option> 
											<option value="�� ��">�� ��</option> 
											<option value="�ڿ���">�ڿ���</option> 
											<option value="��/��/�����">��/��/�����</option> 
											<option value="������">������</option> 
											<option value="����/����">����/����</option> 
											<option value="�񿵸���ü">�񿵸���ü</option> 
											<option value="�� ��">�� ��</option> 
											<option value="�� ��">�� ��</option> 
											<option value="�� Ÿ">�� Ÿ</option> 
										</SELECT> 
										&nbsp; 
										 
										 
										</td> 
								</tr> 
								
								
								
								
								

								<tr>  
									<TD style="PADDING-LEFT: 6px" bgColor=#f3f2f2 height=25><FONT class=c6>*</FONT>&nbsp;<FONT class=c5>E-Mail</FONT></TD>
									<TD style="PADDING-LEFT: 4px" bgColor=white colSpan=2><input type="text" name="MainEmail" size="25" maxlength="40" Value=""><FONT class=c3><FONT color=#47b3b7>   
									  ��)redmaster@oyesmall.net</FONT></FONT></td> 
								</tr> 
							</Table>  
							</div>  
					</td>  
					</tr>  
					
				</table> </TD>
				
				</TR></TBODY></TABLE>
				<BR>
				<Div align=center>
				<input type="button" value="ȸ������ " name="EndOfForm" ID="EndOfForm" onClick="ValidCheck()" class="button"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="�ٽ��ۼ�" name="B1"  class="button">
				</Div></Form><!------main_end-----------------><!--------------bottom------------>
			

<Center><!--#include file="../shop/main_shopbottom.asp"--><BR><BR><!-- �ϴ� Copyright �� --></CENTER></BODY></HTML>