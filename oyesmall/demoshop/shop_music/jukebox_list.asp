<!---#include file="../admin/dbconn.asp"--->

<%

	num = request("num")
	page = request("page")

	If page = "" Then
		page = 1
	End If

	N_search = Request("searchmode")

	IF N_search <> "1" Then 

			SQL = "select count(num) as recCount from juke"
			Set Rs_m = Db.Execute(SQL)

			recordCount = Rs_m(0)

			pagesize = 10

			
			pagecount = int((recordCount-1)/pagesize) +1

			
			SQL = "Select Top " & pagesize & " * From juke"
			SQL = SQL & " where num not in "
			SQL = SQL & "(Select Top " & (int(Page - 1) * pagesize) & " num From juke"
			SQL = SQL & " Order By num DESC) order by num desc" 

			Set Rs_m = Db.Execute(SQL)
	
	ElseIF N_search = "1" Then

			radio = Request("radio")
			searchquery = Request("searchquery")

			Select Case radio

				Case "1"

					search_checkname = "name"

				Case "2"

					search_checkname = "title"

			End Select
			
			SQL = "Select count(num) from juke Where  "& Search_checkname &" Like '%"& searchquery &"%' "

			Set Rs_m = DB.Execute(SQL)

			recordcount = Rs_m(0)
			pagesize = 10
			pagecount = int((recordCount-1)/pagesize) +1
			
			SQL = "SELECT TOP " & pagesize & " * FROM juke "
			SQL = SQL & " Where  "& Search_checkname &" Like '%" & searchquery & "%' and num not in "
			SQL = SQL & "(SELECT TOP " & ((Page - 1) * pagesize) & " num FROM juke"
			SQL = SQL & " Where  "& Search_checkname &" Like '%" & searchquery & "%'"
			SQL = SQL & " ORDER BY num DESC) order by num desc" 

			Set Rs_m = DB.Execute(SQL)

	End IF

	T_page = Pagecount

	

	
%>
<html>
<head>
<HTML><HEAD><TITLE>OyesMall 에 오신것을 환영합니다</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=euc-kr">
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
function all_check(bool)
	  {      
		  var check_count=0,uncheck_count=0;      
		  len = document.checkform.chk.length;      
		 
		  if (bool)
				  {          
				  for(i=0; i<len; i++)
					  {            
					  check_count++;           
					  document.checkform.chk[i].checked = true;         
					  }         
					return 
					}  
					

			 
			  else
				  {          
					  for(i=0; i<len; i++)
					  {            
					  uncheck_count++;            
					  document.checkform.chk[i].checked = false;         
					  }          
				  return    
			  }   
	  }


	 function jukeit() {
						document.jForm.action="JukeBox_list.asp"
						document.jForm.submit();
					   }


		
	function music() {
			var flag = "false";
			var MU = document.checkform.chk;
			for (i=0; i <= MU.length-1; i++) {
					if (document.checkform.chk[i].checked) {
							flag = "true";
					}
			}
			if (flag == "false") {
					alert ("최소한 하나는 선택하셔야죠~^^*");
					history.go();
			}
			document.checkform.action="./my_jukebox.asp";
			document.checkform.submit();
	}

	
	function song2()
			 {
			  var aa=document.all.checkform.chk.length;
			  var c=0;
			  var yn;
			  if(aa==null || aa=="")
			  {
				  alert(" 선택할수 있는 노래가 없습니다.");
			  }  
			  else
			  {  
			  for(i=0;i<aa;i++)
			   { 
				  if(document.all.chk[i].checked==true)
				   c++;
			   }   
			   }

				  if(c==0)
				   { alert(" 듣고싶은곡을 선택해 주세요. ^^"); }
				  else 
					{ 
					  { 
						url="song_2.asp";    
						window.open(url,"aaa","top=100,left=100,width=280,height=280,toolbar=no,location=0,directory=0,status=0,menubar=0,scrollbars=no,resizable=1");
						document.checkform.target="aaa";
						document.checkform.action = url;
						window.checkform.submit(); }
					}        
			}               


//-->
</SCRIPT>
<Script Language="JavaScript">
var checkflag = "false";
		function jCheck(field) {
			if (checkflag == "false") {
				for (i=0; i < field.length; i++) {
					field[i].checked=true;
				}
				checkflag = "true"
				return "   전 체 해 제   ";
			}
			else {
				for (i=0; i < field.length; i++) {
					field[i].checked=false;
				}
				checkflag = "false"
				return "   전 체 선 택   ";
			}
		}
	

