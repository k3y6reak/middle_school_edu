<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->
<%
	page = request("page")

	If page = "" Then
		page = 1
	End If
	
	mode = int(Request("mode"))
	SQL = "Select count(num) as recCount from statistic"
	
	Set Rs = Db.Execute(SQL)
	
	recordCount = Rs(0)
	
	pagesize = 10

	
	pagecount = int((recordCount-1)/pagesize) +1

	
	SQL = "Select Top  " & pagesize & " * From statistic "
	SQL = SQL & " where num not in "
	SQL = SQL & "(Select Top " & (int(Page - 1) * pagesize) & " num From statistic"
	SQL = SQL & " Order By num DESC) order by num desc" 

'	response.write sql
'	response.end
	Set Rs = Db.Execute(SQL)
	

	T_page = Pagecount

	

	
%>
<html>
<head>
<title>◇ ◆OyesMall Statistics ◆ ◇</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">

				

		
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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B>접속통계(<% IF mode="1" Then%>Week <% ElseIF mode="2" Then %>Day<%ElseIF mode="3" then %>Time<%End IF%>)</B></FONT></TD>
							<TD align=middle width=150 bgColor=#222222><FONT face=돋움><B>STATISTICS</B></FONT>
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
		 
		 <TD vAlign=top align=left>&nbsp;&nbsp;OyesMall의 접속현황을  <% IF mode="1" Then%>주<% ElseIF mode="2" Then %>날짜<%ElseIF mode="3" then %>시간<%End IF%>별로 분류한 곳입니다. 
			<BR></TD>
		
		</TR>
		</TBODY>
	</TABLE>

	<BR>
	<Div Align=Right>
		<B>[<font color=red><%=page%></font>/<%=T_page%>]</B>
	</Div>
	<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">
	
	    <input type=hidden value="<%=page%>" name=page >
		<TBODY>
			<TR>
				
				<TD align=middle width="10%"height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="19">
						<B><Font class="font_3">No.</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle height=20  width="25%"><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="19">
						<B><Font class="font_3">USER_IP</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="45%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="19">
						<B><Font class="font_3">USER_AGENT</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
				<TD align=middle width="20%" height=20><TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="19">
						<B><Font class="font_3">LOG_TIME</Font></B>
					</TD>
				</TR>
			</TBODY>
		</TABLE></TD>
			</TR>
			
			<%
				Count = 1

				While Not Rs.Eof and Count <= 10
			%>
			<Tr onMouseOver="this.style.background='#313031'" onMouseOut="this.style.background='#000000'" valign="top">
				<TD vAlign=center align=middle height=25><%=Rs("num")%></Td>
				<TD vAlign=center align=middle><%=Rs("user_ip")%></Td>
				<TD vAlign=center align=middle><%=Rs("user_agent")%></Td>
				<TD vAlign=center align=middle><%=Rs("log_time")%></Td>
			</Tr>
			<%
				Rs.MoveNext

				Count = Count + 1

				Wend
			%>
			<TR>
	<TD colspan="4">
		<TABLE cellSpacing="0" borderColorDark="#868486" cellPadding="0" width="100%" bgColor="#4A494A" borderColorLight="#000000" border="1">
			<TBODY>
				<TR>
					<TD align="middle" height="1">
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</TD>
</TR>
</Tbody>
</Table>
<BR>
<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0">


			<Tr>
				<Td Align=right >

					<%
						intStart = int((page-1)/10)*10 + 1					
						intEnd = intStart + 9
					
					 IF intstart <> 1 Then 
					%>
				[<A Href="./statistics.asp?page=1&mode=<%=mode%>">Start</A>]
					<% 
					End IF
					
					If intstart = 1 Then 
					%>
						&nbsp;
						
					<% Else %>
						<A Href="./statistics.asp?page=<%=intstart-1%>&mode=<%=mode%>">◀</A>
					<% End IF %>

					<% For i=intstart to intend 
						
						IF i = int(page) Then 

							Response.Write "<B>"&i&"</b>"
						Else
						%>
							<A Href="./statistics.asp?page=<%=i%>&mode=<%=mode%>"> [<%=i%>]</a>
						<%
						End if

						If int(intstart) =int(t_page) then  
							exit for
						end if
						intstart=intstart+1

					   Next
					 
					%>
					<% If intstart = T_page Then %>
						
						&nbsp;
					<% else %>
						<A Href="./statistics.asp?page=<%=intend+1%>&mode=<%=mode%>">▶</A>
					<% End If%>
					<% IF intstart <> intend Then %>
				[<A Href="./statistics.asp?page=<%=T_page%>&mode=<%=mode%>">End</A>]
				<% End IF%>&nbsp;
						</Td>
			</Tr>
		</Table>

		<BR>

		<Table width="100%" cellSpacing="1" cellPadding="0" border="0" bgcolor="#4A494A">
			<TR>
				<TD>
					<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" bgcolor="#000000">
			<Tr  height=25>
				<Td align=center>
					<input type="button"  value="Statistic Week" onClick="javascript:window.location.href='statistics.asp?page=<%=page%>&mode=1'" class=button3 style="width:30%;">
					<input type="button"  value="Statistic Day" OnClick="javascript:window.location.href='statistics.asp?page=<%=page%>&mode=2'" class=button3 style="width:30%;">
					<input type="button" value="Statistic Time"   OnClick="javascript:window.location.href='statistics.asp?page=<%=page%>&mode=3'" class=button3 style="width:30%;">
				</Td>
				
			</Tr>
		</Table>
		</TD>
		</TR>
		</Table>

		<BR>

		<Table width="100%" cellSpacing="1" cellPadding="0" border="0" bgcolor="#4A494A">
			<TR>
				<TD>
				<% IF mode = "1" Then %>
					
						<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" bgcolor="#000000">
			<Tr>
					<Td align=center>
						<% 
								YY = Request("YY")
								s_mon = Request("mon")
								'response.write mon
								IF s_mon = "" Then 
									s_mon = month(now) 
								End IF

								IF YY = "" Then
									YY = year(now)
								End IF


								AA = month(now)

								sql2 = " SELECT count(datepart(dw, log_time)) from statistic "
								sql2 = sql2 & " where s_mon = " & s_mon & " and log_time Like '%"& YY &"%'" 
								sql2 = sql2 & " group by datepart(dw, log_time) " 
								sql2 = sql2 & " order by datepart(dw, log_time) " 

								'response.wrtie sql
								'response.end

								set rs = DB.execute (sql2) 

								maxwk = 0 
								minwk = 100000
								
								IF RS.BOF OR RS.EOF Then
							%>
							<Script language=javascript>
								alert("<%=YY%>년 <%=s_mon%>월에는 접속한 결과가 없습니다. ^^");
								history.go(-1);
							</Script>
							<%
								Else

								do until rs.EOF 
									if rs(0) > maxwk then 
									   maxwk = rs(0) 
									end if 
									if minwk > rs(0) then 
									   minwk = rs(0) 
									end if 
									rs.movenext 
								loop 

								rs.movefirst 
						%> 
						<table width="400">
							<Tr>
							<Form action="./statistics.asp?page=<%=page%>&mode=1" method=post name=day>
								<Td colspan="2" height="35" align=center>
								<Select name =YY style="background:#C5C5C5">
											<Option value="<%=BB%>" selected> --&nbsp; 선 &nbsp;택 --</Option>
											<Option value=2001> -- 2001년 -- </Option>
											<Option value=2002> -- 2002년 -- </Option>
											<Option value=2003> -- 2003년 -- </Option>
								</Select>&nbsp;Year&nbsp;&nbsp
								
								<Select name=mon style="background:#C5C5C5">
									<Option selected value=<%=AA%>>--선택--</option>
									<Option value=1> --1월--</option>
									<Option value=2> --2월--</option>
									<Option value=3> --3월--</option>
									<Option value=4> --4월--</option>
									<Option value=5> --5월--</option>
									<Option value=6> --6월--</option>
									<Option value=7> --7월--</option>
									<Option value=8> --8월--</option>
									<Option value=9> --9월--</option>
									<Option value=10>--10월--</option>
									<Option value=11>--11월--</option>
									<Option value=12>--12월--</option>
								</Select>&nbsp;Month&nbsp;&nbsp;
								<Input Type=submit value=Search  class=button3 style="width:20%;">
							</Td>
							</Form>
						</Tr>
								
						<tr>
							<td colspan="2" height="35" align=center><b><font color=#006699><%=YY%></font> 년 <font color=#006699><%=s_mon%></font> 월의 주별 접속 통계</b></td>
						</tr>  
							
							<tr>
								<td width="200" align="middle" height="25"> 
								<font face="돋움" size="2">최대 접속 카운트 :&nbsp;&nbsp; <b><%=maxwk%></b></font> 
								</td>
								<td width="200" align="middle" height="25"> 
								<font face="돋움" size="2">최저 접속 카운트 :&nbsp;&nbsp; <b><%=minwk%></b></font> 
								</td>
							</tr>
						</table>
								
						<br> 
									
						<table border="1" bordercolor="#336699" cellspacing="0" cellpadding="0"> 
							<tr> 
								<% 
								do until rs.EOF 
								   wk = rs(0) 
								%> 
								<td valign="bottom" align="center" height="250" width="45"> 
								<font face="돋움" size="2" 
								<% if wk = minwk then %>color=red<%end if%> 
								<% if wk = maxwk then %>color=blue<%end if%> ><%=wk%></font> <img src="./images/gray.gif" width= "40"height="<%=(wk/maxwk*100)*2%>"></td> 
								<% 
								   rs.movenext 
								loop 
								%> 
							</tr>
							<tr> 
								<td align="center" height="25" ><font face="돋움" size="2">일</td> 
								<td align="center" height="25" ><font face="돋움" size="2">월</td> 
								<td align="center" height="25" ><font face="돋움" size="2">화</td> 
								<td align="center" height="25" ><font face="돋움" size="2">수</td> 
								<td align="center" height="25" ><font face="돋움" size="2">목</td> 
								<td align="center" height="25" ><font face="돋움" size="2">금</td> 
								<td align="center" height="25" ><font face="돋움" size="2">토</td> 
							</tr> 
					</table><BR>
					<%End if%>
				</Td>
			</Tr>
		</Table>
				
				<% ElseIF mode= "2" Then %>
					<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" bgcolor="#000000">
			<Tr>
				<Td align=center>
					<% 
						YY = Request("YY")
						s_mon = Request("mon")
						'response.write mon
						IF s_mon = "" Then 
							s_mon = month(now)
						End IF

						IF YY = "" Then
							YY = year(now)
						End IF

							AA = month(now)
						sql2 = "select s_day ,s_year ,count(*) as counter from statistic " 
						sql2 = sql2 & " where s_mon = " & s_mon & " and log_time Like '%"& YY &"%'"
						sql2 = sql2 & " group by s_mon, s_day ,s_year" 
						sql2 = sql2 & " order by s_mon, s_day" 

					
						
						set rs = DB.execute (sql2) 

						
						MaxNum =0 
						MinNum = 100000 

						IF RS.BOF OR RS.EOF Then
					%>
					<Script language=javascript>
						alert("<%=YY%>년 <%=s_mon%>월에는 접속한 결과가 없습니다. ^^");
						history.go(-1);
					</Script>
					<%
						Else

						do until rs.EOF 
						   if rs("counter") > MaxNum then 
							  MaxNum = rs("counter") 
							  Max_D = Rs("s_day")
						   end if 
						   if MinNum > rs("counter") then 
							  MinNum = rs("counter") 
							  Min_D = Rs("s_day")
						   end if 
						   rs.movenext 
						loop 

						'다시 레코드의 위치를 첨으로 이동합니다. 
						rs.movefirst 
				%> 
						<table width="400"> 
						
						<Tr>
						<Form action="./statistics.asp?page=<%=page%>&mode=2" method=post name=day>
							<Td colspan="2" height="35" align=center>
								<Select name =YY style="background:#C5C5C5 ">
											<Option value="<%=BB%>" selected> --&nbsp; 선 &nbsp;택 --</Option>
											<Option value=2001> -- 2001년 -- </Option>
											<Option value=2002> -- 2002년 -- </Option>
											<Option value=2003> -- 2003년 -- </Option>
								</Select>&nbsp;Year&nbsp;&nbsp
								
								<Select name=mon style="background:#C5C5C5 ">
									<Option selected value=<%=AA%>>--선택--</option>
									<Option value=1> --1월--</option>
									<Option value=2> --2월--</option>
									<Option value=3> --3월--</option>
									<Option value=4> --4월--</option>
									<Option value=5> --5월--</option>
									<Option value=6> --6월--</option>
									<Option value=7> --7월--</option>
									<Option value=8> --8월--</option>
									<Option value=9> --9월--</option>
									<Option value=10>--10월--</option>
									<Option value=11>--11월--</option>
									<Option value=12>--12월--</option>
								</Select>&nbsp;Month&nbsp;&nbsp;
								<Input Type=submit value=Search  class=button3 style="width:20%;">
							</Td>
							</Form>
						</Tr>
								
						<tr>
							<td colspan="2" height="35" align=center><b><font color=#006699><%=YY%></font> 년 <font color=#006699><%=s_mon%></font> 월의 일별 접속 통계</b></td>
						</tr> 
						
						<tr>
							<td width="200" height="25"> 
								<font face="돋움" size="2">최대 접속 카운트 :&nbsp;&nbsp; <b><%=MaxNum%></b></font> 
							</td>
							<td width="200" align="right" height="25"> 
								<font face="돋움" size="2">최저 접속 카운트 :&nbsp;&nbsp; <b><%=minnum%></b></font> 
							</td>
						</tr> 
					
						</table> <br> 
						<table border="1"  bordercolor="#336699" cellspacing="0" cellpadding="0"> 
						<tr> 

						<% 
						'이제 루프를 돌면서 각각의 카운트를 출력해 줍니다. 
						do until rs.EOF 
						   s_day = rs("s_day") 
						   counter = rs("counter") 
						
						   wid = (counter/MaxNum *100) *2 
						  
						   if wid < 1 then 
							  wid = 1 
						   end if 
						%> 

						<td valign="bottom" align="middle" height="250" width="20">
						<font face="돋움" size="2" 
						<% if counter = MinNum then %>color="red"<%end if%> 
						<% if counter = MaxNum then %>color="blue"<%end if%>><%=counter%></font>
						<img src="./images/a.gif" width= "15" height="<%=wid%>">  </td>
						<% 
						rs.movenext 
						loop 
						%>
						</tr>  
						<Tr>
						<% 
						   rs.movefirst 
						   do until rs.EOF   
							  s_day = rs("s_day")  
						%> 
						<td align="center" height="25">
						<font face="돋움" size="2" 
						<% if Min_D = s_day then %>color="red"<%end if%> 
						<% if Max_D = s_day then %>color="blue"<%end if%>><%=s_day%></font>


						</td> 

						<% 
						   rs.movenext 
						loop 
						%> 

						</Tr>
					</table><BR>
					<% End if%>
				</Td>
			</Tr>
		</Table>

		<% ElseIF mode = "3" Then %>
			
			<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" bgcolor="#000000">
			<Tr>
				<Td align=center>
				<% 
						YY = Request("YY")
						s_mon = Request("mon")
						'response.write mon
						IF s_mon = "" Then 
							s_mon = month(now) 
						End IF

						IF YY = "" Then
							YY = year(now)
						End IF

						AA = month(now)
						
						sql2 = "select s_hour ,s_year ,count(*) as counter from statistic " 
						sql2 = sql2 & " where s_mon = " & s_mon & " and log_time Like '%"& YY &"%'"
						sql2 = sql2 & " group by s_mon, s_hour ,s_year" 
						sql2 = sql2 & " order by s_mon, s_hour" 

					set rs = DB.execute (sql2) 
					
					
					MaxNum =0 
					MinNum = 100000 

					IF RS.BOF OR RS.EOF Then
					%>
					<Script language=javascript>
						alert("<%=YY%>년 <%=s_mon%>월에는 접속한 결과가 없습니다. ^^");
						history.go(-1);
					</Script>
					<%
						Else

					do until rs.EOF 
						if rs("counter") > MaxNum then 
							MaxNum = rs("counter") 
							MaxH = rs("s_hour") 
						end if 
						if MinNum> rs("counter") then 
							MinNum= rs("counter") 
							MinH= rs("s_hour") 
						end if 
					   rs.movenext 
					Loop 

					'다시 레코드의 위치를 첨으로 이동합니다. 
					rs.movefirst 
				%> 
				
						<table width="450"> 
							<Tr>
							<Form action="./statistics.asp?page=<%=page%>&mode=3" method=post name=day>
								<Td colspan="2" height="35" align=center>
								<Select name =YY style="background:#C5C5C5">
											<Option value="<%=BB%>" selected> --&nbsp; 선 &nbsp;택 --</Option>
											<Option value=2001> -- 2001년 -- </Option>
											<Option value=2002> -- 2002년 -- </Option>
											<Option value=2003> -- 2003년 -- </Option>
								</Select>&nbsp;Year&nbsp;&nbsp
								
								<Select name=mon style="background:#C5C5C5">
									<Option selected value=<%=AA%>>--선택--</option>
									<Option value=1> --1월--</option>
									<Option value=2> --2월--</option>
									<Option value=3> --3월--</option>
									<Option value=4> --4월--</option>
									<Option value=5> --5월--</option>
									<Option value=6> --6월--</option>
									<Option value=7> --7월--</option>
									<Option value=8> --8월--</option>
									<Option value=9> --9월--</option>
									<Option value=10>--10월--</option>
									<Option value=11>--11월--</option>
									<Option value=12>--12월--</option>
								</Select>&nbsp;Month&nbsp;&nbsp;
								<Input Type=submit value=Search  class=button3 style="width:20%;">
							</Td>
							</Form>
						</Tr>
								
						<tr>
							<td colspan="2" height="35" align=center><b><font color=#006699><%=YY%></font> 년 <font color=#006699><%=s_mon%></font> 월의 시간별 접속 통계</b></td>
						</tr>  
							
							<tr>
								<td width="225" height="25"> 
									<font face="돋움" size="2">최대 접속 카운트 :&nbsp;&nbsp; <b><%=maxnum%></b></font> 
									</td>
								<td width="225" height="25"> 
									<font face="돋움" size="2">최저 접속 카운트 :&nbsp;&nbsp; <b><%=minnum%></b></font> 
									</td>
							</tr> 
						</table>
						<br> 

						<table border="1" bordercolor="#336699" cellspacing="0" cellpadding="0"> 
							<tr> 
									<% 
											do until rs.EOF '이제 루프를 돌면서 각각의 카운트를 출력해 줍니다. 
											s_hour = rs("s_hour") '시간 값을 s_hour이라는 변수에 저장합니다. 
											counter = rs("counter") '시간대의 총 카운트 값을 counter라는 변수에 저장합니다. 

											'각 시간대별 카운트를 최고 카운트로 나누어 백분율을 낸 다음 2 pixel을 곱해줍니다. 
											'이미지의 사이즈를 지정하기 위한 계산입니다. 
											h = (counter / MaxNum*100)*2 

											'만일, 그 계산된 h가 1보다 작은 경우라면 최소값으로 1을 지정합니다. 
											if h< 1 then 
											  h = 1 
											end if 
											%> 
											<td valign="bottom" align="center" height="250" width="20"> 
											<font face="돋움" size="2" 
											<% if counter = MinNum then %>color=red<%end if%> 
											<% if counter = MaxNum then %>color=blue<%end if%>><%=counter%></font> 
											<img src="./images/bar3.gif" width= "15"height="<%=h%>"> 
											</td> 
											<% 
											rs.movenext 
											loop 
									%> 
							</tr> 

							<tr> 
								<% 
								   rs.movefirst 
								   do until rs.EOF  '이제 루프를 돌면서 각각의 카운트를 출력해 줍니다. 
									  s_hour = rs("s_hour")  '시간 값을 s_hour이라는 변수에 저장합니다. 
								%> 
								<td align="center" height="25">
									<font face="돋움" size="2" <% if maxH = s_hour then%>color=blue<%end if%> 
																						<% if minH = s_hour then%>color=red<%end if%>><%=s_hour%></font> 
								</td> 
								<%
								   rs.movenext 
								   loop
								%>
							</tr> 
						</table><BR>
						<%End if%>
				</Td>
			</Tr>
		</Table>

		<% End IF %>
		</TD>
		</TR>
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
<%
		RS.Close
		DB.Close

		Set RS = Nothing
		Set DB = Nothing
%>