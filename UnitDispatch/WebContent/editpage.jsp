<html>
<head>
<%@ include file="menuheader.jsp" %> 
<script language="javascript">
var commentbox="false";

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
  var v1=document.editunitsform.unitid.value;
  var v2=document.editunitsform.wmsn.value;
  var v3=document.editunitsform.module.value;
  var v4=document.editunitsform.gps.value;
  var v5=document.editunitsform.sim.value;
  var v6=document.editunitsform.mob.value; 
  var v7=document.editunitsform.typ.value;  
  var v8=document.editunitsform.swver.value; 
  var v9=document.editunitsform.comp.value; 
  
  var v10=document.editunitsform.correct.value;
  var v11=document.editunitsform.box.value;  
  var v16=document.editunitsform.powersupply.value;  
 // var v12=document.editunitsform.psno.value; 
 // alert("v12"+v12.length);
 // var v13=document.editunitsform.pcbno.value; 
 // var v14=document.editunitsform.boxno.value; 
 // var v15=document.editunitsform.batteryno.value;
  v6= v6.replace(/^\s+|\s+$/g,"");
  if(v1.length==0)
   {
     alert("Please enter Unit ID");
     return false;
   }
    if(isNaN(v1))
   {
     alert("Enter valid unit no");
     return false;
   } 

   if(v2.length==0)
   {
     alert("Please enter WMSN No");
     return false;
   }
   if(isNaN(v2))
   {
     alert("Please enter valid WMSN No");
     return false;
   } 
    if(v2.length<15 || v2.length>15)
   {
     alert("Please enter valid WMSN No");
     return false;
   }

    if(v3=="Select")
  {
     alert("Please select the Module no from the List");
     return false;
  }  

     if(v4=="Select")
  {
     alert("Please select the GPS no from the List");
     return false;
  }  

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
    if(v5.length<8 || v5.length>8)
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
   if(v6.length<10 || v6.length>10)
   {
     alert("Please enter Ten Digit Mobile No");
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


  if(document.editunitsform.voice.checked == false && document.editunitsform.jrm.checked == false && document.editunitsform.buz.checked == false && document.editunitsform.temp1.checked == false && document.editunitsform.temp2.checked == false && document.editunitsform.door1.checked == false && document.editunitsform.door2.checked == false && document.editunitsform.horn.checked == false && document.editunitsform.scard.checked == false && document.editunitsform.flow1.checked == false && document.editunitsform.flow2.checked == false && document.editunitsform.plain.checked == false )
  {
    alert("Please select at least one option from the Peripherals");
    return false;
  }
  if(v9=="select")
  {
     alert("Please select a company name from the List");
     return false;
  }
  if(v10.length=="")
	{ 
		
      	alert("Please select OtherCorrection Done from the list");
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
  
  if(commentbox=="true")
  {
	var commentchange=document.editunitsform.commentchange.value;
	if(commentchange=="" || commentchange.length<1)	
	{
		alert("Please enter Comment for changing Status");
		return false;
	}
  }	
//  if(v12.length==0){
//		 alert("Please enter PS No");
//	     return false;
//	}
//	if(v13.length==0){
//		 alert("Please enter PCB No");
//	     return false;
//	}
//	if(v14.length==0){
//		 alert("Please enter Box No");
//	     return false;
//	}
//	if(v15.length==0){
//		 alert("Please enter Battery No");
//	     return false;
//	}
  
   return true;

}  
/*function edittxtbox()
{
	if(document.editunitsform.chkmob.checked==true)
		document.editunitsform.mob.readOnly=false;
	else
		document.editunitsform.mob.readOnly=true;	
}
*/

function NewRepSwap()
{
	
	document.getElementById("statchange").style.display="";
	commentbox="true";
}
function NewRepSwap1()
{
	document.getElementById("statchange").style.display='none';
	document.editunitsform.commentchange.value="";
	commentbox="false";
}

function ShowStillChangeNewRep()
{
	document.getElementById("stillwanttochange").style.display=""; 	
}

    function checkprevrecords(param)
{ 
   //alert(param);
   var count=(document.editunitsform.unitid.value).length+1;
	
    var unitid=document.editunitsform.unitid.value;
    var unitid2=document.editunitsform.unitidhid.value;
    
    
    
    var wmsn=document.editunitsform.wmsn.value;
   var sim=document.editunitsform.sim.value;
    var mob=document.editunitsform.mob.value;				
    var psno=document.editunitsform.psno.value;
    var pcbno=document.editunitsform.pcbno.value;
    var boxno=document.editunitsform.boxno.value;
    var batteryno=document.editunitsform.batteryno.value;
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
			   
                    var statcheck3 =document.getElementById("statchk3").value;          
                    //alert("statcheck3"+statcheck3);
                    var statcheck = document.editunitsform.statchk.value;
                    // alert("statcheck"+statcheck);
                    var statcheck1 = document.getElementById("statchk1").value;
                    // alert("statcheck1"+statcheck1);
                    var statcheck2 = document.getElementById("statchk2").value;
                    // alert("statcheck2"+statcheck2);
           
                           if(statcheck3=="Yes")
                            {
                                document.editunitsform.statchk.value="No";
                            }
                            
			  if(statcheck=="Yes")
 			  {
				//alert("hi");
				document.editunitsform.unitid.value=unitid2;
                                
				document.editunitsform.statchk.value="No";
                          } 
                          else
                              {
                               
                            //alert(statcheck1);                          
                          
                             // alert("hi1edit");
				document.editunitsform.unitid.value=unitid2;
			        //document.editunitsform.statchk.value="No";   
                              }
                              
                            if(statcheck1=="Yes")
                            {
				//alert("hi2");
				 document.mainpageform.unitid.value=unitid2;
				document.getElementById("statchk1").value="NO";
                            }     

                            
                            if(statcheck2=="Yes")
                            {
				//alert("hi2");
				//document.getElementById("unitid").value="";
                                document.mainpageform.unitid.value=unitid2;
                                document.getElementById("statchk2").value="NO";
                              
                            } 
                                                    
		     } 
         	  }
              var queryString = "?param=" +param+"&unitid="+unitid+"&wmsn="+wmsn+"&sim="+sim+"&mob="+mob+"&PSNo="+psno+"&PCBNo="+pcbno+"&BoxNo="+boxno+"&BatteryNo="+batteryno;
	     ajaxRequest.open("GET", "ajaxchkeditdet.jsp" + queryString, true);
	     ajaxRequest.send(null);  
	     getPreviousRecord();
}

