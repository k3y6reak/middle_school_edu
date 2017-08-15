
<!---#include file="../admin/dbconn.asp"--->

<%
	
	
	sql = "select user_id,name,postdate from members where user_id='" & request("user_id") & "'"
	Set rs = Server.CreateObject("ADODB.RecordSet")
	rs.Open sql,db
%>
<html>

<head>

<title>OyesMall ID 중복검사</title>
<style>
 <!--
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

.button3{
		height:20;padding-top:1pt ;BORDER-RIGHT: #000000 1px solid;Font-family:"Tahoma"; BORDER-TOP: #000000 1px solid; FONT-SIZE: 12px; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid; background-color:#F75552; FONT-FAMILY: tahoma,arial ;color:#ffffff ; border-color:#F75552
}

</STYLE>

</head>
	
<%if (rs.EOF or rs.BOF) then%>
<body bgcolor="#3187BD">

<div align="center">
	<center>
	<table border="0" width="310" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
		<tr>
			<td width="12" align="left" valign="top"><img border="0" src="./login.files/signup_tl.gif" width="12" height="13"></td>
			<td width="519">　</td>
			<td width="13" align="right" valign="top">
				<p align="right"><img border="0" src="./login.files/signup_tr.gif" width="12" height="13"></td>
		</tr>
		<tr>
			<td width="12">　</td>
			<td>
				<p align="center"><img border="0" src="./login.files/idcheck_ok1.gif" align="middle" width="125" height="19">&nbsp; 
				<img border="0" src="./login.files/idcheck_ok2.gif" width="41" height="42">
				<p align="center">
				<font color="green"><%=request("user_id")%></font>는 사용할 수 있는 아이디입니다.
				
				<form id=form1 name=form1><center>
				<p align="center"><input type="button" value="신청하기" name="B1" OnClick="window.close()" class="button2"></p>
				</form></center>
			</td>
			<td width="13">　</td>
		</tr>
		<tr>
			<td width="12" valign="bottom" align="left"><img border="0" src="./login.files/signup_bl.gif" width="12" height="13"></td>
			<td width="519">　</td>
			<td width="13" valign="bottom" align="right">
				<p align="right"><img border="0" src="./login.files/signup_br.gif" width="12" height="13"></td>
		</tr>
<%else%>
<body bgcolor="#F55757">

<div align="center">
	<center>
	<table border="0" width="310" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" height="139">
		<tr>
			<td width="12" align="left" valign="top"><img border="0" src="./login.files/idcheck_no_tl.gif" width="12" height="12"></td>
			<td width="519" valign="top">　</td>
			<td width="13" align="right"  valign="top">
				<p align="right"><img border="0" src="./login.files/idcheck_no_tr.gif" width="12" height="12"></td>
		</tr>
		<tr>
			<td width="12">　</td>
			<td>
				<p align="center"><img border="0" src="./login.files/idcheck_no1.gif" align="middle" width="126" height="19">&nbsp; 
				<img border="0" src="./login.files/idcheck_no2.gif" width="33" height="37">
				<p align="center"><font color="green"><%=request("user_id")%></font>는 이미 사용하고 있는 아이디입니다.
				<form><center>
				<p align="center"><input type="button" value="다시검색" name="B1" OnClick="window.close()" class="button3"></p>
				</form></center>
			</td>
			<td width="13">　</td>
		</tr>
		<tr>
			<td width="12" valign="bottom" align="left"><img border="0" src="./login.files/idcheck_no_bl.gif" width="12" height="12"></td>
			<td>　</td>
			<td valign="bottom" align="right">
				<p align="right"><img border="0" src="./login.files/idcheck_no_br.gif" width="12" height="12"></td>
		</tr>

<%end if
%>
	</table> 
	</div> 
</center> 
 
</body> 
 
</html> 
