<!---#include file="../admin/dbconn.asp"--->
<%
	num = Request("num")
	page = Request("page")
	
	IF Page = "" Then
		Page = 1
	End IF

	SQL_R = "Update Board Set readcount = readcount + 1 Where num="&num

	Db.Execute SQL_R

	SQL = "Select * From board Where num="&num

	Set RS_B = Db.Execute(SQL)
	
	num = RS_B("num")
	r_email = RS_B("email")
	ref = RS_B("ref")
	r_step = RS_B("r_step")
	reforder = RS_B("reforder")
	Content = RS_B("content")
	tank = RS_B("tank")
	Content = Replace(content,Chr(13)&Chr(10),"<BR><BR>")
'	response.Write tank
'	response.End
%>

<HTML><HEAD><TITLE>OyesMall �� ���Ű��� ȯ���մϴ�</TITLE>
<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>


</head>
<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" border="0" bgcolor="#ffffff">

<!-- ��� �޴� -->


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

			<Script language=javascript>
					function reply()
							{
								document.re.submit();
							}

					function e_mail(email)
						{
						window.open("./send_mail.asp?email=<%=r_email%>","send_mail","scrollbars=no,toolbar=no,location=no,directories=no,status=no,width=300,height=420,resizable=no,menubar=no,top=120,left=204");
						}
				</script>

<style>
		
		.button { background-color:#E7E3E7; border:solid 1 #333333; font-family:Tahoma,Verdana; font-size:9pt; color:#000000;width:15%;}
		
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
				<TD align=center><img src="../shop_image/n_list_top2.gif" border=0></TD>
			</TR>
		</Tbody>
	</Table>
	<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
	
			<TBODY>
			<TR background="../shop_image/trgb.gif">
				<TD align=middle   background="../shop_image/trgb.gif" height=25 align=center><FONT 
				  color=#ffffff><B>�ۺ���</B></FONT></TD>
			</TR>
			<TR>
				
				<TD align=center>
					<TABLE cellSpacing=0 cellPadding=0 width="90%" align=center border=0>
						<Tbody>
						<TR>
							<TD height=25 style="WIDTH: 25%;">&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;�� ��</B></TD>
							<TD>&nbsp;&nbsp;<B><%=RS_B("title")%></B> </TD>
						</TR>
						<TR>
							<TD width=120 height=25>&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;�ۼ���</B></TD>
							<TD  >&nbsp;&nbsp;<a href="javascript:e_mail();" ><%=RS_B("name")%></A> </TD>
						</TR>
						
						
						<TR>
							<TD height=25 >&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;Homepage</B></TD>
							<TD>&nbsp;&nbsp;<A Href="<%=RS_B("home")%>" target=_new><%=RS_B("home")%></A> </TD>
						</TR>
						
						<TR>
							<TD colspan=2 width=520 height=248 style="BACKGROUND: url(./tank/<%=tank%>) fixed no-repeat"><BR><BR><%=content%>	
							</TD>
						</TR>
						
						<TR>
							<TD colspan=2>&nbsp;</TD>
						</TR>
						</Tbody>
					</Table>
				</TD>
			</TR>
			<Tr>
					<Td Align=center ><img src="../shop_image/bottom_bar.gif" border=0></TD>
			</TR>
			<Tr>
					<Td Align=center >&nbsp;</TD>
			</TR>

			<Tr>
					<Td Align=center >
								<A Href="javascript:reply();"><img src="../shop_image/reply.gif" border=0></A>&nbsp;&nbsp;&nbsp;<A Href="./shop_board_edit.asp?num=<%=num%>"><img src="../shop_image/edit.gif" border=0></A>&nbsp;&nbsp;	<A href="./shop_board_list.asp?page=<%=page%>"  title="����Ʈ��^^ "><img src="../shop_image/list.gif" border=0></A></TD>
			</TR>
			</Tbody>
			<form method=post action="./shop_board_write.asp" name="re">
						<input type = hidden name = num value=<%=num%>>
						<input type = hidden name = ref value=<%=ref%>>
						<input type = hidden name = r_step value=<%=r_step%>>
						<input type = hidden name = reforder value=<%=reforder%>>
			</Form>
	</Table>
	<BR>
        <BR>
        
      </td>
    </tr>
  </table>
  <!--#include file="../shop/main_shopbottom.asp"-->
</center>
</body>
</Html>