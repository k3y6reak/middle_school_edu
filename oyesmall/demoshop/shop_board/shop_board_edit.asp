<!---#include file="../admin/dbconn.asp"--->
<%

	Num = Request("Num")
	page = Request("page")

	
	
	Set RS_B = Server.CreateObject("ADODB.RecordSet")
	Sql = "Select * From Board Where Num="&Num

	

	RS_B.Open Sql , Db
%>

<HTML><HEAD><TITLE>OyesMall 에 오신것을 환영합니다</TITLE>
<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>

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
	<Form name=write action="./edit_ok.asp" method=post >
			<input type=hidden name=num value="<%=num%>">
			<TBODY>
			<TR background="../shop_image/trgb.gif">
				<TD align=middle   background="../shop_image/trgb.gif" height=25 align=center colspan=2><FONT 
				  color=#ffffff><B>수정하기</B></FONT></TD>
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
								<INPUT maxLength=40 size=15 name=name value="<%=RS_B("name")%>"> </TD>
						</TR>
						
						<TR>
							<TD >&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;E-Mail</B></TD>
							<TD>
								<INPUT maxLength=40 size=40 name=email value="<%=RS_B("email")%>"> </TD>
						</TR>
						<TR>
							<TD  >&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;Homepage</B></TD>
							<TD>
								<INPUT maxLength=40 size=40 name=home value="<%=RS_B("home")%>"> </TD>
						</TR>
						<TR>
							<TD  >&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;제 목</B></TD>
							<TD>
								<INPUT maxLength=40 size=20 name=title style="WIDTH: 80%" value="<%=RS_B("title")%>" > </TD>
						</TR>
						<TR>
							<TD >&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;내 용</B></TD>
							<TD>
								<TABLE cellSpacing=0 cellPadding=0 border=0>
									<TBODY>
										<TR>
											<TD><INPUT type=radio value="text" name="coding" <% IF RS_B("coding")="text" then%> checked<%end if%>>TEXT
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<INPUT type=radio value="html" name="coding" <% IF RS_B("coding")="html" then%>checked<%end if%>>HTML
							</td>
										</TR>
									</TBODY>
								</TABLE>
								<TEXTAREA class=minput style="WIDTH: 100%" name=content rows=12 wrap=hard cols=60><%=RS_B("content")%></TEXTAREA> 
							</TD>
						</TR>
						<TR>
							<TD>&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;Tank</B></TD>
							<TD> <SELECT style="BACKGROUND: #5A758C; COLOR: #ffffff" size=1 name=tank> 
											
	<OPTION value=cha_bg01.gif <%IF RS_B("tank") ="cha_bg01.gif" Then%>Selected <%end if%>>카타펄트</OPTION>
	<OPTION value=cha_bg02.gif <%IF RS_B("tank") ="cha_bg02.gif" Then%>Selected <%end if%>>크로스보우</OPTION>
	<OPTION value=cha_bg03.gif <%IF RS_B("tank") ="cha_bg03.gif" Then%>Selected <%end if%>>캐논</OPTION>
	<OPTION value=cha_bg04.gif <%IF RS_B("tank") ="cha_bg04.gif" Then%>Selected <%end if%>>캐롯탱크</OPTION>
	<OPTION value=cha_bg05.gif <%IF RS_B("tank") ="cha_bg05.gif" Then%>Selected <%end if%>>듀크탱크</OPTION>
	<OPTION value=cha_bg06.gif <%IF RS_B("tank") ="cha_bg06.gif" Then%>Selected <%end if%>>마인랜더</OPTION>
	<OPTION value=cha_bg07.gif <%IF RS_B("tank") ="cha_bg07.gif" Then%>Selected <%end if%>>미사일</OPTION>
	<OPTION value=cha_bg08.gif <%IF RS_B("tank") ="cha_bg08.gif" Then%>Selected <%end if%>>멀티미슬</OPTION>
	<OPTION value=cha_bg09.gif <%IF RS_B("tank") ="cha_bg09.gif" Then%>Selected <%end if%>>레이저탱크</OPTION>
	<OPTION value=cha_bg10.gif <%IF RS_B("tank") ="cha_bg10.gif" Then%>Selected <%end if%>>아이온어태커</OPTION>
	<OPTION value=cha_bg11.gif <%IF RS_B("tank") ="cha_bg11.gif" Then%>Selected <%end if%>>세크윈드</OPTION>
	<OPTION value=cha_bg12.gif <%IF RS_B("tank") ="cha_bg12.gif" Then%>Selected <%end if%>>포세이돈</OPTION>
	<OPTION value=cha_bg13.gif <%IF RS_B("tank") ="cha_bg13.gif" Then%>Selected <%end if%>>슈퍼탱크</OPTION></TD>
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
			<Tr>
					<Td Align=center colspan=2>&nbsp;</TD>
			</TR>

			<Tr>
					<Td Align=center colspan=2><Input type=button value=정보변경 onclick="write_ok();" class=button>&nbsp;&nbsp;<Input type=Reset value=다시쓰기  class=button>
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

