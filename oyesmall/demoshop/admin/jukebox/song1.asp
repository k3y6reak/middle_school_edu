<ASX Version = "3.0" >
<ABSTRACT>:: Mall ::</ABSTRACT>
<Title> :: Red_Music :: </Title>
<AUTHOR> Mall </AUTHOR>
<COPYRIGHT> 2002 Mall Corporation </COPYRIGHT>
<!---#include file="../dbconn.asp"--->
<%
		mNo = Request("mNo")
		nCount = split(mNo, ",")

		For i=0 to ubound(nCount)
				SQL = "SELECT * From Juke WHERE num="&nCount(i)
				Set Rs = Db.Execute(SQL)
				singer = Rs(1) &" - "& Rs(2)
				category = Rs(3)
				song = Rs(4)
%> 
				<Entry>
				<Title>Oyesmall MusicBox</Title>
				<AUTHOR> <%=singer%> </AUTHOR>
				<Copyright>RedMaster</Copyright>
				<Ref href = "mms://music.oyesmall.net/music/<%=category%>/<%=song%>" />
				</Entry>
<%
		next
		RS.Close
		DB.Close
		Set RS = Nothing
		Set DB = Nothing
%>
</ASX>