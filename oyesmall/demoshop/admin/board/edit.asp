


<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->

<%

	Num = Request("Num")
	page = Request("page")

	
	
	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Sql = "Select * From Board Where Num="&Num

	

	Rs.Open Sql , Db


	
	
	

%>
<html>
<head>
<title>◇ ◆ OyesMall Board◆ ◇</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">

				<Script Language="JavaScript">
				<!--
				function write_ok() 
					{
						
						if ( document.write.name.value == "" ) 
							{
								alert("작성자를 쓰셔야죠 ^^");
								document.write.name.focus();
								return false;
							}
						 if (!check_mail(document.write.email))
							{
										alert('메일주소가 형식에 맞지 않습니다.');
										document.write.email.focus();
										return false; 
							}
						
						if ( document.write.title.value == "" ) 
							{
								alert("이글의 제목을 써 주세요 ^^");
								document.write.title.focus();
								return false;
							}
						if ( document.write.content.value == "" ) 
							{
								alert("내용을 써 주세요 ^^");
								document.write.content.focus();
								return false;
							}
						if ( document.write.tank.value == "" ) 
							{
								alert("탱크를 골라 주세요 ^^");
								document.write.tank.focus();
								return false;
							}
						
						
								
						
				document.write.submit();
				}

				function check_mail(cg) {
	emailEx1 = /[^@]+@[A-Za-z0-9_\-]+\.[A-Za-z]+/;
	emailEx2 = /[^@]+@[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z]+/;
	emailEx3 = /[^@]+@[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z0-9_\-]+\.[A-Za-z]+/;

	if(emailEx1.test(cg.value)) return true;
	if(emailEx2.test(cg.value)) return true;
	if(emailEx3.test(cg.value)) return true;

	return false;
}
				//-->
		</Script>
</head>

<body bgcolor="#000000" text="#000000" leftMargin=0  topMargin=0 marginwidth="0" marginheight="0">
<!--#include file="../main_top.asp"-->
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 bgcolor=#000000>
	<TBODY>
  <tr>
    <td>&nbsp;</td>
  </tr></TBODY>
</table>
<table width="100%" border="0" height="90%" bgcolor=#000000>
  <tr>
    <td height="100%" width="17%" valign=top>
      <!--#include file="../goods/admin_left.asp" -->
    </td>
    <td height="100%" width="83%" valign=top>
	<!----list start---->
				
		<table width="100%" border="0" bgcolor="#000000">
		<TBODY>
		<TR>
			<TD>
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
					<TBODY>
					<TR height=25>
						<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B>게시판(Edit)</B></FONT>
						</TD>
						<TD align=middle width=150 bgColor=#222222>
							<FONT face=돋움 ><B>OPERATION</B></FONT>
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
				
				<TD vAlign=top align=left>&nbsp;&nbsp;
					OyesMall의 게시판에 글을 올리는 페이지입니다. 
				</TD>
			</TR>
		</TBODY>
	</TABLE>
	<BR>
