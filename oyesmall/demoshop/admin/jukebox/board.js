
function song()
 {
  var aa=document.all.jForm.j_check.length;
  var c=0;
  var yn;
  if(aa==null || aa=="")
  {
	  alert(" �����Ҽ� �ִ� �뷡�� �����ϴ�.");
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
       { alert(" �ϳ� �̻��� �׸��� �����ؾ� �մϴ�."); }
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
