

<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->
<%

	Num = Request("Num")
	page = Request("page")

	Sql = "Select * From goods Where Num="&Num

	Set Rs = Server.CreateObject("ADODB.RecordSet")

	Rs.Open Sql , Db

	feature = RS("feature")
	
	content = RS("content")
	'content = ">"&content
	content = Replace(content,chr(13)&chr(10),chr(13)&chr(10))
	
%>


<html>
<head>
<title>◇ ◆ OyesMall Goods Edit_Page◆ ◇</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">

				<Script Language="JavaScript">
				<!--
				function edit_ok() 
					{
						if ( document.good_re.ca1.value == "" ) 
							{
								alert("대분류 카테고리를 쓰셔야죠 ^^");
								document.good_re.ca1.focus();
								return false;
							}
						if ( document.good_re.ca2.value == "" ) 
							{
								alert("중분류 카테고리를 쓰셔야죠 ^^");
								document.good_re.ca2.focus();
								return false;
							}
						if ( document.good_re.ca3.value == "" ) 
							{
								alert("소분류 카테고리를 쓰셔야죠 ^^");
								document.good_re.ca3.focus();
								return false;
							}
						if ( document.good_re.g_name.value == "" ) 
							{
								alert("상품명을 쓰셔야죠 ^^");
								document.good_re.g_neme.focus();
								return false;
							}
						if ( document.good_re.g_com.value == "" ) 
							{
								alert("제조회사는 어디에요? ^^");
								document.good_re.g_com.focus();
								return false;
							}
						if ( document.good_re.or_p.value == "" ) 
							{
								alert("상품에 가격도 없어요? ^^");
								document.good_re.or_p.focus();
								return false;
							}
						if ( document.good_re.point.value == "" ) 
							{
								alert("Point 점수는 얼마에요..? ^^");
								document.good_re.point.focus();
								return false;
							}
						
						if ( document.good_re.r_ea.value == "" ) 
							{
								alert("상품의 재고량은 얼마나 있나요? ^^");
								document.good_re.r_ea.focus();
								return false;
							}
						
						if ( document.good_re.feature.value == "" ) 
							{
								alert("상품에 대한 요약 설명이 있어야죠..^^");
								document.good_re.feature.focus();
								return false;
							}
						if ( document.good_re.content.value == "" ) 
							{
								alert("상품의 상세설명도 기입해 주세요 ^^");
								document.good_re.content.focus();
								return false;
							}
								
						
				document.good_re.submit();
				}
				//-->
		</Script>
</head>

<body bgcolor="#ffffff" text="#000000" leftMargin=0  topMargin=0 marginwidth="0" marginheight="0">
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
						<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B>등록 상품 수정</B></FONT>
						</TD>
						<TD align=middle width=150 bgColor=#222222>
							<FONT face=돋움 ><B>상품 관리</B></FONT>
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
					OyesMall에 등록된 상품을 수정하는 페이지 입니다. 
				</TD>
			</TR>
		</TBODY>
	</TABLE>
