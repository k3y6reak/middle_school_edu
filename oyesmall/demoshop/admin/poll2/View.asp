<%
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
'
'	�������縦 ����ϰ�, ������ �� �ִ� ���α׷��Դϴ�.
'	��ġ���� ����� �����ϱ�, ���ܼ���.txt ������ ���ð�	
'	��ġ�Ͻø� �ǰڽ��ϴ�.
'	���� �������̳�, ���״� �Ʒ� ���Ϸ� ��������.
'	������ �ǽñ�...
'
'	������ : ��ũ�ٽ� ( cuqdas@coom.co.kr )
'
':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
%>

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
dim p_vote_count
dim p_total_count
dim contents(9)
dim counts(9)
dim percents(9)
dim TailRecordCount
dim AllTail
dim TailRows
dim TailCount
dim Cols
dim t_num
dim t_name
dim t_email
dim t_content
dim t_date
dim t_ip

call PageLoad()
call GetRow()
call GetTail()
call PageUnLoad()

'*----------------------------------------------------------------------------------------------------*
'������ �ε�� �ڵ�
sub PageLoad()

	p_num = request ("p_num")

end sub

'*----------------------------------------------------------------------------------------------------*
'������ ��ε�� �ڵ�
sub PageUnLoad()

	db.close()

end sub

'*----------------------------------------------------------------------------------------------------*
'������ ��ȣ�� ������ ��������
sub GetRow()

	sql = "select * from poll where p_num = "&cint(p_num)&""
	set rs = db.execute(sql)

		p_num				= rs ("p_num")
		p_name				= rs ("p_name")
		p_email				= rs ("p_email")
		p_title				= rs ("p_title")
		p_qcount			= rs ("p_qcount")
		p_over				= rs ("p_over")
		p_date				= rs ("p_date")
		contents(0)			= rs ("p_q1")
		contents(1)			= rs ("p_q2")
		contents(2)			= rs ("p_q3")
		contents(3)			= rs ("p_q4")
		contents(4)			= rs ("p_q5")
		contents(5)			= rs ("p_q6")
		contents(6)			= rs ("p_q7")
		contents(7)			= rs ("p_q8")
		contents(8)			= rs ("p_q9")
		counts(0)			= rs ("p_q1_count")
		counts(1)			= rs ("p_q2_count")
		counts(2)			= rs ("p_q3_count")
		counts(3)			= rs ("p_q4_count")
		counts(4)			= rs ("p_q5_count")
		counts(5)			= rs ("p_q6_count")
		counts(6)			= rs ("p_q7_count")
		counts(7)			= rs ("p_q8_count")
		counts(8)			= rs ("p_q9_count")
		p_vote_count		= rs ("p_vote_count")
		p_total_count		= rs ("p_total_count")

	rs.close()
	set rs = nothing

	for i = 0 to 8

		if cdbl(counts(i)) = 0 then

			percents(i) = 0

		else

			percents(i) = ((counts(i) / p_total_count) * 1000)/10

		end if

	next

end sub

'*----------------------------------------------------------------------------------------------------*
'������ ��ȣ�� ����� ��Ÿ�ǰ� ���̺� ���ڵ�V ��������
sub GetTail()

	'���̺��� �����ϴ��� üũ
	sql = "select name from sysobjects where name = 'poll_tail'"
	set rs = db.execute(sql)
	
		if rs.eof or rs.bof then 
					
			exit sub
				
		end if
	
	rs.Close()

	sql = "select count(t_num) from poll_tail where t_num="&p_num&""
	set rs = db.execute(sql)

		TailRecordCount = rs(0)

	rs.close()

	sql="select t_num,t_name,t_email,t_content,t_date,t_ip from poll_tail where t_num="&p_num&" order by t_date"
	set rs = db.execute(sql)

	if not (rs.bof or rs.eof) then

		AllTail = rs.getstring(2,,chr(9),chr(13)&"^")		
		TailRows = split(AllTail,chr(13)&"^")
		TailCount = ubound(TailRows)		

	end if

	rs.close()
	
	str = "<script language='javascript'>"
	str = str & "function check_w(vv){if (vv.value == ''){vv.value = vv.defaultValue;}}"
	str = str & "function clear_w(vv){if (vv.value == vv.defaultValue){vv.value = '';}}"
	str = str & "function sendform(form)"
	str = str & "{"
	str = str & "if (form.t_content.value == form.t_content.defaultValue){alert('�ϰ��� ���� �� ������');return;}"	
	str = str & "if (form.t_name.value == form.t_name.defaultValue){form.t_name.value = ''}"	
	str = str & "emailEx1 = /[^@]+@[A-Za-z0-9_-]+.[A-Za-z]+/;"
	str = str & "emailEx2 = /[^@]+@[A-Za-z0-9_-]+.[A-Za-z0-9_-]+.[A-Za-z]+/;"
	str = str & "emailEx3 = /[^@]+@[A-Za-z0-9_-]+.[A-Za-z0-9_-]+.[A-Za-z0-9_-]+.[A-Za-z]+/;"
	str = str & "var str = '';"
	str = str & "if(emailEx1.test(form.t_email.value)) str = form.t_email.value;"
	str = str & "if(emailEx2.test(form.t_email.value)) str = form.t_email.value;"
	str = str & "if(emailEx3.test(form.t_email.value)) str = form.t_email.value;"
	str = str & "form.t_email.value=str;"
	str = str & "form.submit();"
	str = str & "}"
	str = str & "</script>"
	
	Response.Write str

