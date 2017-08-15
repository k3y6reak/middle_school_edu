<!--
function tick() {
  var month,date,hours, minutes, seconds, ap;
  var intYear,intDate,intMon,intHours, intMinutes, intSeconds;
  var today;

  today = new Date();

  intYear = today.getYear();  
  intDate = today.getDate();
  intMon = today.getMonth()+1;
  intHours = today.getHours();
  intMinutes = today.getMinutes();
  intSeconds = today.getSeconds();

//  if (intMon < 10) {
// 	month = "0"+intMon;
//  } else {
  	month = intMon;
//  }
  if (intDate < 10) {
  	date = "0"+intDate;
  } else {
  	date = intDate;
  }
  if (intHours == 0) {
     hours = "12: ";
     ap = "새벽";
//     hours = "12:";
//    ap = "am";
  } else if (intHours < 12) { 
     hours = intHours+": ";
     ap = "오전";
//     hours = intHours + ":";
//     ap = "am";	 
  } else if (intHours == 12) {
     hours = "12 : ";
      ap = "정오";
//     hours = "12:";
//      ap = "pm";
  } else {
     intHours = intHours - 12
     hours = intHours + " : ";
     ap = "오후";
//     hours = intHours + ":";
//     ap = "pm";
  }

  if (intMinutes < 10) {
     minutes = "0"+intMinutes+" : ";
//     minutes = "0"+intMinutes+":";	 
  } else {
     minutes = intMinutes+" : ";
//     minutes = intMinutes+":";
  }

  if (intSeconds < 10) {
     seconds = "0"+intSeconds;
//     seconds = "0"+intSeconds;	 
  } else {
     seconds = intSeconds;
//     seconds = intSeconds;	 
  } 

  timeString = intYear + "년 " + month +"월 "+ date +"일 " + ap + " " +hours+minutes+seconds;

  Clock.innerHTML = timeString;

  window.setTimeout("tick();", 100);
}

window.onload = tick;
-->
