<Html>
<Head>
<Title>OyesMall Juke Box</Title>
</Head>
<body bgcolor='#c0c0c0' topmargin=0 leftmargin=0>
<div align=center>
<table width="280" border="0" cellpadding="0" cellspacing="0" > 
			<tr>
				<td align="left" valign="bottom"  height="37">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td align="right" valign="bottom" height="28" bgcolor="#c0c0c0">
					<img src="../shop_image/pur.gif" border=0 alt="go red station">
				</td>
			</tr>	
			<tr>
				<td align="center" valign="top"  height="154" bgcolor="#c0c0c0">
				<OBJECT ID="NSPlay" WIDTH=170 HEIGHT=130 classid="CLSID:22D6F312-B0F6-11D0-94AB-0080C74C7E95" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701" standby="Loading Microsoft Windows Media Player components..." type="application/x-oleobject">

				<PARAM NAME="FileName" VALUE="./song1.asp?mNo=<%=Request("chk")%>">
				<PARAM NAME="ShowControls" VALUE="1">
				<PARAM NAME="ShowDisplay" VALUE="1">
				<PARAM NAME="ShowStatusBar" VALUE="1">
				<PARAM NAME="AutoSize" VALUE="1">

				<Embed type="application/x-mplayer2" pluginspage="http://www.microsoft.com/Windows/Downloads/Contents/Products/MediaPlayer/"        filename="http://www.oistation.co.kr/temp_id/202549756.asx" 
				src="jukebox.asx"
				Name=NSPlay
				ShowCaptioning=0
				ShowControls=1
				ShowDisplay=1
				ShowStatusBar=1
				playCount="0"
				width=290
				height=320>
				</embed>
				</OBJECT>
				</td>
			</tr>
			<tr>
				<td align="center" valign="bottom" height="62">
				<img src="../shop_image/photo.gif">
				</td>
			</tr>
		</table>
		</Div>
		</body>
		</Html>
	