</SCRIPT>
<SCRIPT language=JavaScript>


	function song()
			 {
			  var aa=document.all.jForm.check.length;
			  var c=0;
			  var yn;
			  if(aa==null || aa=="")
			  {
				  alert(" 선택할수 있는 노래가 없습니다.");
			  }  
			  else
			  {  
			  for(i=0;i<aa;i++)
			   { 
				  if(document.all.check[i].checked==true)
				   c++;
			   }   
			   }

				  if(c==0)
				   { alert(" 듣고싶은곡을 선택해 주세요. ^^"); }
				  else 
					{ 
					  { 
						url="song.asp";    
						window.open(url,"aaa","top=100,left=100,width=280,height=280,toolbar=no,location=0,directory=0,status=0,menubar=0,scrollbars=no,resizable=1");
						document.jForm.target="aaa";
						document.jForm.action = url;
						window.jForm.submit(); }
					}        
			}  
			


	function delit() 
		{
		if(!confirm("JukeBox 를 닫겠습니다.")) return;					
		document.checkform.action="./myjukeall_del.asp?page=<%=page%>";
		document.checkform.submit();
		}

	</SCRIPT>
<Script language="javascript">
					function search1Submit()
						{
							if(document.search1.searchquery.value.length == 0)
							{
								alert("검색할 키워드를 기입해 주세요");
								document.search1.searchquery.focus();
								return false;
							}
							else
							{
							document.search1.submit();
							}
						}
				</Script>
