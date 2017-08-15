


<!---#include file="../dbconn.asp"--->
<!--#include file="../master.asp"-->
<%
	page = Request("page")
	num = Request("num")
	b_name  = Request("b_name")
	nomi  = Request("nomi")
	top3  = Request("top3")
	category_top  = Request("category_top")
	mainimage = Request("mainimage")
	



		
		Sql2 = "Update banner Set b_name='"&b_name&"'"
		Sql2 = Sql2 &",nomi='"&nomi&"'"
		Sql2 = Sql2 &",mainimage='"&mainimage&"'"
		Sql2 = Sql2 &",top3='"&top3&"'"
		Sql2 = Sql2 &",category_top='"&category_top&"'"
		Sql2 = Sql2 &"Where num="&num
	

		DB.Execute(Sql2)


		DB.Close

		Set Db = Nothing

		Response.Redirect "./event_list.asp?page="&page
	

	End IF
%>