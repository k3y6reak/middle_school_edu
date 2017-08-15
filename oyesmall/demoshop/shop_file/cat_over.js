function cat_over(num) {
var str_cat, loop_cat
	str_cat = eval("cat_"+num+"i.style");
	for (i = 1; i < 10; i++) {
		loop_cat = eval("cat_"+i+"i.style");
		loop_cat.visibility="hidden"
		
		imgChg("cat_"+i,"cat_"+i+"off");
	}
	imgChg("cat_"+num,"cat_"+num+"on");
	str_cat.visibility="visible"
}