<style>
		
		.button { background-color:#336699; border:solid 1 #333333; font-family:Tahoma,Verdana; font-size:9pt; color:#FFFFFF;width:15%;}
		
</style>
<!--#include file="../shop_about/about_top.asp"-->
<center>
  <table width="747" border="0" cellspacing="0" cellpadding="0">
    <tr>
       <!--#include file="../shop/shop_left.asp"-->
      <td valign="top" align="center">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	
          <tr>
              <td><img src="../shop_image/music_station.gif" width="148" height="26"></td>
           
          </tr>
       
        </table>
        
		 <TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
        <TBODY>
        <TR height=48>
          <TD background="../shop_image/searchbox_middlebg.gif">
            <TABLE cellSpacing=0 cellPadding=0 border=0>
              <FORM name="search1" onsubmit="return search1Submit();" action="./jukebox_list.asp" method="post">
											<Input type="hidden" name="searchmode" value="1">
												<TBODY>
													<TR>
														<TD width="5">
															<IMG height="48" src="../shop_image/searchbox_left.gif" width="5">
														</TD>
														<TD width="120">
															<IMG height="20" src="../shop_image/test.gif" width="120">
														</TD>
														<TD width="186">
															<SELECT name="radio">
																<OPTION value="1" selected>
																	가 수</OPTION>
																<OPTION value="2">
																	제 목</OPTION>
															</SELECT><INPUT style="BORDER-RIGHT: #055480 1px solid; BORDER-TOP: #055480 1px solid; BORDER-LEFT: #055480 1px solid; WIDTH: 75px; BORDER-BOTTOM: #055480 1px solid" maxLength="20" size="7" name="searchquery">
														</TD>
														<TD>
															&nbsp;<input type="image" src="../shop_image/btn_search2.gif" border="0" ALIGN="absbottom" >
														</TD>
													</TR>
											</FORM></TBODY></TABLE></TD>

          <TD align=right background="../shop_image/searchbox_middlebg.gif">
            <TABLE cellSpacing=0 cellPadding=0 border=0>
			<form method=post name="checkform">
              <TBODY>
              <TR>
                <TD width=5><IMG height=48 
                  src="../shop_image/button_leftbg.gif" width=5></TD>
                <TD width=48><A href="javascript:song2();"><IMG 
                  height=48 src="../shop_image/btn_seqplay.gif" width=48 
                  border=0></A></TD>
                <TD width=48><A href="javascript:all_check(true);" ><IMG 
                  height=48 src="../shop_image/btn_allselect.gif" width=48 
                  border=0></A></TD>
                <TD width=48><A href="javascript:all_check(false);"><IMG 
                  height=48 src="../shop_image/btn_alldelete.gif" width=48 
                  border=0></A></TD>
                <TD width=48><A  href="javascript:music();"><IMG 
                  height=48 src="../shop_image/btn_selectlist.gif" width=52 
                  border=0></A></TD>
                <TD width=5><IMG height=48 
                  src="../shop_image/button_rightbg.gif" 
              width=5></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
        <table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25" height="30">&nbsp;</td>
            
          </tr>
        </table>
		 
        <table border="0" cellspacing="0" cellpadding="2" width="95%">
          <tr align="center">
			<td bgcolor="#E1ECFD" height="24" width="5%" class="tk"><font color="#192642">선택</font></td>
            <td bgcolor="#E1ECFD" class="tk" width="5%"><font color="#192642">번호</font></td>
            <td bgcolor="#E1ECFD" class="tk" width="80%"><font color="#192642">제 &nbsp;&nbsp;&nbsp;목</font></td>
            <td bgcolor="#E1ECFD" class="tk" width="5%"><font color="#192642">듣기</font></td>
            <td bgcolor="#E1ECFD" class="tk" width="5%"><font color="#192642">가사</font></td>
          </tr>
        <tr bgcolor="#83A0C0">
			<td colspan="6" height="1"></td>
		</tr>
          
        </table>
        <table width="95%" border="0" cellspacing="0" cellpadding="0" bgcolor="#F3F3F3">
			<% IF RS_m.EOF OR RS_m.BOF Then %>
			<Tr bgcolor="#FFFFFF">
				<TD align=center height=50>
					<%
						IF N_search <> "1" Then 

							Response.Write "등록된 음악이 없습니다.^^"
					
						ElseIF N_search = "1" Then
					%>
										<Script Language="JavaScript">
								alert("(<%=keyword%>) 로 검색된 결과가 없습니다..\n\n다른 키워드를 이용하세요 ^^");
								location.href="javascript:history.go(-1);";
							</Script>
										<%End IF%>
						</TD></TD>
			</TR>
		</Table>
			<%
				Else
				Count = 1

				While Not RS_m.Eof  and Count <= 10
				
				m_no = Count 
			%>
			<% IF count mod 2 = 1 Then %>
          <Tr bgcolor="#FFFFFF">
            <TD vAlign=center align=middle width="5%" height=23><Input type=checkbox name="chk" value="<%=RS_m("num")%>"></TD>
			<TD vAlign=center align=middle width="5%"><%=m_no%></TD>
			<TD vAlign=center  width="80%">&nbsp;&nbsp;&nbsp;<%=RS_m("name")%> - <%=RS_m("title")%></TD>
			<TD vAlign=center align=middle width="5%"><a href="mms://music.redboard.net/<%=Rs_m("category")%>/<%=Rs_m("mp3")%>"><img src="../shop_image/icon_play.gif" border=0 alt="노래 듣기"></A></TD>
			<TD vAlign=center align=middle width="5%"><img src="../shop_image/icon_info2.gif" border=0 alt="음악정보 보기"></TD>
          
          </TR>
		  <%Else%>
		  <Tr bgcolor="#F3F3F3">
            <TD vAlign=center align=middle width="5%" height=23><Input type=checkbox name="chk" value="<%=RS_m("num")%>"></TD>
			<TD vAlign=center align=middle width="5%"><%=m_no%></TD>
			<TD vAlign=center  width="80%">&nbsp;&nbsp;&nbsp;<%=RS_m("name")%> - <%=RS_m("title")%></TD>
			<TD vAlign=center align=middle width="5%"><a href="mms://music.redboard.net/<%=Rs_m("category")%>/<%=Rs_m("mp3")%>"><img src="../shop_image/icon_play.gif" border=0 alt="노래 듣기"></A></TD>
			<TD vAlign=center align=middle width="5%"><img src="../shop_image/icon_info2.gif" border=0 alt="음악정보 보기"></TD>
          
          </TR>
		  <%
				End IF
				RS_m.MoveNext

				Count = Count + 1

				Wend
			%>
		
		   
          <tr bgcolor="#E1ECFD">
                  <td align="center" colspan="5" height="4"></td>
                </tr>
                <tr bgcolor="#83A0C0">
                  <td align="center" colspan="5" height="1"></td>
                </tr>
		  </Form>
        </table>
        <br>
	
		<Table width="95%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
			<TR>
				<TD align=center>
					<%
						intStart = int((page-1)/5)*5 + 1					
						intEnd = intStart + 4
					
						If intstart = 1 Then 
					%>
					<img src="../shop_image/btn_prev1.gif" border=0>
						
					<% Else %>
						<A Href="./jukebox_list.asp?page=<%=intstart-1%><% IF N_search ="1" Then%>&radio=<%=radio%>&searchquery=<%=searchquery%><%End IF%>"><img src="../shop_image/btn_prev1.gif" border=0></A>
					<% 
							End IF 
						For i=intstart to intend 
						
						IF i = int(page) Then 

							Response.Write "<Font Color=Red Size=3>"&i&"</Font>"
						Else
					%>
					
						<A Href="./jukebox_list.asp?page=<%=i%><% IF N_search ="1" Then%>&radio=<%=radio%>&searchquery=<%=searchquery%><%End IF%>"> [<%=i%>]</a>
					<%
						End if

						If int(intstart) =int(t_page) then  
							exit for
						end if
						intstart=intstart+1

					   Next
					 
						 If intstart = T_page Then
					%>
						
						<img src="../shop_image/btn_next1.gif" border=0>
					<% else %>
						<A Href="./jukebox_list.asp?page=<%=intend+1%><% IF N_search ="1" Then%>&radio=<%=radio%>&searchquery=<%=searchquery%><%End IF%>"><img src="../shop_image/btn_next1.gif" border=0></A>
					<% End If%>
				</TD>
			</TR>
		</Table>
	 
			
	<%End IF%>
        <!----- 쥬크박스----->


<%
'	Sql = "Select * From my_juke Order By num Asc"

	SQL = "SELECT J.num, J.title, J.name, J.category, M.SessionID, M.ck, M.mp3,M.j_num From Juke J, my_juke M WHERE J.num=M.ck AND M.SessionID="&Session.SessionID&" ORDER BY j_num ASC"
	
'	Response.write sql
'	response.end
	Set J_Rs = Db.Execute(SQL)

	If Not J_Rs.Eof Then

	
	
%>

	<BR>
	<Table width="95%" border=0>
		<TR>
				<TD  width=95><img src="../shop_image/seleted_logo.gif" border=0 >&nbsp;&nbsp;</TD>
		
				<TD><img src="../shop_image/seleted_title.gif" border=0 rowspan=3></TD>
			
		</TR>
	</Table>

	<TABLE  width="95%"  border=0 bgcolor="#FFE3CE">
		<Form name=jForm method=POST>
		<TBODY>
			<TR>
				<TD>
					<TABLE  width="97%"  border=0 bgcolor="#FFE3CE" align=center>
						<TR>
							<TD>&nbsp;</Td>
						</TR>
			<%
				j_Count = 1

				While Not J_Rs.Eof and j_Count >0 

				no =  j_Count 
				
				IF no mod 2 = 1 Then
			%>
					
			<TR bgcolor="#ffffff" >
				<Td ><Input type=checkbox name=check value=<%=J_Rs("ck")%>>&nbsp;&nbsp;&nbsp;<B><%=no%></B>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=J_Rs("name")%> - <%=J_Rs("title")%> </td>
				
			</TR>

			<% Else %>
			<TR >
				<Td ><Input type=checkbox name=check value=<%=J_Rs("ck")%>>&nbsp;&nbsp;&nbsp;<B><%=no%></B>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=J_Rs("name")%> - <%=J_Rs("title")%> </td>
				
			</TR>
			<% End IF %>
			<%
			
				J_Rs.MoveNext
				j_Count = j_Count + 1
				Wend
			%>
			<TR height=50>
					<TD>&nbsp;</Td>
			</TR>
	
		</Table>
		</TD>
		</TR>
		</Tbody>
		</Table>
		<BR>
		<TABLE  width="95%"  border=0 bgcolor="#FFE3CE">
			<TBODY>
			<TR>
				<TD align=center><input type=button name="j_check" value="전 체 선 택 " OnClick='this.value=jCheck(this.form.check);' class="button">
	&nbsp;&nbsp;&nbsp;
	<INPUT  class="button" onclick="song();" type=button value=" 듣 &nbsp;&nbsp;기 "> &nbsp;&nbsp;
	<INPUT class="button" onclick="delit();" type=button value=" 닫 &nbsp;&nbsp;기 "> </TD>
			</TR>
			</Form>
			</Tbody>
		</Table>


		<BR>

		
	<% End if %>
        
        
      </td>
    </tr>
  </table>
  <!--#include file="../shop/main_shopbottom.asp"-->
</center>
</body>
</Html>
