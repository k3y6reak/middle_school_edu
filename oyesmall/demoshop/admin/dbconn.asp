<%
	Set DB = Server.CreateObject("ADODB.Connection")

	db.ConnectionString = Application("dbconn")

	Db.open "provider=sqloledb.1;uid=sa;pwd=kisec0125;database=oyesmall;server=localhost"

	site = Application("site")
%>

