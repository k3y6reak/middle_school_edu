
<!-- #include file = "./include/dbconnect.asp" -->

<%

dim rs
dim sql
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
dim p_total_count
dim contents(9)
dim counts(9)
dim CheckMode
dim i

p_num = request ("p_num")

sql = "select * from poll where p_num = "&cint(p_num)&""
set rs = db.execute(sql)

	p_name				= rs ("p_name")
	p_email				= rs ("p_email")
	p_title				= rs ("p_title")
	p_qcount			= rs ("p_qcount")
	p_over				= rs ("p_over")
	p_date				= rs ("p_date")
	contents(0)		= rs ("p_q1")
	contents(1)		= rs ("p_q2")
	contents(2)		= rs ("p_q3")
	contents(3)		= rs ("p_q4")
	contents(4)		= rs ("p_q5")
	contents(5)		= rs ("p_q6")
	contents(6)		= rs ("p_q7")
	contents(7)		= rs ("p_q8")
	contents(8)		= rs ("p_q9")
	counts(0)			= rs ("p_q1_count")
	counts(1)			= rs ("p_q2_count")
	counts(2)			= rs ("p_q3_count")
	counts(3)			= rs ("p_q4_count")
	counts(4)			= rs ("p_q5_count")
	counts(5)			= rs ("p_q6_count")
	counts(6)			= rs ("p_q7_count")
	counts(7)			= rs ("p_q8_count")
	counts(8)			= rs ("p_q9_count")
	p_total_count		= rs ("p_total_count")

rs.close()
set rs = nothing

if cint(p_over) = 1 then

	CheckMode = "checkbox"

else

	CheckMode = "radio"

end if

%>

<html>
<head>
<script language="javascript">
<!--
function sendform()
{
	form = document.myform;
	form.submit();
}
-->
</script>
<link rel="stylesheet" type="text/css" href="./include/coom.css">
</head>
<body>
<center><br><br>
<form action="VoteOk.asp" method="post" name="myform">
<input type="hidden" name="p_num" value="<%=p_num%>">

<table width=600 border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
<tr height=35 bgcolor="#F0F0F0">
	<td align=center><b><%=p_title%></b></td>
</tr>
<tr height=22>
	<td>
		<br>
		<%
		for i = 0 to cint(p_qcount) - 1
		%>
		&nbsp;&nbsp;&nbsp;<input type="<%=CheckMode%>" name="cValue" value="<%=cint(i)+1%>">&nbsp;<%=contents(i)%><br>
		<%
		next
		%>
		<br>
	</td>
</tr>
</table>
<br>
<input type="button" value="  투표하기  " onclick="sendform();">&nbsp;<input type="button" value="  투표결과  " onclick="location.href='./View.asp?p_num=<%=p_num%>';">

</form>
</body>
</html>