<!---#include file="../admin/dbconn.asp"--->
<!--#include file="../cookie.asp"--->
<%
		order_date = date()
		order_total = Request("order_total")
		order_name1 = Request("order_name1")
		order_name2 = Request("order_name2")
		order_address = Trim(Request("order_address"))
		order_tel2 = Request("order_tel2")
		order_kind =Request("order_kind")
		
		cardno = Request("cardno")
		bankno = Request("bankno")
		paidman = Request("paidman")
		bank_amt = Request("bank_amt")
		card_amt = Request("card_amt")
		order_status = "0"
		
	'	response.write "은행돈:"&bank_amt&"<br>"
	'	response.write "카드돈:"&card_amt&"<br>"
	'	response.write "카드번호:"&cardno&"<br>"
	'	response.Write "돈내는 사람:"&paidman&"<br>"
	'	response.Write "은행명:"&bankno&"<br>"
	'	response.End
	
		mon = Month(date)
		dayy = day(date)

		hr = Hour(Time)
		min = Minute(Time)
		sec = Second(time)
		
		IF Cint(mon) < 10 Then
			mon = "0" &mon
		End IF

		IF Cint(dayy) < 10 Then
			dayy = "0" &dayy
		End IF

		IF Cint(hr) < 10 Then
			hr = "0" & hr
		End IF

		IF Cint(min) <10 Then
			min = "0" & min
		End IF

		IF Cint(sec) < 10 Then
			sec = "0" & sec
		End IF

		order_num = Year(Date)&mon&Dayy&hr&min&sec '주문번호 생성..
	'	response.Write order_kind
	'	response.End

		SQL = "Select userID,Passwd From tbl_Temp Where SessionID ="&oyes_order&" "
		Set RS = DB.Execute (SQL)

		IF RS.EOF Then
			Response.write "<Script Language=JavaScript>"
			Response.write "alert('죄송합니다. \n\n고객님의 정보유출을 방지하가위해서 세션이 끝어진 상태입니다.\n \n다시 로그인 해 주십시오 ^^');"
			Response.write "location.href='../shop/shop_main.asp;"
			Response.write "</Script>"
		Else
			passwd = RS("passwd")
			user_id = RS("userID")

			SQL_M = "Select tel1_1,tel1_2,tel1_3 From Members Where user_id='"&user_id&"' and Passwd='"&passwd&"'"
			Set RS2 = DB.Execute (SQL_M)
			
			order_tel1 = RS2("tel1_1")&"-"&RS2("tel1_2")&"-"&RS2("tel1_3")
		
		
			SQL_Bag = "Select A.g_name, A.g_com, A.color, A.or_p, A.g_code, A.point, A.or_p, B.good_ea From Goods A, Shop_cart B Where B.SessionID="&oyes_order&" And B.Good_code = A.g_code"
			
			Set RS_b = DB.Execute (SQL_Bag)
			
			While Not RS_b.EOF
				g_code = RS_b("g_code")
				g_name = RS_b("g_name")
				good_ea = RS_b("good_ea")
				good_price = RS_b("or_p")
				point = RS_b("point")
			
	
			
				


			SQL_Sell = "Insert Into seller (g_code,order_num,good_name,good_price,good_ea) Values ('"
			SQL_Sell = SQL_Sell &g_code&"','"
			SQL_Sell = SQL_Sell &order_num&"','"
			SQL_Sell = SQL_Sell &g_name&"','"
			SQL_Sell = SQL_Sell &good_price&"','"
			SQL_Sell = SQL_Sell &good_ea&"')"
			
			'response.Write SQL_Sell&"<br>"
		
			DB.Execute (SQL_Sell)
			
			RS_b.MoveNext
			Wend
			'	response.End
			RS_b.Close
			
			Set RS_b = Nothing
			
			
			SQL4 = "Insert into sell_man(user_id,total_p,re_add,re_name,re_tel,re_kind,cardno,bankno,paidman,bank_amt,card_amt,order_num) Values('"
			SQL4 = SQL4 & user_id &"','"
			SQL4 = SQL4 & order_total &"','"
			SQL4 = SQL4 & order_address &"','"
			SQL4 = SQL4 & order_name2 &"','"
			SQL4 = SQL4 & order_tel2 &"','"
			SQL4 = SQL4 & order_kind &"','"
			SQL4 = SQL4 & cardno&"','"
			SQL4 = SQL4 & bankno&"','"
			SQL4 = SQL4 & paidman&"','"
			SQL4 = SQL4 & bank_amt&"','"
			SQL4 = SQL4 & card_amt&"','"
			SQL4 = SQL4 & order_num &"')"
			
			Response.Write SQL4
	'		Response.End
			DB.Execute (SQL4)
			

			SQL_Del = "Delete From shop_cart Where sessionID = "&oyes_order&" "

			DB.Execute (SQL_Del)

			Response.Redirect "./cart_pay_success.asp"

			DB.Close

			Set DB = Nothing

End IF

%>