<BR>
	<Div align=center>

	<Table width="98%" cellSpacing="1" cellPadding="0" border="0" bgcolor="#4A494A">
		<TR>
			<TD>
	<Form name=good_re action="./goods_edit_ok.asp?page=<%=page%>" method=post enctype="multipart/form-data">

	<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" bgcolor="#000000">
		<INPUT type=hidden value="<%=num%>" name=num>
		<input type=hidden value="<%=page%>" name=page>
	
	
		<TBODY>

		<TR>
			<TD width=120 bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">상품 카테고리</B></TD>
			<TD>&nbsp;<INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:15%;background:#C5C5C5" name=ca1 value="<%=RS("ca1")%>"readonly>&nbsp;-&nbsp;<INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:15%;background:#C5C5C5" name=ca2 value="<%=RS("ca2")%>"readonly>&nbsp;-&nbsp;<INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:15%;background:#C5C5C5" name=ca3 value="<%=RS("ca3")%>"readonly>&nbsp;&nbsp;상품의 카테고리는 변경할 수 없습니다. </TD>
		</TR>

		<TR>
			<TD  bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">상품코드</B></TD>
			<TD>&nbsp;<INPUT type=text value="<%=RS("g_code")%>" maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:30%;background:#C5C5C5" name=g_code readonly>&nbsp;&nbsp;상품코드는 변경할 수 없습니다. </TD>
		</TR>

		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">상품명</B></TD>
			<TD>&nbsp;<INPUT maxLength=30  name=g_name type=text value="<%=RS("g_name")%>" style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:30%;background:#C5C5C5"> </TD>
		</TR>
		
		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">제조회사</B>
			</TD>
			<TD>&nbsp;<INPUT maxLength=20 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:30%;background:#C5C5C5" name=g_com type=text value="<%=RS("g_com")%>"></TD>
		</TR>
		
		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">판매가</B></TD>
			<TD>&nbsp;<INPUT maxLength=8 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:10%;background:#C5C5C5"  name=or_p type=text value="<%=RS("or_p")%>">&nbsp;원</TD>
		</TR>
		
		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">적립금</B></TD>
			<TD>&nbsp;<INPUT maxLength=20 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:10%;background:#C5C5C5"  name=point type=text value="<%=RS("point")%>">&nbsp;원 </TD>
		</TR>

		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">제품색상</B></TD>
			<TD>&nbsp;<INPUT maxLength=20 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:20%;background:#C5C5C5"  name=color type=text value="<%=RS("color")%>"> </TD>
		</TR>
		
		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">재고수량</B></TD>
			<TD>&nbsp;<INPUT maxLength=20 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:10%;background:#C5C5C5"  name=r_ea type=text value="<%=RS("r_ea")%>"> </TD>
		</TR>
		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">추 천</B></TD>
			<TD><INPUT type=checkbox name=Best_Choice value=1 <%IF RS("best_choice") = "1" Then%>Checked<%End IF%>>Best Choice&nbsp;&nbsp;
						<INPUT type=checkbox name=Weekly_Best value=1 <%IF RS("Weekly_Best") = "1" Then%>Checked<%End IF%>>Weekly Best&nbsp;&nbsp;
						<INPUT type=checkbox name=m_choice value=1 <%IF RS("m_choice") = "1" Then%>Checked<%End IF%>>Main Today Choice&nbsp;&nbsp;
						<INPUT type=checkbox name=choice value=1 <%IF RS("choice") = "1" Then%>Checked<%End IF%>>Today Choice&nbsp;&nbsp;
						<INPUT type=checkbox name=event value=1 <%IF RS("event_2") = "1" Then%>Checked<%End IF%>>Event&nbsp;&nbsp;
						<BR><BR>&nbsp;<B><Font color=green>*</Font>&nbsp;Best Choice :</B>&nbsp;Main 페이지의 Best Choice 상품으로 등록됩니다. 
					<BR>&nbsp;<B><Font color=green>*</Font>&nbsp;Weekly Best :</B>&nbsp;해당 카테고리 페이지에서 Weekly Best 상품으로 등록됩니다.
					<BR>&nbsp;<B><Font color=green>*</Font>&nbsp;Main Today Choice :</B>&nbsp;Main 페이지의 Today Choice 상품으로 등록됩니다.
					<BR>&nbsp;<B><Font color=green>*</Font>&nbsp;Today Choice :</B>&nbsp;해당 카테고리 페이지에서 Today Choice 상품으로 등록됩니다.
					<BR>&nbsp;<B><Font color=green>*</Font>&nbsp;Event :</B>&nbsp;해당 카테고리 페이지에서 Event 상품으로 등록됩니다.
					<BR>&nbsp;<font color=orange>(어떤것도 선택하지 않으면 그 상품은 해당 카테고리 상품으로만 남아 있습니다.)</font></TD>
		</TR>
		
		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">그림파일</B></TD>
			<TD>
				<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="100%" bgColor=#efefef borderColorLight=#999966 border=1>
					<TBODY>
					<TR>
						<TD align=left width=100>&nbsp;기준 이미지</TD>
						<TD><INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100%;background:#C5C5C5" maxLength=90   name=sphoto type=file ></TD>
						<!--oyesmall은 업로드할때는 삭제--->
					</TR>
        
					<TR>
						<TD align=left width=100 >&nbsp;확대 이미지</TD>
						<TD> <INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100%;background:#C5C5C5"  maxLength=90   name=bphoto type=file ></TD>
						<!--oyesmall은 업로드할때는 삭제--->
					</TR>

					<TR>
						<TD align=left width=100 >&nbsp;상세 이미지</TD>
						<TD> <INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100%;background:#C5C5C5"  maxLength=90  name=cphoto type=file ></TD>
						<!--oyesmall은 업로드할때는 삭제--->
					</TR>
					</TBODY>
				</TABLE>
				<BR><B>&gt;&gt; 기준이미지: </B>&nbsp;&nbsp;&nbsp;상품리스트에 보여주는 이미지이며, <B>180*180 
				 PIXEL(10kb이하)</B>을 권장합니다.
      
				<BR><B>&gt;&gt; 확대이미지: </B>&nbsp;&nbsp;&nbsp;상품의 상세설명에  출력되는  큰사이즈의 이미지입니다.
				<BR><B>&gt;&gt; 상세이미지: </B>&nbsp;&nbsp;&nbsp;상품의 상세설명에	출력되는 특정부분의 확대
				이미지입니다.
			</TD>
		</TR>
		</Tbody>
		</Table>
		</TD>
		</TR>
		</Table>
		<BR>
		<Table width="98%" cellSpacing="1" cellPadding="0" border="0" bgcolor="#4A494A">
		<TR>
			<TD>
		<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" bgcolor="#000000">
			<Tbody>

		
		
		<TR>
			<TD bgcolor="#4A494A" width=120>
				<IMG src="../image/icon_orange.gif">상품요약설명</B></TD>
			<TD><INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:90%;;background:#C5C5C5"  name=feature type=text value="<%=feature%>"> </TD>
		</TR>
		
		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">상품설명</B></TD>
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

				&nbsp;<TEXTAREA class=minput style="OVERFLOW: auto;WIDTH: 99%;background:#C5C5C5" name="content" rows=12 wrap=hard cols=60 style="font-size:9pt;color:#000000;border:1 solid #366670;width:95%" name=content ><%=content%></TEXTAREA> 
			</TD>
		</TR>
		</TBODY>
	</TABLE>

	</TD>
	</TR>
	</Table>
	<BR>
	<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="1">
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
		<TBODY>
			<TR>
				<TD >
					<TABLE height=26 cellSpacing=0 cellPadding=0 width="100%"  border=0>
						<TBODY>
							<TR>
								<TD align=middle height=40><INPUT   type=button value="정보변경" Onclick="edit_ok();" style="width:15%;" class=button2> 
									<INPUT  type=reset value=다시쓰기 style="width:15%;" class=button2> 
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
	</FORM>

	</Div>
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
	RS.Close
	Db.Close

	Set RS = Nothing
	Set Db = Nothing
	
%>
