<!---#include file="../admin/dbconn.asp"--->
<%
	page = Request("page")

	IF Page = "" Then
		Page = 1
	End IF

	SQL = "select count(num) as recCount from board"

	Set RS_B = Db.Execute(SQL)

	recordCount = RS_B(0)
	
	pagesize = 10

	
	pagecount = int((recordCount-1)/pagesize) +1

	
	SQL = "Select Top " & pagesize & " * From board "
	SQL = SQL & " where num not in "
	SQL = SQL & "(Select Top " & (int(Page - 1) * pagesize) & " num From board"
	SQL = SQL & "  Order By ref Desc,r_step Asc) order by ref Desc,r_step Asc" 

	Set RS_B = Db.Execute(SQL)

	T_page = Pagecount
	No2 = recordcount
'	response.Write No2
'	response.End
%>

<HTML><HEAD><TITLE>OyesMall �� ���Ű��� ȯ���մϴ�</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=euc-kr">
<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>
<SCRIPT language=javascript src="../shop_file/cat_over.js"></SCRIPT>

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
					function search()
						{
							if(document.	search1.searchquery.value=="")
							{
								alert("�˻��� Ű���带 ������ �ּ���");
								document.search1.searchquery.focus();
								history.go();
							}
							document.search1.submit();
						}
						
				</script>