function  getPreviousRecord() {
	var vv1=document.editunitsform.unitid.value

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

	        //  document.getElementById("mydiv").innerHTML="<select name='vehreg' id='vehreg' > " ;
	                   // Create a function that will receive data sent from the server
	            	   ajaxRequest.onreadystatechange = function()
	                     {
	     	 	   if(ajaxRequest.readyState ==4)
	                        {
	                           	var reslt=ajaxRequest.responseText;
	                         	//alert(reslt);
	  				var reslt=ajaxRequest.responseText;
	                           	var mySplitResult = reslt.split("#");

	                            document.getElementById('cpwmsnno').innerHTML = mySplitResult[0];
	                            document.getElementById('cpsimno').innerHTML = mySplitResult[1];
	                            document.getElementById('cpmobno').innerHTML = mySplitResult[2];
	                            document.getElementById('cppsno').innerHTML = mySplitResult[3];
	                            document.getElementById('cppcbno').innerHTML = mySplitResult[4];
	                            document.getElementById('cpboxno').innerHTML = mySplitResult[5];
	                            document.getElementById('cpbatteryno').innerHTML = mySplitResult[6];
					//document.mainform.dterec.value = mySplitResult[6];
	                                 //alert(mySplitResult[8]);
			      } 
	     	 	   
	         	   }
	               var queryString = "?unid=" +vv1;
	 	      ajaxRequest.open("GET", "AjaxgetPreviousData.jsp" + queryString, true);
		     ajaxRequest.send(null); 
}
    
function checkprevrecords1(param)
{ 
   var count=(document.editunitsform.unitid.value).length+1;
	
    var unitid=document.editunitsform.unitid.value;
    var wmsn=document.editunitsform.wmsn.value;
     var wmsn2=document.editunitsform.wmsnhid.value;
   var sim=document.editunitsform.sim.value;
    var mob=document.editunitsform.mob.value;					
    var psno=document.editunitsform.psno.value;
    var pcbno=document.editunitsform.pcbno.value;
    var boxno=document.editunitsform.boxno.value;
    var batteryno=document.editunitsform.batteryno.value;
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
		  var wmsncheck = document.editunitsform.wmsnchk.value;
                      
			  if(wmsncheck=="Yes")
 			  {
				//alert("hi");
				document.editunitsform.wmsn.value=wmsn2;
				document.editunitsform.wmsnchk.value="No";
                          }                                            
                         
		     } 
         	  }
              var queryString = "?param=" +param+"&unitid="+unitid+"&wmsn="+wmsn+"&sim="+sim+"&mob="+mob+"&PSNo="+psno+"&PCBNo="+pcbno+"&BoxNo="+boxno+"&BatteryNo="+batteryno;
	     ajaxRequest.open("GET", "ajaxchkeditdet.jsp" + queryString, true);
	     ajaxRequest.send(null);  
   
}
function checkprevrecords11(param)
{ 
   var count=(document.editunitsform.unitid.value).length+1;
	//alert(param)
    var unitid=document.editunitsform.unitid.value;
    var wmsn=document.editunitsform.wmsn.value;
     var psno2=document.editunitsform.psnohid.value;
   var sim=document.editunitsform.sim.value;
    var mob=document.editunitsform.mob.value;					
    var psno=document.editunitsform.psno.value;
    var pcbno=document.editunitsform.pcbno.value;
    var boxno=document.editunitsform.boxno.value;
    var batteryno=document.editunitsform.batteryno.value;
    var modul = document.editunitsform.module.value;
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
			
			   document.getElementById("psnodets").innerHTML=reslt;
		  var psnocheck = document.editunitsform.psnochk.value;
                      
			  if(psnocheck=="Yes")
 			  {
				//alert("hi");
				document.editunitsform.psno.value=psno2;
				document.editunitsform.psnochk.value="No";
                          }                                            
                         
		     } 
         	  }
              var queryString = "?param=" +param+"&unitid="+unitid+"&wmsn="+wmsn+"&sim="+sim+"&mob="+mob+"&PSNo="+psno+"&PCBNo="+pcbno+"&BoxNo="+boxno+"&BatteryNo="+batteryno+"&module="+modul;
	     ajaxRequest.open("GET", "ajaxchkeditdet.jsp" + queryString, true);
	     ajaxRequest.send(null);  
   
}
function checkprevrecords12(param)
{ 
   var count=(document.editunitsform.unitid.value).length+1;
	
    var unitid=document.editunitsform.unitid.value;
    var wmsn=document.editunitsform.wmsn.value;
     var pcbno2=document.editunitsform.pcbnohid.value;
   var sim=document.editunitsform.sim.value;
    var mob=document.editunitsform.mob.value;					
    var psno=document.editunitsform.psno.value;
    var pcbno=document.editunitsform.pcbno.value;
    var boxno=document.editunitsform.boxno.value;
    var batteryno=document.editunitsform.batteryno.value;
    var modul = document.editunitsform.module.value;
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
		  var pcbnocheck = document.editunitsform.pcbnochk.value;
                      
			  if(pcbnocheck=="Yes")
 			  {
				//alert("hi");
				document.editunitsform.pcbno.value=pcbno2;
				document.editunitsform.pcbnochk.value="No";
                          }                                            
                         
		     } 
         	  }
              var queryString = "?param=" +param+"&unitid="+unitid+"&wmsn="+wmsn+"&sim="+sim+"&mob="+mob+"&PSNo="+psno+"&PCBNo="+pcbno+"&BoxNo="+boxno+"&BatteryNo="+batteryno+"&module="+modul;
	     ajaxRequest.open("GET", "ajaxchkeditdet.jsp" + queryString, true);
	     ajaxRequest.send(null);  
   
}
function checkprevrecords13(param)
{ 
    var count=(document.editunitsform.unitid.value).length+1;
    var unitid=document.editunitsform.unitid.value;
    var wmsn=document.editunitsform.wmsn.value;
    var boxno2=document.editunitsform.boxnohid.value;
    var sim=document.editunitsform.sim.value;
    var mob=document.editunitsform.mob.value;					
    var psno=document.editunitsform.psno.value;
    var pcbno=document.editunitsform.pcbno.value;
    var boxno=document.editunitsform.boxno.value;
    var batteryno=document.editunitsform.batteryno.value;
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
		  var boxnocheck = document.editunitsform.boxnochk.value;
                      
			  if(boxnocheck=="Yes")
 			  {
				//alert("hi");
				document.editunitsform.boxno.value=boxno2;
				document.editunitsform.boxnochk.value="No";
                          }                                            
                         
		     } 
         	  }
              var queryString = "?param=" +param+"&unitid="+unitid+"&wmsn="+wmsn+"&sim="+sim+"&mob="+mob+"&PSNo="+psno+"&PCBNo="+pcbno+"&BoxNo="+boxno+"&BatteryNo="+batteryno;
	     ajaxRequest.open("GET", "ajaxchkeditdet.jsp" + queryString, true);
	     ajaxRequest.send(null);  
   
}
function checkprevrecords14(param)
{ 
   var count=(document.editunitsform.unitid.value).length+1;
	
    var unitid=document.editunitsform.unitid.value;
    var wmsn=document.editunitsform.wmsn.value;
     var batteryno2=document.editunitsform.batterynohid.value;
   var sim=document.editunitsform.sim.value;
    var mob=document.editunitsform.mob.value;					
    var psno=document.editunitsform.psno.value;
    var pcbno=document.editunitsform.pcbno.value;
    var boxno=document.editunitsform.boxno.value;
    var batteryno=document.editunitsform.batteryno.value;
    var modul = document.editunitsform.module.value;
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
		  var batterynocheck = document.editunitsform.batterynochk.value;
                      
			  if(batterynocheck=="Yes")
 			  {
				//alert("hi");
				document.editunitsform.batteryno.value=batteryno2;
				document.editunitsform.batterynochk.value="No";
                          }                                            
                         
		     } 
         	  }
              var queryString = "?param=" +param+"&unitid="+unitid+"&wmsn="+wmsn+"&sim="+sim+"&mob="+mob+"&PSNo="+psno+"&PCBNo="+pcbno+"&BoxNo="+boxno+"&BatteryNo="+batteryno+"&module="+modul;
	     ajaxRequest.open("GET", "ajaxchkeditdet.jsp" + queryString, true);
	     ajaxRequest.send(null);  
   
}
function checkprevrecords2(param)
{ 
   var count=(document.editunitsform.unitid.value).length+1;
	
    var unitid=document.editunitsform.unitid.value;
    var wmsn=document.editunitsform.wmsn.value;
    var sim=document.editunitsform.sim.value;
    var sim2=document.editunitsform.simhid.value;
    var mob=document.editunitsform.mob.value;				
    var psno=document.editunitsform.psno.value;
    var pcbno=document.editunitsform.pcbno.value;
    var boxno=document.editunitsform.boxno.value;
    var batteryno=document.editunitsform.batteryno.value;
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
			
			   document.getElementById("simdets").innerHTML=reslt;
		  var simcheck = document.editunitsform.simchk.value;	                         
			  if(simcheck=="Yes")
 			  {
				//alert("hi");
				document.editunitsform.sim.value=sim2;
				document.editunitsform.simchk.value="No";
                }
			 /* else if(simcheck=="notgot")
			  {
				  document.editunitsform.mob.value	="";
			  }
			  else if(!(simcheck=="Yes") && !((simcheck=="notgot")))    
              {
				  document.editunitsform.mob.value=simcheck;
				  document.editunitsform.mobhid.value=simcheck;					
                  }   */                                           
                         
		     } 
         	  }
             var queryString = "?param=" +param+"&unitid="+unitid+"&wmsn="+wmsn+"&sim="+sim+"&mob="+mob+"&PSNo="+psno+"&PCBNo="+pcbno+"&BoxNo="+boxno+"&BatteryNo="+batteryno;
	     ajaxRequest.open("GET", "ajaxchkeditdet.jsp" + queryString, true);
	     ajaxRequest.send(null);  
   
}

