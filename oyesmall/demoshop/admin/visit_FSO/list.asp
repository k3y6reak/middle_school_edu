
<%
	Response.Expires = 0
Set fs = CreateObject("Scripting.FileSystemObject")
const maxitem = 10

	lastfile = Server.MapPath("dat_file/last.dat")
	filecount = fs.OpenTextFile(lastfile, 1, false).ReadAll
	maxpage = int((filecount-1) / maxitem)+1
	page = request("page")
if page="" then page=1 else page = int(page)

function chUrl(txt)
if left(txt, 6)="http:/" then txt = " " & txt
	txt = Replace(txt, vbCRLF, " <br> ") & " "

' 웹 주소 링크 걸기
	tmp = split(txt, "http:/")
	txt = ""
for each i in tmp
if txt="" then
	txt = i
else
	temp = "http:/" & left(i, instr(1, i, " ") - 1)
if instr(1, temp, ".") < 1 then temp=""
	txt = txt & replace("http:/" & i, temp, "<a target=_blank href=" & temp & ">" & temp & "</a>")
end if  
next

' 메일 주소 링크 걸기
	tmp = split(txt, "@")
	txt = ""
for each i in tmp
if txt="" then
	txt = i
else
	rtmp = right(txt, len(txt) - instrrev(txt, " "))
	ltmp = left(i, instr(1, i, " ") - 1)
	temp = rtmp & "@" & ltmp
if instr(1, ltmp, ".") < 1 then temp=""
	txt = left(txt, instrrev(txt, " "))
	atag = "<a href=javascript:send_mail('"& temp & "')>" & temp & "</a>"
	txt = txt & replace(rtmp & "@" & i, temp, atag)
end if
next

	chUrl = trim(txt)
end function
%>
<html>
<head>
<title>◇ ◆ OyesMall Guest Books◆ ◇</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
<!--
body{ font-family: 돋움; font-size: 9pt; color: #787878;  background-color:#F7FFF7; background-attachment: fixed; background-image: url(images/sky.gif); background-repeat: no-repeat; background-position: center; line-height:140%; }
table,select,input,div,form,textarea,center { font-family: 돋움; font-size: 9pt; color: #787878; line-height:140%; }
blockquote{ font-family: 돋움; font-size: 9pt; line-height: 140%; color: #787878 }
a{ font-family:돋움; font-size:9pt; color:#787878; text-decoration:none }
a:hover{ font-family:돋움; font-size:9pt; color:#ff8600; text-decoration:underline; }
a:link{color: #787878; font-family: 돋움; font-size: 9pt; line-height: 11pt; text-decoration: none}
-->
</style>
<style type="text/css"> 
			BODY {
						scrollbar-face-color: #F7FFF7; 
						scrollbar-shadow-color: #cc99ff; 

						scrollbar-highlight-color: #cc99ff; 
						scrollbar-3dlight-color:#ffffff; 

						scrollbar-darkshadow-color: #ffffff; 
						scrollbar-track-color: #F7FFF7; 

						scrollbar-arrow-color: #cc99ff
						} 

				</style> 
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
window.open("send_mail.asp?email="+email,"send_mail","scrollbars=no,toolbar=no,location=no,directories=no,status=no,width=300,height=420,resizable=no,menubar=no,top=120,left=204");
}

//-->
</script>
</head>
<body bgcolor="#f0fff0" text="black" link="blue" vlink="purple" alink="red">
<div align=center>
<table width="500" border="0" cellspacing="1" cellpadding="0" >
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" align=center >
				<tr>
					<td>
						<%
							if filecount > 0 then
								for ii = filecount-(page-1)*maxitem to filecount-page*maxitem+1 step -1
									gbfile = Server.MapPath("./dat_file/" & ii & ".dat")

									'response.write gbfile
									'response.end
									if fs.FileExists(gbfile) then
										Set gb = fs.OpenTextFile(gbfile, 1, false)
										name = gb.ReadLine
										e_mail = gb.ReadLine
										url = gb.ReadLine
										postdate = gb.ReadLine
										comments = gb.ReadAll
										comments = replace(comments,"@","＠")
						%>
						<table align="center" width="100%" border="0" cellpadding="0" cellspacing="0" onmouseover="this.style.background='#F7FFF7'" onmouseout="this.style.background=''" >
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td colspan="2" style="padding-left:10;padding-right:10;">
									<font color="#787878">No. <%= ii%> &nbsp;&nbsp;&nbsp;&nbsp;
									<a href="javascript:del(<%= ii%>);" title="흔적을 지웁니다.">delete</a></font>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<font color="#cc99ff">
									............................................................................................................</font>
								</td>
							</tr>
							<tr>
								<td width="40%" valign="top" style="padding-left:10;padding-right:10;">
									<font color="#787878"><%=name%><br>
									mail : <%=chUrl(e_mail)%><br>
									<a href="http://" target="_blank"><%=chUrl(url)%></a><br>
									<%=postdate%></font>
								</td>
								<td width="60%">
									<font style="color:#787878"><%=chUrl(comments)%></font>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<font color="#cc99ff">
									............................................................................................................</font>
								</td>
							</tr>
						</table>
						<%
								end if
							next
						end if
						%>
						<center>
						<%
						for j=1 to maxpage
						if j = page then
							if session("member") = "" then
								Response.Write "<font color=red size=3>" & j & "</font> "
							else
								Response.Write "<font color=#cc99ff>[" & j & "]</font> "
							end if
						else
							Response.Write "<a href=list.asp?page=" & j & ">[" & j & "]</a> "
						end if
						next

						'gb.close
						set fs = nothing
						%>
						</center>
						<P>&nbsp;</p>
						<P>&nbsp;</p>
						<P>&nbsp;</p>
						<P>&nbsp;</p>
						<P>&nbsp;</p>
						<P>&nbsp;</p>
						<script language=javascript>
						<!--
						if (navigator.appName.indexOf("Netscape") != -1) {
							document.write("<LAYER top=350 left=10 width='452' height=214 zIndex=2 name='topicon'> </LAYER>");
						}
						else {
							document.write("<div id='topicon' style='LEFT: center; TOP: 350; POSITION: absolute; Z-INDEX: 2;'>");
							document.write("<IFRAME width='454' height=198 frameborder=no scrolling=no src='write_form.htm'>");
							document.write("</IFRAME>");
							document.write("</div>");}
						//-->
						</script>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<Div>
</body>
</html>