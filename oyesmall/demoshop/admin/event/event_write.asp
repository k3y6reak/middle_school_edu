<!---#include file="../session.asp"---> 

<%
		ea = Request("ea")
		If IsEmpty(ea) then
				ea = 0
		End if
%>




<html>
<head>
<title>◇ ◆ OyesMall Event 상품등록 ◆ ◇</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">
				
		<Script Language="JavaScript">
				<!--
				function write_ok() 
					{
						
						if ( document.banner.cate.value == "0" ) 
							{
								alert("Event 상품의 카테고리를 선택하셔야죠 ^^");
								document.banner.cate.focus();
								return false;
							}
						if ( document.banner.b_name.value == "" ) 
							{
								alert("Event 상품명을 쓰셔야죠 ^^");
								document.banner.b_name.focus();
								return false;
							}
						if ( document.banner.image1.value == "" ) 
							{
								alert("Event 상품의 기준이미지를 선택하셔야죠 ^^");
								document.banner.image1.focus();
								return false;
							}
						
								
						
				document.banner.submit();
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
<table width="100%" border="0" height="83%" bgcolor=#000000>
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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B>신규 Event 상품 등록</B></FONT></TD>
							<TD align=middle width=150 bgColor=#222222><FONT face=돋움><B>상 품 관 리</B></FONT>
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
		 
		 <TD vAlign=top align=left>&nbsp;&nbsp;OyesMall의 Event 상품을 등록하는 곳입니다. 
			<BR></TD>
		
		</TR>
		</TBODY>
	</TABLE>
	<BR>
	<Div align=center>
	<TABLE cellSpacing="0" cellPadding="0" width="99%" border="0">
		<Form name="ABCForm" method=POST action="./event_write.asp">
		<TBODY>
		
		<TR bgColor="#4A494A">
			<TD >
				<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
					<TBODY>
						<TR  height="18">
							<TD align=left ><IMG src="../image/icon_orange.gif"><B>Quantity :</B>&nbsp;&nbsp;&nbsp;<INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:10%;background:#C5C5C5" name=ea value=1>
						<input type="submit"  value="EA"  style="width:40px;" class=button2 >
								
							</TD>
						</TR>
					</TBODY>
				</TABLE>
				</TD>
		</TR>
		</TBODY>
		</Form>
	</TABLE>
	<BR>
	
	
	
	<TABLE cellSpacing="0" cellPadding="0" width="98%" border="0">
		<form name=banner method=post action="./event_write_ok.asp?ea=<%=ea%>" enctype="multipart/form-data">
		<TBODY>
		
		<TR height=25>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif"><B>Category</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<SELECT name=cate style="background:#C5C5C5 ">
					<OPTION value=0>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;선 &nbsp;&nbsp;&nbsp;&nbsp;택</OPTION>
					<OPTION VALUE="men">--Men--</OPTION>
					<OPTION VALUE="women">--Women--</OPTION>
					<OPTION VALUE="kids">--Kids & Baby--</OPTION>
					<OPTION VALUE="home">--Home & Office--</OPTION>
					<OPTION VALUE="electronics">--Electronics--</OPTION>
					<OPTION VALUE="book">--Books & Media--</OPTION>
					<OPTION VALUE="leisure">--Leisure & Sports--</OPTION>
					<OPTION VALUE="hobby">--Hobby--</OPTION>
					<OPTION VALUE="luxury">--Luxury--</OPTION>
				</SELECT>
			</TD>
		</TR>
		<TR>
			<TD  height=10></TD>
		</TR>
		<%For i=1 to int(ea)%>
		<TR>
			<TD>
				<TABLE cellSpacing=0 cellPadding=0 width="100%" border=1 bordercolor="#4A494A">
					  <TBODY>
					 <TR>
							<Td align=center>
							<Table width="100%" cellSpacing="0" cellPadding="3" border="0">
								<TR>
									<TD width=120 bgColor="#4A494A">
										<IMG src="../image/icon_orange.gif"><B><font color=#3366cc><%=i%>.</font></B>&nbsp;Event Name</TD>
									<TD>&nbsp;<INPUT maxLength=40 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:145px;background:#C5C5C5" name=b_name> </TD>
								</TR>

								<TR>
									<TD bgColor="#4A494A">
										<IMG src="../image/icon_orange.gif"><B><font color=#3366cc><%=i%>.</font></B>&nbsp;추 천</TD>
									<TD>&nbsp;<INPUT type=checkbox name=mainimage value=1>Shop Main Image&nbsp;&nbsp;
											<INPUT type=checkbox name=top3 value=1>Top Best 3 Event&nbsp;&nbsp;
											<INPUT type=checkbox name=category_top value=1>Top Main Event&nbsp;&nbsp
											<INPUT type=checkbox name=nomi value=2>Category Top Event<BR><BR>&nbsp;<B>>>&nbsp;Shop Main Image :</B>&nbsp; Main Page의 Top 이미지 입니다.<BR>&nbsp;<B>>>&nbsp;Top Best 3 Event :</B>&nbsp; Main Page의 오른쪽에 위치하는 이벤트 입니다.<BR>&nbsp;<B>>>&nbsp;Top Main Event :</B>&nbsp;카테고리별로 Event 상품중에서 Main 페이지에 오는 상품을 의미합니다.<BR>&nbsp;<B>>>&nbsp;Category Top Event :</B>&nbsp;해당 카테고리의 Main 이미지를 의미 합니다.<BR>&nbsp;<font color=orange>(어떤것도 선택하지 않으면 그 상품은 해당 카테고리의 Enevt 상품으로만 남아 있습니다.)</font></TD>
								</TR>
								
								<TR>
									<TD bgColor="#4A494A">
										<IMG src="../image/icon_orange.gif"><B><font color=#3366cc><%=i%>.</font></B>&nbsp;그림파일</B></TD>
									<TD>
										<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="100%" bgColor=#efefef borderColorLight=#999966 border=1>
											<TBODY>
											<TR>
												<TD align=left width=100>&nbsp;기준 이미지</TD>
												<TD><INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100%;background:#C5C5C5" maxLength=90   name=image1 type=file> </TD>
												
											</TR>
								
											<TR>
												<TD align=left width=100 >&nbsp;확대 이미지</TD>
												<TD> <INPUT style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100%;background:#C5C5C5"  maxLength=90  name=image2 type=file> </TD>
												
											</TR>

											</TBODY>
										</TABLE>
									</TD>
								</TR>
							</Table>

							</TD>
						</TR>
						</Tbody>
					</Table>
				</TD>
			</TR>
			<TR >
				<TD height=20></TD>
			</TR>
		
		
		
		<%next%>
		
		</TBODY>
	</TABLE>
			
	


	</div>
	
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
				<TD align=middle height=40>
					<input type="button" style="width:15%;" class=button2 value="상품등록" onclick="write_ok()">&nbsp;&nbsp;
					<input type="reset"style="width:15%;" class=button2  value="다시쓰기" >
				</td>
			</TR>
		</TBODY>
	
	</Form>
	</Table>
	



	
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






		

