
function song()
 {
  var aa=document.all.jForm.j_check.length;
  var c=0;
  var yn;
  if(aa==null || aa=="")
  {
	  alert(" 선택할수 있는 노래가 없습니다.");
  }  
  else
  {  
  for(i=0;i<aa;i++)
   { 
      if(document.all.j_check[i].checked==true)
       c++;
   }   
   }

      if(c==0)
       { alert(" 하나 이상의 항목을 선택해야 합니다."); }
      else 
        { 
          { 
            url="song.asp";    
            window.open(url,"aaa","width=300,height=145");
            document.jForm.target="aaa";
            document.jForm.action = url;
            window.jForm.submit(); }
        }        
}               