<style>
		
		.button { background-color:#E7E3E7; border:solid 1 #333333; font-family:Tahoma,Verdana; font-size:9pt; color:#000000;width:15%;}
		.input {
	BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: silver; BACKGROUND: none transparent scroll repeat 0% 0%; BORDER-BOTTOM-WIDTH: 1px; BORDER-BOTTOM-COLOR: silver; BORDER-TOP-COLOR: silver; LINE-HEIGHT: 100%; BORDER-RIGHT-WIDTH: 0px; BORDER-RIGHT-COLOR: silver
}
		
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

		<%
				v_num = Request("v_num")

				IF v_num <> "" Then

				SQL_Read = "Update Board Set readcount = readcount + 1 Where num="&v_num&" "

				DB.Execute (SQL_Read)

				SQL_View = "Select num,title,name,email,content,postdate,coding,pwd,ref,r_step,reforder,home,tank,master,b_filename From Board Where Num="&v_num&" "

				Set RS_V = DB.Execute (SQL_View)
				
				master = RS_V("master")
				num = RS_V("num")
				r_email = RS_V("email")
				filename=RS_V("b_filename")
				ref = RS_V("ref")
				r_step = RS_V("r_step")
				reforder = RS_V("reforder")
				Content = RS_V("content")
				tank = RS_V("tank")
				Content = Replace(content,Chr(13)&Chr(10),"<BR><BR>")
		%>
		<Script language=javascript>
					function reply()
							{
								document.re.submit();
							}

					function e_mail(email)
						{
						window.open("./send_mail.asp?email=<%=r_email%>","send_mail","scrollbars=no,toolbar=no,location=no,directories=no,status=no,width=300,height=420,resizable=no,menubar=no,top=120,left=204");
						}

					function down(filename)
					{
					  if(filename != ""){
					  var filepath = "upload_file";
					  var goUrl = "./shop_download.asp?strFileName=" + filename+"&f_path="+filepath;
					  location.href=goUrl;
					  }else{
						alert("�ٿ�ε������� �������� �ʽ��ϴ�.Ȯ���Ͽ� �ֽʽÿ�");
					  }
					}


				</script>


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
							<TD>&nbsp;&nbsp;<B><%=RS_V("title")%></B> </TD>
						</TR>

						<TR>
							<TD width=120 height=25>&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;�ۼ���</B></TD>
							<TD  >&nbsp;&nbsp;<a href="javascript:e_mail();" ><% IF master = "1" Then %><font face="comic sans ms bold" size=3><font color=red>Red</font><font color=#069FC6>Master</font></font><% Else %><%=RS_V("name")%><%End IF%></A> </TD>
						</TR>
						
						<TR>
							<TD height=25 >&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;Homepage</B></TD>
							<TD>&nbsp;&nbsp;<A Href="<%=RS_V("home")%>" target=_new><%=RS_V("home")%></A> </TD>
						</TR>
						
												<TR>
							<TD height=25 >&nbsp;
								<IMG src="../shop_image/i_title.gif">&nbsp;���ϸ�</B></TD>
								<TD  >&nbsp;&nbsp;<a href="javascript:down('<%=RS_V("b_filename")%>');"><img src="../shop_image/F.gif">&nbsp;<%=RS_V("b_filename")%></A> </TD>
						</TR>

						<TR>
							<TD colspan=2 width=520 height=248 style="BACKGROUND: url(./tank/<%=tank%>) fixed no-repeat"><BR><BR><%=content%>	
							</TD>
						</TR>
						
						<TR>
							<TD colspan=2>&nbsp;</TD>
						</TR>
						<%
							   
							  SQL_com = "Select Co_name, Co_date, Co_Content,co_seq,num,master,co_pass from Comment  where num=" &v_num
			  
							  Set RS_com = Db.Execute(SQL_com)
							  
							  IF Not RS_com.EOF Then

						%>
						<TR>
							<TD colspan=2 height=30></TD>
						</TR>
						<TR>
							<TD colspan=2><HR width="98%" color=#6197A5></TD>
						</TR>

                        <%
									While Not RS_com.Eof 	
									co_content = RS_com("co_content")
									co_Content = Replace(co_content,Chr(13),"<BR>")
									
									co_num = RS_com("num")
									co_pass = RS_com("co_pass")
									co_seq = RS_com("co_seq")
									co_name = RS_com("co_name")
									co_date = Left(RS_com("co_date"),10)
									master = RS_com("master")
						%>  
						
						<Tr onMouseOver="this.style.background='#CCE3E9'" onMouseOut="this.style.background='#FFFFFF'"  valign="top">
							<TD colspan=2 align=center  >
								<Table border=0 width="98%" >
									<TR >
										<TD width="20%" valign=top><% IF master = "1" Then %><font face="comic sans ms bold" size=3><font color=red>Red</font><font color=#069FC6>Master</font></font><% Else %><%=co_name%><%End IF%></TD>
										<TD ><%=co_content%></Td>
										<TD width="15%" align=center valign=top><%=co_date%></TD>
										<TD width="3%" align=center valign=top><A href="./comment_del.asp?page=<%=page%>&num=<%=co_num%>&co_seq=<%=co_seq%>"><img src="../shop_image/com_del.gif" border=0></A></TD>
									</TR>
								</Table>
							</TD>
						</TR>
						<%
								RS_com.MoveNext

								Wend

							End IF

							Set RS_com = Nothing
						%>
						<!-- Ŀ��Ʈ ���� -->
						<Script language="javascript">
						function addComment()
							  {
								  if (document.frmMent.co_name.value=="") 
										{
										  alert("�̸��� �Է��� �ּ���");
										  document.frmMent.co_name.focus();
										  return;
										}
								if (document.frmMent.co_pass.value=="") 
										{
										  alert("��й�ȣ�� �Է��� �ּ���");
										  document.frmMent.co_pass.focus();
										  return;
										}
								if (document.frmMent.co_content.value=="") 
										{
										  alert("������ �Է��� �ּ���");
										  document.frmMent.co_content.focus();
										  return;
										}
								document.frmMent.submit();
							  }

							 
							</Script>
						
						<TR>
							<TD colspan=2><HR width="98%" color=#6197A5></TD>
						</TR>
						<TR>
							<TD colspan=2 align=right>
								<form name="frmMent" action="./comment_ok.asp" Method="post">
								<input type="hidden" name="num" value="<%=v_num%>" >
								<input type="hidden" name="page" value="<%=page%>">
								<Table border=0 bordercolor=red cellSpacing=1 cellPadding=3 width="98%" >
									<Tbody>
									<TR >
										<TD align=right ><Textarea name="co_content" rows=6 wrap=hard cols=50 style="OVERFLOW: auto; HEIGHT: 70px"></TextArea><input type=button value=comment class=button style="height:70px" onClick="addComment();" >&nbsp;</TD>
									</TR>
									<TR>
										<TD align=right>Name : &nbsp;<input type=text name="co_name" size=10 maxLength=10 class=input>&nbsp;&nbsp;Password : &nbsp;<input type=password name="co_pass" size=10 maxLength=10 class=input>&nbsp;</TD>
									</TR>
									</Tbody>
								</Table>
								

							</TD>
						</TR>
						<TR>
							<TD colspan=2><HR width="98%" color=#6197A5></TD>
						</TR>
						</form><!-- Ŀ��Ʈ ���� End -->
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
								<A Href="javascript:reply();"><img src="../shop_image/reply.gif" border=0></A>&nbsp;&nbsp;&nbsp;<A Href="./shop_board_edit.asp?num=<%=num%>"><img src="../shop_image/edit.gif" border=0></A>&nbsp;&nbsp;&nbsp;<A href="./shop_board_list.asp?page=<%=page%>"  title="����Ʈ��^^ "><img src="../shop_image/list.gif" border=0></A>&nbsp;&nbsp;&nbsp;<A href="./shop_board_del.asp?page=<%=page%>&num=<%=num%>"><img src="../shop_image/delete.gif" border=0></A></TD>
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
    <%
			End IF
			Set RS_V = Nothing
	%>    
	<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
		<Tbody>
			<TR>
				<TD align=center><img src="../shop_image/n_list_top.gif" border=0></TD>
			</TR>
		</Tbody>
	</Table>
	<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
	<form method=post action="./member_list.asp" name="checkform">
			<TBODY>
			<TR background="../shop_image/trgb.gif">
				
				<TD align=middle width="7%"  background="../shop_image/trgb.gif" height=25><FONT 
				  color=#ffffff>No.</FONT></TD>
				<TD align=middle width="37%"   background="../shop_image/trgb.gif"><FONT 
				  color=#ffffff>�� ��</FONT></TD>
				 <TD align=middle width="10%"   background="../shop_image/trgb.gif"><FONT 
				  color=#ffffff>���ϸ�</FONT></TD>
				<TD align=middle width="18%"  background="../shop_image/trgb.gif" ><FONT 
				  color=#ffffff>�۾���</FONT></TD>
				<TD align=middle   width="18%"background="../shop_image/trgb.gif"><FONT 
				color=#ffffff>�ۼ���</FONT></TD>
				<TD align=middle width="10%"background="../shop_image/trgb.gif" ><FONT 
				  color=#ffffff>�� ȸ</FONT></TD>
			</TR>
			<% IF RS_B.EOF OR RS_B.BOF Then %>
			<TR>
				<TD align=center height=50 colspan=5>�Խ��ǿ� ��ϵ� ���� �����ϴ�.</TD>
			</TR>
			<Tr>
				<Td Align=center colspan=5><img src="../shop_image/bottom_bar.gif" border=0></TD>
			</TR>
			<Tr height=50>
				<Td Align=center colspan=4>&nbsp;</Td>
				<TD><A Href="./shop_board_write.asp"><img src="../shop_image/n_listwrite.gif" border=0></A></TD>
			</Tr>
			<%
				Else
				Count = 1

				While Not RS_B.Eof and Count <= 10

				W_date = RS_B("postdate")
			%>
		
			<Tr onMouseOver="this.style.background='#CCE3E9'" onMouseOut="this.style.background='#FFFFFF'"  valign="top">
				
				<TD vAlign=center align=middle height=20><% IF RS_B("num") <> num  Then%><% IF RS_B("reforder") > 0 Then %>&nbsp;<%Else%><%=RS_B("num")%><%End IF%><%Else%><img src="../shop_image/popicon.gif" border=0><%End If%></TD>
				<TD vAlign=center ><%
											IF RS_B("reforder") > 0 Then
											 AA = RS_B("reforder")
										%>
											<%for i=1 to AA%>&nbsp; <%next%>
											<img src="../shop_image/list_re.gif">
										<%End IF%>
											
																	<% IF DateDiff("h",RS_B("postdate"),Now()) < 24 Then %><img src="../shop_image/new.gif"><%Else%><img src="../shop_image/list_icon.gif"><%End IF%><A Href="./shop_board_list.asp?page=<%=page%>&v_num=<%=RS_B("num")%>">&nbsp;&nbsp;
																	<%
						If Len(RS_B("title")) > 15 Then
							Response.Write Left(RS_B("title"),15)&".."
						Else
							Response.Write (RS_B("title"))
						End If
					%></A></TD>
				<TD vAlign=center align=middle><% IF RS_B("b_filename") <>"" Then %><img src="../shop_image/F.gif"><%End IF%></TD>
				<TD vAlign=center align=middle><% IF RS_B("master") = "1" Then %><font face="comic sans ms bold" size=3><font color=red>Red</font><font color=#069FC6>Master</font></font><% Else %><%=RS_B("name")%><%End IF%></TD>
				<TD vAlign=center align=middle><%Response.Write Left(W_date, 10) %></TD>
				<TD vAlign=center align=middle><%=RS_B("readcount")%></TD>
			</Tr>
			<% IF count <> No2 Then %>
			<TR valign=top>
				<TD colspan=5 align=center><img src="../shop_image/line_long_dot.gif" width="566" height="4"></td>
			</tr>
			<%End IF%>
			<%
				RS_B.MoveNext

				Count = Count + 1

				Wend
			%>
			
			<Tr>
				<Td Align=center colspan=5><img src="../shop_image/bottom_bar.gif" border=0></TD>
			</TR>
			
			<TR>
				<TD colspan=5>&nbsp;</TD>
			</TR>
			<Tr>
				<Td Align=center colspan=4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<%
						intStart = int((page-1)/10)*10 + 1					
						intEnd = intStart + 9
					%>
					<% If intstart = 1 Then %>
						<img src="../shop_image/pre.gif" border=0>
						
					<% Else %>
						<A Href="./shop_board_list.asp?page=<%=intstart-1%>"><img src="../shop_image/pre.gif" border=0></A>
					<% End IF %>

					<% For i=intstart to intend 
						
						IF i = int(page) Then 

							Response.Write "<Font Color=Red Size=3>"&i&"</Font>"
						Else
						
							Response.Write " <A Href=./shop_board_list.asp?page="&i&"> ["&i&"]</a> "
						End if

						If int(intstart) =int(t_page) then  
							exit for
						end if
						intstart=intstart+1

					   Next
					 
					%>
					<% If intstart = T_page Then %>
						
						<img src="../shop_image/next.gif" border=0>
					<% else %>
						<A Href="./shop_board_list.asp?page=<%=intend+1%>"><img src="../shop_image/next.gif" border=0></A>
					<% End If%>
					
				</Td>
				<TD><A Href="./shop_board_write.asp"><img src="../shop_image/n_listwrite.gif" border=0></A></TD>
			</Tr>
			
			<%End IF%>
			
			</Tbody>
			</Form>
	</Table>
	<BR>
	<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
			<FORM name=search1 action="./search.asp" method=post>
			<TBody>
				<Tr>
					<Td align=center bgcolor=#E7E3E7 ><Input type=radio name=radio value=title checked>Subject&nbsp;
													<Input type=radio name=radio value=name>Writer&nbsp;
													<Input type=radio name=radio value=content>Content&nbsp;
													&nbsp;&nbsp;												
													<input type=text style="WIDTH: 100px" name="searchquery" >&nbsp;<A href="javascript:search()"><img src="../shop_image/search2.gif" border=0 align=absmiddle></A></Td>
				<Tr>
			</Tbody>
			</Form>
		</Table>
        <BR><BR>
        
      </td>
    </tr>
  </table>
  <!--#include file="../shop/main_shopbottom.asp"-->
</center>
</body>
</Html>