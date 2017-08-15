 
<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->
<%
	c_no = Request("c_no")
	ref = Request("ref")
	ref_n = Request("ref_n")
	lev = Request("lev")
	step1 = Request("step")
	
	s_step = left(step1,4)

	Set Rs = Server.CreateObject("ADODB.Recordset")

	Sql = "select c_title from category where ref="&ref&" and lev=0 "

	Rs.Open Sql, Db, 1
	title_1 = Rs("c_title")
	Rs.Close

	Sql = "select c_title from category where ref="&ref&" and lev=1 and step like '%"&s_step&"%'"
	Rs.Open Sql, Db, 1
	title_2 = Rs("c_title")
	Rs.Close

	Sql = "select c_title from category where ref="&ref&" and lev=2 and c_no="&c_no
	Rs.Open sql, db, 1
	title_3 = Rs("c_title")
	Rs.Close

	
	Set RS = Nothing

	If IsEmpty(g_code) then
				g_code = Year(Date)&Month(DATE)&Day(Date)&Hour(Time)&Minute(Time)&Second(Time)
	End if

'	response.write g_code
'	response.write title_2&"<br>"
'	response.write title_3&"<br>"
'	response.end

%>
<html>
<head>
<title>::::::: OyesMall 신규상품등록 :::::::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">

<Script Language="JavaScript">
				<!--
				function write_ok() 
					{
						
						if ( document.good_re.g_name.value == "" ) 
							{
								alert("상품명을 쓰셔야죠 ^^");
								document.good_re.g_name.focus();
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
						if ( document.good_re.sphoto.value == "" ) 
							{
								alert("기준 이미지가 있어야 상품을 볼수있겠죠 ^^");
								document.good_re.sphoto.focus();
								return false;
							}
						
						if ( document.good_re.bphoto.value == "" ) 
							{
								alert("확대 이미지가 있어야 상품을 자세히 볼수 있겠죠 ^^");
								document.good_re.bphoto.focus();
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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B>신규 상품 등록</B></FONT></TD>
							<TD align=middle width=150 bgColor=#222222><FONT face=돋움 ><B>상 품 관 리</B></FONT>
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
					OyesMall에 상품을 등록하는 페이지 입니다. 
				</TD>
			</TR>
		</TBODY>
	</TABLE>
	<BR>
<Div align=center>

	<Table width="98%" cellSpacing="1" cellPadding="0" border="0" bgcolor="#4A494A">
		<TR>
			<TD>
	<Form name=good_re action="./goods_re_ok.asp" method=post enctype="multipart/form-data">
	

	<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" bgcolor="#000000">
	
	
		<TBODY>
		<TR>
			<TD width=120 bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">상품 카테고리</B></TD>
			<TD>&nbsp;<INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:15%;background:#C5C5C5" name=ca1 readonly value=<%=title_1%>>&nbsp;-&nbsp;
				<INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:15%;background:#C5C5C5" name=ca2 readonly value=<%=title_2%>>&nbsp;-&nbsp;
				<INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:15%;background:#C5C5C5" name=ca3 readonly value=<%=title_3%>> </TD>
		</TR>

		<TR>
			<TD width=120 bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">상품코드</B></TD>
			<TD>&nbsp;<INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:30%;background:#C5C5C5" name=g_code value="<%=g_code%>" readonly>&nbsp;&nbsp;코드번호는 날짜, 시간...으로 자동으로 만들어 줍니다. </TD>
		</TR>

		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">상품명</B></TD>
			<TD>&nbsp;<INPUT maxLength=50 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:30%;background:#C5C5C5" name=g_name> </TD>
		</TR>
		
		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">제조회사</B>
			</TD>
			<TD>&nbsp;<INPUT  style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:30%;background:#C5C5C5" name=g_com maxLength=50></TD>
		</TR>
		
		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">판매가</B></TD>
			<TD>&nbsp;<INPUT maxLength=20 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:10%;background:#C5C5C5"   name=or_p>&nbsp;원</TD>
		</TR>
		
		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">적립금</B></TD>
			<TD>&nbsp;<INPUT maxLength=20 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:10%;background:#C5C5C5"  name=point>&nbsp;원 </TD>
		</TR>

		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">제품색상</B></TD>
			<TD>&nbsp;<INPUT maxLength=50 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:20%;background:#C5C5C5"  name=color> </TD>
		</TR>
		
		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">재고수량</B></TD>
			<TD>&nbsp;<INPUT maxLength=20 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:10%;background:#C5C5C5" name=r_ea> </TD>
		</TR>
		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">추 천</B></TD>
			<TD><INPUT type=checkbox name=Best_Choice value=1>Best Choice&nbsp;&nbsp;
					<INPUT type=checkbox name=Weekly_Best value=1>Weekly Best&nbsp;&nbsp;
					<INPUT type=checkbox name=m_choice value=1>Main Today Choice&nbsp;&nbsp;
					<INPUT type=checkbox name=choice value=1>Today Choice&nbsp;&nbsp;
					<INPUT type=checkbox name="event_2" value=1>Event&nbsp;&nbsp;
					
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
						<TD><INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100%;background:#C5C5C5" maxLength=90 size=60  name=sphoto type=file> </TD>
						
					</TR>
        
					<TR>
						<TD align=left width=100 >&nbsp;확대 이미지</TD>
						<TD> <INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100%;background:#C5C5C5"  maxLength=90 size=60  
							name=bphoto type=file> </TD>
						
					</TR>

					<TR>
						<TD align=left width=100 >&nbsp;상세 이미지</TD>
						<TD> <INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100%;background:#C5C5C5"  maxLength=90 size=60  
							name=cphoto type=file> </TD>
						
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
			<TD>&nbsp;<INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:90%;;background:#C5C5C5"  name=feature> </TD>
		</TR>
		
		<TR>
			<TD bgcolor="#4A494A">
				<IMG src="../image/icon_orange.gif">상품설명</B></TD>
			<TD>
				<TABLE cellSpacing=0 cellPadding=0 border=0>
					<TBODY>
						<TR>
							<TD><INPUT type=radio value="text" name="coding" checked>TEXT
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<INPUT type=radio value="html" name="coding">HTML
							</td>
						</TR>
					</TBODY>
				</TABLE>

				&nbsp;<TEXTAREA class=minput style="OVERFLOW: auto;WIDTH: 99%;background:#C5C5C5" name="content" rows=12 wrap=hard cols=60 style="font-size:9pt;color:#000000;border:1 solid #366670;width:95%"  ></TEXTAREA> 
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
								<TD align=middle height=40><INPUT style="width:15%;" class=button2  type=button value="상품 등록" onclick="write_ok()">&nbsp;&nbsp; 
									<INPUT style="width:15%;" class=button2 type=reset value=다시쓰기 > 
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
	Db.Close

	Set Db = Nothing
%>
