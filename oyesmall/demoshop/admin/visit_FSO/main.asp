<html>
	<head>
	<script language="JavaScript">
<!--
if(navigator.appName.indexOf("Netscape")!=-1){
	var IW=0;
	var IH=0;
	var PX=0;
	var PY=0;
	var us=null;
	var IMGW=452;
	var IMGH=212;
	var TSAFETY=15;

	function branding(){
		if(typeof(document.layers["topicon"])=='undefined')return;
		if(us==null){
			//for(i=0;i<document.layers.length;i++){
			//us=document.layers[i];
			//if(us.id=="topicon")
			//break;
			//}
			us=document.layers["topicon"];
		}
		if(us!=null){
			IH=window.innerHeight;
			IW=window.innerWidth;
			PX=window.pageXOffset;
			PY=window.pageYOffset;
			us.top=(IH+PY-(IMGH+TSAFETY)+10);
		}
	}
	setInterval("branding()",100);
}


if(navigator.appName=="Microsoft Internet Explorer"){
	var IW=0;
	var IH=0;
	var PX=0;
	var PY=0;
	var brand=null;
	var IMGW=452;
	var IMGH=212;
	var TSAFETY=15;
	var alldivs=new Array();
	alldivs=document.all.tags("DIV");

	function BrandInit(){
		if(brand!=null)return;
		else{
			brand=document.all.topicon;
		}
	}
	function BrandPosition(){
		if(brand!=null){
			IH=document.body.clientHeight;
			IW=document.body.clientWidth;
			var PH=document.body.scrollHeight;
			PX=document.body.scrollLeft;
			PY=document.body.scrollTop;
			brand.style.top=(IH+PY-(IMGH+TSAFETY)+13);
		}
	}
	function Branding(){
		if(typeof(document.all.topicon)=='undefined')return;
			BrandInit();
		if((brand!=null))
			BrandPosition();
	}
	setInterval("Branding()",100);
}

function del(no){
	yorn=confirm("정말로 지우시겠습니까?");
		if(yorn==true){
		passwd=prompt("관리자 패스워드를 입력하세요?","");
		location="delete.asp?no="+no+"&pwd="+passwd;
	}
}

//새창을 띄울 경우의 소스
function send_mail(email){
window.open("send_mail.asp?email="+email,"send_mail","scrollbars=no,toolbar=no,location=no,directories=no,status=no,width=590,height=472,resizable=no,menubar=no,top=120,left=204");
}
//같은 페이지에서 열 경우의 소스
/*function send_mail(email){
	location.href="send_mail.asp?email="+email
}*/
//-->
</script>
		<script language="javascript">
	
						<!--
						if (navigator.appName.indexOf("Netscape") != -1) {
							document.write("<LAYER top=350 left=10 width='452' height=214 zIndex=2 name='topicon'> </LAYER>");
						}
						else {
							document.write("<div id='topicon' style='LEFT: 10; TOP: 350; POSITION: absolute; Z-INDEX: 2;'>");
							document.write("<IFRAME width='454' height=198 frameborder=no scrolling=no src='write_form.htm'>");
							document.write("</IFRAME>");
							document.write("</div>");}
						//-->
						
		</script>
	</head>

	<body>
<form name=red>
	<a href="javascript:send_mail();">
						<font face="돋움" size="2" color="black">방명록</font></a>
</form>
	</body>
</html>
