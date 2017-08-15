
<!---#include file="../dbconn.asp"--->
<!---#include file="../session3.asp"--->
<%

	num = Request("num")
	page = Request("page")

	Sql = "Select * From members Where num="&num

	Set Rs = Server.CreateObject("ADODB.RecordSet")
	
	Rs.Open Sql , Db

%>

<html>
<head>
<title>◇ ◆ OyesMall 회원정보◆ ◇</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<LINK href="../image/style.css" type="text/css" rel="STYLESHEET">
<LINK href="../image/style2.css" type="text/css" rel="STYLESHEET">
	<LINK href="join.files/style.css" type=text/css rel=StyleSheet>
		
		

	<Script Language="JavaScript">
				<!--
				function write_ok() 
					{
						
						if ( document.AA.passwd.value == "" ) 
							{
								alert("PassWord를 기입해 주세요 ^^");
								document.AA.passwd.focus();
								return false;
							}
						if ( document.AA.passwd_a.value == "" ) 
							{
								alert("비밀번호 힌트에 대한 답변을 기입해 주세요 ^^");
								document.AA.passwd_a.focus();
								return false;
							}
						if ( document.AA.name.value == "" ) 
							{
								alert("회원의 이름을 기입해 주세요 ^^");
								document.AA.name.focus();
								return false;
							}
						if ( document.AA.jumin1.value == "" ) 
							{
								alert("주민등록번호 앞자리를 기입해 주세요 ^^");
								document.AA.jumin1.focus();
								return false;
							}
						if ( document.AA.jumin2.value == "" ) 
							{
								alert("주민등록번호 뒷자리를 기입해 주세요 ^^");
								document.AA.jumin2.focus();
								return false;
							}
						if ( document.AA.birth_yy.value == "" ) 
							{
								alert("생년월일중 태어난 해를 기입해 주세요 ^^");
								document.AA.birth_yy.focus();
								return false;
							}
						if ( document.AA.birth_mm.value == "" ) 
							{
								alert("생년월일중 태어난 달을 기입해 주세요  ^^");
								document.AA.birth_mm.focus();
								return false;
							}
						if ( document.AA.birth_dd.value == "" ) 
							{
								alert("생년월일중 태어난 일을 기입해 주세요 ^^");
								document.AA.birth_dd.focus();
								return false;
							}
						
						if ( document.AA.point.value == "" ) 
							{
								alert("Point 점수를 기입해 주세요 ^^");
								document.AA.point.focus();
								return false;
							}
						if ( document.AA.address.value == "" ) 
							{
								alert("회원의 주소를 기입해 주세요 ^^");
								document.AA.address.focus();
								return false;
							}
						if ( document.AA.tel1_1.value == "" ) 
							{
								alert("지역번호를 기입해 주세요 ^^");
								document.AA.tel1_1.focus();
								return false;
							}
						if ( document.AA.tel1_2.value == "" ) 
							{
								alert("전화번호 국번을 기입해 주세요 ^^");
								document.AA.tel1_2.focus();
								return false;
							}
						if ( document.AA.tel1_3.value == "" ) 
							{
								alert("전화번호를 기입해 주세요 ^^");
								document.AA.tel1_3.focus();
								return false;
							}
						if ( document.AA.email.value == "" ) 
							{
								alert("회원의 E-Mail주소를 기입해 주세요 ^^");
								document.AA.email.focus();
								return false;
							}
					
								
						
				document.AA.submit();
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
							<TD>&nbsp; &nbsp; <FONT face=돋움 size=2><B> MEMBERS</B></FONT></TD>
							<TD align=middle width=150 bgColor=#222222><FONT face=돋움><B>회 원 관 리</B></FONT>
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
			
			<TD vAlign=top align=left>&nbsp;&nbsp;<B><font size=2 color=#ff6600><%=Trim(Rs("name"))%></font></B>&nbsp;회원의 상세정보 페이지 입니다. 
			<BR></TD>
		</TR>
		</TBODY>
	</TABLE>
<BR>
<Div align=center>

	<TABLE cellSpacing=0 cellPadding=0 width="98%" border=1 bordercolor="#4A494A">
		<TBODY>
					 <TR>
							<Td align=center>
							<Table width="100%" cellSpacing="0" cellPadding="3" border="0">
		<Form method=post action="./join_edit_ok.asp" name=AA>
		<input type=hidden name=num value=<%=num%>>
		<input type=hidden value="<%=page%>" name=page>
	
	
		<TBODY>
		<TR>
			<TD width=120 bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">회원 ID</B></TD>
			<TD><B><%=Rs("user_id")%></B> </TD>
		</TR>

		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">비밀번호</B></TD>
			<TD><INPUT maxLength=8  style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100px;background:#C5C5C5" name=passwd value="<%=Rs("passwd")%>" type=password> </TD>
		</TR>

		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">비밀번호 힌트</B></TD>
			<TD><SELECT name=passwd_q style="WIDTH: 220px;BACKGROUND: #C5C5C5; "> 
							<OPTION <% IF RS("passwd_q")="어머니의 성함은?" Then %>Selected <%End IF%>>어머니의 성함은?</OPTION> 
							<OPTION <% IF RS("passwd_q")="아버지의 성함은?" Then %>Selected <%End IF%>>아버지의 성함은?</OPTION> 
							<OPTION <% IF RS("passwd_q")="자신의 별명은?" Then %>Selected <%End IF%>>자신의 별명은?</OPTION> 
						    <OPTION <% IF RS("passwd_q")="기억에 남는 추억의 장소는?"Then %>Selected <%End IF%>>기억에 남는 추억의 장소는?</OPTION> 
							<OPTION <% IF RS("passwd_q")="가장 여행하고 싶은 나라는?"Then %>Selected <%End IF%>>가장 여행하고 싶은 나라는?</OPTION> 
							<OPTION <% IF RS("passwd_q")="자신의 보물 제1호는?"Then %>Selected <%End IF%>>자신의 보물 제1호는?</OPTION> 
							<OPTION <% IF RS("passwd_q")="가장 감명깊게 본 영화는?"Then %>Selected <%End IF%>>가장 감명깊게 본 영화는?</OPTION> 
							<OPTION <% IF RS("passwd_q")="배우자의 생년월일은?(예)1970/05/25"Then %>Selected <%End IF%>>배우자의 생년월일은?(예)1970/05/25</OPTION> 
						    <OPTION <% IF RS("passwd_q")="좋아하는 색깔은?"Then %>Selected <%End IF%>>좋아하는 색깔은?</OPTION>
					  </Select></TD>
		</TR>

		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">답 변</B></TD>
			<TD><INPUT maxLength=20 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100px;background:#C5C5C5" name=passwd_a value="<%=Rs("passwd_a")%>"> </TD>
		</TR>
		
		
		
		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">이 름</B></TD>
			<TD><INPUT maxLength=8 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:100px;background:#C5C5C5"  name=name value="<%=Trim(Rs("name"))%>" readonly></TD>
		</TR>
		
		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">주민등록번호</B></TD>
			<TD><INPUT maxLength=6 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:70px;background:#C5C5C5" name=jumin1 value="<%=Rs("jumin1")%>">&nbsp;-&nbsp;<INPUT maxLength=7 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:70px;background:#C5C5C5" name=jumin2 value="<%=Rs("jumin2")%>"> </TD>
		</TR>

		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">생년월일</B></TD>
			<TD><INPUT maxLength=20 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:60px;background:#C5C5C5" name=birth_yy value=<%=Rs("birth_yy")%>> 년  <SELECT style="WIDTH:55px;BACKGROUND: #C5C5C5; " name=birth_mm>  
			  <OPTION <% if Rs("birth_mm")=01 then %>Selected <%end if%> value=01>01</OPTION>
			  <OPTION <% if Rs("birth_mm")=02 then %>Selected <%end if%> value=02>02</OPTION>
			  <OPTION <% if Rs("birth_mm")=03 then %>Selected <%end if%> value=03>03</OPTION>
			  <OPTION <% if Rs("birth_mm")=04 then %>Selected <%end if%> value=04>04</OPTION> 
			  <OPTION <% if Rs("birth_mm")=05 then %>Selected <%end if%> value=05>05</OPTION> 
			  <OPTION <% if Rs("birth_mm")=06 then %>Selected <%end if%> value=06>06</OPTION> 
			  <OPTION <% if Rs("birth_mm")=07 then %>Selected <%end if%> value=07>07</OPTION> 
			  <OPTION <% if Rs("birth_mm")=08 then %>Selected <%end if%> value=08>08</OPTION>
			  <OPTION <% if Rs("birth_mm")=09 then %>Selected <%end if%> value=09>09</OPTION> 
			  <OPTION <% if Rs("birth_mm")=10 then %>Selected <%end if%> value=10>10</OPTION> 
			  <OPTION <% if Rs("birth_mm")=11 then %>Selected <%end if%> value=11>11</OPTION> 
			  <OPTION <% if Rs("birth_mm")=12 then %>Selected <%end if%> value=12>12</OPTION> 

			  
			 </SELECT> 월 
			 
			 <SELECT style="WIDTH:55px;BACKGROUND: #C5C5C5; " name=birth_dd> 
			  
			  <OPTION <% if Rs("birth_dd")=01 then %>Selected <%end if%>value=01>01</OPTION> 
			  <OPTION <% if Rs("birth_dd")=02 then %>Selected <%end if%>value=02>02</OPTION> 
			  <OPTION <% if Rs("birth_dd")=03 then %>Selected <%end if%>value=03>03</OPTION> 
			  <OPTION <% if Rs("birth_dd")=04 then %>Selected <%end if%>value=04>04</OPTION> 
			  <OPTION <% if Rs("birth_dd")=05 then %>Selected <%end if%>value=05>05</OPTION> 
			  <OPTION <% if Rs("birth_dd")=06 then %>Selected <%end if%>value=06>06</OPTION> 
			  <OPTION <% if Rs("birth_dd")=07 then %>Selected <%end if%>value=07>07</OPTION> 
			  <OPTION <% if Rs("birth_dd")=08 then %>Selected <%end if%>value=08>08</OPTION> 
			  <OPTION <% if Rs("birth_dd")=09 then %>Selected <%end if%>value=09>09</OPTION> 
			  <OPTION <% if Rs("birth_dd")=10 then %>Selected <%end if%>value=10>10</OPTION> 
			  <OPTION <% if Rs("birth_dd")=11 then %>Selected <%end if%>value=11>11</OPTION> 
			  <OPTION <% if Rs("birth_dd")=12 then %>Selected <%end if%>value=12>12</OPTION> 
			  <OPTION <% if Rs("birth_dd")=13 then %>Selected <%end if%>value=13>13</OPTION> 
			  <OPTION <% if Rs("birth_dd")=14 then %>Selected <%end if%>value=14>14</OPTION> 
			  <OPTION <% if Rs("birth_dd")=15 then %>Selected <%end if%>value=15>15</OPTION> 
			  <OPTION <% if Rs("birth_dd")=16 then %>Selected <%end if%>value=16>16</OPTION> 
			  <OPTION <% if Rs("birth_dd")=17 then %>Selected <%end if%>value=17>17</OPTION> 
			  <OPTION <% if Rs("birth_dd")=18 then %>Selected <%end if%>value=18>18</OPTION> 
			  <OPTION <% if Rs("birth_dd")=19 then %>Selected <%end if%>value=19>19</OPTION> 
			  <OPTION <% if Rs("birth_dd")=20 then %>Selected <%end if%>value=20>20</OPTION> 
			  <OPTION <% if Rs("birth_dd")=21 then %>Selected <%end if%>value=21>21</OPTION> 
			  <OPTION <% if Rs("birth_dd")=22 then %>Selected <%end if%>value=22>22</OPTION> 
			  <OPTION <% if Rs("birth_dd")=23 then %>Selected <%end if%>value=23>23</OPTION> 
			  <OPTION <% if Rs("birth_dd")=24 then %>Selected <%end if%>value=24>24</OPTION> 
			  <OPTION <% if Rs("birth_dd")=25 then %>Selected <%end if%>value=25>25</OPTION> 
			  <OPTION <% if Rs("birth_dd")=26 then %>Selected <%end if%>value=26>26</OPTION> 
			  <OPTION <% if Rs("birth_dd")=27 then %>Selected <%end if%>value=27>27</OPTION> 
			  <OPTION <% if Rs("birth_dd")=28 then %>Selected <%end if%>value=28>28</OPTION>
			  <OPTION <% if Rs("birth_dd")=29 then %>Selected <%end if%>value=29>29</OPTION> 
			  <OPTION <% if Rs("birth_dd")=30 then %>Selected <%end if%>value=30>30</OPTION> 
			  <OPTION <% if Rs("birth_dd")=31 then %>Selected <%end if%>value=31>31</OPTION> 
			</SELECT> 일 &nbsp; 
            <INPUT type=radio value=1 <% If Rs("birth_gbn")=1 Then %>Checked <% end if %> name=birth_gbn>양력 
			<INPUT 
            type=radio value=2 <% If Rs("birth_gbn")=2 Then %>Checked <%End if %>name=birth_gbn>음력 </FONT></TD></TR>
		
		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">적립금</B></TD>
			<TD><INPUT maxLength=20 style="WIDTH: 70px;BACKGROUND: #C5C5C5; " name=point value="<%=Rs("point")%>"> </TD>
		</TR>

		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">결혼유무</B></TD>
			<TD>
				<INPUT type=radio value=1 <% IF Rs("ismarry")=1 Then %>CHECKED 
					<%end if%> name=ismarry >미혼 
				<INPUT type=radio value=2 <% If Rs("ismarry")=2 Then %>CHECKED 
					<%End if%>name=ismarry>기혼</FONT> </TD>
		</TR>

	
		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">주 소</B></TD>
			<TD><INPUT  style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:400px;background:#C5C5C5" maxLength=100 name=address value="<%=Rs("address")%>"> </TD>
		</TR>
		
		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">전화번호</B></TD>
			<TD>
				<INPUT  maxLength=3  style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:50px;background:#C5C5C5" name=tel1_1 value="<%=Rs("tel1_1")%>">
				&nbsp;-&nbsp; 
				<INPUT maxLength=4 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:50px;background:#C5C5C5"  name=tel1_2 value="<%=Rs("tel1_2")%>">
				&nbsp;-&nbsp; 
				<INPUT maxLength=4 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:50px;background:#C5C5C5" name=tel1_3 value="<%=Rs("tel1_3")%>"> 
				
				<INPUT type=radio value=1 <% IF RS("whereTel1")=1 Then %>Checked<%End if%> name=whereTel1>직장 
				<INPUT type=radio value=2 <% If Rs("whereTel1")=2 Then %> Checked<%end if%> name=whereTel1>자택
				
			</TD>
		</TR>
        
		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">휴대폰</B></TD>
			<TD>
				<INPUT maxLength=3 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:50px;background:#C5C5C5" name=hp1 value="<%=Rs("hp1")%>">
				&nbsp;-&nbsp; 
				<INPUT maxLength=4 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:50px;background:#C5C5C5" name=hp2 value="<%=Rs("hp2")%>">
				&nbsp;-&nbsp; 
				<INPUT  maxLength=4 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:50px;background:#C5C5C5" name=hp3 value="<%=Rs("hp3")%>">
			</TD>
		</TR>

		
        <TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">직 업</B></TD>
			<TD>
				  <SELECT name=job style="WIDTH: 130px;BACKGROUND: #C5C5C5; "> 
					<OPTION <% if Rs("job")="고등학생" then %>Selected <%end if%>>학생</OPTION>  
					
					<OPTION <% if Rs("job")="대학생" then %>Selected <%end if%>>대학생</OPTION>   
					<OPTION <% if Rs("job")="컴퓨터/인터넷" then %>Selected <%end if%>>컴퓨터/인터넷</OPTION>  
					<OPTION <% if Rs("job")="언론" then %>Selected <%end if%>>언론</OPTION>  
					<OPTION <% if Rs("job")="공무원" then %>Selected <%end if%>>공무원</OPTION>  
					<OPTION <% if Rs("job")="군인" then %>Selected <%end if%>>군인</OPTION>  
					<OPTION <% if Rs("job")="서비스업" then %>Selected <%end if%>>서비스업</OPTION>   
					<OPTION <% if Rs("job")="교육" then %>Selected <%end if%>>교육</OPTION>   
					<OPTION <% if Rs("job")="금융/증권/보험업" then %>Selected <%end if%>>금융/증권/보험업</OPTION>   
					<OPTION <% if Rs("job")="유통업" then %>Selected <%end if%>>유통업</OPTION>  
					<OPTION <% if Rs("job")="예술" then %>Selected <%end if%>>예술</OPTION>  
					<OPTION <% if Rs("job")="의료" then %>Selected <%end if%>>의료</OPTION>  
					<OPTION <% if Rs("job")="법률" then %>Selected <%end if%>>법률</OPTION>   
					<OPTION <% if Rs("job")="건설업" then %>Selected <%end if%>>건설업</OPTION>   
					<OPTION <% if Rs("job")="제조업" then %>Selected <%end if%>>제조업</OPTION>  
					<OPTION <% if Rs("job")="부동산업" then %>Selected <%end if%>>부동산업</OPTION>   
					<OPTION <% if Rs("job")="운송업" then %>Selected <%end if%>>운송업</OPTION>   
					<OPTION <% if Rs("job")="농/수/임/광산업" then %>Selected <%end if%>>농/수/임/광산업</OPTION>   
					<OPTION <% if Rs("job")="가사" then %>Selected <%end if%>>가사</OPTION>   
					<OPTION <% if Rs("job")="무직" then %>Selected <%end if%>>무직</OPTION>  
					<OPTION <% if Rs("job")="기타" then %>Selected <%end if%>>기타</OPTION>  
				</SELECT>
			</TD>
		</TR>

		<TR>
			<TD bgColor="#4A494A">
				<IMG src="../image/icon_orange.gif">E-Mail</B></TD>
			<TD><INPUT maxLength=25 style="BORDER-RIGHT: #366670 1px solid; BORDER-TOP: #366670 1px solid; BORDER-LEFT: #366670 1px solid; BORDER-BOTTOM: #366670 1px solid;width:150px;background:#C5C5C5" name=email value="<%=Rs("email")%>"> </TD>
		</TR>
		</TBODY>
	</TABLE>
	</TD>
	</TR>
	</Tbody>
	</Table>
	</Div>
	<BR>

	
	<table width="100%" border="0" bgcolor="#000000">
		<TBODY>
			<TR>
				<TD>
					<TABLE height=26 cellSpacing=0 cellPadding=0 width="100%" border=0>
						<TBODY>
							<TR>
								<TD align=middle><INPUT class=button2 style="width:80px;"  type=button value="정보변경" onclick="write_ok();">&nbsp; 
									<INPUT id=reset1 class=button2 style="width:80px;" type=reset value=다시쓰기 name=reset1>&nbsp;&nbsp;<input type="button" class=button2 style="width:80px;" value="LIST" onClick="history.go(-1);"> 
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
		</TBODY>
	</FORM>
	</TABLE>
	


	<%
			RS.Close
			DB.Close

			Set RS = Nothing
			Set DB = Nothing
	%>
        
        
       
        
 


	
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
