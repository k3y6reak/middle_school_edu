<!---#include file="../admin/dbconn.asp"--->

<HTML><HEAD><TITLE>OyesMall 에 오신것을 환영합니다</TITLE>
<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>
<SCRIPT language=javascript src="../shop_file/cat_over.js"></SCRIPT>

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
					//	if ( document.write.email.value == "" ) 
					//		{
					//			alert("E-Mail 주소를 기입해 주세요 ^^");
					//			document.write.email.focus();
					//			return false;
					//		}
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
						if ( document.write.pwd.value == "" ) 
							{
								alert("이글의 수정과 삭제시 필요하므로 비밀번호를 기입해 주세요 ^^");
								document.write.pwd.focus();
								return false;
							}
					
						if ( document.write.file_up.value == "" ) 
							{
							//	alert("파일을 선택하세요.");
							//	document.write.file_up.focus();
							//	return false;
							}
						else
						{
							if(document.write.file_up.value.indexOf(".jpg") == -1 &&
							   document.write.file_up.value.indexOf(".hwp") == -1 &&
   							   document.write.file_up.value.indexOf(".html") == -1 &&
							   document.write.file_up.value.indexOf(".pdf") == -1 &&
							   document.write.file_up.value.indexOf(".jpeg") == -1 &&
							   document.write.file_up.value.indexOf(".txt") == -1 
							   ) {
								alert("첨부가능한 확장자는 jpg, hwp, pdf, jpeg, txt만 가능합니다.");
								return false;
								}
						}
								
						
				document.write.submit();
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
//-->
		</Script>

<style>
		
		.button { background-color:#7BE3FF; border:solid 1 #333333; font-family:Tahoma,Verdana; font-size:9pt; color:#000000;width:15%;}
		
</style>
<!--#include file="../shop_about/about_top.asp"-->
<center>
  <table width="747" border="0" cellspacing="0" cellpadding="0">
    <tr>
       <!--#include file="../shop/shop_left.asp"-->
      <td valign="top" align="center">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	
          <tr>
              <td><img src="../shop_image/board.gif" width="148" height="26"></td>
           
          </tr>
       
        </table>
        
	<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
		<Tbody>
			<TR>
				<TD align=center><img src="../shop_image/n_list_top.gif" border=0></TD>
			</TR>
		</Tbody>
	</Table>
	<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
	<Form name=write action="./shop_board_write_ok.asp" method="POST" enctype="multipart/form-data">
			<input type=hidden name=num value="<%=Request("num")%>">
			<input type=hidden name=ref value="<%=Request("ref")%>">
			<input type=hidden name=r_step value="<%=Request("r_step")%>">
			<input type=hidden name=reforder value="<%=Request("reforder")%>">
			<TBODY>
			<TR background="../shop_image/trgb.gif">
				<TD align=middle   background="../shop_image/trgb.gif" height=25 align=center colspan=2><FONT 
				  color=#ffffff><B><% IF Request("num") <>""  Then%>답변하기<%Else%>글쓰기<%End IF%></B></FONT></TD>
			</TR>
			<TR>
				<TD align=center width=30>&nbsp;</TD>
				<TD align=center>
					<TABLE cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
						<Tbody>
						<TR>
							<TD width=120 >&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;작성자</B></TD>
							<TD  >
								<INPUT maxLength=40 size=15 name=name > </TD>
						</TR>
						
						<TR>
							<TD >&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;E-Mail</B></TD>
							<TD>
								<INPUT maxLength=40 size=40 name=email > </TD>
						</TR>
						<TR>
							<TD  >&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;Homepage</B></TD>
							<TD>
								<INPUT maxLength=40 size=40 name=home value="http://"> </TD>
						</TR>
						<TR>
							<TD  >&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;제 목</B></TD>
							<TD>
								<INPUT maxLength=40 size=20 name=title style="WIDTH: 80%"  > </TD>
						</TR>
						<TR>
							<TD >&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;내 용</B></TD>
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
								<TEXTAREA class=minput style="WIDTH: 100%" name=content rows=12 wrap=hard cols=60></TEXTAREA> 
							</TD>
						</TR>
						
						<tr>
						<TD>&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;파일첨부</B></TD>
						<td align="left" >
						<input type="file" name="file_up" style="color:slategray;border:1 solid silver;width:200; height:20"> (최대 4M)</td>
						</tr> 

						<TR>
							<TD>&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;Tank</B></TD>
							<TD> <SELECT style="BACKGROUND: #5A758C; COLOR: #ffffff" size=1 name=tank> 
											<OPTION value="" selected>선 택</OPTION>
											<OPTION value=cha_bg01.gif >카타펄트</OPTION>
											<OPTION value=cha_bg02.gif >크로스보우</OPTION>
											<OPTION value=cha_bg03.gif >캐논</OPTION>
											<OPTION value=cha_bg04.gif >캐롯탱크</OPTION>
											<OPTION value=cha_bg05.gif >듀크탱크</OPTION>
											<OPTION value=cha_bg06.gif >마인랜더</OPTION>
											<OPTION value=cha_bg07.gif >미사일</OPTION>
											<OPTION value=cha_bg08.gif >멀티미슬</OPTION>
											<OPTION value=cha_bg09.gif >레이저탱크</OPTION>
											<OPTION value=cha_bg10.gif >아이온어태커</OPTION>
											<OPTION value=cha_bg11.gif >세크윈드</OPTION>
											<OPTION value=cha_bg12.gif >포세이돈</OPTION>
											<OPTION value=cha_bg13.gif >슈퍼탱크</OPTION></TD>
						</TR>
						<TR>
							<TD >&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;비밀번호</B></TD>
							<TD>
								<INPUT maxLength=10 size=13 name=pwd type=password > </TD>
						</TR>
						
						<TR>
							<TD colspan=2>&nbsp;</TD>
						</TR>
						</Tbody>
					</Table>
				</TD>
			</TR>
			<Tr>
					<Td Align=center colspan=2><img src="../shop_image/bottom_bar.gif" border=0></TD>
			</TR>
			<Tr >
					<Td Align=center colspan=2>&nbsp;</TD>
			</TR>

			<Tr>
					<Td Align=center colspan=2><Input type=button value=Submit onclick="write_ok();" class=button>&nbsp;&nbsp;<Input type=Reset value=Reset  class=button>
								</TD>
			</TR>
			</Tbody>
			</Form>
	</Table>
	<BR>
      </td>
    </tr>
  </table>
  <!--#include file="../shop/main_shopbottom.asp"-->
</center>
</body>
</Html>
