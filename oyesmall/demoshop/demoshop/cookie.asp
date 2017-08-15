<%
	IF Request.Cookies("oyesorder")("oyes_order") = "" Then
		Response.Cookies("oyesorder")("oyes_order") = Session.SessionID
		Response.Cookies("oyesorder").expires = date +7
		
		oyes_order = Request.Cookies("oyesorder")("oyes_order")
	Else
		oyes_order = Request.Cookies("oyesorder")("oyes_order")
	End IF
%>