function checkprevrecords3(param)
{ 
   var count=(document.editunitsform.unitid.value).length+1;
	
    var unitid=document.editunitsform.unitid.value;
    var wmsn=document.editunitsform.wmsn.value;
    var sim=document.editunitsform.sim.value;
    var mob=document.editunitsform.mob.value;				
     var mob2=document.editunitsform.mobhid.value;
     var psno=document.editunitsform.psno.value;
     var pcbno=document.editunitsform.pcbno.value;
     var boxno=document.editunitsform.boxno.value;
     var batteryno=document.editunitsform.batteryno.value;
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
			
			   document.getElementById("mobdets").innerHTML=reslt;
		  var mobcheck = document.editunitsform.mobchk.value;	                         
			  if(mobcheck=="Yes")
 			  {
				document.editunitsform.mob.value=mob2;
                                document.editunitsform.mobchk.value="No";
                          }                                            
			  else if(mobcheck=="notgot")
              {
	              var mobvalue = document.editunitsform.mobvalue.value;
				
               	 var ans=confirm("The Sim No you entered has Mobile No: "+mobvalue+" in database.Please confirm it. Else if you are sure press OK.");
            	  if(ans==true) 
              		{
          	        document.editunitsform.chkmob.value="verified";
          	        }
                  else
                	  document.editunitsform.chkmob.value="-";
              	document.editunitsform.mobchk.value="";
                  var ok= document.editunitsform.chkmob.value;
                  // alert("ok"+ok);
              }   
			  else if(mobcheck=="got")
			  {
				  document.editunitsform.chkmob.value="verified";
					document.editunitsform.mobchk.value="";
				  var ok= document.editunitsform.chkmob.value;
                 // alert("ok"+ok);
			  }       
		     } 
         	  }
             var queryString = "?param=" +param+"&unitid="+unitid+"&wmsn="+wmsn+"&sim="+sim+"&mob="+mob+"&PSNo="+psno+"&PCBNo="+pcbno+"&BoxNo="+boxno+"&BatteryNo="+batteryno;
	     ajaxRequest.open("GET", "ajaxchkeditdet.jsp" + queryString, true);
	     ajaxRequest.send(null);  
   
}

