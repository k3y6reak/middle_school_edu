function num_p(num) {


	str_name = eval("document.form_cart.ea" + num);
	str_name.value = parseInt(str_name.value) + 1;


	
	document.form_cart.num.value = num;	
	document.form_cart.action = "./cart_add.asp?g_code=<%=Cart('g_code')%>";
	document.form_cart.submit();
}

function num_m(num) {

	
	str_name = eval("document.form_cart.ea" + num);
	if(str_name.value > 1) {
		str_name.value = parseInt(str_name.value) -1;
		document.form_cart.num.value = num;	
		document.form_cart.action = "./cart_add.asp";
		document.form_cart.submit();
	}else {
		str_name.value = 1;
		alert("\n1개 이상 선택하셔야 합니다    ");
		return;
	}


}

function formatCurrency(gbn,num) {
	num = num.toString().replace(/\$|\,/g,'');

	if(isNaN(num)) num = "0";
		cents = Math.floor((num*100+0.5)%100);
		num = Math.floor((num*100+0.5)/100).toString();

	if(cents < 10) cents = "0" + cents;
		for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
			num = num.substring(0,num.length-(4*i+3))+','+num.substring(num.length-(4*i+3));

	if (gbn=='1') { return (num + '.' + cents); } else { return (num); }
}
