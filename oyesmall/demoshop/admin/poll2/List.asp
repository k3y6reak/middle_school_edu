

<!-- #include file = "./include/dbconnect.asp" -->

<%

dim rs
dim sql
dim AllRs
dim Rows
dim RowsCount
dim Cols
dim p_num
dim p_name
dim p_email
dim p_title
dim p_qcount
dim p_over	
dim p_date	
dim p_q1
dim p_q2
dim p_q3
dim p_q4
dim p_q5
dim p_q6
dim p_q7
dim p_q8
dim p_q9
dim p_q1_count
dim p_q2_count
dim p_q3_count
dim p_q4_count
dim p_q5_count
dim p_q6_count
dim p_q7_count
dim p_q8_count
dim p_q9_count
dim p_vote_count

call PageLoad()
call GetTable()
call PageUnLoad()

'------------------------------------------------------------------------

sub PageLoad()

end sub

'------------------------------------------------------------------------

sub PageUnLoad()

end sub

'------------------------------------------------------------------------

sub GetTable()

	sql = "select p_num,p_name,p_email,p_title,p_qcount,p_date,p_vote_count from poll order by p_date desc"
	set rs = db.execute(sql)

		if rs.eof or rs.bof then
		else

			AllRs = rs.getstring(2,,chr(9),chr(13)&chr(14))
			Rows = split(AllRs,chr(13)&chr(14))
			RowsCount = ubound(Rows)

		end if

	rs.close()
	set rs = nothing

end sub

'------------------------------------------------------------------------

function GetData(i)

	Cols			= split(Rows(i),chr(9))
	p_num			= Cols(0)
	p_name			= Cols(1)
	p_email			= Cols(2)
	p_title			= Cols(3)
	p_qcount		= Cols(4)
	p_date			= Cols(5)
	p_vote_count	= Cols(6)

end function

'------------------------------------------------------------------------

%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="./include/coom.css">
<script language="javascript">
<!--
function goDel(vv)
{
	var str = confirm("설문조사 삭제를 선택하셨습니다\n\n계속 하시겠습니까?");
	if (str)
	{
		location.href = "./DelPollok.asp?p_num=" + vv;
	}
	else
	{
		return;
	}
}
-->
</script>
</head>
<body>
<center>
<h3>설문조사</h3>
<br><br>

<table width=780 border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
<tr bgcolor="#F0F0F0" align="center" height=22>
	<th width=30>번호</td>
	<th>설 문 제 목</td>
	<th>투표</td>
	<th>작성자</td>
	<th>문항</td>
	<th>참가인원</td>
	<th>등록일</td>	
	<th>삭제</td>
</tr>

<%
For i = 0 to RowsCount - 1
GetData(i)
%>

<tr align=center height=22>
	<td class="tahomaType"><%=cint(i)+1%></td>
	<td align="left">&nbsp;<a href="./View.asp?p_num=<%=p_num%>" onfocus="blur();"><%=p_title%></a></td>
	<td><a href="./Vote.asp?p_num=<%=p_num%>">투표</a></td>
	<td><%=p_name%></td>
	<td><%=p_qcount%></td>
	<td align="right"><%=formatnumber(p_vote_count,0)%>&nbsp;명&nbsp;</td>
	<td class="tahomaType"><%=formatdatetime(p_date,2)%></td>
	<td><a href="javascript:goDel(<%=p_num%>);">삭제</a></td>
</tr>

<%
Next
%>

</table>
<br>
<a href="./AddPoll.asp">설문 등록</a>

</body>
</html>