function copy(type)
{
	if(type == 'msn')
	{
		document.getElementById('wmsn').value = document.getElementById("cpwmsnno").innerHTML;
	}
	else if(type == 'sim')
	{
		document.getElementById('sim').value = document.getElementById("cpsimno").innerHTML;
	}
	else if(type == 'mob')
	{
		document.getElementById('mob').value = document.getElementById("cpmobno").innerHTML;
	}
	else if(type == 'ps')
	{
		document.getElementById('psno').value = document.getElementById("cppsno").innerHTML;
	}
	else if(type == 'pcb')
	{
		document.getElementById('pcbno').value = document.getElementById("cppcbno").innerHTML;
	}
	else if(type == 'box')
	{
		document.getElementById('boxno').value = document.getElementById("cpboxno").innerHTML;
	}
	else if(type == 'battery')
	{
		document.getElementById('batteryno').value= document.getElementById("cpbatteryno").innerHTML;
	}
}

</script>

<form name="editunitsform" action="update.jsp" onsubmit="return validate();">

<table border="0" width="100%">
  <tr>
      <td> <div align="left"> <a href="testedunits.jsp"> <img src="images/home-icon.jpg" width="40px" height="40px" border="0"/> </a> </div> </td>
       <!--<input type="radio" -->  
  </tr>
</table>
<%
 String unid1=request.getParameter("unid");
 
 String user1=session.getAttribute("user").toString();
 
 String ustyp=session.getAttribute("urole").toString();


%>
<input type="hidden" name="oldunid" value="<%=unid1 %>" />
<%!
Connection con1, con2;
%>

<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con1.createStatement(), stmt2 = con2.createStatement(), stmt3 = con2.createStatement();
ResultSet rs1=null, rs2=null, rs3=null, rs4=null, rs5=null,rsPOWER_SUPPLY=null;
String sql1="", sql2="", sql3="", sql4="", sql5="",POWER_SUPPLY="";

String uniddb="", wmsndb="", simdb="", mobiledb="",boxtype="", pvoicedb="", pjrmbuzzdb="", pbuzzdb="", ptemp1db="", ptemp2db="", pdoor1db="", pdoor2db="", phorndb="", phrndb="", pscarddb="", pflowsen1db="",peripherals="", pflowsen2db="", pplaindb="", unittype="", modtype="", gpsno="", swver="", insttype="",powersupply="";
String PSNo="",PCBNo="",BoxNo="",BatteryNo="";

String correct=null,FirmwareChanged=null, ModuleChanged=null, pcbmod=null,Power=null,mousecorrection=null,antennacorrection=null,Softwaresim=null,company=null;
ArrayList<String> othcorr= new ArrayList<String>();
Iterator itr  = othcorr.iterator();
String user=session.getAttribute("user").toString();

java.util.Date d=new java.util.Date();
String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();
String tme= "" + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();

java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   String nwfrmtdte=formatter.format(datefrmdb);

%>

<% String unid=request.getParameter("un");
//out.print(unid);
   String simm=request.getParameter("sim"); 
   String mobb=request.getParameter("mob");
   String wms=request.getParameter("wms");
   String unitwarranty=request.getParameter("warranty");


   if(unid==null)
   {
      
   }
   else
   { %>
        <table border="0" width="100%">
          <tr>
              <td> <div align="center"> <font color="maroon"><B> Already Configured. Details are as UnitId=<%=unid %>; SIM=<%=simm %>; Mobile=<%=mobb %>; WMSN=<%=wms %> </B></font> </div></td>
          </tr>
        </table>
<% } %>
<center> 
<table border="0" width="80%">
  <tr>
     <td> <div align="center"> <font color="maroon" size="3"> <B> Edit Manufacturing Detail </B></font> </div> </td>
  </tr>
</table>

<%
/* ************Getting all the specification about this Unit************* */
  sql4="select * from t_unitmaster where UnitID='"+unid1+"' ";
  //out.println(sql4);
  rs4=stmt2.executeQuery(sql4);
  if(rs4.next())
  {
    uniddb=rs4.getString("UnitID");
    wmsndb=rs4.getString("WMSN");
    simdb=rs4.getString("SimNo");
    mobiledb=rs4.getString("MobNo").trim();
    pvoicedb=rs4.getString("PVoice");
    pjrmbuzzdb=rs4.getString("PJrmBuzz");
    pbuzzdb=rs4.getString("PBuzzer");
    ptemp1db=rs4.getString("PTemp1");
    ptemp2db=rs4.getString("PTemp2");
    pdoor1db=rs4.getString("PDoor1");
    pdoor2db=rs4.getString("PDoor2");
    phrndb=rs4.getString("PHorn");
    pscarddb=rs4.getString("PScard");
    pflowsen1db=rs4.getString("PFlowSen1");
    pflowsen2db=rs4.getString("PFlowSen2");
    pplaindb=rs4.getString("Plain");
    peripherals=rs4.getString("Peripherals");

   unittype=rs4.getString("typeunit");
   modtype=rs4.getString("Module");	
   gpsno=rs4.getString("GPS");	
   swver=rs4.getString("SwVer");
   insttype=rs4.getString("insttype");	

   	FirmwareChanged=rs4.getString("FirmwareChanged");
    ModuleChanged=rs4.getString("ModulePCBChanged");
    pcbmod=rs4.getString("PCBmodification");
    Power=rs4.getString("PowerSupplyChanged");
    mousecorrection=rs4.getString("GPSMouseChanged");
    antennacorrection=rs4.getString("GSMAntennaChanged");
    Softwaresim=rs4.getString("SoftwareSimCorrections");
    company=rs4.getString("SimCompany");
   	correct=rs4.getString("OtherCorrections");
   	PSNo=rs4.getString("PSNo");
   	PCBNo=rs4.getString("PCBNo");
   	BoxNo=rs4.getString("BoxNo");
   	BatteryNo=rs4.getString("BatteryNo");
   	boxtype=rs4.getString("Box_type");
   	powersupply=rs4.getString("Power_Supply");
  }


 StringTokenizer strk= new StringTokenizer(correct,","); 
 while(strk.hasMoreTokens())
 {
String temp=strk.nextToken();
othcorr.add(new String (temp.trim()));

 }
  
  if(modtype==null)
  {
	modtype="-";
  } 
  if(gpsno==null)	
  {
       gpsno="-";
  }
  if(unittype==null) 
  {
	unittype="-";
  }
   if(swver==null)
   {
	swver="-";	
   }
