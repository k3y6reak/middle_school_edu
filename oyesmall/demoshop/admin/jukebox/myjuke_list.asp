

<!---#include file="../dbconn.asp"--->
<!---#include file="../session.asp"--->

<%
'	Sql = "Select * From my_juke Order By num Asc"

	SQL = "SELECT J.num, J.title, J.name, J.category, M.SessionID, M.ck, M.mp3,M.j_num From Juke J, my_juke M WHERE J.num=M.ck AND M.SessionID="&Session.SessionID&" ORDER BY j_num ASC"
	
'	Response.write sql
'	response.end
	Set J_Rs = Db.Execute(SQL)

	If Not J_Rs.Eof Then
	
%>
<Html>
<Head>
<Title>O~yesMall 【Juke Box 선택곡 리스트】</Title>
<STYLE type=text/css>
SELECT {
	FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: 굴림
}
INPUT {
	FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: 굴림
}
TEXTAREA {
	FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: 굴림
}
OPTION {
	FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: 굴림
}
BODY {
	FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: "굴림"; TEXT-DECORATION: none
}
A:link {
	COLOR: black; TEXT-DECORATION: none; font-color: #333300
}
A:visited {
	COLOR: black; TEXT-DECORATION: none; font-color: #333300
}
A:active {
	COLOR: black; TEXT-DECORATION: none; font-color: #333300
}
A:hover {
	COLOR: black; TEXT-DECORATION: none; font-color: #cc6600
}
TR {
	FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: "굴림"; TEXT-DECORATION: none
}
TD {
	FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: "굴림"; TEXT-DECORATION: none
}
</STYLE>
<Script Language="Javascript">
function delit() 
			{
			if(!confirm("JukeBox 를 삭제 하시겠습니까?")) return;					
			document.checkform.action="./myjukeall_del.asp?page=<%=page%>";
			document.checkform.submit();
			}


function jukeit() {
						document.jForm.action="JukeBox_list.asp"
						document.jForm.submit();
					   }


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
				   { alert(" 하나 이상의 항목을 선택해야 합니다."); }
				  else 
					{ 
					  { 
						url="song.asp";    
						window.open(url,"aaa","top=100,left=100,width=300,height=300,toolbar=no,location=0,directory=0,status=0,menubar=0,scrollbars=no,resizable=1");
						document.jForm.target="aaa";
						document.jForm.action = url;
						window.jForm.submit(); }
					}        
			}               
</Script>
</Head>
<body Bgcolor=#D8D4B6>

	<TABLE cellSpacing=0 borderColorDark=#ffffff cellPadding=2 width="100%" 
		borderColorLight=#999966 border=1>
		<Form name=jForm method=POST>
		<TBODY>
		  <tr>
			<td>
				<tr>
				
				<td width="5%" align=center bgColor=#333300 height=25><Font color=ffffff><b>No.</b></font></td>

						<td align=center bgColor=#333300 height=25 width="17%"><Font color=ffffff><b>Title&nbsp;/&nbsp;Album</B></Font></td>

						<td width="13%" align=center bgColor=#333300 height=25><Font color=ffffff><b>Singer&nbsp;/&nbsp;Group</b></font></td>

						<td width="5%" align=center bgColor=#333300 height=25><Font color=ffffff><b>♬</b></font></td>

						<td width="5%" align=center bgColor=#333300 height=25><Font color=ffffff><B>Chk</B></font></td>

						<td width="5%" align=center bgColor=#333300 height=25><Font color=ffffff><b>Del</b></font></td>
			</tr>
			
			<%
				Count = 10

				While Not J_Rs.Eof and Count >0 

				no = 10 - Count + 1
			%>
					<tr bgcolor="#D8D4B6" onMouseOver="this.style.backgroundColor='#CBDFE4'" onMouseOut="this.style.backgroundColor='#D8D4B6'">
						
						<td align=center><%=no%></td>
						<td align=center><%=J_Rs("title")%></td>
						<td align=center><%=J_Rs("name")%></td>
						<td align=center><A href="mmst://211.187.59.231/oyesmall/<%=J_Rs("category")%>/<%=J_Rs("mp3")%>"><Font color=Black><b>♬</b></font></a></td>
						<Td align=center><Input type=checkbox name=check value=<%=J_Rs("ck")%>></td>
					    <td align=center><A Href="./myjuke_del.asp?num=<%=J_Rs("j_num")%>"><img src="./images/del.gif" border=0></a></td>
						

						
					</tr>
			<%
				J_Rs.MoveNext
				Count = Count - 1
				Wend
				
				If  Count > 0 Then
				
					For i=1 To Count
			%>
			<tr bgcolor="#D8D4B6" onMouseOver="this.style.backgroundColor='#CBDFE4'" onMouseOut="this.style.backgroundColor='#D8D4B6'">
				<td align=center>&nbsp;</td>
				<td align=center>&nbsp;</td>
				<td align=center>&nbsp;</td>
				<td align=center>&nbsp;</td>
				<td align=center>&nbsp;</td>
				<td align=center>&nbsp;</td>
			</tr>
			<% 
				Next
				End if
			%>
			
				
			</td>
		  </tr>
		</table>

		
<Div Align=center>
	<input type=button name="j_check" value=" &nbsp;&nbsp;전 체 선 택 &nbsp;&nbsp;" OnClick='this.value=jCheck(this.form.check);' style="BACKGROUND-COLOR: #ffcc33">
	&nbsp;&nbsp;
	<INPUT  style="BACKGROUND-COLOR: #ffcc33" onclick="song();" type=button value=" My JukeBox 듣기 ">
	&nbsp;&nbsp;
	<INPUT style="BACKGROUND-COLOR: #ffcc33" onclick="delit();" type=button value=" 쥬크박스 비우기 "> 
</Div>
		
	<%
			End if
			J_Rs.Close
			DB.Close

			Set J_Rs = Nothing
			Set DB = Nothing
	%>
</Body>
</Html>