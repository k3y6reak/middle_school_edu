

<!---#include file="../admin/dbconn.asp"--->

<% 
		Set RS = Server.CreateObject("ADODB.RecordSet")

		SQL_Ca = "Select ref From Category Where lev=0 And step=0 Order By c_no ASC"

		RS.Open SQL_Ca, DB, 1
		Ca_no = RS.Recordcount
		RS.Close

%>

<TD>
		<%For AA = 1 To Ca_no %> 
            <DIV id="cat_<%=AA%>i">
            <TABLE cellSpacing=0 cellPadding=0  width=747 border=0>
				  <TBODY>
				  <TR>
					<% Select Case AA
								Case "1"
									BB = ("<TD width=12></TD><TD height=21>")
									CC = ""
								Case "2"
									BB = ("<TD width=22></TD><TD height=21>")
									CC = ""
								Case "3"
									BB = ("<TD width=102></TD><TD height=21>")
									CC = ""
								Case "4"
									BB = ("<TD width=142></TD><TD height=21>")
									CC = ""
								Case "5"
									BB = ("<TD width=282></TD><TD height=21>")
									CC = ""
								Case "6"
									BB = ("<TD width=392></TD><TD height=21>")
									CC = ""
								Case "7"
									BB = ("<TD width=452></TD><TD height=21>")
									CC = ""
								Case "8"
									BB = ("<TD width=102></TD><TD height=21 align=right>")
									CC = ""
								Case "9"
									BB = ("<TD width=102></TD><TD height=21 align=right>")
									CC = (NOBR)
							End Select
								
					Response.Write BB
				
							SQL = "Select (c_title) From Category Where lev = 1 And ref = "&AA&" order by ref asc, step asc"
							RS.Open SQL, DB, 1
							M_count = 1
							While Not RS.EOF
							DD = RS("c_title")
							Response.Write DD
					
					 IF RS.Recordcount <> M_count Then 
				%>
					<IMG height=15  src='../shop_image/line_dot_submenu.gif' width=12>
					<% 
							End IF

							RS.MoveNext
							M_count = M_count + 1
							Wend
							RS.Close
							
							
					%> </TD>
					</TR>
					</TBODY>
			</TABLE>
			</DIV>
     <% Next%>
			
</TD>