/* ************************************************************************** */
%>
<center>
<div id="unitdets">
</div>

<div id="wmsndets">
</div>

<div id="simdets">
</div>

<div id="mobdets">
</div>
<div id="psnodets">
</div>
<div id="pcbnodets">
</div>
<div id="boxnodets">
</div>
<div id="batterynodets">
</div>
<!-- Specifications of this particular unit will be already selected/filled in this form-->
<table border="1" width="80%">
  <tr>
       <td width="50%">  <font color="maroon"> Unit Id: </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="unitid" class="formElement" value="<%=uniddb %>" onBlur="checkprevrecords('unit');"/>
       </td><input type="hidden" name="unitidhid" value="<%=uniddb %>" />
       <td> <font color="maroon"> WMSN No.: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
         
           <input type="text" name="wmsn" id="wmsn"class="formElement" maxlength="15" value="<%=wmsndb %>"  onBlur="checkprevrecords1('wmsn');"  />
           <div align="left"><a href="#" onclick="copy('msn')";><B>Previous
				Record - </B></a></div>
				<div align="left"><label id="cpwmsnno" style="color: blue">
				</label></div>
       </td><input type="hidden" name="wmsnhid" value="<%=wmsndb %>" />
  </tr>
<% sql1="select * from t_utmodule order by module asc ";    
   rs1=stmt1.executeQuery(sql1);
%>
   <tr>
       <td> <font color="maroon"> Module Type:</font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <select name="module" class="formElement"> <option value="Select"> Select </option>
     <% while(rs1.next())
         { 
             String modtype1=rs1.getString("module");
     %>
              <option value="<%=rs1.getString("module") %>" <% if(modtype.equals(modtype1)) {  %> Selected <% } %>> <%=rs1.getString("module") %> </option>
<%       } %>
        </select>
       </td>
<% sql2="select * from t_utgps order by gps asc ";
   rs2=stmt1.executeQuery(sql2);
%> 
       <td> <font color="maroon"> GPS No.: </font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;
             <select name="gps" class="formElement"> <option value="Select"> Select </option>
           <% while(rs2.next())
                   { 
            		String gpsno1=rs2.getString("gps");
           %>
                      <option value="<%=rs2.getString("gps") %>" <% if(gpsno.equals(gpsno1)) {  %> Selected <% } %> > <%=rs2.getString("gps") %> </option>
                <% } %>
</select>
       </td>
  </tr>

  <tr>
       <td> <font color="maroon"> SIM No.:</font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="sim" id="sim" class="formElement" maxlength="8" value="<%=simdb %>" onBlur="checkprevrecords2('sim');" />
<div align="left"><a href="#" onclick="copy('sim')";><B>Previous
				Record - </B></a></div>
				<div align="left"><label id="cpsimno" style="color: blue"></label></div>
       </td><input type="hidden" name="simhid" value="<%=simdb %>" />
       <td> <font color="maroon"> Mobile No.:</font><input type="hidden" name="chkmob" value=""></input>
             <input type="text" name="mob"  id="mob" maxlength="10" class="formElement" value="<%=mobiledb %>" onBlur="checkprevrecords3('mob');"  />
                <div align="left"><a href="#" onclick="copy('mob')";><B>Previous
				Record - </B></a></div>
				<div align="left"><label id="cpmobno" style="color: blue"></label></div>
       </td><input type="hidden" name="mobhid" value="<%=mobiledb %>" />
  </tr>
<tr>
		<td>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%"><font color="maroon"> PS No :</font></td>
				<td><input type="text" name="psno" id="psno" maxlength="8" class="formElement"  onBlur="checkprevrecords11('PSNo');" value="<%=PSNo%>"/>
				<div align="left"><a href="#" onclick="copy('ps')";><B>Previous
				Record - </B></a></div>
				<div align="left"><label id="cppsno" style="color: blue"></label></div>
				</td></td>
			<input type="hidden" name="psnohid" value="<%=PSNo%>" />
			</tr>
		</table>
		</td>
		<td>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%"><font color="maroon"> PCB No :</font></td>
				<td><input type="text" name="pcbno" id="pcbno" maxlength="10" class="formElement"  onBlur="checkprevrecords12('PCBNo');"  value="<%=PCBNo%>"/><div align="left"><a href="#" onclick="copy('pcb')";><B>Previous
				Record - </B></a></div>
				<div align="left"><label id="cppcbno" style="color: blue"></label></div></td>
				<input type="hidden" name="pcbnohid" value="<%=PCBNo%>" />
			</tr>
		</table>
		</td>
		
	</tr>
	<tr>
		<td>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%"><font color="maroon"> Box No:</font></td>
				<td><input type="text" name="boxno" id="boxno" maxlength="8"	class="formElement"  onBlur="checkprevrecords13('BoxNo');" value="<%=BoxNo%>" /><div align="left"><a href="#" onclick="copy('box')";><B>Previous
				Record - </B></a></div>
				<div align="left"><label id="cpboxno" style="color: blue"></label></div></td>
			<input type="hidden" name="boxnohid" value="<%=BoxNo%>" />
			</tr>
		</table>
		</td>
		<td>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%"><font color="maroon"> Battery No:</font></td>
				<td><input type="text" name="batteryno"  id="batteryno" maxlength="10" class="formElement"  onBlur="checkprevrecords14('BatteryNo');" value="<%=BatteryNo%>" /><div align="left"><a href="#" onclick="copy('battery')";><B>Previous
				Record - </B></a></div>
				<div align="left"><label id="cpbatteryno" style="color: blue"></label></div></td>
			<input type="hidden" name="batterynohid" value="<%=BatteryNo%>" />
			</tr>
			
		</table>
		</td>
		
	</tr>
  <tr>
       <td>
            <table border="1" width="100%">
             <tr> 

<% sql5="select * from t_utcodever where valid='yes' order by codever asc";                    
   rs5=stmt1.executeQuery(sql5);
