<%@ include file="menuheader.jsp"%>
<html>
<head>

<script language="javascript">

mandatory="Yes";

function ajaxrouter()
{
	var router=document.getElementById("Router_id").value;
	
    var ajaxRequest; // The variable that makes Ajax possible!
	try {
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	} catch (e) {
		// Internet Explorer Browsers
		try {
			ajaxRequest = new ActiveXObject(
					"Msxml2.XMLHTTP");
		} catch (e) {
			try {
				ajaxRequest = new ActiveXObject(
						"Microsoft.XMLHTTP");
			} catch (e) {
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	ajaxRequest.onreadystatechange = function() {
		if (ajaxRequest.readyState == 4) {
			var reslt = ajaxRequest.responseText;
			if(reslt.trim()=="R")
			//document.getElementById("vehno").innerHTML = reslt;
			
			{
			alert("Router Serial No Doesn't Exist!!");
			}  
			
			else if(reslt.trim()=="RX")
				//document.getElementById("vehno").innerHTML = reslt;
				
				{
				alert("Router Serial No Already Exist!!");
				}
			else if(reslt.trim()=="")
				{
				
				}
			
			
		/* 	document.getElementById("City").disabled = false;
			document.getElementById("City").innerHTML = reslt; */

		}
	};

	var queryString = "?id="+router+"&category=Router";
	//alert(queryString);
	ajaxRequest.open("GET", "AjaxRouter.jsp"
			+ queryString, true);
	ajaxRequest.send(null);
	
	
	
}

function ajaxnuc()
{
var NUC=document.getElementById("NUC_id").value;

var ajaxRequest; // The variable that makes Ajax possible!
try {
	// Opera 8.0+, Firefox, Safari
	ajaxRequest = new XMLHttpRequest();
} catch (e) {
	// Internet Explorer Browsers
	try {
		ajaxRequest = new ActiveXObject(
				"Msxml2.XMLHTTP");
	} catch (e) {
		try {
			ajaxRequest = new ActiveXObject(
					"Microsoft.XMLHTTP");
		} catch (e) {
			// Something went wrong
			alert("Your browser broke!");
			return false;
		}
	}
}
ajaxRequest.onreadystatechange = function() {
	if (ajaxRequest.readyState == 4) {
		var reslt = ajaxRequest.responseText;
		if(reslt.trim()=="R")
		//document.getElementById("vehno").innerHTML = reslt;
		
		{
		alert("NUC Serial No Doesn't Exist!!");
		}  
		
		else if(reslt.trim()=="RX")
			//document.getElementById("vehno").innerHTML = reslt;
			
			{
			alert("NUC Serial No Already Exist!!");
			}
		else
			{
			
			}
		
		
	/* 	document.getElementById("City").disabled = false;
		document.getElementById("City").innerHTML = reslt; */

	}
};

var queryString = "?id="+NUC+"&category=NUC";
//alert(queryString);
ajaxRequest.open("GET", "AjaxNUC.jsp"
		+ queryString, true);
ajaxRequest.send(null);





	
}

function ajaxdongle()
{
	var dongle=document.getElementById("Dongle_id").value;
	
	var ajaxRequest; // The variable that makes Ajax possible!
	try {
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	} catch (e) {
		// Internet Explorer Browsers
		try {
			ajaxRequest = new ActiveXObject(
					"Msxml2.XMLHTTP");
		} catch (e) {
			try {
				ajaxRequest = new ActiveXObject(
						"Microsoft.XMLHTTP");
			} catch (e) {
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	ajaxRequest.onreadystatechange = function() {
		if (ajaxRequest.readyState == 4) {
			var reslt = ajaxRequest.responseText;
			if(reslt.trim()=="R")
			//document.getElementById("vehno").innerHTML = reslt;
			
			{
			alert("Dongle Serial No Doesn't Exist!!");
			}  
			
			else if(reslt.trim()=="RX")
				//document.getElementById("vehno").innerHTML = reslt;
				
				{
				alert("Dongle Serial No Already Exist!!");
				}
			else
				{
				
				}
			
			
		/* 	document.getElementById("City").disabled = false;
			document.getElementById("City").innerHTML = reslt; */

		}
	};

	var queryString = "?id="+dongle+"&category=Dongle";
	//alert(queryString);
	ajaxRequest.open("GET", "AjaxDongle.jsp"
			+ queryString, true);
	ajaxRequest.send(null);

	
	
	
	
	
	
}

function camera1()
{
	var camera1=document.getElementById("camera1").value;
	
	var ajaxRequest; // The variable that makes Ajax possible!
	try {
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	} catch (e) {
		// Internet Explorer Browsers
		try {
			ajaxRequest = new ActiveXObject(
					"Msxml2.XMLHTTP");
		} catch (e) {
			try {
				ajaxRequest = new ActiveXObject(
						"Microsoft.XMLHTTP");
			} catch (e) {
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	ajaxRequest.onreadystatechange = function() {
		if (ajaxRequest.readyState == 4) {
			var reslt = ajaxRequest.responseText;
			if(reslt.trim()=="R")
			//document.getElementById("vehno").innerHTML = reslt;
			
			{
			alert("Camera1 Serial No Doesn't Exist!!");
			}  
			
			else if(reslt.trim()=="RX")
				//document.getElementById("vehno").innerHTML = reslt;
				
				{
				alert("Camera1 Serial No Already Exist!!");
				}
			else
				{
				
				}
			
			
		/* 	document.getElementById("City").disabled = false;
			document.getElementById("City").innerHTML = reslt; */

		}
	};

	var queryString = "?id="+camera1+"&category=Camera";
	//alert(queryString);
	ajaxRequest.open("GET", "AjaxCamera1.jsp"
			+ queryString, true);
	ajaxRequest.send(null);
	
	
	
	
}
function camera2()
{
	var camera2=document.getElementById("camera2").value;
	
	var ajaxRequest; // The variable that makes Ajax possible!
	try {
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	} catch (e) {
		// Internet Explorer Browsers
		try {
			ajaxRequest = new ActiveXObject(
					"Msxml2.XMLHTTP");
		} catch (e) {
			try {
				ajaxRequest = new ActiveXObject(
						"Microsoft.XMLHTTP");
			} catch (e) {
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	ajaxRequest.onreadystatechange = function() {
		if (ajaxRequest.readyState == 4) {
			var reslt = ajaxRequest.responseText;
			if(reslt.trim()=="R")
			//document.getElementById("vehno").innerHTML = reslt;
			
			{
			alert("Camera 2 Serial No Doesn't Exist!!");
			}  
			
			else if(reslt.trim()=="RX")
				//document.getElementById("vehno").innerHTML = reslt;
				
				{
				alert("Camera 2 Serial No Already Exist!!");
				}
			else
				{
				
				}
			
			
		/* 	document.getElementById("City").disabled = false;
			document.getElementById("City").innerHTML = reslt; */

		}
	};

	var queryString = "?id="+camera2+"&category=Camera";
	//alert(queryString);
	ajaxRequest.open("GET", "AjaxCamera2.jsp"
			+ queryString, true);
	ajaxRequest.send(null);
	



}
function camera3()
{
	var camera3=document.getElementById("camera3").value;
	
	var ajaxRequest; // The variable that makes Ajax possible!
	try {
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	} catch (e) {
		// Internet Explorer Browsers
		try {
			ajaxRequest = new ActiveXObject(
					"Msxml2.XMLHTTP");
		} catch (e) {
			try {
				ajaxRequest = new ActiveXObject(
						"Microsoft.XMLHTTP");
			} catch (e) {
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	ajaxRequest.onreadystatechange = function() {
		if (ajaxRequest.readyState == 4) {
			var reslt = ajaxRequest.responseText;
			if(reslt.trim()=="R")
			//document.getElementById("vehno").innerHTML = reslt;
			
			{
			alert("Camera 3 Serial No Doesn't Exist!!");
			}  
			
			else if(reslt.trim()=="RX")
				//document.getElementById("vehno").innerHTML = reslt;
				
				{
				alert("Camera 3 Serial No Already Exist!!");
				}
			else
				{
				
				}
			
			
		/* 	document.getElementById("City").disabled = false;
			document.getElementById("City").innerHTML = reslt; */

		}
	};

	var queryString = "?id="+camera3+"&category=Camera";
	//alert(queryString);
	ajaxRequest.open("GET", "AjaxCamera3.jsp"
			+ queryString, true);
	ajaxRequest.send(null);
	
	
	
	
	
	
	
}
function camera4()
{
	var camera4=document.getElementById("camera4").value;
	
	var ajaxRequest; // The variable that makes Ajax possible!
	try {
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	} catch (e) {
		// Internet Explorer Browsers
		try {
			ajaxRequest = new ActiveXObject(
					"Msxml2.XMLHTTP");
		} catch (e) {
			try {
				ajaxRequest = new ActiveXObject(
						"Microsoft.XMLHTTP");
			} catch (e) {
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	ajaxRequest.onreadystatechange = function() {
		if (ajaxRequest.readyState == 4) {
			var reslt = ajaxRequest.responseText;
			if(reslt.trim()=="R")
			//document.getElementById("vehno").innerHTML = reslt;
			
			{
			alert("Camera 4 Serial No Doesn't Exist!!");
			}  
			
			else if(reslt.trim()=="RX")
				//document.getElementById("vehno").innerHTML = reslt;
				
				{
				alert("Camera 4 Serial No Already Exist!!");
				}
			else
				{
				
				}
			
			
		/* 	document.getElementById("City").disabled = false;
			document.getElementById("City").innerHTML = reslt; */

		}
	};

	var queryString = "?id="+camera4+"&category=Camera";
	//alert(queryString);
	ajaxRequest.open("GET", "AjaxCamera4.jsp"
			+ queryString, true);
	ajaxRequest.send(null);
	



}
function camera3()
{
	var camera3=document.getElementById("camera3").value;
	
	var ajaxRequest; // The variable that makes Ajax possible!
	try {
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	} catch (e) {
		// Internet Explorer Browsers
		try {
			ajaxRequest = new ActiveXObject(
					"Msxml2.XMLHTTP");
		} catch (e) {
			try {
				ajaxRequest = new ActiveXObject(
						"Microsoft.XMLHTTP");
			} catch (e) {
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	ajaxRequest.onreadystatechange = function() {
		if (ajaxRequest.readyState == 4) {
			var reslt = ajaxRequest.responseText;
			if(reslt.trim()=="R")
			//document.getElementById("vehno").innerHTML = reslt;
			
			{
			alert("Camera 3 Serial No Doesn't Exist!!");
			}  
			
			else if(reslt.trim()=="RX")
				//document.getElementById("vehno").innerHTML = reslt;
				
				{
				alert("Camera 3 Serial No Already Exist!!");
				}
			else
				{
				
				}
			
			
		/* 	document.getElementById("City").disabled = false;
			document.getElementById("City").innerHTML = reslt; */

		}
	};

	var queryString = "?id="+camera3+"&category=Camera";
	//alert(queryString);
	ajaxRequest.open("GET", "AjaxCamera3.jsp"
			+ queryString, true);
	ajaxRequest.send(null);
	
	
	
	
	
	
}


function LED()
{
	
	var LED=document.getElementById("LED").value;
	
	
	var ajaxRequest; // The variable that makes Ajax possible!
	try {
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	} catch (e) {
		// Internet Explorer Browsers
		try {
			ajaxRequest = new ActiveXObject(
					"Msxml2.XMLHTTP");
		} catch (e) {
			try {
				ajaxRequest = new ActiveXObject(
						"Microsoft.XMLHTTP");
			} catch (e) {
				// Something went wrong
				alert("Your browser broke!");
				return false;
			}
		}
	}
	ajaxRequest.onreadystatechange = function() {
		if (ajaxRequest.readyState == 4) {
			var reslt = ajaxRequest.responseText;
			if(reslt.trim()=="R")
			//document.getElementById("vehno").innerHTML = reslt;
			
			{
			alert("LED Serial No Doesn't Exist!!");
			}  
			
			else if(reslt.trim()=="RX")
				//document.getElementById("vehno").innerHTML = reslt;
				
				{
				alert("LED Serial No Already Exist!!");
				}
			else
				{
				
				}
			
			
		/* 	document.getElementById("City").disabled = false;
			document.getElementById("City").innerHTML = reslt; */

		}
	};

	var queryString = "?id="+LED+"&category=LED";
	//alert(queryString);
	ajaxRequest.open("GET", "AjaxLED.jsp"
			+ queryString, true);
	ajaxRequest.send(null);

	
	
	
	
	
	
	
	
}


function showhidedetails()
{
var smart=document.getElementById("typ").options[document.getElementById("typ").selectedIndex].innerHTML;
	if(smart=="SmartGrid")
		{
		document.getElementById("sim0").style.display="";
		document.getElementById("sim1").style.display="";
		document.getElementById("sim2").style.display="";
		document.getElementById("sim3").style.display="";
		document.getElementById("sim4").style.display="";
		document.getElementById("sim5").style.display="";
		document.getElementById("sim6").style.display="";
		document.getElementById("sim7").style.display="";
		
		}
	else
		{
		document.getElementById("sim0").style.display="none";
		document.getElementById("sim1").style.display="none";
		document.getElementById("sim2").style.display="none";
		document.getElementById("sim3").style.display="none";
		document.getElementById("sim4").style.display="none";
		document.getElementById("sim5").style.display="none";
		document.getElementById("sim6").style.display="none";
		document.getElementById("sim7").style.display="none";
		
		}
	
	
}


function isNumber(evt)
{
	
	var charCode = (evt.which) ? evt.which : event.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57))
	{
		alert("IMEI NO. should contain only numbers."); 
		return false;   
	}
}

function validate()
{  

	//alert("inside validate");
 var invalid=/^[A-Za-z0-9.:-]+$/;	
 // var v1=document.mainpageform.unitid.value;
  var v2=document.mainpageform.wmsn.value;
  var v1=document.getElementById("unitid").options[document.getElementById("unitid").selectedIndex].innerHTML;
  //alert(v2);
  var v3=document.mainpageform.module.value;
  var v4=document.mainpageform.gps.value;
  var v5=document.mainpageform.sim.value;
  var v6=document.mainpageform.mob.value; 
  var v7=document.mainpageform.typ.value; 
  var v8=document.mainpageform.swver.value; 
  var v9=document.mainpageform.comp.value; 
  var v10=document.mainpageform.correct.value; 
  var v11=document.mainpageform.box.value; 
  var v16=document.mainpageform.powersupply.value;
 // alert(">>>"+v1);
  var v12=document.mainpageform.psno.value; 
 // alert("v12"+v12.length);
  var v13=document.mainpageform.pcbno.value; 
  var v14=document.mainpageform.boxno.value; 
  var v15=document.mainpageform.batteryno.value; 
  var imeino = document.mainpageform.imeino.value;
	

  v6= v6.replace(/^\s+|\s+$/g,"");
  if(v1 == "Select")
   {
     alert("Please Select Unit ID");
     return false;
   }
    if(isNaN(v1))
   {
     alert("Enter valid unit no");
     //return false;
   } 

if(mandatory=="Yes")
{
   if(v2.length==0)
   {
     alert("Please enter WMSN No");
     return false;
   }
//    if(isNaN(v2))
//    {
//      alert("Please enter valid WMSN No");
//      return false;
//    } 

     if(!invalid.test(v2))
   {
     alert("Please enter valid WMSN No");
     return false;
   } 


   if(v3=="GH1202")
   {
 	  if(v2.length<8 || v2.length>8)
       {
	         alert("WMSN No. should be 8 digit");
       	 return false;
       }
   }
   else if(v3=="FM2200")
   {
 	  if(v2.length<8 || v2.length>8)
       {
	         alert("WMSN No. should be 8 digit");
       	 return false;
       }
   }
   else
   {
 	   if(v2.length<15 || v2.length>15)
    		{
      		alert("Please enter valid WMSN No");
      		return false;
    		}
   }
}
else
{ 
   if(v2.length>0)
   {      
//       if(isNaN(v2))
//       {
//         alert("Please enter valid WMSN No");
//         return false;
//       } 

    if(!invalid.test(v2))
   {
     alert("Please enter valid WMSN No");
     return false;
   } 
 

      if(v3=="GH1202")
      {
    	  if(v2.length<8 || v2.length>8)
          {
	         alert("WMSN No. should be 8 digit");
          	 return false;
          }
      }
      else if(v3=="FM2200")
      {
    	  if(v2.length<8 || v2.length>8)
          {
	         alert("WMSN No. should be 8 digit");
          	 return false;
          }
      }
      else if(v3!="FM2200" || v3!="GH1202")
      {
       	if(v2.length<15 || v2.length>15)
       	{
          	alert("Please enter valid WMSN No");
         	 return false;
       	}
      }
  }
}

    if(v3=="Select")
  {
     alert("Please select the Module no from the List");
     return false;
  }  

    if(v3=="GH1202")
    {
	 if(imeino.length==0 || imeino.length>15 || imeino.length<15)
	{
		alert("IMEI NO. should be 15 digit.");
		return false;
	}
    }

    if(v3=="FM2200")
    {
	 if(imeino.length==0 || imeino.length>15 || imeino.length<15)
	{
		alert("IMEI NO. should be 15 digit.");
		return false;
	}
    }
    
     if(v4=="Select")
  {
     alert("Please select the GPS no from the List");
     return false;
  }  

if(mandatory=="Yes")
{
   if(v5.length==0)
   {
     alert("Please enter SIM No");
     return false;
   }
   if(isNaN(v5))
   {
     alert("Please enter valid SIM No");
     return false;
   } 
    if(v5.length<8 || v5.length>15)
   {
     alert("Please enter valid SIM No");
     return false;
   }

    if(v6.length==0)
   {
    	
     alert("Please enter Mobile No");
     return false;
   }
   if(isNaN(v6))
   {
     alert("Enter valid Mobile No");
     return false;
   } 
   if(v6.length<10 || v6.length>16)
   {
     alert("Please enter 10 to 15 Digit Mobile No");
     return false;
   }
}
else
{ 
  if(v5.length>0)
   {
       if(isNaN(v5))
       {
           alert("Please enter valid SIM No");
           return false;
       } 
       if(v5.length<8 || v5.length>8)
       {
          alert("Please enter valid SIM No");
          return false;
       }
  }
 
  if(v6.length>0)
  {
       if(isNaN(v6))
      {
           alert("Enter valid Mobile No");
           return false;
      } 
      if(v6.length<10 || v6.length>10)
      {
          alert("Please enter valid Mobile No");
          return false;
      }
  }
}

if(v12.length==0){
	 alert("Please enter PS No");
    return false;
}
if(v13.length==0){
	 alert("Please enter PCB No");
    return false;
}
if(v14.length==0){
	 alert("Please enter Box No");
    return false;
}
if(v15.length==0){
	 alert("Please enter Battery No");
    return false;
}

   if(v7=="Select")
  {
     alert("Please select the Unit Type from the List");
     return false;
  }  

  if(v8=="Select")
  {
     alert("Please select the Software version from the List");
     return false;
  }  

  if(document.mainpageform.voice.checked == false && document.mainpageform.jrm.checked == false && document.mainpageform.buz.checked == false && document.mainpageform.temp1.checked == false && document.mainpageform.temp2.checked == false && document.mainpageform.door1.checked == false && document.mainpageform.door2.checked == false && document.mainpageform.horn.checked == false && document.mainpageform.scard.checked == false && document.mainpageform.flow1.checked == false && document.mainpageform.flow2.checked == false && document.mainpageform.plain.checked == false && document.mainpageform.battery.checked == false && document.mainpageform.battery950.checked == false && document.mainpageform.battery1800.checked == false && document.mainpageform.battery1050.checked == false && document.mainpageform.Camera.checked == false && document.mainpageform.PlainDualCamera.checked == false && document.mainpageform.SmartGrid.checked == false)
  {
    alert("Please select at least on option from the Peripherals");
    return false;
  }

  if(v9=="select")
  {
     alert("Please select a company name from the List");
     return false;
  }
  if(v11=="select")
  {
     alert("Please select a Box Enclosure Type from the List");
     return false;
  }
  if(v16=="select")
  {
     alert("Please select a Power Supply from the List");
     return false;
  }
  
  if(v10.length=="")
	{ 
		
      	alert("Please select OtherCorrection Done from the list");
     		return false;
 		
	}


  
	  
   return true;

}  

function varchange(ind)
{
  if(ind==0)
  { 
     mandatory="No";
  }
  else
  {
    mandatory="Yes";
  }
}

function checkprevrecords(param)
{ 


	var count=(document.mainpageform.unitid.value).length+1;
   // var unitid=document.mainpageform.unitid.value;
    var wmsn=document.mainpageform.wmsn.value;
   var sim=document.mainpageform.sim.value;
    var mob=document.mainpageform.mob.value;				
    var PSNo=document.mainpageform.psno.value;
    var PCBNo=document.mainpageform.pcbno.value;
    var BoxNo=document.mainpageform.boxno.value;
    var BatteryNo=document.mainpageform.batteryno.value;
    var modul = document.mainpageform.module.value;
    
  
    

    

try{
	  var unitidnew=document.getElementById("unitid").options[document.getElementById("unitid").selectedIndex].innerHTML;
	//var unitid1=document.getElementById("unitid");
    //var unitidnew = unitid1.value;
//alert("index>111>"+document.getElementById("unitid").innerHTML);
  // alert("final unit id >>"+document.getElementById("unitid").options[document.getElementById("unitid").selectedIndex].innerHTML);
   

   //alert("unitidnew>>>>>"+unitidnew);
   //alert(unitidnew);
    //alert("count of  unitid>>>>>"+count);
}catch(e)
{
alert(" aleert for unit id  "+e);
}
	

    var ajaxRequest;  // The variable that makes Ajax possible!

    try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	        }  
                catch (e)
                {
		        // Internet Explorer Browsers
		        try
                        {
			   ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		        } 
                        catch (e)
                        {
			   try
                           {
			       ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			   } 
                           catch (e)
                           {
			      // Something went wrong
			      alert("Your browser broke!");
			      return false;
			   }
		        }
                }

             // Create a function that will receive data sent from the server
           	  ajaxRequest.onreadystatechange = function()
                   {
    	 	  if(ajaxRequest.readyState == 4)
                      {
                         var reslt=ajaxRequest.responseText;
                    
                           //var mySplitResult = reslt.split("#");
			
			   document.getElementById("unitdets").innerHTML=reslt;
                            var statcheck = document.getElementById("statchk").value;
                            if(statcheck=="Yes")
                            {
                                document.mainpageform.unitid.value="";
                                document.getElementById("statchk").value="NO";
                            }  

		     } 
         	  }
              var queryString = "?param=" +param+"&unitid="+unitidnew+"&wmsn="+wmsn+"&sim="+sim+"&mob="+mob+"&PSNo="+PSNo+"&PCBNo="+PCBNo+"&BoxNo="+BoxNo+"&BatteryNo="+BatteryNo+"&module"+modul;
              //alert(queryString);
	     ajaxRequest.open("GET", "Ajaxchkdetails.jsp" + queryString, true);
	     ajaxRequest.send(null);  
   
}

function checkprevrecords1(param)
{ 
   
	 //alert("hi>1111111111111>>");
	//var count=(document.mainpageform.unitid.value).length+1;
	
   //alert("hi>>>");
   // var unitid=document.mainpageform.unitid.value;
    
    var unitidnew=document.getElementById("unitid").options[document.getElementById("unitid").selectedIndex].innerHTML;
    
    //alert("bbbbb>>");
    var wmsn=document.mainpageform.wmsn.value;
   var sim=document.mainpageform.sim.value;
    var mob=document.mainpageform.mob.value;					
    var PSNo=document.mainpageform.psno.value;
    var PCBNo=document.mainpageform.pcbno.value;
    var BoxNo=document.mainpageform.boxno.value;
    var BatteryNo=document.mainpageform.batteryno.value;
   var ajaxRequest;  // The variable that makes Ajax possible!

    try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	        }  
                catch (e)
                {
		        // Internet Explorer Browsers
		        try
                        {
			   ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		        } 
                        catch (e)
                        {
			   try
                           {
			       ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			   } 
                           catch (e)
                           {
			      // Something went wrong
			      alert("Your browser broke!");
			      return false;
			   }
		        }
                }

             // Create a function that will receive data sent from the server
           	  ajaxRequest.onreadystatechange = function()
                   {
    	 	  if(ajaxRequest.readyState == 4)
                      {
                         var reslt=ajaxRequest.responseText;
                    
                           //var mySplitResult = reslt.split("#");
			
			   document.getElementById("wmsndets").innerHTML=reslt;
		  var wmsncheck = document.mainpageform.wmsnchk.value;	                         
			  if(wmsncheck=="Yes")
 			  {
				//alert("hi");
				document.mainpageform.wmsn.value="";
				document.mainpageform.wmsnchk.value="No";
                          }                                            
                         
		     } 
         	  }
              var queryString = "?param=" +param+"&unitid="+unitidnew+"&wmsn="+wmsn+"&sim="+sim+"&mob="+mob+"&PSNo="+PSNo+"&PCBNo="+PCBNo+"&BoxNo="+BoxNo+"&BatteryNo="+BatteryNo;
	     ajaxRequest.open("GET", "Ajaxchkdetails.jsp" + queryString, true);
	     ajaxRequest.send(null);  
   
}
function checkprevrecords11(param)
{ 
//alert("in PSNo function");
	   //var count=(document.mainpageform.unitid.value).length+1;
	
    //var unitid=document.mainpageform.unitid.value;
 
    var unitidnew=document.getElementById("unitid").options[document.getElementById("unitid").selectedIndex].innerHTML;
    
    
    //   alert(unitid);
    var wmsn=document.mainpageform.wmsn.value;
   var sim=document.mainpageform.sim.value;
    var mob=document.mainpageform.mob.value;	
//    alert(mob);			
    var PSNo=document.mainpageform.psno.value;
    var PCBNo=document.mainpageform.pcbno.value;
    var BoxNo=document.mainpageform.boxno.value;
    var BatteryNo=document.mainpageform.batteryno.value;
    var modul = document.mainpageform.module.value;
 //   alert(BatteryNo)
   var ajaxRequest;  // The variable that makes Ajax possible!

    try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	        }  
                catch (e)
                {
		        // Internet Explorer Browsers
		        try
                        {
			   ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		        } 
                        catch (e)
                        {
			   try
                           {
			       ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			   } 
                           catch (e)
                           {
			      // Something went wrong
			      alert("Your browser broke!");
			      return false;
			   }
		        }
                }

             // Create a function that will receive data sent from the server
           	  ajaxRequest.onreadystatechange = function()
                   {
    	 	  if(ajaxRequest.readyState == 4)
                      {
                         var reslt=ajaxRequest.responseText;
                    
                           //var mySplitResult = reslt.split("#");
		//	alert(reslt)
			   document.getElementById("psnodets").innerHTML=reslt;
		  var psnocheck = document.mainpageform.psnochk.value;	                         
			  if(psnocheck=="Yes")
 			  {
				//alert("hi");
				document.mainpageform.psno.value="";
				document.mainpageform.psnochk.value="No";
                          }                                            
                         
		     } 
         	  }
              var queryString = "?param=" +param+"&unitid="+unitidnew+"&wmsn="+wmsn+"&sim="+sim+"&mob="+mob+"&PSNo="+PSNo+"&PCBNo="+PCBNo+"&BoxNo="+BoxNo+"&BatteryNo="+BatteryNo+"&module="+modul;
			  //alert(queryString)
     	     ajaxRequest.open("GET", "Ajaxchkdetails.jsp" + queryString, true);
	     ajaxRequest.send(null);  
   
}
function checkprevrecords12(param)
{ 
   //var count=(document.mainpageform.unitid.value).length+1;
	
    //var unitid=document.mainpageform.unitid.value;
    
      var unitidnew=document.getElementById("unitid").options[document.getElementById("unitid").selectedIndex].innerHTML;
    
    var wmsn=document.mainpageform.wmsn.value;
   var sim=document.mainpageform.sim.value;
    var mob=document.mainpageform.mob.value;					
    var PSNo=document.mainpageform.psno.value;
    var PCBNo=document.mainpageform.pcbno.value;
    var BoxNo=document.mainpageform.boxno.value;
    var BatteryNo=document.mainpageform.batteryno.value;
    var modul = document.mainpageform.module.value;
   var ajaxRequest;  // The variable that makes Ajax possible!

    try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	        }  
                catch (e)
                {
		        // Internet Explorer Browsers
		        try
                        {
			   ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		        } 
                        catch (e)
                        {
			   try
                           {
			       ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			   } 
                           catch (e)
                           {
			      // Something went wrong
			      alert("Your browser broke!");
			      return false;
			   }
		        }
                }

             // Create a function that will receive data sent from the server
           	  ajaxRequest.onreadystatechange = function()
                   {
    	 	  if(ajaxRequest.readyState == 4)
                      {
                         var reslt=ajaxRequest.responseText;
                    
                           //var mySplitResult = reslt.split("#");
			
			   document.getElementById("pcbnodets").innerHTML=reslt;
		  var pcbnocheck = document.mainpageform.pcbnochk.value;	                         
			  if(pcbnocheck=="Yes")
 			  {
				//alert("hi");
				document.mainpageform.pcbno.value="";
				document.mainpageform.pcbnochk.value="No";
                          }                                            
                         
		     } 
         	  }
              var queryString = "?param=" +param+"&unitid="+unitidnew+"&wmsn="+wmsn+"&sim="+sim+"&mob="+mob+"&PSNo="+PSNo+"&PCBNo="+PCBNo+"&BoxNo="+BoxNo+"&BatteryNo="+BatteryNo+"&module="+modul;
	     ajaxRequest.open("GET", "Ajaxchkdetails.jsp" + queryString, true);
	     ajaxRequest.send(null);  
   
}
function checkprevrecords13(param)
{ 
   //var count=(document.mainpageform.unitid.value).length+1;
	
    //var unitid=document.mainpageform.unitid.value;
    
     var unitidnew=document.getElementById("unitid").options[document.getElementById("unitid").selectedIndex].innerHTML;
    
    
    var wmsn=document.mainpageform.wmsn.value;
   var sim=document.mainpageform.sim.value;
    var mob=document.mainpageform.mob.value;					
    var PSNo=document.mainpageform.psno.value;
    var PCBNo=document.mainpageform.pcbno.value;
    var BoxNo=document.mainpageform.boxno.value;
    var BatteryNo=document.mainpageform.batteryno.value;
    var modul = document.mainpageform.module.value;
   var ajaxRequest;  // The variable that makes Ajax possible!

    try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	        }  
                catch (e)
                {
		        // Internet Explorer Browsers
		        try
                        {
			   ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		        } 
                        catch (e)
                        {
			   try
                           {
			       ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			   } 
                           catch (e)
                           {
			      // Something went wrong
			      alert("Your browser broke!");
			      return false;
			   }
		        }
                }

             // Create a function that will receive data sent from the server
           	  ajaxRequest.onreadystatechange = function()
                   {
    	 	  if(ajaxRequest.readyState == 4)
                      {
                         var reslt=ajaxRequest.responseText;
                    
                           //var mySplitResult = reslt.split("#");
			
			   document.getElementById("boxnodets").innerHTML=reslt;
		  var boxnocheck = document.mainpageform.boxnochk.value;	                         
			  if(boxnocheck=="Yes")
 			  {
				//alert("hi");
				document.mainpageform.boxno.value="";
				document.mainpageform.boxnochk.value="No";
                          }                                            
                         
		     } 
         	  }
              var queryString = "?param=" +param+"&unitid="+unitidnew+"&wmsn="+wmsn+"&sim="+sim+"&mob="+mob+"&PSNo="+PSNo+"&PCBNo="+PCBNo+"&BoxNo="+BoxNo+"&BatteryNo="+BatteryNo+"&module="+modul;
	     ajaxRequest.open("GET", "Ajaxchkdetails.jsp" + queryString, true);
	     ajaxRequest.send(null);  
   
}
function checkprevrecords14(param)
{ 
   
	
	//var count=(document.mainpageform.unitid.value).length+1;
	
    //var unitid=document.mainpageform.unitid.value;
    
     var unitidnew=document.getElementById("unitid").options[document.getElementById("unitid").selectedIndex].innerHTML;
    
    
    var wmsn=document.mainpageform.wmsn.value;
   var sim=document.mainpageform.sim.value;
    var mob=document.mainpageform.mob.value;					
    var PSNo=document.mainpageform.psno.value;
    var PCBNo=document.mainpageform.pcbno.value;
    var BoxNo=document.mainpageform.boxno.value;
    var BatteryNo=document.mainpageform.batteryno.value;
    var modul = document.mainpageform.module.value;
   var ajaxRequest;  // The variable that makes Ajax possible!

    try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	        }  
                catch (e)
                {
		        // Internet Explorer Browsers
		        try
                        {
			   ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		        } 
                        catch (e)
                        {
			   try
                           {
			       ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			   } 
                           catch (e)
                           {
			      // Something went wrong
			      alert("Your browser broke!");
			      return false;
			   }
		        }
                }

             // Create a function that will receive data sent from the server
           	  ajaxRequest.onreadystatechange = function()
                   {
    	 	  if(ajaxRequest.readyState == 4)
                      {
                         var reslt=ajaxRequest.responseText;
                    
                           //var mySplitResult = reslt.split("#");
			
			   document.getElementById("batterynodets").innerHTML=reslt;
		  var batterynodets = document.mainpageform.batterynochk.value;	                         
			  if(batterynodets=="Yes")
 			  {
				//alert("hi");
				document.mainpageform.batteryno.value="";
				document.mainpageform.batterynochk.value="No";
                          }                                            
                         
		     } 
         	  }
              var queryString = "?param=" +param+"&unitid="+unitidnew+"&wmsn="+wmsn+"&sim="+sim+"&mob="+mob+"&PSNo="+PSNo+"&PCBNo="+PCBNo+"&BoxNo="+BoxNo+"&BatteryNo="+BatteryNo+"&module="+modul;
	     ajaxRequest.open("GET", "Ajaxchkdetails.jsp" + queryString, true);
	     ajaxRequest.send(null);  
   
}
function checkprevrecords2(param)
{ 
   
	//var count=(document.mainpageform.unitid.value).length+1;
	
    //var unitid=document.mainpageform.unitid.value;
    
     var unitidnew=document.getElementById("unitid").options[document.getElementById("unitid").selectedIndex].innerHTML;
    
    var wmsn=document.mainpageform.wmsn.value;
    var sim=document.mainpageform.sim.value;
    var mob=document.mainpageform.mob.value;				
    var PSNo=document.mainpageform.psno.value;
    var PCBNo=document.mainpageform.pcbno.value;
    var BoxNo=document.mainpageform.boxno.value;
    var BatteryNo=document.mainpageform.batteryno.value;
   var ajaxRequest;  // The variable that makes Ajax possible!

    try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	        }  
                catch (e)
                {
		        // Internet Explorer Browsers
		        try
                        {
			   ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		        } 
                        catch (e)
                        {
			   try
                           {
			       ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			   } 
                           catch (e)
                           {
			      // Something went wrong
			      alert("Your browser broke!");
			      return false;
			   }
		        }
                }

             // Create a function that will receive data sent from the server
           	  ajaxRequest.onreadystatechange = function()
                   {
    	 	  if(ajaxRequest.readyState == 4)
                      {
                         var reslt=ajaxRequest.responseText;
                    
			  // alert("reslt:---"+reslt);
			   
			   document.getElementById("simdets").innerHTML=reslt;
		       var simcheck = document.mainpageform.simchk.value;	
		       
		       
			  if(simcheck=="Yes")
 			  {
				//alert("hi");
				document.mainpageform.sim.value="";
				document.mainpageform.mob.value="";
				document.mainpageform.simchk.value="No";
               }else{
            	  // alert("hi in else");
            	   document.mainpageform.mob.value=document.getElementById("simbymob").value;
            	 document.mainpageform.simchk.value="Yes";
               }  
			  /*else if(simcheck=="notgot")
			  {
				  document.mainpageform.mob.value="";
			  }
			  else if(!(simcheck=="Yes") && !((simcheck=="notgot")))    
              {
            	  document.mainpageform.mob.value=simcheck;					
                  }  */                                    
                         
		     } 
         	  }
             var queryString = "?param=" +param+"&unitid="+unitidnew+"&wmsn="+wmsn+"&sim="+sim+"&mob="+mob;
	     ajaxRequest.open("GET", "Ajaxchkdetails.jsp" + queryString, true);
	     ajaxRequest.send(null);  

	    // function utidchk()
	   //  {
           //  alert(">>>>inside function ut");
	    	// var unitid=document.mainpageform.unitid.value;	         
	    	// var sim=document.mainpageform.sim.value;
	    	// document.addinstn.action="unitidchk.jsp?q="+unitid+"&d="+sim;


       	 // document.addinstn.submit();


	   //  }
   
}

function showhideIMEI()
{
	try{
	var module = document.mainpageform.module.value;
	//alert(module+"..hi");
	if(module=="GH1202") //GH3000 is for M12 units 
	{
		//var i =document.getElemetById(imei);
		//alert(i);
		try{
			
			document.mainpageform.imeino.style.display='block';
			var row12 = document.getElementById("imei");
			row12.style.visibility="visible";
			
			
			
		}
		catch(e)
		{
			alert(e);
		}
		//document.mainpageform.imei.visibility='visible';
		
	}
	else if(module=="FM2200") //FM2200 is for M12 units 
	{
		//var i =document.getElemetById(imei);
		//alert(i);
		try{
			
			document.mainpageform.imeino.style.display='block';
			var row12 = document.getElementById("imei");
			row12.style.visibility="visible";
			
			
			
		}
		catch(e)
		{
			alert(e);
		}
		//document.mainpageform.imei.visibility='visible';
		
	}
	
	
	
	
	
	else
	{
		document.mainpageform.imeino.style.display='none';
		var row12 = document.getElementById("imei");
		row12.style.visibility="hidden";
		
		
		
	}
	}
	catch(e)
	{
		alert(e);
	}
}
/*function edittxtbox()
{
	if(document.mainpageform.chkmob.checked==true)
		document.mainpageform.mob.readOnly=false;
	else
		document.mainpageform.mob.readOnly=true;	
}*/

function checkprevrecords3(param)
{ 
   //var count=(document.mainpageform.unitid.value).length+1;
	
 //   var unitid=document.mainpageform.unitid.value;
   
  var unitidnew=document.getElementById("unitid").options[document.getElementById("unitid").selectedIndex].innerHTML;
 
 var wmsn=document.mainpageform.wmsn.value;
    var sim=document.mainpageform.sim.value;
    var mob=document.mainpageform.mob.value;				
    var PSNo=document.mainpageform.psno.value;
    var PCBNo=document.mainpageform.pcbno.value;
    var BoxNo=document.mainpageform.boxno.value;
    var BatteryNo=document.mainpageform.batteryno.value;
   var ajaxRequest;  // The variable that makes Ajax possible!

//  alert("mob==>"+mob);

   
    try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	        }  
                catch (e)
                {
		        // Internet Explorer Browsers
		        try
                        {
			   ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		        } 
                        catch (e)
                        {
			   try
                           {
			       ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			   } 
                           catch (e)
                           {
			      // Something went wrong
			      alert("Your browser broke!");
			      return false;
			   }
		        }
                }

             // Create a function that will receive data sent from the server
           	  ajaxRequest.onreadystatechange = function()
                   {
    	 	  if(ajaxRequest.readyState == 4)
                      {
                         var reslt=ajaxRequest.responseText;
                    
			
			   document.getElementById("mobdets").innerHTML=reslt;

			   var mobdeact=document.getElementById("mobchk11").value;	
			   var simdeact=document.getElementById("simchk11").value;


			 //  alert("mobdeact==>"+mobdeact);


			   if(mobdeact=="flush")
				  {
					  document.mainpageform.mob.value="";
					  

				  }else if(simdeact=="flush"){
					  
					  document.mainpageform.sim.value="";

				  } else{
					  
				  }
			   //alert("hi=22222=>");
			   var mobcheck = document.mainpageform.mobchk.value;
			  


      
		                           
			  if(mobcheck=="Yes")
 			  {
				document.mainpageform.mob.value="";
				document.mainpageform.mobchk.value="No";
                          }   
			  else if(mobcheck=="notgot")
              {
				var mobvalue = document.mainpageform.mobvalue.value;
				
                  var ans=confirm("The Sim No you entered has Mobile No: "+mobvalue+" in database.Please confirm it. Else if you are sure press OK.");
                  if(ans==true) 
                  {
                  document.mainpageform.chkmob.value="verified";
                  }
                  else
                	 document.mainpageform.chkmob.value="-";
              	     document.mainpageform.mobchk.value="";
                  var ok= document.mainpageform.chkmob.value;
                  // alert("ok"+ok);
              }   
			  else if(mobcheck=="got")
			  {
				  document.mainpageform.chkmob.value="verified";
					document.mainpageform.mobchk.value="";
				  var ok= document.mainpageform.chkmob.value;
                 // alert("ok"+ok);
			  }                                   
                         
		     } 
         	  }
         	  
             var queryString = "?param=" +param+"&unitid="+unitidnew+"&wmsn="+wmsn+"&sim="+sim+"&mob="+mob;
	     ajaxRequest.open("GET", "Ajaxchkdetails.jsp" + queryString, true);
	     ajaxRequest.send(null);  

	     document.addinstn.action="addcontent.jsp?q="+q+"&d="+d;


   	  document.addinstn.submit();
   
}

function checkimei()
{
	var imeino = document.mainpageform.imeino.value;
	if(imeino.length==0 || imeino.length>15 || imeino.length<15)
	{
		alert("IMEI NO. should be 15 digit.");
	}
}



</script>


<body>
<form name="mainpageform" action="insert.jsp" method="get" onsubmit="return validate();">

<%!
Connection con1,con2;
%> 
<% 

ResultSet rs1=null, rs2=null, rs3=null, rs4=null, rs5=null,rs98=null,rsPOWER_SUPPLY=null;
Statement stmt1=null;
Statement stmt2=null;
Statement stmt3=null;
Statement stmt98=null;
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

stmt1 = con1.createStatement();
stmt2 = con1.createStatement();
stmt3 = con2.createStatement();
stmt98= con1.createStatement();
String sql1="", sql2="", sql3="", sql4="", sql5="",a11="",POWER_SUPPLY="";
String cnt="",VendorName="";

String user=session.getAttribute("user").toString();
String ustyp=session.getAttribute("urole").toString();

%> <%
java.util.Date d=new java.util.Date();
String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();
String tme= "" + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();

java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   String nwfrmtdte=formatter.format(datefrmdb);
   a11=request.getParameter("msg"); 
  
  
   System.out.println("<><><>...."+a11);
  
   
String unid=request.getParameter("un");
   String simm=request.getParameter("sim"); 
   String mobb=request.getParameter("mob");
   String wms=request.getParameter("wms");
   if(unid==null)
   {
   }
   else
   { %>
<table border="0" width="100%">
	<tr>
		<td>
			<div align="center">
			<font color="maroon"><B> Already Configured. Details are as UnitId=<%=unid %>; SIM=<%=simm %>; Mobile=<%=mobb %>; WMSN=<%=wms %> </B></font>
			</div>
		</td>
	</tr>
</table>
<% } 

    String inserted=request.getParameter("inserted");
   if(inserted==null)
   {
   }
   else
   { 
       
%>
<table border="0" width="100%">
	<tr>
		<td>
			<div align="center"><font color="maroon"><B>Successfully Inserted </B></font></div>
		</td>
	</tr>
</table>
<% }

  String changed=request.getParameter("changed");
  
  if(changed==null)
   {
   }
   else
   { 

  %>
<table border="0" width="100%">
	<tr>
		<td>
			<div align="center"><font color="maroon" size="2"> <b><U> Password change successful </U> </b></font></div>
		</td>
	</tr>
</table>

<%  } %>

<%
try
{

String router=request.getParameter("router");	
String router1=request.getParameter("router1");
if(router!=null)
%>
	
	
	
	
<%
	
}
catch(Exception e)
{
	e.printStackTrace();
}

%>






<center>
<table border="0" width="80%">
	<tr>
		<td>
			<div align="center"><font color="maroon" size="3"> <B>Unit Manufacturing Details </B></font></div>
		</td>
		
		
		<td>
			<div align="center"><a href="#" onclick="window.open('cameraMfdForm.jsp','Edit_PopUp_Window','width=890,height=800,toolbar=true,location=false,status=no,menubar=no,resizable=yes,scrollbars=yes,left=50,top=50');"> <font  size="2">Camera Manufacturing Entry</font></a></div> 
		</td>
		  
	</tr>
</table>

<%

if(!(null==a11))
 {
	
 		
   %>
	<div> <b> <%=a11 %></b> </div>
	
	<% 		
}



%>


</center>
<center>

<div id="unitdets"></div>

<div id="wmsndets"></div>

<div id="simdets"></div>

<div id="mobdets"></div>

<div id="psnodets"></div>
<div id="pcbnodets"></div>
<div id="boxnodets"></div>
<div id="batterynodets"></div>
<!-- <img id="top" src="images/top.png"  width="85%" alt=""> -->
<table border="1" width="85%" cellpadding="1" cellspacing="0">
	<tr>
		<td>
		<table border="0" width="100%">
			<tr>
			<%
			String VendorNameString = "SELECT a.V_Name as VendorName FROM db_CustomerComplaints.t_vendorMaster as a join db_CustomerComplaints.t_admin as b where b.UName = '"+user+"' and a.V_ID = b.TypeValue and b.UserType like 'dispatch'";
		    System.out.println(VendorNameString);
			ResultSet rsVEndorName = stmt2.executeQuery(VendorNameString);
		    if(rsVEndorName.next())
		    {
		    	VendorName =rsVEndorName.getString("VendorName");
		    }
		    
			String AllocatedUnits = "Select Unitid from t_unitserialization where VENDOR = '"+VendorName+"' AND STATUS <> 'MANUFACTURED'";
			System.out.println(AllocatedUnits);
			ResultSet rsAllocatedUnits = stmt3.executeQuery(AllocatedUnits);
			%>
				<td width="40%"><font color="maroon"> Unit Id: </font></td>
				<td>
				<select name="unitid" id="unitid" class="formElement" onchange="checkprevrecords('unit');">
				<option value="Select">Select</option>
				<%
				while(rsAllocatedUnits.next())
				{
					%>
					<option  value"<%=rsAllocatedUnits.getString(1)%>"><%=rsAllocatedUnits.getString(1)%></option>
					<%
				}
				%>
				</select>
				
				</td>
				
				<!-- <input type="hidden" name="unitid" value="< %=rsAllocatedUnits.getString(1) %>" ></input> -->
			</tr>
		</table>
		</td>
		<td>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%"><font color="maroon"> WMSN No.: </font></td>
				<td><input type="text" name="wmsn" maxlength="15" class="formElement" onBlur="checkprevrecords1('wmsn');" /></td>
			</tr>
		</table>
		</td>
	</tr>
	<% 	sql1="select * from t_utmodule order by module asc ";    
   		rs1=stmt1.executeQuery(sql1);
	%>
	<tr>
		<td>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%"><font color="maroon"> Module Type:</font></td>
				<td><select name="module" class="formElement" onchange="showhideIMEI();">
					<option value="Select">Select</option>
					<% while(rs1.next())
		         		{ 
		         	%>
					<option value="<%=rs1.getString("module") %>"><%=rs1.getString("module") %>
					</option>
					<%       } %>
				</select>
				
				</td>
				<td>
				<label style="visibility: hidden" id="imei" ><font color="maroon"> IMEI No:</font></label><input type="text" style="display: none" name="imeino" maxlength="15" class="formElement" onkeypress="return isNumber(event);" />
				</td>
				<!--<td width="40%"><label style="visibility: hidden" id="imei" class="formElement" ><font color="maroon"> IMEI No:</font></label></td>-->
				<!--<td id="td1"><input type="text" style="display: none" name="imeino" maxlength="15" class="formElement" onkeypress="return isNumber(event);"  onBlur="checkimei();" /></td>-->
				
			</tr>
		</table>
		</td>
		<% 	sql2="select * from t_utgps order by gps asc ";
   			rs2=stmt1.executeQuery(sql2);
		%>
		<td>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%"><font color="maroon"> GPS No.: </font></td>
				<td><select name="gps" class="formElement">
					<option value="Select">Select</option>
					<% while(rs2.next())
	                  { 
	                %>
					<option value="<%=rs2.getString("gps") %>"><%=rs2.getString("gps") %>
					</option>
					<% } %>
				</select></td>
			</tr>
		</table>
		</td>
	</tr>

	<tr>
		<td>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%"><font color="maroon"> SIM No.:</font></td>
 				<td><input type="text" name="sim" maxlength="8"	class="formElement" onBlur="checkprevrecords2('sim');" /></td> 
				
			</tr>
		</table>
		</td>
		<td>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%"><font color="maroon"> Mobile No.:</font><input type="hidden" name="chkmob" value="" ></input></td>
- 				<td><input type="text" name="mob" readonly="readonly" maxlength="10" class="formElement" onBlur="checkprevrecords3('mob');" /></td> 
				
			</tr>
		</table>
		</td>
		
	</tr>
	<tr>
		<td>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%"><font color="maroon"> PS No :</font></td>
				<td><input type="text" name="psno" maxlength="8" class="formElement"  onBlur="checkprevrecords11('PSNo');" /></td>
			</tr>
		</table>
		</td>
		<td>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%"><font color="maroon"> PCB No :</font></td>
				<td><input type="text" name="pcbno" maxlength="10" class="formElement"  onBlur="checkprevrecords12('PCBNo');" /></td>
			</tr>
		</table>
		</td>
		
	</tr>
	<tr>
		<td>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%"><font color="maroon"> Box No:</font></td>
				<td><input type="text" name="boxno" maxlength="8"	class="formElement"  onBlur="checkprevrecords13('BoxNo');" /></td>
			</tr>
		</table>
		</td>
		<td>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%"><font color="maroon"> Battery No:</font></td>
				<td><input type="text" name="batteryno" maxlength="10" class="formElement"  onBlur="checkprevrecords14('BatteryNo');" /></td>
			</tr>
		</table>
		</td>
		
	</tr>
	<% 	sql3="select * from t_typeofunits order by typename asc ";
		rs3=stmt1.executeQuery(sql3);
	%>
	<tr>
		<td>
		<table border="1" width="100%" cellpadding="1" cellspacing="0">
			<tr>
				<td><font color="maroon"> Type of Unit:</font>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
					<select name="typ" id="typ" class="formElement" onchange="showhidedetails();">
					<option value="Select">Select</option>
					<% while(rs3.next())
                    { 
                    %>
					<option value="<%=rs3.getString("typename") %>"><%=rs3.getString("typename")%></option>
					<% 
					} 
					%>
					</select>
				</td>
				<% 	sql5="select * from t_utcodever where valid='Yes' order by codever asc";                    
   					rs5=stmt1.executeQuery(sql5);
				%>
				<td>&nbsp;&nbsp; 
				<font color="maroon"> Software Version:</font>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
				 <select name="swver" class="formElement">
				 <option value="Select">Select</option>
				 <% while(rs5.next())
                    { 
                 %>
					<option value="<%=rs5.getString("codever") %>"><%=rs5.getString("codever") %>
					</option>
				<%  } %>
				</select>
				</td>
			</tr>
			<tr>
				<td><font color="maroon">Correction Done:</font> </td>
				<td><font color="maroon"> Other Corrections Done:</font></td>
			</tr>
			<tr><td width="50%">
				Firmware Changed:
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   			&nbsp;&nbsp;
				<input type="radio" id="FirmwareChanged" name="FirmwareChanged" value="yes">Yes
				<input type="radio" id="FirmwareChanged" name="FirmwareChanged" value="no" checked="checked">No
			</td>
			<td rowspan="7" align="center" valign="top">
   				<select name="correct"  multiple="multiple" size="10" style="width: 100%">
   				<%
					sql4="select * from hw_comment where CommentName='Correction'";
   				    rs4=stmt1.executeQuery(sql4);
					while(rs4.next())
					{
				%>
						<option value="<%=rs4.getString("Comment") %>" > <%=rs4.getString("Comment") %> </option> 
				<%
					}
				%>
   				</select>
   			</td>
			</tr>
			<tr>
			<td >
	   			Module & PCB Changed:
	   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   			<input type="radio" id="ModuleChanged" name="ModuleChanged" value="yes">Yes
	   			<input type="radio" id="ModuleChanged" name="ModuleChanged" value="no" checked="checked">No
   			</td>
   			</tr>
   			<tr>
   			<td >
	   			PCB modification:
	   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" id="pcbmod" name="pcbmod" value="yes">Yes
	   			<input type="radio" id="pcbmod" name="pcbmod" value="no" checked="checked">No
   			</td>
     		</tr>
   			<tr>
   			<td >
	   			Power supply correction or changed:
	   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" id="Power" name="Power" value="yes">Yes
	   			<input type="radio" id="Power" name="Power" value="no" checked="checked">No
   			</td>
   			</tr>
   			<tr>
   			<td >
   			  	GPS mouse correction or changed:
   			   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" id="mousecorrection" name="mousecorrection" value="yes">Yes
   				<input type="radio" id="mousecorrection" name="mousecorrection" value="no" checked="checked">No
   			</td>
   			</tr>
   			<tr>
   			<td>
	   			GSM antenna correction or changed:
	   			&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" id="antennacorrection" name="antennacorrection" value="yes">Yes
	   			<input type="radio" id="antennacorrection" name="antennacorrection" value="no" checked="checked">No
   			</td>
   			</tr>
   			<tr>
   			<td >
	   			Software reloading and sim corrections.
				<input type="radio" id="Softwaresim" name="Softwaresim" value="yes">Yes
	   			<input type="radio" id="Softwaresim" name="Softwaresim" value="no" checked="checked">No
   			</td>
     		</tr>
			</table>
		</td>
		<td valign="top">
		<table border="1" width="100%" style="vertical-align: top;"  cellpadding="1" cellspacing="0">
		<tr>
			<td width="40%" style="border-right: none">
				<font color="maroon">Company:</font>
			</td>
			<td style="border-left: none;">
				<select name="comp" class="formelement">
				<option value="select">Select</option>
				<% 
				String sql98="select distinct(Service_provider) from db_gps.t_simmaster";
				rs98=stmt98.executeQuery(sql98);
				while(rs98.next()){
					%>
					<option value="<%=rs98.getString("Service_provider")%>"><%=rs98.getString("Service_provider") %></option>
					<% 
				}
				%>
				
				<!-- <option value="airtel">Airtel</option>
				<option value="idea">Idea</option>
				<option value="vodafone">Vodafone</option>
				<option value="aircel">Aircel</option>
				<option value="reliance">Reliance</option> -->
				</select>	
			</td>
		</tr>
		<td width="40%" style="border-right: none">
				<font color="maroon">Box Enclosure Type:</font>
			</td>
			<td style="border-left: none;">
				<select name="box" class="formelement">
				<option value="select">Select</option>
				<option value="Metal">Metal</option>
				<option value="Plastic">Plastic</option>
				
				</select>	
			</td>
		<%
		POWER_SUPPLY ="select * from t_powersupply where valid='Yes' order by POWER_SUPPLY  asc";
		rsPOWER_SUPPLY=stmt3.executeQuery(POWER_SUPPLY);
		%>
		<tr>
		<td width="40%" style="border-right: none">
				<font color="maroon">Power Supply:</font>
			</td>
			<td style="border-left: none;">
				<select name="powersupply" class="formelement">
				<option value="select">Select</option>
				<% while(rsPOWER_SUPPLY.next())
				{
				%>
				 <option value<%=rsPOWER_SUPPLY.getString("POWER_SUPPLY") %>><%=rsPOWER_SUPPLY.getString("POWER_SUPPLY")%></option>
				<%
				}
				%>
				
				</select>	
			</td>
		</tr>
		</table>
		<br/><br/><br/>
		<table border="0" >
			<tr>
				<td><font color="maroon"> Peripherals:</font></td>
				<td><input type="checkbox" name="voice" value="Voice"/>Voice</td>
				<td><input type="checkbox" name="jrm" value="JRM+Buzzer"/>JRM+ Buzzer </td>
				<td><input type="checkbox" name="buz" value="BuzzerOnly"/>Buzzer Only</td>
				<td><input type="checkbox" name="smartKey" value="smartKey"/>Smart Key</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="checkbox" name="temp1" value="1Temp"/>1 Temp </td>
				<td><input type="checkbox" name="temp2" value="2Temp"/>2 Temp </td>
				<td><input type="checkbox" name="scard" value="SmartCard"/>Smart Card </td>
				<td><input type="checkbox" name="battery" value="WithBattery">With Battery </td>
			</tr>
			<tr>
				<td></td>
				<td><input type="checkbox" name="door1" value="1Door">1Door </td>
				<td><input type="checkbox" name="door2" value="2Door">2Door </td>
				<td><input type="checkbox" name="horn" value="Horn">Horn	</td>
				<td><input type="checkbox" name="battery950" value="With 950mAh Battery">With 950mAh Battery </td>
			</tr>
			<tr>
				<td></td>
				<td><input type="checkbox" name="flow1" value="1FlowSensor">1 Flow Sensor </td>
				<td><input type="checkbox" name="flow2" value="2FlowSensor">2 Flow Sensor </td>
				<td><input type="checkbox" name="plain" value="plain">Plain</td>
				<td><input type="checkbox" name="battery1800" value="With 1800mAh Battery">With 1800mAh Battery </td>
			</tr>
			<tr>
				<td></td>
				<td><input type="checkbox" name="battery1050" value="With 1050mAh Battery">With 1050mAh Battery </td>
				<td><input type="checkbox" name="Camera" value="With Camera">With Camera</td>
				<td><input type="checkbox" name="PlainDualCamera" value="Plain Dual Camera">Plain+DualCamera</td>
			   <td><input type="checkbox" name="SmartGrid" value="SMARTGRID">SmartGrid</td>
			
			</tr>
			
			<tr>
				<td></td>
				
			   <td><input type="checkbox" name="PanikKey" value="PANICKEY">PanicKey</td>
			
			</tr>
			
		</table>
		</td>
	</tr>
	
	<tr>
	<td>
<table border="0">
<tr id="sim0" style="display: none;">
<td>Router:</td><td><input type="text" id="Router_id" name="Router_id" onblur="ajaxrouter();"></td>
</tr>
<tr id="sim1" style="display: none;">
<td>NUC:</td><td><input type="text" id="NUC_id" name="NUC_id"  onblur="ajaxnuc();"></td>
</tr>

<tr id="sim2" style="display: none;">
<td>Dongle:</td><td><input type="text" id="Dongle_id" name="Dongle_id" onblur="ajaxdongle();"></td>
</tr>

<tr id="sim3" style="display: none;">
<td>Camera 1:</td><td><input type="text" id="camera1" name="camera1" onblur="camera1();" ></td>
</tr>
<tr id="sim4" style="display: none;">
<td>Camera 2:</td><td><input type="text" id="camera2"  name="camera2" onblur="camera2();" ></td>
</tr>

<tr id="sim6" style="display: none;">
<td>Camera 3:</td><td><input type="text" id="camera3" name="camera3" onblur="camera3();" ></td>
</tr>
<tr id="sim7" style="display: none;">
<td>Camera 4:</td><td><input type="text" id="camera4"  name="camera4" onblur="camera4();" ></td>
</tr>


<tr id="sim5" style="display: none;">
<td>LED:</td><td><input type="text" id="LED"  name="LED" onblur="LED();" ></td>
</tr>

</table>
</td>
<td>
<table border="0">
<tr id="sim0" style="display: none;">
<td></td><td></td>
</tr>
<tr id="sim1" style="display: none;">
<td></td><td></td>
</tr>

<tr id="sim2" style="display: none;">
<td></td><td></td>
</tr>

<tr id="sim3" style="display: none;">
<td></td><td
></td>
</tr>
<tr id="sim4" style="display: none;">
<td></td><td></td>
</tr>

<tr id="sim6" style="display: none;">
<td></td><td
></td>
</tr>
<tr id="sim7" style="display: none;">
<td></td><td></td>
</tr>


<tr id="sim5" style="display: none;">
<td></td><td></td>
</tr>


</table>
</td>
</tr>

	<tr>
		<td colspan="2">
		
		
			<div align="center"><input type="submit" name="submit" value="Submit" class="formElement" /></div>
		
		</td>
	</tr>
</table>
<!-- <img id="bottom" src="images/bottom.png" width="85%" alt=""> -->
</center>

<% 

} catch(Exception e) 
{ 
	out.println("Exception----->"+e); 
}

finally
{
try {
	if(rs1!=null)
		rs1.close();
	if(rs2!=null)
		rs2.close();
	if(rs3!=null)
		rs3.close();
	if(rs4!=null)
		rs4.close();
	if(rs5!=null)
		rs5.close();
	if(stmt1!=null)
		stmt1.close();
	if(con1!=null)
		con1.close();
} catch (SQLException e) {

	e.printStackTrace();
}
}
%> <br>
<br>
<table border="1" width="100%">
	<tr>
		<td bgcolor="white" class="copyright" width="100%">
		<center>Copyright &copy; 2008 by Transworld Compressor
		Technologies Ltd. All Rights Reserved.</center>
		</td>
	</tr>
</table>

</form>
</body>
</html>