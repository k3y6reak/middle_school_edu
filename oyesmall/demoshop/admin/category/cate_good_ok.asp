<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->
<%
c_title=Request("c_title")
ref=Request("ref")
lev=Request("lev")
no=Request("no")
c_step=Request("step")
a=Request("a")

'c_title = c_title&","
'response.write  c_step
'response.end

Set rs=server.CreateObject("ADODB.RecordSet")
sql="Select Max(c_no) From category"
rs.Open(sql),db
If IsNull(rs(0)) Then
c_no=1
else
c_no=rs(0)+1
End If
rs.Close             
Set rs=Nothing


select case a
case 1    ' 리플이 아닌경우..
	sql="insert into category (c_no,c_title,lev,ref,step) values("&c_no&", '"&c_title&"',0,"&c_no&",0 )  "
	db.Execute(sql)

case 2   '추가생성인 경우 이에 맞는 값을 대응...

	lev=lev+1  '레벨값 결정
	ref=ref    'ref값 결정
	set rs=server.CreateObject("ADODB.RecordSet")   'step 값 결정..
		sql="Select Max(step) From category Where  ref='"&ref&"' and lev='"&lev&"' and ref_n="&no&" "
		rs.Open(sql),db
	set rs_min=server.CreateObject("ADODB.RecordSet")   'Max값 과 Mini값의 step데이터길이판단..
		sql="Select Min(step) From category Where  ref='"&ref&"' and lev='"&lev&"' and ref_n="&no&" "
		rs_min.Open(sql) ,db
		 If IsNull(rs(0)) Then
			If c_step="0" Then
				realstep="0.1"&"1"   ' <<<결정되어진 step값.
			Else
				realstep=c_step&"1"   ' <<<결정되어진 step값.
			End If		
		 Else
			leftstep=Left(rs(0),Instr(rs(0),"."))
			intstep=Mid(rs(0),InstrRev(rs(0),".")+1)
			rs_mini=Len(Replace(rs_min(0),"0." ,""))
			rs_max=Len(intstep)

			If rs_mini<>rs_max Then
				realstep="0."&intstep&"1"
			Else
				intstep=intstep+1
				realstep=leftstep&intstep   ' <<<결정되어진 step값.
			End If
		 End If
	rs.Close
	Set rs=Nothing
	rs_min.Close
	Set rs_min=Nothing

		' step값 중복될때 스텝값 증가..(밀어내기) When value of step is more then one
		sql_b="Select step,c_no From category Where  ref="&ref&" and step="&realstep&" "
		Set rs=db.Execute(sql_b)


		If not rs.eof Then
			sql_b="Select step,c_no From category Where  ref="&ref&" and step>="&realstep&" "
			Set rs=db.Execute(sql_b)
		End If

		While Not rs.Eof          'step값 1씩 증가시키기..
			i_no=rs("c_no")			
			incstep=replace(rs("step"),"0." ,"")
			incstep="0."&(incstep+1)
			sql_u="Update category Set step="&incstep&" Where c_no="&i_no&"  "
			db.Execute(sql_u)
			Rs.MoveNext
		Wend


		' 상위 레벨과 step값 중복될때 
		sql_c="Select max(step) From category Where  lev="&lev&"+1 and  ref="&ref&" and step>"&realstep&" "
		Set rs_1=db.Execute(sql_c)
			if not IsNull(rs_1(0)) Then
			intstep=replace(rs_1(0),"0.","")
			realstep=intstep+1
			realstep="0."&realstep
			end if
Response.Write sql_c
Response.Write realstep
'Response.End

	 


	' 폼으로 부터 넘어온값 입력..
	sql="insert into category (c_no,c_title,lev,ref,ref_n,step) values("&c_no&",'"&c_title&"',"&lev&","&ref&","&no&","&realstep&") "
	db.Execute(sql)

End select
Response.Redirect "cate_list.asp"

	End IF

%>






