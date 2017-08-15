
<!---#include file="../admin/dbconn.asp"--->
<% 
Response.Expires = 0
Dong = trim(request("Dong")) 

%>
<script language=javascript>
function CatchEnter(nType)
{
	if(event.keyCode == 13)
	{
		if (nType == 0)
		{
			document.PostForm.Action.value = "주소찾기";
			PostForm.submit();
		}
		else if (nType == 1 )		//완료 메시지
		{
			CompleteSearch();
		}
	}
}
</script>

<script language="JavaScript">

function CompleteSearch	()
{
	if  (document.PostForm.HouseNumber.value != "")
	{
		nIndex = document.PostForm.SelectAddress.selectedIndex;
		addressHidden = document.PostForm.SelectAddress.options[nIndex].value + "," + document.PostForm.HouseNumber.value;
		address = document.PostForm.SelectAddress.options[nIndex].text + " " + document.PostForm.HouseNumber.value;
		opener.DisplayAddress( address, addressHidden);
		window.close();
	}
	else
	{
		alert("통/반이나 번지를 정확하게 입력해주십시오.");
		document.PostForm.HouseNumber.focus();
	}
}

function SelectAddressandChange()
{
	var strAddress = document.PostForm.SelectAddress[document.PostForm.SelectAddress.selectedIndex].value;
	
//	if ((strAddress.indexOf("∼") != -1) || (strAddress.indexOf("-") != -1)) {
		var strArray;
		strArray = strAddress.split(",");
		strAddress = "[" + strArray[0].substring(0,3) + "-" + strArray[0].substring(3) + "] " + strArray[1] + " " + strArray[2] + " " + strArray[3]
		strAddressHidden = strArray[0] + "," + strArray[1] + "," + strArray[2] + "," + strArray[3] + "," + strArray[4] + ",,,"
		strHouseNumber = strArray[4] + " ";

		document.PostForm.SelectAddress[document.PostForm.SelectAddress.selectedIndex].text = strAddress;
		document.PostForm.SelectAddress[document.PostForm.SelectAddress.selectedIndex].value = strAddressHidden;
		document.PostForm.HouseNumber.value = strHouseNumber;
//	}
	ShowConfirmButton();
}

function ShowConfirmButton()
{
	var IE4 = (document.all) ? true : false;
	var NS4 = (document.layers) ? true : false;

	if (IE4 == true)
	{
		if (document.all("HouseNumber") != null)
		{
			var strTmp = document.PostForm.HouseNumber.value;

			if (strTmp == "")
			{
				document.PostForm.HouseNumber.focus();
			}
		}
	}
	else
	{
		var strTmp = document.PostForm.HouseNumber.value;

		if (strTmp == "")
		{
			document.PostForm.HouseNumber.focus();
		}
	}
}

function MoveFocus()
{
	var IE4 = (document.all) ? true : false;
	var NS4 = (document.layers) ? true : false;

	var strTmp = document.PostForm.Dong.value;

	if (IE4 == true)
	{
		if (strTmp == "")
		{
			document.PostForm.Dong.focus();
		}
		else if (document.all("SelectAddress") == null)
		{
			document.PostForm.Dong.focus();
		}
		else
		{
			document.PostForm.SelectAddress.focus();
		}
	}
	else
	{
		if (strTmp == "")
		{
			document.PostForm.Dong.focus();
		}
		else
		{
			document.PostForm.SelectAddress.focus();
		}
	}
	return;
}

</script>
<html>

<head>

<title>OyesMall - 주소찾기</title>
<style>
 <!--
  p           { font-size: 12px; font-family: 굴림; text-decoration: none; color: black }
  td           { font-size: 12px; font-family: 굴림; text-decoration: none; color: black }
a:link       { font-size: 12px; font-family: 굴림; text-decoration: none; color: black }
a:visited    { font-size: 12px; font-family: 굴림; text-decoration: none; color: black }
a:hover      { font-size: 12px; text-decoration: blink; color: red }
-->
</style>
<style type="text/css"> 