end sub

'*----------------------------------------------------------------------------------------------------*
'��Ÿ�ǰ� : ������ �����͸� �迭�� ���� --> �� ������ ����
function GetDataTail()

	Cols		= split(TailRows(i),chr(9))
	t_num		= Cols(0)
	t_name		= Cols(1)
	t_email		= Cols(2)
	t_content	= Cols(3)
	t_date		= Cols(4)
	t_ip		= Cols(5)
	
	if t_name = "" then
		
		t_name = t_ip
		
	end if	

end function

'*----------------------------------------------------------------------------------------------------*

%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="./include/coom.css">
</head>
<body>
<form action='TailWrite.asp' name='myform' method='post'>
<center><br><br><br>

<table width=600 border="1" cellspacing="0" cellpadding=10 bordercolordark="white" bordercolorlight="black">
<tr height=25 bgcolor="#F0F0F0">
	<td width=600>
		<b><%=p_title%></b>&nbsp;&nbsp;&nbsp;�� <%=formatnumber(p_vote_count,0)%> �� ��ǥ
	</td>
<tr>
<tr>
	<td width=600 valign="center">		
		<%
		For i = 0 to cint(p_qcount) - 1
		%>
		<%=cint(i)+1%>.&nbsp;<%=contents(i)%>
		<br>
		<img src = "./image/graph.gif" height="10" width="<%=int((percents(i)/100)*100)*5%>"><font color="#D86161">&nbsp;<%=formatnumber(counts(i),0)%></font>ǥ(<%=formatnumber(percents(i),1)%>%)
		<br><br>
		<%
		next
		%>
		<br>
		<b>��Ÿ�ǰ�</b>		
		<table width=100% border="0" cellspacing=0 cellpadding=0>
		<%
		For i = 0 to TailCount -1
		GetDataTail()
		%>
		<tr>
			<td width=15 valign=top align=left nowrap><font color=#444A61>��</font></td>
			<td valign=top align=left><font color=#444A61><%=t_name%>&nbsp;&nbsp;[<%=formatdatetime(t_date,2)%>]&nbsp;&nbsp;<a href="mailto:<%=t_email%>"><%=t_email%></a><br></font><font color=#BB5555><%=replace(t_content,chr(13)&chr(10),"<br>")%></font></td>
		</tr>				
		<%
		Next
		%>
		</table>

		<table width=100%>
		<tr>
			<td colspan=5>
				<input type=hidden name=t_num value='<%=p_num%>'>
				<input type=text name=t_name size=10 maxlength=10 value=�̸� onBlur=check_w(this) onFocus=clear_w(this) class='inputType'>
				<input type=text name=t_email size=50 maxlength=30 value=E-mail onBlur=check_w(this) onFocus=clear_w(this) class='inputType'><br>
				<textarea name='t_content' cols=70 rows=3 onBlur=check_w(this) onFocus=clear_w(this) class='inputType'>�� �ٸ� �ǰ�...</textarea><br>
				<input type=button value='SEND' onfocus='blur();' onclick='sendform(this.form);' class='submitType1'>
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>
<br>
<a href="./List.asp">����Ʈ��</a>&nbsp;|&nbsp;<a href="./Vote.asp?p_num=<%=p_num%>">��ǥ�ϱ�</a>

</form>
</body>
</html>