<Div align=center>

	
	<TABLE cellSpacing=0 cellPadding=0 width="99%" border=1 bordercolor="#4A494A">
		<Form name=write action="./edit_ok.asp" method=post >
			<input type=hidden name=num value="<%=num%>">
		<TBODY>
		<TR>
			<TD>
				<Table width="100%" cellSpacing="0" cellPadding="3" border="0">
					<TR>
						<TD width=120 bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">작성자</B></TD>
						<TD>
							<INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100px;background:#C5C5C5"  name=name value="<%=Rs("name")%>"> </TD>
					</TR>
					<TR>
						<TD bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">E-Mail</B></TD>
						<TD>
							<INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:200px;background:#C5C5C5" name=email value="<%=Rs("email")%>"> </TD>
					</TR>
					<TR>
						<TD bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">Homepage</B></TD>
						<TD>
							<INPUT maxLength=40  style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:200px;background:#C5C5C5" name=home value="<%=Rs("home")%>"> </TD>
					</TR>
					<TR>
						<TD bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">제 목</B></TD>
						<TD>
							<INPUT maxLength=40  name=title style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:90%;background:#C5C5C5"  value="<%=Rs("title")%>"> </TD>
					</TR>
					<TR>
						<TD bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">내 용</B></TD>
						<TD>
							<TABLE cellSpacing=0 cellPadding=0 border=0>
								<TBODY>
									<TR>
										<TD><INPUT type=radio value="text" name="coding" <% IF RS("coding")="text" then%> checked<%end if%>>TEXT
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<INPUT type=radio value="html" name="coding" <% IF RS("coding")="html" then%>checked<%end if%>>HTML
										</td>
									</TR>
								</TBODY>
							</TABLE>
							<TEXTAREA style="OVERFLOW: auto;WIDTH: 100%;background:#C5C5C5" name="content" rows=12 wrap=hard cols=60 style="font-size:9pt;color:#000000;border:1 solid #366670;width:100%"><%=Rs("content")%></TEXTAREA> 
						</TD>
					</TR>
					<TR>
										<TD bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">Tank</B></TD>
										<TD> <SELECT  size=1 name=tank style="WIDTH: 100px;background:#C5C5C5"> 
														
				<OPTION value=cha_bg01.gif <%IF RS("tank") ="cha_bg01.gif" Then%>Selected <%end if%>>카타펄트</OPTION>
				<OPTION value=cha_bg02.gif <%IF RS("tank") ="cha_bg02.gif" Then%>Selected <%end if%>>크로스보우</OPTION>
				<OPTION value=cha_bg03.gif <%IF RS("tank") ="cha_bg03.gif" Then%>Selected <%end if%>>캐논</OPTION>
				<OPTION value=cha_bg04.gif <%IF RS("tank") ="cha_bg04.gif" Then%>Selected <%end if%>>캐롯탱크</OPTION>
				<OPTION value=cha_bg05.gif <%IF RS("tank") ="cha_bg05.gif" Then%>Selected <%end if%>>듀크탱크</OPTION>
				<OPTION value=cha_bg06.gif <%IF RS("tank") ="cha_bg06.gif" Then%>Selected <%end if%>>마인랜더</OPTION>
				<OPTION value=cha_bg07.gif <%IF RS("tank") ="cha_bg07.gif" Then%>Selected <%end if%>>미사일</OPTION>
				<OPTION value=cha_bg08.gif <%IF RS("tank") ="cha_bg08.gif" Then%>Selected <%end if%>>멀티미슬</OPTION>
				<OPTION value=cha_bg09.gif <%IF RS("tank") ="cha_bg09.gif" Then%>Selected <%end if%>>레이저탱크</OPTION>
				<OPTION value=cha_bg10.gif <%IF RS("tank") ="cha_bg10.gif" Then%>Selected <%end if%>>아이온어태커</OPTION>
				<OPTION value=cha_bg11.gif <%IF RS("tank") ="cha_bg11.gif" Then%>Selected <%end if%>>세크윈드</OPTION>
				<OPTION value=cha_bg12.gif <%IF RS("tank") ="cha_bg12.gif" Then%>Selected <%end if%>>포세이돈</OPTION>
				<OPTION value=cha_bg13.gif <%IF RS("tank") ="cha_bg13.gif" Then%>Selected <%end if%>>슈퍼탱크</OPTION></TD>
									</TR>
					<TR>
						<TD bgColor="#4A494A">
							<IMG src="../image/icon_orange.gif">비밀번호</B></TD>
						<TD>
							<INPUT maxLength=10 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100px;background:#C5C5C5"  name=pwd type=password> </TD>
					</TR>
				</Table>
			</TD>
		</TR>
		</Tbody>
	</Table>
	<BR>


	
					<TABLE height=26 cellSpacing=0 cellPadding=0 width="99%" border=0>
						<TBODY>
							<TR>
								<TD align=middle ><INPUT style="width:80px;" class=button2  type=button value="Submit" name=action onclick="write_ok();" >&nbsp;&nbsp; 
									<INPUT id=reset1 style="width:80px;" class=button2 type=reset value=Reset >&nbsp;&nbsp;<INPUT style="width:80px;" class=button2 type=button value="List" name=action Onclick="javascript:window.location.href='./list.asp'"> 
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				
	</FORM>

	
</div>


	
	<!----list End------>
	</td>
  </tr>

  <tr>
	<td>&nbsp;</td>
  </tr>
  
</table>

<!---#include file="../down.inc"-->

</BODY>
</HTML>
<%
	Db.Close

	Set Db = Nothing
	
%>