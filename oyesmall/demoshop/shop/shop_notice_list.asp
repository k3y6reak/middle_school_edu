<!---#include file="../admin/dbconn.asp"--->
<!--#include file="../cookie.asp"--->
<%
	num = request("num")
	page = request("page")

	If page = "" Then
		page = 1
	End If

	SQL_N = "select count(num) as recCount from notice"
	Set RS_N = Db.Execute(SQL_N)

	recordCount = RS_N(0)
	
	pagesize = 10

	
	pagecount = int((recordCount-1)/pagesize) +1

	
	SQL_N = "Select Top " & pagesize & " * From notice "
	SQL_N = SQL_N & " where num not in "
	SQL_N = SQL_N & "(Select Top " & (int(Page - 1) * pagesize) & " num From notice"
	SQL_N = SQL_N & " Order By num DESC) order by num desc" 


	Set RS_N = Db.Execute(SQL_N)
	

	T_page = Pagecount

	

	
%>
<HTML><HEAD><TITLE>OyesMall 에 오신것을 환영합니다</TITLE>
<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>

<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 border="0" marginheight="0" 
marginwidth="0"><A name=top><!-- 상단 메뉴 -->


<SCRIPT language=JavaScript>
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
</SCRIPT>
<SCRIPT language=javascript>
		function isEnter(tObj) {
			if(event.keyCode == 13) {
				if(tObj.value == "") {
					alert("Password를 입력하세요");
					tObj.focus();
					return;
				}
				if(frmMain.user_id.value == "") {
					alert("ID를 입력하세요");
					frmMain.user_id.focus();
					return;
				}
				document.frmMain.submit();
			}
		}
		function chkForm() {
			if(frmMain.user_id.value == "") {
				alert("ID를 입력하세요");
				frmMain.user_id.focus();
				return;
			}
			if(frmMain.passwd.value == "") {
				alert("Password를 입력하세요");
				frmMain.user_id.focus();
				return;
			}
			document.frmMain.submit();
		}
	</SCRIPT>
<!--#include file="../shop_about/about_top.asp"-->

<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=747 border=0>
  <TBODY>
  <TR>
    <!--#include file="../shop/shop_left.asp"-->
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <FORM name=form2>
        <TBODY>
        <TR>
          <TD><IMG height=26 src="../shop_image/shoppingguide_title1.gif" 
          width=161></TD>
          </TR></FORM></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR bgColor=#d7d7d7>
          <TD class=lm style="PADDING-LEFT: 20px" height=25><A 
            href="../shop/shop_main.asp">home</A> &gt;  <B>Shopping 
            Guide</B></TD></TR>
        <TR bgColor=#eeeeee>
          <TD class=lm style="PADDING-LEFT: 20px" bgColor=#efefef 
        height=4></TD></TR></TBODY></TABLE><BR>
		<% 
			v_num = Request("n_open")
			IF v_num <> "" Then 

			SQL_V = "Select * From notice Where num="&v_num&" "
			Set RS_V =DB.Execute (SQL_V)

	
		%>
       <TABLE cellSpacing=0 cellPadding=2 width=570 border=0>
        <TBODY>
        <TR>
          <TD class=tk height=25><IMG height=13 src="../shop_image/notice.gif" 
            width=59></TD></TR>
        <TR vAlign=bottom>
          <TD style="PADDING-LEFT: 10px; class: tk" bgColor=#e1ecfd 
            height=22><FONT color=#192642><B><%=RS_V("title")%></B></FONT></TD></TR>
        <TR vAlign=bottom>
          <TD style="PADDING-LEFT: 10px; class: tk" bgColor=#83a0c0 
          height=1></TD></TR>
        <TR>
          <TD class=tk style="PADDING-LEFT: 10px; PADDING-TOP: 10px"><%=RS_V("content")%></TD></TR></TBODY></TABLE><BR><BR>
		<%End IF%>
      <TABLE cellSpacing=0 cellPadding=2 width=570 border=0>
        <TBODY>
        <TR align=middle>
          <TD class=tgn width=40 bgColor=#f3f3f3 height=24><B>번호</B></TD>
          <TD class=tgn width=450 bgColor=#f3f3f3><B>제목</B></TD>
          <TD class=tgn width=80 bgColor=#f3f3f3><B>게시일</B></TD></TR>
        <TR>
          <TD bgColor=#dcdcdc height=1></TD>
          <TD bgColor=#dcdcdc height=1></TD>
          <TD bgColor=#dcdcdc height=1></TD></TR>

		  <%
				IF NOT RS_N.EOF Then
				
				Count = 1

				While Not RS_N.Eof and Count <= 5

				branch = RS_N("branch")

				Select Case branch
					Case "1"
						kind = "[news]"
					Case "2"
						kind = "[event]"
				End Select
			%>
        <TR>
          <TD class=tgn align=middle><%=RS_N("num")%></TD>
          <TD class=tgn><A 
            href="./shop_notice_list.asp?n_open=<%=RS_N("num")%>"><%=kind%>&nbsp;<%=RS_N("title")%></A></TD>
          <TD class=tgn align=middle><%=RS_N("postdate")%></TD></TR>
		  <%
				RS_N.MoveNext

				Count = Count + 1

				Wend

				Set RS_N = Nothing
			
				Else
			%>
			<TR>
				<TD class=tgn align=middle colspan=3>등록된 공지사항이 아직 없습니다.^^</TD>
			</TR>

			<%End IF%>

        
        </TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=570 border=0>
        <TBODY>
        <TR bgColor=#f3f3f3>
          <TD class=tgn align=middle height=25><%
						intStart = int((page-1)/3)*3 + 1					
						intEnd = intStart + 2
					
					 If intstart = 1 Then 
					 %>
					<IMG height=14 alt=이전페이지로 hspace=4 src="../shop_image/btn_prev1.gif" width=35 border=0>
						
					<% Else %>
						<A Href="./shop_notice_list.asp?page=<%=intstart-1%>"><IMG height=14 alt=이전페이지로 
            hspace=4 src="../shop_image/btn_prev1.gif" width=35 border=0></A>
					<% End IF %>

					<% For i=intstart to intend 
						
						IF i = int(page) Then 

							Response.Write "<Font Color=Red Size=3>"&i&"</Font>"
						Else
						
							Response.Write " <A Href=./shop_notice_list.asp?page="&i&"> ["&i&"]</a> "
						End if

						If int(intstart) =int(t_page) then  
							exit for
						end if
						intstart=intstart+1

					   Next
					 
					 If intstart = T_page Then
					 
					 %>
						
					<IMG 
            height=14 alt=다음페이지로 hspace=4 src="../shop_image/btn_next1.gif" width=35 
            border=0>
					<% else %>
						<A Href="./shop_notice_list.asp?page=<%=intend+1%>"><IMG 
            height=14 alt=다음페이지로 hspace=4 src="../shop_image/btn_next1.gif" width=35 
            border=0></A>
					<% End If%>
					</TD>
				</TR>
        <TR>
          <TD bgColor=#dcdcdc height=1></TD></TR></TBODY></TABLE><BR><BR></TD></TR></TBODY></TABLE>
	  <!--#include file="../shop/main_shopbottom.asp"-->
	  </CENTER></BODY></HTML>
