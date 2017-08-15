



<%
	Function ConvertTohtml(byval strContent)

	dim strtemp

	if len(strContent) = 0 or isnull(len(strContent)) = true then

		strtemp = ""
	else
		strtemp = strContent
		strtemp = replace(strtemp,"&","&amp;")
		strtemp = replace(strtemp,">","&gt;")
		strtemp = replace(strtemp,"<","&lt;")
	end if

	convertToHTML= strtemp

	end Function


	Function ConvertToSQL(strContent)

		dim strtemp
		strtemp = strContent
		strtemp = replace(strtemp,"'","''")

		convertToSQL = strtemp
	end Function
%>