.button2{
		height:20;padding-top:1pt ;BORDER-RIGHT: #000000 1px solid;Font-family:"Tahoma"; BORDER-TOP: #000000 1px solid; FONT-SIZE: 12px; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; background-color:#3186BD; FONT-FAMILY: tahoma,arial ;color:#ffffff ; border-color:#3186BD
}

</STYLE>
</head>
<body bgcolor="#3187BD" onload="MoveFocus()">

<div align="center">
	<table border="0" width="440" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
		<tr>
			<td width="12" align="left" valign="top"><img border="0" src="./login.files/signup_tl.gif" width="12" height="13"></td>
			<td>　</td>
			<td width="13" align="right" valign="top">
				<p align="right"><img border="0" src="./login.files/signup_tr.gif" width="12" height="13"></td>
		</tr>
		<tr>
			<td width="12">　</td>
			<td>
				<p align="center"><br>
				<font color="#3187BD" size="1">▶</font><b>동/읍/면의 이름을 입력하시고 '주소찾기'를 클릭하세요.<br>
				</b>(예:둔산 또는 창녕읍 또는 홍동면)</p>

<form name="PostForm" method="post" action="findNewaddr.asp">

	<div align="center">
		<table border="0" width="350" cellspacing="0" cellpadding="3">
			<tr>
				<td width="160" align="right">
					<p align="left"><input name="Dong" id="Dong" size="21"  value=""></p>
				</td>
				<input type="hidden" name="Action" value="주소찾기">
				<td width="224"><input type=button onclick=PostForm.submit() value="주소찾기" class=button2 name=button2></td>
			</tr>
		</table>
<% If request("Dong") = "" then %>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
<%else%>
<%
		sqlstr  = "select * from post2 where Dong like '" & Dong & "%' or PostEtc like '" & Dong & "%' order by si" 
		                         
		
		set rs = db.Execute(sqlstr)
	  		
  		if rs.eof then %>
			<br><br><br><br>
			<div align=center><font size=2>
			동 또는 면 이름을 잘못 입력하셨거나 자료가 없습니다.</font><br><br> 
<%		else %>

       			   <div align="center">
					<p align="center"><font color="#3187BD" size="1">▶</font> <font color="#3187BD" size="1"></font>해당주소를
					선택하시고, 나머지 주소를 필히 입력해주십시오.
				</div>
				<div align="center">
					<table border="0" width="350" cellspacing="0" cellpadding="3">
						<tr>
							<td width="342" colspan="2">
								<select name="SelectAddress" id="SelectAddress" onChange = "SelectAddressandChange()">
<% do while not rs.eof  %>

				<option name="selectedIndex" id="selectedIndex" value="<%=rs("postno")%>,<%=rs("si")%>,<%=rs("gu")%>,<%=rs("Dong")%>,<%=rs("postetc")%>">
				[<%=left(rs("postno"),3)%>-<%=right(rs("postno"),3)%>]&nbsp;<%=rs("si")%>&nbsp;<%=rs("gu")%>&nbsp;<%=rs("Dong")%>&nbsp;<%=rs("postetc")%></option>
				
<% rs.movenext
   loop   %>
</select>
						</tr>
						<tr>
							<td width="232"><input name="HouseNumber" id="HouseNumber" size="40" maxlength="40" value=""></td>
							<td width="102"><center><input type="button" ALIGN="center"  name="Confirm" class=button2 value="  완   료  " onClick="CompleteSearch()"></center></td>

						</tr>
					</table>
				</div>
<%		
		db.Close
		set db = nothing
    end if %>

		
				<div align="center">
					　
				</div>
			</td>
<%end if%> 
</form>

			<center>
			<td width="13">　</td>
			</tr>
			<tr>
				<td width="12" valign="bottom" align="left"><img border="0" src="./login.files/signup_bl.gif" width="12" height="13"></td>
				<td>　</td>
				<td width="13" valign="bottom" align="right">
					<p align="right"><img border="0" src="./login.files/signup_br.gif" width="12" height="13"></td>
			</tr>
		</table>
	</div>
</center>

</body>
</html>