%>
               <td>  
                    <font color="maroon"> Software Version:</font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;  
                    <select name="swver" class="formElement"> <option value="Select"> Select </option>
                    <% while(rs5.next())
                       { 
				String swver1=rs5.getString("codever"); 
			%>
                            <option value="<%=rs5.getString("codever") %>" <% if(swver.equals(swver1)) {  %> Selected <% } %> > <%=rs5.getString("codever") %> </option>
                    <% } %> 
                    </select> 
               </td>
               <% sql3="select * from t_typeofunits order by Typename asc";
rs3=stmt1.executeQuery(sql3);
%>
                              <td>
                <font color="maroon"> Type of Unit:</font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp; 
                <select name="typ" class="formElement"> <option value="Select"> Select </option>
               <% while(rs3.next())
              {
		  String unittype1=rs3.getString("typename");
			//out.print(unittype1);
		 %>
                   <option value="<%=rs3.getString("typename") %>" <% if(unittype.equals(unittype1)) {  %> Selected <% } %> > <%=rs3.getString("typename") %> </option> 
           <% } %>
               </select>
                
               </td>
             </tr>
	     <tr> 
		    <%  //out.print(ustyp); 
			if(ustyp.equals("administrator")) 
			{ 
			  
			   if(unitwarranty.equals("NA") &&  insttype.equals("Repaired"))	
			   {	
				if(insttype.equals("New"))
				{
%>
				 	<td colspan="2"> <div align="center"> <font color="maroon"> Unit is: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="newrep" value="New" class="formElement" onChange="NewRepSwap1();" checked><font color="maroon"> New </font> </input> 
				 	<input type="radio" name="newrep" value="Repaired" class="formElement" onChange="NewRepSwap();"> <font color="maroon" >Repaired </font></input>
				          </div> </td>
<%				}
				else
				{ %>
					<td colspan="2"> <div align="center"> <font color="maroon"> Unit is: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="newrep" value="New" class="formElement" onChange="NewRepSwap();"><font color="maroon"> New </font> </input> &nbsp;&nbsp;&nbsp;
				 	<input type="radio" name="newrep" value="Repaired" class="formElement"  onChange="NewRepSwap1();" checked> <font color="maroon">Repaired </font> </input>
				         </div> </td>
<%				} 
			  }

			  else
			  { %>
					<td colspan="2"> <div align="center"> <font color="red" >You cannot Edit New/Repaired Status because:
<B> 1. </B> The Unit is not in Warranty OR
<B> 2. </B> The Unit is in Field OR
<B> 3. </B> The Unit is not in Field and is New
</font>  <BR>
	<B> If you still want to change its Type, <a href="#" onClick="ShowStillChangeNewRep();"> Click here </a> </B>
<div id="stillwanttochange" style="display:none">
<BR>
		<div align="center"> <font color="maroon"> Unit is: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="newrep" value="New" class="formElement" onChange="NewRepSwap();" checked><font color="maroon"> New </font> </input> &nbsp;&nbsp;&nbsp;
	 	<input type="radio" name="newrep" value="Repaired" class="formElement"  onChange="NewRepSwap();" > <font color="maroon">Repaired </font> </input>
	         </div>
</div>
</div> </td>
		 <%       }
                        } //close of outer IF
   		 %>		
		
             </tr>
	    
		<tr id="statchange" style="display:none">
			<td colspan="2"> <div align="center"> <label for="statch" name="statch" id="statch" > <font color="maroon">Comment for changing Status</font></label>
    <textarea name="commentchange" class="formElement"> </textarea> </div></td>
		</tr>
	     	<tr>
				<td><font color="maroon">Correction Done:</font> </td>
				<td><font color="maroon"> Other Corrections Done:</font></td>
			</tr>
			<tr><td width="60%">
				Firmware Changed:
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   			&nbsp;
	   			<%if(FirmwareChanged!=null && FirmwareChanged.trim().length()>0 && FirmwareChanged.equals("yes"))
					{
				%>
						<input type="radio" id="FirmwareChanged" name="FirmwareChanged" value="yes" checked="checked">Yes
						<input type="radio" id="FirmwareChanged" name="FirmwareChanged" value="no" >No
				<%	}
			 	 else
			   		{ %>
						<input type="radio" id="FirmwareChanged" name="FirmwareChanged" value="yes">Yes
						<input type="radio" id="FirmwareChanged" name="FirmwareChanged" value="no" checked="checked">No
				 <%} %>
			</td>
			<td rowspan="7" align="center" valign="top">
   				<select name="correct"  multiple="multiple" class="formElement" style="width: 100%;">
   				<%
					sql4="select * from hw_comment where CommentName='Correction'";
					rs4=stmt1.executeQuery(sql4);
					while(rs4.next())
					{int i=othcorr.size();
						i--;
						 String comm=rs4.getString("Comment");
				%>
						<option value="<%=rs4.getString("Comment") %>" 
						<% while(i>=0) 
							{ String comme1=othcorr.get(i).toString();
							if(comme1.trim().equals(comm.trim()))
							 %> selected="selected" 
					<%     	 
						i--;
						}
							%> > <%=rs4.getString("Comment") %> </option> 
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
			<%if(ModuleChanged!=null && ModuleChanged.trim().length()>0 && ModuleChanged.equals("yes"))
				{
				%>
						<input type="radio" id="ModuleChanged" name="ModuleChanged" value="yes" checked="checked"/>Yes
	   					<input type="radio" id="ModuleChanged" name="ModuleChanged" value="no" />No
				
		    <%  }
			else{ %>
	   					<input type="radio" id="ModuleChanged" name="ModuleChanged" value="yes" />Yes
	   					<input type="radio" id="ModuleChanged" name="ModuleChanged" value="no" checked="checked"/>No
	   		 <%} %>
   			</td>
   			</tr>
   			<tr>
   			<td >
	   			PCB modification:
	   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   			<%if(pcbmod!=null && pcbmod.trim().length()>0 && pcbmod.equals("yes"))
	   				{
				%>
						<input type="radio" id="pcbmod" name="pcbmod" value="yes" checked="checked">Yes
	   					<input type="radio" id="pcbmod" name="pcbmod" value="no" >No
	   			<%	}
	   			else{ %>
						<input type="radio" id="pcbmod" name="pcbmod" value="yes">Yes
	   					<input type="radio" id="pcbmod" name="pcbmod" value="no" checked="checked">No
				<%  }
				%>
   			</td>
     		</tr>
   			<tr>
   			<td >
	   			Power supply correction or changed:
	   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   			<%if(Power!=null && Power.trim().length()>0 && Power.equals("yes"))
	   				{
				%>
						<input type="radio" id="Power" name="Power" value="yes" checked="checked">Yes
	   					<input type="radio" id="Power" name="Power" value="no" >No
	   			<%	}
	   			else{ %>
	   					<input type="radio" id="Power" name="Power" value="yes">Yes
	   					<input type="radio" id="Power" name="Power" value="no" checked="checked">No
	   			<%  }
				%>
   			</td>
   			</tr>
   			<tr>
   			<td >
   			  	GPS mouse correction or changed:
   			   	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			   	<%if(mousecorrection!=null && mousecorrection.trim().length()>0 && mousecorrection.equals("yes"))
	   				{
				%>
						<input type="radio" id="mousecorrection" name="mousecorrection" value="yes" checked="checked">Yes
   						<input type="radio" id="mousecorrection" name="mousecorrection" value="no" >No
   				<%	}
	   			else{ %>
   						<input type="radio" id="mousecorrection" name="mousecorrection" value="yes">Yes
   						<input type="radio" id="mousecorrection" name="mousecorrection" value="no" checked="checked">No
   				<%  }
				%>
   			</td>
   			</tr>
   			<tr>
   			<td>
	   			GSM antenna correction or changed:
	   			&nbsp;&nbsp;&nbsp;&nbsp;
	   			<%if(antennacorrection!=null && antennacorrection.trim().length()>0 && antennacorrection.equals("yes"))
	   				{
				%>
						<input type="radio" id="antennacorrection" name="antennacorrection" value="yes" checked="checked">Yes
	   					<input type="radio" id="antennacorrection" name="antennacorrection" value="no" >No
	   			<%	}
	   			else{ %>
	   					<input type="radio" id="antennacorrection" name="antennacorrection" value="yes">Yes
	   					<input type="radio" id="antennacorrection" name="antennacorrection" value="no" checked="checked">No
	   			<%  }
				%>
   			</td>
   			</tr>
   			<tr>
   			<td >
	   			Software reloading and sim corrections.
	   			<%if(Softwaresim!=null && Softwaresim.trim().length()>0 && Softwaresim.equals("yes"))
	   				{
				%>
						<input type="radio" id="Softwaresim" name="Softwaresim" value="yes" checked="checked">Yes
	   					<input type="radio" id="Softwaresim" name="Softwaresim" value="no" >No
	   			<%	}
	   			else{ %>
	   					<input type="radio" id="Softwaresim" name="Softwaresim" value="yes">Yes
	   					<input type="radio" id="Softwaresim" name="Softwaresim" value="no" checked="checked">No
	   			<%  }
				%>
   			</td>
     		</tr>
           </table> 
       </td>
       
       <td valign="top"> 
<table  width="100%"  >
<tr>
			<td colspan="4" >
			<table border="1" width="100%">
			<tr>
			<td width="17%">
			<font color="maroon">Company:</font>
			</td>
			<td width="">
				<%if(company!=null && company.trim().length()>0 )
	   				{
				%>	
				<select name="comp" class="formelement">
				<option value="<%=company%>" selected="selected"><%=company%></option>
				<option value="select">Select</option>
				<option value="airtel">Airtel</option>
				<option value="idea">Idea</option>
				<option value="vodafone">Vodafone</option>
				<option value="aircel">Aircel</option>
				</select>
				<%	}
	   			else{ %>
				<select name="comp" class="formelement">
				<option value="select">Select</option>
				<option value="airtel">Airtel</option>
				<option value="idea">Idea</option>
				<option value="vodafone">Vodafone</option>
				<option value="aircel">Aircel</option>
				</select>	
				<%  }
				%>
			</td>
			</tr>
			<tr>
			<td width="40%" style="border-right: none">
			<font color="maroon">Box Enclosure Type:</font>
			</td>
			<td width="">
				<%if(boxtype!=null && !boxtype.equalsIgnoreCase("null")&& boxtype.trim().length()>0 && !boxtype.equals("-") )
	   				{
				%>	
				<select name="box" class="formelement">
				<option value="<%=boxtype %>" selected="selected"><%=boxtype %></option>
				<option value="select">Select</option>
				<option value="Metal">Metal</option>
				<option value="Plastic">Plastic</option>
				</select>
				<%	}
	   			else{ %>
				<select name="box" class="formelement">
				<option value="select">Select</option>
				<option value="Metal">Metal</option>
				<option value="Plastic">Plastic</option>
				
				</select>	
				<%  }
				%>
			</td>
			</tr>
			<tr>
			<td width="40%" style="border-right: none">
			<font color="maroon">Power Supply:</font>
			</td>
			<%
		     POWER_SUPPLY ="select * from t_powersupply where valid='Yes' order by POWER_SUPPLY  asc";                    
		     rsPOWER_SUPPLY=stmt3.executeQuery(POWER_SUPPLY);
		    %>
			<td width="">
				<%if(powersupply!=null && !powersupply.equalsIgnoreCase("null")&& powersupply.trim().length()>0 && !powersupply.equals("-") )
	   				{
				%>	
				<select name="powersupply" class="formelement">
				<option value="<%=powersupply %>" selected="selected"><%=powersupply %></option>
				<option value="select">Select</option>
				<% while(rsPOWER_SUPPLY.next())
				{
				%>
				 <option value<%=rsPOWER_SUPPLY.getString("POWER_SUPPLY") %>><%=rsPOWER_SUPPLY.getString("POWER_SUPPLY")%></option>
				<%
				}
				%>
				</select>
				<%	}
	   			else{ %>
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
				<%  }
				%>
			</td>
			</tr>
			</table>
				
			</td>
			
		</tr>
   <tr>
     <td><br/><br/><br/><br/>
<font color="maroon"> Peripherals:</font>
     </td>
     <td><br/><br/><br/><br/>   
<%
if(pvoicedb==null || pvoicedb.equals("null"))
   { %>
       <input type="checkbox" name="voice" value="Voice" >Voice </input> 
<% } 
   else
   { %>
       <input type="checkbox" name="voice" value="Voice" CHECKED>Voice </input> 
<% } %>
    </td>
    <td><br/><br/><br/><br/>   
<% if(pjrmbuzzdb==null || pjrmbuzzdb.equals("null"))
   { %>
<input type="checkbox" name="jrm" value="JRM+Buzzer" >JRM + Buzzer </input> 
<% }
   else
   { %> 
<input type="checkbox" name="jrm" value="JRM+Buzzer" CHECKED >JRM + Buzzer </input> 
    </td>
<% } %>
    <td><br/><br/><br/><br/>   
<% if(pbuzzdb==null || pbuzzdb.equals("null"))
   { %>
<input type="checkbox" name="buz" value="BuzzerOnly" >Buzzer Only</input>  
<% }
   else
   { %>
  <input type="checkbox" name="buz" value="BuzzerOnly" CHECKED>Buzzer Only</input>  
<% } %>
    </td>
  </tr>
  <tr>
 <td> </td>  
  <td>
<% if(ptemp1db==null || ptemp1db.equals("null"))
   { %>
<input type="checkbox" name="temp1" value="1Temp" >1 Temp </input> 
<% }
   else
   { %>
<input type="checkbox" name="temp1" value="1Temp" CHECKED >1 Temp </input> 
<% } %>
  </td>
  <td>
<% if(ptemp2db==null || ptemp2db.equals("null"))
   { %>
<input type="checkbox" name="temp2" value="2Temp" >2 Temp </input>
<% }
   else
   { %>
  <input type="checkbox" name="temp2" value="2Temp" CHECKED >2 Temp </input>
<% } %>
</td>
 <td>
<%
if(pdoor1db==null || pdoor1db.equals("null"))
   { %>
<input type="checkbox" name="door1" value="1Door" >1 Door </input> 
<% } 
   else
   { %>
<input type="checkbox" name="door1" value="1Door" CHECKED>1 Door </input> 
<% } %>
 </td>
</tr>
<tr>
<td> </td>
<td>
<%
if(pdoor2db==null || pdoor2db.equals("null"))
   { %>
<input type="checkbox" name="door2" value="2Door" >2 Door </input>
<% }
   else
   { %>
<input type="checkbox" name="door2" value="2Door" CHECKED>2 Door </input>
<% } %>
</td>
<td>
<%
if(phrndb==null || phrndb.equals("null"))
   { %>
<input type="checkbox" name="horn" value="Horn" >Horn </input> 
<% }
   else
   { %>
 <input type="checkbox" name="horn" value="Horn" CHECKED>Horn </input> 
<% } %>
</td>
<td>
<%
if(pscarddb==null || pscarddb.equals("null"))
   { %>
<input type="checkbox" name="scard" value="SmartCard" >Smart Card </input> 
<% } 
   else
   { %>
<input type="checkbox" name="scard" value="SmartCard" CHECKED>Smart Card </input> 
<% } %>
</td>
</tr>
<tr>
<td> </td>
<td>
<%
if(pflowsen1db==null || pflowsen1db.equals("null"))
   { %>
<input type="checkbox" name="flow1" value="1FlowSensor" >1 Flow Sensor </input>
<% } 
   else
   { %>
<input type="checkbox" name="flow1" value="1FlowSensor" CHECKED>1 Flow Sensor </input>
<% } %>
</td>
<td>
<%
if(pflowsen2db==null || pflowsen2db.equals("null"))
   { %>
<input type="checkbox" name="flow2" value="2FlowSensor" >2 Flow Sensor </input> 
<% }
   else
   { %> 
  <input type="checkbox" name="flow2" value="2FlowSensor" CHECKED>2 Flow Sensor </input> 
<% } %>
</td>
<td> 
<%
if(pplaindb==null || pplaindb.equals("null"))
   { %>
<input type="checkbox" name="plain" value="plain" >Plain </input> 
<% }
   else
   { %>
<input type="checkbox" name="plain" value="plain" CHECKED>Plain </input> 
<% } %>
 </td>
</tr>
<tr>
<td> </td> 
<td> 
<%
if(null!=peripherals && peripherals.contains("With Battery"))
   { %>
<input type="checkbox" name="battery" value="WithBattery" CHECKED>With Battery </input> 
<% }
   else
   { %>
<input type="checkbox" name="battery" value="WithBattery" >With Battery </input> 
<% } %>
 </td>
 <td> 
<%
if(null!=peripherals && peripherals.contains("With 1800mAh Battery"))
   { %>
<input type="checkbox" name="battery1800" value="With 1800mAh Battery" CHECKED>With 1800mAh Battery </input> 
<% }
   else
   { %>
<input type="checkbox" name="battery1800" value="With 1800mAh Battery" >With 1800mAh Battery </input> 
<% } %>
 </td>
  <td> 
<%
if(null!=peripherals && peripherals.contains("With 950mAh Battery"))
   { %>
<input type="checkbox" name="battery950" value="With 950mAh Battery" CHECKED>With 950mAh Battery </input> 
<% }
   else
   { %>
<input type="checkbox" name="battery950" value="With 950mAh Battery" >With 950mAh Battery </input> 
<% } %>
 </td>
</tr>
<tr>
<td> </td>
  <td> 
<%
if(null!=peripherals && peripherals.contains("With 1050mAh Battery"))
   { %>
<input type="checkbox" name="battery1050" value="With 1050mAh Battery" CHECKED>With 1050mAh Battery </input> 
<% }
   else
   { %>
<input type="checkbox" name="battery1050" value="With 1050mAh Battery" >With 1050mAh Battery </input> 
<% } %>
 </td>
</tr>
</table>
       </td>
  </tr>

  <tr> 
     <td colspan="2"> <div align="center">
          <input type="submit" name="submit" value="Update" class="formElement" /> </div>
     </td>
  </tr>
</table>
</center>

<% 

} catch(Exception e) { out.println("Exception----->"+e); e.printStackTrace();}

finally
{
con1.close();
con2.close();
}
%>
          
<br>
<br>
<table border="1" width="100%" >
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>

</form>


   



