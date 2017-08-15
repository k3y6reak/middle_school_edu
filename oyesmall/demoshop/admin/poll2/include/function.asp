<%

function CheckWord(cw)

	cw = replace(cw,"&","&amp;")
	cw = replace(cw,"<","&lt;")
	cw = replace(cw,">","&gt;")
	cw = replace(cw,chr(34),"&quot;")
	cw = replace(cw,"'","''")	
	cw = trim(cw)
	CheckWord = cw

end function

function ReturnWord(cw)

	cw = replace(cw,"&amp;","&")
	cw = replace(cw,"&lt;","<")
	cw = replace(cw,"&gt;",">")	
	cw = replace(cw,"''","'")
	cw = replace(cw,"&quot;",chr(34))
	cw = trim(cw)
	ReturnWord = cw

end function

function CutLeft(str,strLength)

	strLength = cint(strlength)

	if len(str) > strLength then

		str = left(str,strLength)

	end if

	CutLeft = str

end function

%>