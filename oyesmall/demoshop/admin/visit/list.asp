<!--#include file="../dbconn.asp"-->
<!---#include file="../session.asp"--->
<%
	Response.Expires = 0

	page = Request("page")

	IF page = "" Then
		page = 1
	End IF

	SQL = "select count(num) as recCount from visit"

	Set Rs = Db.Execute(SQL)

	recordCount = Rs(0)
	
	pagesize = 10

	
	pagecount = int((recordCount-1)/pagesize) +1

	
	SQL = "Select Top " & pagesize & " * From visit"
	SQL = SQL & " where num not in "
	SQL = SQL & "(Select Top " & (int(Page - 1) * pagesize) & " num From visit"
	SQL = SQL & " Order By num DESC) order by num Desc" 

	Set Rs = Db.Execute(SQL)

	T_page = Pagecount
%>
<html>
<head>
<title>◇ ◆ OyesMall Guest Note◆ ◇</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
<!--
body{ font-family: 돋움; font-size: 9pt; color: #787878;  background-color:#000000; background-attachment: fixed; background-image: url(images/wephoto.jpg); background-repeat: no-repeat; background-position: center; line-height:140%; }
table,select,input,div,form,textarea,center { font-family: 돋움; font-size: 9pt; color: #787878; line-height:140%; }
blockquote{ font-family: 돋움; font-size: 9pt; line-height: 140%; color: #787878 }
a{ font-family:돋움; font-size:9pt; color:#787878; text-decoration:none }
a:hover{ font-family:돋움; font-size:9pt; color:#ff8600; text-decoration:underline; }
a:link{color: #787878; font-family: 돋움; font-size: 9pt; line-height: 11pt; text-decoration: none}
-->
</style>
<style type="text/css"> 
			BODY {
						scrollbar-face-color: #000000; 
						scrollbar-shadow-color: #ff0000; 

						scrollbar-highlight-color: #ff0000; 
						scrollbar-3dlight-color:#000000; 

						scrollbar-darkshadow-color: #000000; 
						scrollbar-track-color: #000000; 

						scrollbar-arrow-color: #ff0000
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
function send_mail(num){
window.open("send_mail.asp?num="+num,"send_mail","scrollbars=no,toolbar=no,location=no,directories=no,status=no,width=300,height=420,resizable=no,menubar=no,top=120,left=204");
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
						<% IF RS.EOF or RS.BOF Then %>
							<table align="center" width="100%" border="0" cellpadding="0" cellspacing="0" onmouseover="this.style.background='#000000'" onmouseout="this.style.background=''" >
							<tr height=50><td>방명록에 올라온 글이 없습니다.^^</td></tr>
							</Table>
						<%
							Else
							count = 1
			
							While Not RS.EOF and count <=10
						%>
						<table align="center" width="100%" border="0" cellpadding="0" cellspacing="0" onmouseover="this.style.background='#000000'" onmouseout="this.style.background=''" >
						<Form name=visit method=post>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td colspan="2" style="padding-left:10;padding-right:10;">
									<font color="#787878">No. <%=RS("num")%> &nbsp;&nbsp;&nbsp;&nbsp;
									<a href="javascript:del(<%=RS("num")%>);" title="흔적을 지웁니다.">Delete</a></font>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<font color="red">
									...........................................................................................................................</font>
								</td>
							</tr>
							<tr>
								<td width="40%" valign="top" style="padding-left:10;padding-right:10;">
									<font color="#787878"><%=RS("name")%><br>
									mail : <A Href="javascript:send_mail(<%=RS("num")%>);"><%=RS("email")%></a><br>
									<a href="<%=RS("home")%>" target="_blank"><%=RS("home")%></a><br>
									<%=postdate%></font>
								</td>
								<td width="60%">
									<font style="color:#787878"><%=RS("content")%></font>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<font color="red">
									...........................................................................................................................</font>
								</td>
							</tr>
							</Form>
						</table>
						
						<%
							RS.MoveNext

							count = count + 1

							Wend

							RS.Close
							DB.Close
							Set RS = Nothing
							Set DB = Nothing
						%>
						
						<center>
						<%
						intStart = int((page-1)/10)*10 + 1					
						intEnd = intStart + 9
					%>
					<% If intstart = 1 Then %>
						<img src="./images/btn_prev1.gif" border=0>
						
					<% Else %>
						<A Href="./list.asp?page=<%=intstart-1%>"><img src="./images/btn_prev1.gif" border=0></A>
					<% End IF %>

					<% For i=intstart to intend 
						
						IF i = int(page) Then 

							Response.Write "<Font Color=Red Size=3>"&i&"</Font>"
						Else
						
							Response.Write " <A Href=./list.asp?page="&i&"> ["&i&"]</a> "
						End if

						If int(intstart) =int(t_page) then  
							exit for
						end if
						intstart=intstart+1

					   Next
					 
					%>
					<% If intstart = T_page Then %>
						
						<img src="./images/btn_next1.gif" border=0>
					<% else %>
						<A Href="./list.asp?page=<%=intend+1%>"><img src="./images/btn_next1.gif" border=0></A>
					<% End If%>
						</center>
						<% End IF%>
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