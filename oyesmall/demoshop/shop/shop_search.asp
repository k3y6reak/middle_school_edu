<!---#include file="../admin/dbconn.asp"--->

<% 
		Set RS = Server.CreateObject("ADODB.RecordSet")		
%>
<HTML><HEAD><TITLE>OyesMall 에 오신것을 환영합니다</TITLE>
<LINK href="../shop_file/sample.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/cat_layer.css" type=text/css rel=stylesheet>
<LINK href="../shop_file/style.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="../shop_file/roll_over.js"></SCRIPT>

<SCRIPT language=javascript>
<!--
    function s_submit() 
		{
        document.Search.submit();
		}
      

// -->
</SCRIPT>

<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 border="0" marginheight="0" 
marginwidth="0"><!-- 상단 메뉴 시작 -->
<!--#include file="./shop_maintop.asp"-->
<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=747 border=0>
  <TBODY>
  <TR>
    <!--#include file="./shop_left.asp"-->
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=middle>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              
              <TBODY>
              <TR>
                <TD><IMG height=26 src="../shop_image/advancedsearch_title1.gif" 
                  width=169></TD>
                </TR></TBODY></TABLE>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD vAlign=top align=middle>
                  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <TBODY>
                    <TR bgColor=#d7d7d7>
                      <TD class=lm style="PADDING-LEFT: 20px" height=22><A 
                        href="./shop_main.asp">home</A> &gt; 
                        <B>Advanced Search</B></TD></TR>
                    <TR bgColor=#eeeeee>
                      <TD class=lm style="PADDING-LEFT: 20px" bgColor=#efefef 
                      height=4></TD></TR></TBODY></TABLE><BR><BR>
                  <FORM name=Search action="../shop/shop_searchresult.asp" method=post>
				  <INPUT type=hidden value=1 name=searchmode> 
                  <TABLE cellSpacing=0 cellPadding=0 width=500 border=0>
                    <TBODY>
                    <TR>
                      <TD vAlign=top>
                        <TABLE cellSpacing=0 cellPadding=3 width=360 
                        bgColor=#f0f0f0 border=0>
                          <TBODY>
                          <TR>
                            <TD style="PADDING-LEFT: 10px"><BR>Keyword</TD></TR>
                          <TR>
                            <TD style="PADDING-LEFT: 10px"><INPUT 
                              style="WIDTH: 135px" name=s_word> </TD></TR>
                          <TR>
                            <TD style="PADDING-LEFT: 10px">
								<SELECT class=lm style="WIDTH: 138px" name=s_category> 
									<OPTION value="" selected>View all Categories</OPTION> 
									<OPTION value="">-------------------</OPTION> 
									<OPTION value=1>&nbsp;Men</OPTION> 
									<OPTION value=2>&nbsp;Women</OPTION> 
									<OPTION value=3>&nbsp;Kids &amp; Baby</OPTION> 
									<OPTION value=4>&nbsp;Home &amp; Office</OPTION> 
									<OPTION value=5>&nbsp;Electronics</OPTION> 
									<OPTION value=6>&nbsp;Books &amp; Media</OPTION>
									<OPTION value=7>&nbsp;Leisure &amp; Sports</OPTION> 
									<OPTION value=8>&nbsp;Hobby</OPTION>
									<OPTION value=9>&nbsp;Luxury</OPTION>
								</SELECT> 
								<SELECT class=lm style="WIDTH: 138px"name=s_brand> 
									<OPTION value="" selected>View all Brand</OPTION> 
									<OPTION value="">-------------------</OPTION> 
									<OPTION value=Abercrombie>&nbsp;Abercrombie</OPTION> 
									<OPTION value="American Eagle">&nbsp;American Eagle</OPTION> 
									<OPTION value="Ann Taylor">&nbsp;Ann Taylor</OPTION> 
									<OPTION value=Armani>&nbsp;Armani</OPTION> 
									<OPTION value="Banana Republic">&nbsp;Banana Republic</OPTION>
									<OPTION value=bebe>&nbsp;bebe</OPTION> 
									<OPTION value=BeneFit>&nbsp;BeneFit</OPTION> 
									<OPTION 	value="Brooks Brothers">&nbsp;Brooks Brothers</OPTION> 
									<OPTION 	value=Burberry>&nbsp;Burberry</OPTION> 
									<OPTION value="Calvin Klein">&nbsp;Calvin Klein</OPTION> 
									<OPTION value="Calvin Klein">&nbsp;Calvin Klein</OPTION>
									<OPTION 	value="Casual Corner">&nbsp;Casual Corner</OPTION>
									<OPTION value=COACH>&nbsp;COACH</OPTION>
									<OPTION value="Cole Haan">&nbsp;Cole Haan</OPTION> 
									<OPTION value="Custo Barcelona">&nbsp;Custo Barcelona</OPTION> 
									<OPTION 	value=dELiA*s>&nbsp;dELiA*s</OPTION> 
									<OPTION value=Disney>&nbsp;Disney</OPTION>
									<OPTION 	value=DKNY>&nbsp;DKNY</OPTION> 
									<OPTION 	value="Dolce &amp; Gabbana">&nbsp;Dolce &amp; 	Gabbana</OPTION> 
									<OPTION 	value="Donna Karan">&nbsp;Donna Karan</OPTION> 
									<OPTION value="Dooney &amp; Bourke">&nbsp;Dooney 	&amp; Bourke</OPTION> 
									<OPTION 	value="Earl Jean">&nbsp;Earl Jean</OPTION> 
									<OPTION value=Eddiebauer>&nbsp;Eddiebauer</OPTION> 
									<OPTION 	value="Ermenegildo Zegna">&nbsp;Ermenegildo Zegna</OPTION> 								<OPTION 	value=Esprit>&nbsp;Esprit</OPTION> 
									<OPTION 	value="Etienne Aigner">&nbsp;Etienne Aigner</OPTION> 
									<OPTION 	value="Etienne Aigner">&nbsp;Etienne Aigner</OPTION>
									<OPTION 	value="Fall Exclusive">&nbsp;Fall 	Exclusive</OPTION> 
									<OPTION 	value=FENDI>&nbsp;FENDI</OPTION>
									<OPTION 	value=GAP>&nbsp;GAP</OPTION>
									<OPTION value=GianniVersace>&nbsp;GianniVersace</OPTION> 
									<OPTION value="Grigio Perla">&nbsp;Grigio 	Perla</OPTION> 
									<OPTION 	value=GUCCI>&nbsp;GUCCI</OPTION>
									<OPTION 	value=Guess>&nbsp;Guess</OPTION>
									<OPTION 	value=gymboree>&nbsp;gymboree</OPTION>
									<OPTION 	value=Handspring>&nbsp;Handspring</OPTION> 
									<OPTION value="Helly Hansen">&nbsp;Helly Hansen</OPTION>
									<OPTION 	value="Hugo Boss">&nbsp;Hugo Boss</OPTION> 
									<OPTION value=INCA>&nbsp;INCA</OPTION>
									<OPTION 	value=J.crew>&nbsp;J.crew</OPTION>
									<OPTION 	value="John Galliano">&nbsp;John Galliano</OPTION>		
									<OPTION 	value="Kate Spade">&nbsp;Kate Spade</OPTION> 
									<OPTION value="Kenneth Cole">&nbsp;Kenneth Cole</OPTION>
									<OPTION 	value=L.L.Bean>&nbsp;L.L.Bean</OPTION>
									<OPTION 	value="Lands' End">&nbsp;Lands' End</OPTION> 
									<OPTION value="Laura Mercier">&nbsp;Laura Mercier</OPTION> 
									<OPTION 	value="Louis Vitton">&nbsp;Louis Vitton</OPTION> 
									<OPTION value="Marc Jacobs">&nbsp;Marc Jacobs</OPTION>
									<OPTION 	value="Martha Stewart">&nbsp;Martha 	Stewart</OPTION>
									<OPTION 	value="Max Mara">&nbsp;Max Mara</OPTION>
									<OPTION 	value="Michael Kors">&nbsp;Michael Kors</OPTION> 
									<OPTION value=Nars>&nbsp;Nars</OPTION> 
									<OPTION 	value=Nike>&nbsp;Nike</OPTION>
									<OPTION value=Oakley>&nbsp;Oakley</OPTION>
									<OPTION 	value="Old Navy">&nbsp;Old Navy</OPTION>
									<OPTION 	value=Palm>&nbsp;Palm</OPTION> 
									<OPTION 	value=patagonia>&nbsp;patagonia</OPTION>
									<OPTION 	value=Polo>&nbsp;Polo</OPTION> 
									<OPTION 	value=PRADA>&nbsp;PRADA</OPTION>
									<OPTION 	value="Ralph Lauren">&nbsp;Ralph Lauren</OPTION> 
									<OPTION 	value="Salvatore Ferragamo">&nbsp;Salvatore 	Ferragamo</OPTION> 
									<OPTION 	value=Samsonite>&nbsp;Samsonite</OPTION>
									<OPTION 	value=Sony>&nbsp;Sony</OPTION>
									<OPTION 	value=Stila>&nbsp;Stila</OPTION> 
									<OPTION 	value="T. LeClerc">&nbsp;T. LeClerc</OPTION> 
									<OPTION value="Tommy Hilfiger">&nbsp;Tommy Hilfiger</OPTION> 
									<OPTION 	value="Victoria's Secret">&nbsp;Victoria's Secret</OPTION>
								</SELECT> <BR><BR>
								</TD>
						  </TR>
                          <TR>
                            <TD style="PADDING-LEFT: 10px">Search by price range</TD></TR>
                          <TR>
                            <TD style="PADDING-LEFT: 10px">
								<SELECT class=lm  style="WIDTH: 100px" name=price_s> 
									<OPTION value=10000 selected>&nbsp;10,000원</OPTION> 
									<OPTION value=20000>&nbsp;20,000원</OPTION> 
									<OPTION value=30000>&nbsp;30,000원</OPTION> 
									<OPTION value=40000>&nbsp;40,000원</OPTION> 
									<OPTION value=50000>&nbsp;50,000원</OPTION> 
									<OPTION value=60000>&nbsp;60,000원</OPTION> 
									<OPTION value=70000>&nbsp;70,000원</OPTION> 
									<OPTION value=80000>&nbsp;80,000원</OPTION> 
									<OPTION value=90000>&nbsp;90,000원</OPTION> 
									<OPTION value=100000>&nbsp;100,000원</OPTION> 
									<OPTION value=150000>&nbsp;150,000원</OPTION> 
									<OPTION value=200000>&nbsp;200,000원</OPTION> 
									<OPTION value=250000>&nbsp;250,000원</OPTION> 
									<OPTION value=300000>&nbsp;300,000원</OPTION> 
									<OPTION value=350000>&nbsp;350,000원</OPTION> 
									<OPTION value=400000>&nbsp;400,000원</OPTION> 
									<OPTION value=450000>&nbsp;450,000원</OPTION> 
									<OPTION value=500000>&nbsp;500,000원</OPTION>
							  </SELECT> 이상 ~ 
                              <SELECT class=lm style="WIDTH: 100px" name=price_e> 
									<OPTION value=99999999999 selected>&nbsp;all price</OPTION> 
									<OPTION value=20000>&nbsp;20,000원</OPTION> 
									<OPTION 	value=30000>&nbsp;30,000원</OPTION>
									<OPTION 	value=40000>&nbsp;40,000원</OPTION>
									<OPTION value=50000>&nbsp;50,000원</OPTION>
									<OPTION 	value=60000>&nbsp;60,000원</OPTION>
									<OPTION 	value=70000>&nbsp;70,000원</OPTION>
									<OPTION value=80000>&nbsp;80,000원</OPTION>
									<OPTION 	value=90000>&nbsp;90,000원</OPTION> 
									<OPTION 	value=100000>&nbsp;100,000원</OPTION> 
									<OPTION value=150000>&nbsp;150,000원</OPTION> 
									<OPTION 	value=200000>&nbsp;200,000원</OPTION> 
									<OPTION value=250000>&nbsp;250,000원</OPTION> 
									<OPTION value=300000>&nbsp;300,000원</OPTION> 
									<OPTION value=350000>&nbsp;350,000원</OPTION> 
									<OPTION 	value=400000>&nbsp;400,000원</OPTION> 
									<OPTION value=450000>&nbsp;450,000원</OPTION>
									<OPTION 	value=500000>&nbsp;500,000원</OPTION>
								</SELECT> 이하<BR><BR>
							</TD>
					  </TR>
					  </TBODY>
				</TABLE>
				</TD>
                      <TD vAlign=top align=right>
                        <TABLE cellSpacing=1 cellPadding=4 width=130 
                        bgColor=#cccccc border=0>
                          <TBODY>
                          <TR align=middle bgColor=#ffffff>
                            <TD class=tk>검색어 Best 10</TD></TR>
                          <TR bgColor=#ffffff>
                            <TD class=tblue style="PADDING-LEFT: 10px">1. <A 
                              href="../shop/shop_searchresult.asp?frmSearchWord=american eagle">american 
                              eagle</A><BR>2. <A 
                              href="../shop/shop_searchresult.asp?frmSearchWord=jcrew">jcrew</A><BR>3. 
                              <A 
                              href="../shop/shop_searchresult.asp?frmSearchWord=polo">polo</A><BR>4. 
                              <A 
                              href="../shop/shop_searchresult.asp?frmSearchWord=luxury">luxury</A><BR>5. 
                              <A 
                              href="../shop/shop_searchresult.asp?frmSearchWord=스웨터">스웨터</A><BR>6. 
                              <A 
                              href="../shop/shop_searchresult.asp?frmSearchWord=가디건">가디건</A><BR>7. 
                              <A 
                              href="../shop/shop_searchresult.asp?frmSearchWord=나이키">나이키</A><BR>8. 
                              <A 
                              href="../shop/shop_searchresult.asp?frmSearchWord=아동복">아동복</A><BR>9. 
                              <A 
                              href="../shop/shop_searchresult.asp?frmSearchWord=gymboree">gymboree</A><BR>10. 
                              <A 
                              href="../shop/shop_searchresult.asp?frmSearchWord=underwear">underwear</A><BR></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM><A 
                  href="javascript:s_submit();"><IMG height=21 alt=검색 
                  src="../shop_image/btn_search_1.gif" width=70 border=0></A> 
              <BR></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<!--#include file="./main_shopbottom.asp"--></CENTER>

</BODY></HTML>
<%
	Db.Close

	Set Db = Nothing
	
%>