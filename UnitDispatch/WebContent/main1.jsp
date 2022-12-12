<!-- 
  Module Name : Log in Page
  Creator : Azhar G B
  Date of Creation : 20/07/08
  Modifier :Vikram I. Nalawade
  Date of Modification :29-Sept-08
  Reason of Modification :Designinig 
-->
<table  border="1"width="95%" align="center" bgcolor="">
<tr><td><%@ include file="headeradmin.jsp" %>
</td></tr>
<tr><td>
<script language="javascript">
var simnotsame="No";
var mobnotsame="No";
var powsuptest="No";
var gsmled="No";
var swver="Yes";
var firmver="Yes";
var mailid="Yes";
var othcomnt="No";
var othdebit="No";
var condet="No";


function Validate()
{ 
  var v1=document.mainform.unitid.value;
  var v2=document.mainform.cust.value;
  var v3=document.mainform.utype.value;
  var v4=document.mainform.avlpcb.value;
  var v5=document.mainform.powerpcb.value;
  var v6=document.mainform.wmsn.value;
  var v7=document.mainform.wave.value;
  var v8=document.mainform.firmware.value;
  var v9=document.mainform.codever.value;
  var v10=document.mainform.mobno1.value;
  var v11=document.mainform.simno1.value;
  var v12=document.mainform.cn7pin1.value;
  var v13=document.mainform.cn7pin2.value;
  var v14=document.mainform.cn7pin3.value;
  var v15=document.mainform.cn7inpvol.value;
  var v16=document.mainform.pin9.value;
  var v17=document.mainform.pin40.value;
  var v18=document.mainform.atwopen1.value;
  var v19=document.mainform.atwopen0.value; 
  var v20=document.mainform.swver.value; 
  var v21=document.mainform.firmvertext.value; 
  var v22=document.mainform.mailid.value; 
  var v23=document.mainform.codever.value; 
  var v24=document.mainform.dterec.value; 
  var v25=document.mainform.comment.value; 
  var v26=document.mainform.debnote.value; 
/*
  var v27=document.mainform.othcomment.value;
  var v28=document.mainform.othdeb.value;  
*/
  var v29=document.mainform.condet.value;    

  
  if(v1.length==0)
  {
     alert("Please enter Unit Id");
     return false;
  }
  if(isNaN(v1))
  {
     alert("Please enter proper Unit Id");
     return false;
  } 

  if(v2=="Select")
  {
     alert("Please select Customer Name");
     return false;
  }

    if(v3=="Select")
  {
     alert("Please select Unit Type");
     return false;
  }

    if(v4=="Select")
  {
     alert("Please select AVL PCB Version");
     return false;
  }

    if(v5=="Select")
  {
     alert("Please select Power Supply PCB Version");
     return false;
  }

    if(v6.length==0)
  {
     alert("Please enter WMSN No");
     return false;
  }
  if(v6.length<15 || v6.length>15)
  {
     alert("Please enter 15 digit WMSN No");
     return false;
  }
  if(isNaN(v6))
  {
     alert("Please enter proper WMSN No");
     return false;
  }

    if(v7=="Select")
  {
     alert("Please select Wavecom Module Version");
     return false;
  }

    if(v8=="Select")
  {
     alert("Please select Firmware Version");
     return false;
  }

  if(simnotsame=="Yes")
  {
     if(v11.length==0)
     {
        alert("Please enter another SIM no");
        return false;
     }
     if(v11.length<8 || v11.length>8)
     {
        alert("Please enter proper 8 digit SIM no");
        return false;
     }
     if(isNaN(v11))
     {
        alert("Please enter proper SIM no");
        return false;
     }
  }

	if(mobnotsame=="Yes")
	{
		if(v10.length==0)
		{
        		alert("Please enter another Mobile no");
        		return false;
     		}
		if(v10.length<10 || v10.length>10)
		{
			alert("Please enter proper 10 digit Mobile no");
			return false;
		}
		if(isNaN(v10))
		{
			alert("Please enter proper Mobile no");
			return false;
		}
	}

	if(condet=="Yes")
	{
		if(v29.length<3)
		{
		alert("Please enter Connection details");
		return false;
		}
	}
	if(powsuptest=="Yes")
	{
		if(v12.length==0)
		{
	        	alert("Please enter PIN1 voltage in Power supply testing ");
        		return false;
    		}
		if(v13.length==0)
		{
			alert("Please enter PIN2 voltage in Power supply testing ");
			return false;
		}
		if(v14.length==0)
		{
			alert("Please enter PIN3 voltage in Power supply testing ");
			return false;
		}
		if(v15.length==0)
		{
			alert("Please enter Power supply Pin voltage in Power supply testing ");
			return false;
		}
	}
  
	if(gsmled=="Yes")
	{
		if(v16.length==0)
		{
			alert("Please enter PIN9 value in Hardware Testing ");
			return false;
		}
		if(v17.length==0)
		{
			alert("Please enter PIN40 value in Hardware Testing");
			return false;
		}
		if(isNaN(v16))
		{
			alert("Please enter proper PIN9 value in Hardware Testing");
			return false;
		}
		if(isNaN(v17))
		{
			alert("Please enter proper PIN40 value in Hardware Testing");
			return false;
		}
	}
  
	if(v18.length==0)
	{
	       alert("Please enter AT+WOPEN=1 value in Software Testing");
	       return false;
    	}

	if(v19.length==0)
	{
	       alert("Please enter AT+WOPEN=0 value in Software Testing");
	       return false;
	}
	if(swver=="Yes")
	{
	       if(v20.length==0)
	       {
			alert("Please enter Software version in Software Testing");
			return false;
	       }
	}

	if(firmver=="Yes")
	{
	       if(v21.length==0)
	       {
			alert("Please enter Firmware version in Software Testing");
			return false;
		}
	}

	if(mailid=="Yes")
	{
		if(v22.length==0)
		{
			alert("Please enter mail id in Software Testing");
			return false;
		}
	}

	if(v23.length==0)
	{
		alert("Please enter Code version in Software Testing");
        	return false;
	}

	if(v24.length==0)
	{
		alert("Please enter last date of data received in Software Testing");
		return false;
	}
 
	if(v25.length==0)
	{
		alert("Please enter comment for unit");
		return false;
    }
    /*
    if(othcomnt=="Yes")
    {
        if(v27.length==0)
        {
           alert("Please enter your comment");
           return false;
        }
    }*/

    if(v26=="Select")
    {
       alert("Please select debit note from the list");
       return false;
    }

   
    if(othdebit=="Yes")
    {
      if(v28.length==0)
        {
           alert("Please enter your Debit note");
           return false;
        }
   }  
  
   
   
  return datevalidate();
}

function datevalidate()
{   
   var date1=document.mainform.tdydte.value;
   var date2=document.mainform.dterec.value; 

   var dm1,dd1,dy1,dm2,dd2,dy2;

   dy1=date1.substring(0,4);
   dy2=date2.substring(0,4);
   
   dm1=date1.substring(5,7);
   dm2=date2.substring(5,7);
   
   dd1=date1.substring(8,10);
   dd2=date2.substring(8,10);

   if(dy2>dy1)
	{
		alert("Selected year cannot be greater than today's year");
		document.mainform.dterec.value=""; 
		
		return false;
	
	}
  else if(dm2>dm1)
	{
		alert("Selected month cannot be greater than today's month");
		document.mainform.dterec.value=""; 
		
		return false;
	
	}

  if(dm2==dm1)
  {
		if(dd2>dd1)
		{
		alert("Selected Date cannot be greater than Today's Date");
		document.mainform.dterec.value=""; 
		
		return false;
	
		}
 }


  return true;
}

function AJAXFunc1()
{
  var vv1=document.mainform.unitid.value;

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
     	 	   if(ajaxRequest.readyState == 4)
                        {
                           var reslt=ajaxRequest.responseText;
                           //alert(reslt);
  

                           var reslt=ajaxRequest.responseText;
                           var mySplitResult = reslt.split("#");
                           var mySplitResult1=  mySplitResult[0]; 
                           var mySplitResult2=  mySplitResult[1];
                           //var mySplitResult9=  mySplitResult[9];
                           document.mainform.wmsn.value = mySplitResult[0];
                           document.mainform.mobno.value = mySplitResult[1];
                           document.mainform.simno.value = mySplitResult[2];
		      } 
         	   }
               var queryString = "?unid=" +vv1;
 	      ajaxRequest.open("GET", "Ajaxgetdata1.jsp" + queryString, true);
	     ajaxRequest.send(null); 
}

function ShowSIM(id)
{ //alert(simtext);
  if(id=="1")
  {
     //document.mainform.simno.style.visibility='hidden';
     //document.mainform.simno.value="";
       document.mainform.simno1.style.visibility='hidden';
      document.mainform.sim1.checked=false;
      document.mainform.sim1.disabled='true';
      
      document.mainform.mobno1.style.visibility='hidden';
      document.mainform.mob1.disabled='true';
      document.mainform.mob1.checked=false; 
     simtext="No";
  }
  else
  {
      //document.mainform.simno1.style.visibility='visible';
      document.mainform.sim1.disabled=false;

      //document.mainform.mobno1.style.visibility='visible';
      document.mainform.mob1.disabled=false;
             
      document.mainform.simno1.value="";
      document.mainform.mobno1.value="";     
    // document.mainform.simno.style.visibility='visible';
     simtext="Yes";
  }
}

function ShowSw(id1)
{ 
  if(id1=="1")
  {
     document.mainform.swver.style.visibility='hidden';
     document.mainform.swver.value="";   
  
     swver="No";
  }
  else
  {
     document.mainform.swver.style.visibility='visible';
     swver="Yes";
  }
}

function ShowFirm(id2)
{ 
  if(id2=="1")
  {
     document.mainform.firmvertext.style.visibility='hidden';
     document.mainform.firmvertext.value="";

     firmver="No";
  }
  else
  {
     document.mainform.firmvertext.style.visibility='visible';
     firmver="Yes";
  }
}

function ShowMail(id3)
{ 
  if(id3=="1")
  {
     document.mainform.mailid.style.visibility='hidden';
     document.mainform.mailid.value="";

     mailid="No";
  }
  else
  {
     document.mainform.mailid.style.visibility='visible';

     mailid="Yes";
  }
}
/*
function OnChangeFunc1(dropdown)
  {
 var vv1=dropdown.selectedIndex;
 var SelValue1 = dropdown.options[vv1].value;
 
        if(SelValue1=="Other")
        {
                
            document.mainform.othcomment.style.visibility='visible';

            othcomnt="Yes";
        }
        else
        { 
            document.mainform.othcomment.style.visibility='hidden';
            document.mainform.othcomment.value="";

            othcomnt="No";
        }
 }*/      

function OnChangeFunc2(dropdown)
  {
 var vv2=dropdown.selectedIndex;
 var SelValue2 = dropdown.options[vv2].value;
 
        if(SelValue2=="Other")
        {
                             
            document.mainform.othdeb.style.visibility='visible';

             othdebit="Yes";
        }
        else
        { 
            document.mainform.othdeb.style.visibility='hidden';
            document.mainform.othdeb.value="";
 
            othdebit="No";
        }
 }  
var arSelected = new Array(); 
function getMultiple(ob) 
{ 
	while (ob.selectedIndex != -1) 
	{ 
		if (ob.selectedIndex != 0) 
		arSelected.push(ob.options[ob.selectedIndex].value); 
		ob.options[ob.selectedIndex].selected = false;
 	} // You can use the arSelected array for further processing. 
}
/*function getmultiselect()
{
	//alert("hi");
	var selects = document.getElementsByTagName('cust');
	for(var i = 0, maxi = selects.length; i < maxi; i++) {
		selects[i].selected = getmultiselect(){
			var sel = new Array();
			for(var i = 0, maxi = this.options.length; i < maxi; i++) {
				if (this.options[i].selected){
					sel[sel.length] = this.options[i];
				}
			}
			return sel;
			
		}
		selects[i].onmouseup = getmultiselect(){
			alert(this.selected().length);
		}
	}
}*/
function OnChangeFunc3(dropdown)
{
  
   var vv1=dropdown.selectedIndex;
   var SelValue1 = dropdown.options[vv1].value;
 //alert(SelValue1);
   
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
     	 	   if(ajaxRequest.readyState == 4)
                        {
                           var reslt=ajaxRequest.responseText;
                           //alert(reslt);document.mainform.simno1.style.visibility='hidden';
  

                           var reslt=ajaxRequest.responseText;
                           var mySplitResult = reslt.split("#");
                           var mySplitResult1=  mySplitResult[0]; 
                           var mySplitResult2=  mySplitResult[1];
                           var mySplitResult9=  mySplitResult[9];
                           
                           document.mainform.cust.value = mySplitResult[0];
                           document.mainform.utype.value = mySplitResult[1];
                           document.mainform.avlpcb.value = mySplitResult[2];
                           document.mainform.powerpcb.value = mySplitResult[3];
                           document.mainform.wmsn.value = mySplitResult[4];
                           document.mainform.wave.value = mySplitResult[5];
                           document.mainform.firmware.value = mySplitResult[6];
                          // document.mainform.codever.value = mySplitResult[7];
 
                            //alert(mySplitResult[8]);
                           if(mySplitResult9.length < 3)
                           { 
                             document.mainform.mobno.value = mySplitResult[8];
                           }
                           else
                           { 
                             
                             document.mainform.mobno.value = mySplitResult[9];
                           }
//alert(mySplitResult[8]);
// var len=mySplitResult10.length;
// alert(len);
                   if(mySplitResult[11] == 0)
                   {
                      document.mainform.simm[0].checked="true"
                      document.mainform.simm[1].checked="false" 

                      document.mainform.simm[0].disabled="true"
                      document.mainform.simm[1].disabled="true" 
                   }
                   else
                   {
                      document.mainform.simm[1].checked="true"
                      document.mainform.simm[0].checked="false" 

                      document.mainform.simm[0].disabled="true"
                      document.mainform.simm[1].disabled="true" 

                   } 

                   if(mySplitResult[11].length < 3) 
                   {
                       document.mainform.simno.value=mySplitResult[10];             
                   }
                   else
                    {
                       document.mainform.simno.value=mySplitResult[11];             
                           
                    }
                     var res12=0;
                     res12=mySplitResult[12];
                      
                     if(res12 == 0)
                     {
 			//alert("hi");
                        document.mainform.led1[0].checked=true;
                     }
                     else
                     {
                        //alert("bye"); 
                       document.mainform.led1[0].checked=false;
                       document.mainform.led1[1].checked=true;
                     }

                     var res13=0;
                     res13=mySplitResult[13];
                     //alert(mySplitResult[13]);
 
                     if(res13 == 0)
                     {
                        document.mainform.led2[0].checked=true;
                     }
                     else
                     {
                       document.mainform.led2[0].checked=false;
                       document.mainform.led2[1].checked=true;
                     }

                     var res14=0;
                     res14=mySplitResult[14];
                     //alert(mySplitResult[14]);
 
                     if(res14 == 0)
                     {
                        document.mainform.led3[0].checked=true;
                     }
                     else
                     {
                       document.mainform.led3[0].checked=false;
                       document.mainform.led3[1].checked=true;
                     }

                     var res15=0;
                     res15=mySplitResult[15];
                     //alert(mySplitResult[15]);
 
                     if(res15 == 0)
                     {
                        document.mainform.led4[0].checked=true;
                     }
                     else
                     {
                       document.mainform.led4[0].checked=false;
                       document.mainform.led4[1].checked=true;
                     }

                      var res16=0;
                     res16=mySplitResult[16];
                     //alert(mySplitResult[16]);
 
                     if(res16 == 0)
                     {
                        document.mainform.led5[0].checked=true;
                     }
                     else
                     {
                       document.mainform.led5[0].checked=false;
                       document.mainform.led5[1].checked=true;
                     }

                     var res17=0;
                     res17=mySplitResult[17];
                     //alert(mySplitResult[17]);
 
                     if(res17 == 0)
                     {
                        document.mainform.othcon[0].checked=true;
                     }
                     else
                     {
                       document.mainform.othcon[0].checked=false;
                       document.mainform.othcon[1].checked=true;
                     }

                    var res18=0;
                     res18=mySplitResult[18];
                     //alert(mySplitResult[18]);
 
                     if(res18 == 0)
                     {
                        document.mainform.gpsant[0].checked=true;
                     }
                     else
                     {
                       document.mainform.gpsant[0].checked=false;
                       document.mainform.gpsant[1].checked=true;
                     }

                     var res19=0;
                     res19=mySplitResult[19];
                     //alert(mySplitResult[19]);
 
                     if(res19 == 0)
                     {
                        document.mainform.gpsantled[0].checked=true;
                     }
                     else
                     {
                       document.mainform.gpsantled[0].checked=false;
                       document.mainform.gpsantled[1].checked=true;
                     }

                     //var res20=0;
                     res20=mySplitResult[20];
                     //alert(mySplitResult[20]);
 
                     if(res17 == 0)
                     {
                       document.mainform.condet.style.visibility='hidden';
                     }
                     else
                     {
                       document.mainform.condet.style.visibility='visible';
                       document.mainform.condet.value=res20;
                       document.mainform.condet.disabled='true';
                     } 
                      
                     document.mainform.cn7pin1.value=mySplitResult[21]; 
                     document.mainform.cn7pin2.value=mySplitResult[22];
                     document.mainform.cn7pin3.value=mySplitResult[23];
 
                     var res24=0;
                     res24=mySplitResult[24];
                     //alert(mySplitResult[24]);
 
                     if(res24 == 0)
                     {
                        document.mainform.rnge[0].checked=true;
                     }
                     else if(res24 == 1)
                     {
                       document.mainform.rnge[0].checked=false;
                       document.mainform.rnge[1].checked=true;
                     }
                     else
                     { }

                     document.mainform.cn7inpvol.value=mySplitResult[25]; 
                     document.mainform.cn7inpvol.disabled='true'; 

                     var res26=0;
                     res26=mySplitResult[26];
                     //alert(mySplitResult[26]);
 
                     if(res26 == 0)
                     {
                        document.mainform.powsupfail[1].checked=true;
                     }
                     else if(res26 == 1)
                     {
                       document.mainform.powsupfail[1].checked=false;
                       document.mainform.powsupfail[0].checked=true;
                     }
                     else
                     { }

                      var res30=0;
                     res30=mySplitResult[30];
                     //alert(mySplitResult[30]);
 
                     if(res30 == 0)
                     {
                        document.mainform.fusebx[0].checked=true;
                     }
                     else if(res30 == 1)
                     {
                       document.mainform.fusebx[0].checked=false;
                       document.mainform.fusebx[1].checked=true;
                     }
                     else
                     { }  
           
                       document.mainform.pin9.value=mySplitResult[27];
                      
                       document.mainform.pin40.value=mySplitResult[28]; 

                     var res29=0;
                     res29=mySplitResult[29];
                     //alert(mySplitResult[29]);
 
                     if(res29 == 0)
                     {
                        document.mainform.modtest[0].checked=true;
                     }
                     else if(res29 == 1)
                     {
                       document.mainform.modtest[0].checked=false;
                       document.mainform.modtest[1].checked=true;
                       document.mainform.modtest[2].checked=false;
                     }
                     else if(res29 == 2)
                     {
                       document.mainform.modtest[0].checked=false;
                       document.mainform.modtest[1].checked=false;
                       document.mainform.modtest[2].checked=true;
                     }
                     else
                     { }
                      
	     } 
           }
           var queryString = "?unid=" +SelValue1;
 	   ajaxRequest.open("GET", "Ajaxgetdata.jsp" + queryString, true);
	   ajaxRequest.send(null); 
 }



function OnChangeChkBx()
{ 
  if(document.mainform.sim1.checked == true)
  { 
     document.mainform.simno1.style.visibility="visible";
     simnotsame="Yes";
  }
  else
  {
     document.mainform.simno1.style.visibility="hidden";
     document.mainform.simno1.value="";
     simnotsame="No";
  }
}

function OnChangeChkBx1()
{ 
  if(document.mainform.mob1.checked == true)
  { 
      document.mainform.mobno1.style.visibility="visible";
      mobnotsame="Yes";
  }
  else
  {
     document.mainform.mobno1.style.visibility="hidden";
     document.mainform.mobno1.value="";
     mobnotsame="No";
  }
}

/*function OnChangeRad(ind)
{
      if(ind==1)
    { 
       document.mainform.condet.style.visibility="visible";

       condet="Yes";
    }
    else
    {
       document.mainform.condet.style.visibility="hidden";
       document.mainform.condet.value="";

       condet="No";
    }
}
function Showperi(ind)
{
	
	if(ind==1)
	{
	    
         	document.getElementById("peritable").style.display="visible";   
        }  
	else
	    {
               document.getElementById("peritable").style.display="none";
            }
	
}*/

function displayRow(ind)
{
var row = document.getElementById("peritable");

if(ind==0) 
	row.style.display = 'none';
else
	 row.style.display = '';

}
function displayconn(ind)
{
var row = document.getElementById("condet");

if(ind==0) 
	row.style.display = 'none';
else
	row.style.display = '';

}
/*function displayRow1()
{
var row = document.getElementById("peritable");

if (row.style.display == 'none') 
	row.style.display = '';
else
	 row.style.display = 'none';

}*/
function ShowVis6(ind)
{
  if(ind==0)
  {
     document.mainform.pin9.disabled=true;
     document.mainform.pin40.disabled=true;
 
     document.mainform.pin9.value="";
     document.mainform.pin40.value="";

     gsmled="No";
  } 
  else
  {
    //alert("in else");
     document.mainform.pin9.disabled=false;
     document.mainform.pin40.disabled=false;
 
     gsmled="Yes";
  } 
}
/*
function showselect()
{ 
	var selIdx="",newSel="";erros[]="";
	selIdx = document.mainform.cust.selectedIndex;
	newSel = document.mainform.cust.options[selIdx].text;
	error=error+","+ newsel;
	alert(error);
}*/
function chk()
{
  if(document.mainform.led1[0].checked=true)
   {
     alert("yes");
   } 
}
function ShowPowSupTest(ind)
{
   
   if(ind==0 && document.mainform.led1[0].checked==true && document.mainform.led2[0].checked==true )
   {
     document.mainform.cn7pin1.disabled=true;
     document.mainform.cn7pin2.disabled=true;
     document.mainform.cn7pin3.disabled=true;
 
     document.mainform.rnge[0].disabled=true;
     document.mainform.rnge[1].disabled=true;
     document.mainform.rnge[0].checked=false;

     document.mainform.cn7inpvol.disabled=true;

     document.mainform.powsupfail[0].disabled=true;
     document.mainform.powsupfail[1].disabled=true;
     document.mainform.powsupfail[0].checked=false;

     document.mainform.fusebx[0].disabled=true;
     document.mainform.fusebx[1].disabled=true;
     document.mainform.fusebx[0].checked=false;
   
     document.mainform.cn7pin1.value="";     
     document.mainform.cn7pin2.value="";
     document.mainform.cn7pin3.value="";

     document.mainform.cn7inpvol.value="";

     powsuptest="No";
   }
   else
   {
     document.mainform.cn7pin1.disabled=false;
     document.mainform.cn7pin2.disabled=false;
     document.mainform.cn7pin3.disabled=false;

     document.mainform.rnge[0].disabled=false;
     document.mainform.rnge[1].disabled=false;
     document.mainform.rnge[0].checked=true;

     document.mainform.cn7inpvol.disabled=false;

     document.mainform.powsupfail[0].disabled=false;
     document.mainform.powsupfail[1].disabled=false;
     document.mainform.powsupfail[0].checked=true;

     document.mainform.fusebx[0].disabled=false;
     document.mainform.fusebx[1].disabled=false;
     document.mainform.fusebx[0].checked=true;

     powsuptest="Yes";
   }
}

</script>



<%!
Connection con1, con2;
String empname="", emptype=""; 
%>
<html>
 
<form name="mainform" method="get" action="insert.jsp" onSubmit="return Validate()";>


<%
 empname=session.getValue("user").toString();
 //emptype=session.getValue("role").toString();
%>
<table border="0" width="100%" align="right" >
<tr>
<td  align="center"><font color="blue" size="2"> <B><U>Welcome <%=empname %> </U></B> </font></center></td>

</tr>
</table>
<!--<table class="stats">
  <tr>
      
           <% if(emptype.equals("Hardware"))
            { %>
             <a href="testview.jsp"> View </a> 
       <%   }
            else
            { %>
              <a href="swviewunit.jsp"> View </a> 
      <%    } %>
</div>     </td> 
      
  </tr>
</table>-->
<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement(), stmt2=con2.createStatement();
ResultSet rs1=null, rs2=null, rs3=null, rs4=null, rs5=null, rs6=null, rs7=null, rs8=null;
String sql1="", sql2="",sql3="", sql4="", sql5="", sql6="", sql7="", sql8="";

//String empname=request.getParameter("empname");
//String emptype=request.getParameter("role");

%>
<% String inserted=request.getParameter("inserted");
   if(inserted==null)
   {
   }
   else
   { 
      String ref=request.getParameter("refno");
  %> <br><br>
        <table class="stats">
          <tr>
               <td> <div align="center"> <font color="maroon" size="2"> <B> Successfully Inserted. Reference No = <%=ref %> </B> </font></div> </td>
          </tr>
        </table>
<% } %>

<!--<center><font color="maroon" size="2"> <B><U>Welcome <%=empname %> </U></B> </font></center>-->

<input type="hidden" name="ustyp" value="<%=emptype %>" />
<input type="hidden" name="usr" value="<%=empname %>" />

<% java.util.Date d=new java.util.Date();
   String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();


   java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
   String nwfrmtdte=formatter.format(datefrmdb);

   java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter1=new SimpleDateFormat("yyyy-MM-dd");
   String nwfrmtdte1=formatter1.format(datefrmdb1);
   
%>
 <input type="hidden" name="tdydte" value="<%=nwfrmtdte1 %>" />
<br><br>
<table width="100%" >
  <tr>
      <td  > <label for="dte"> <B> Date:  <font color="maroon"><%=nwfrmtdte %></font></label></td>
<td><div align="left"><font size="3" color="maroon"><b>Testing Detail Form </font><b></div></td>
  </tr>
</table>

<table >
  <tr>
      <td  colspan="7" bgcolor="Lightgreen "> <div align="Center"><b><font size="2" color="maroon">Unit Details </font> </td> 
  </tr>
  <tr>
      <td width="16%"> <div align="left"> <B> 1. Unit ID </B>  </td>
      <td><div align="left">

         <input type="text" name="unitid" id="unitid" size="13" class="formElement" onBlur="AJAXFunc1()"; />   </div> </td> 
      </td>

<% sql7="select distinct(TypeValue) from t_security where TypeofUser in('Transporter', 'Manufacturer') order by TypeValue asc ";
   rs7=stmt2.executeQuery(sql7);
%>
<td width="16%"> <div align="left"> <B> 2. Customer </B></div>  </td>

<td width="16%">  <div align="left">
   <select name="cust" class="formElement" size="1"  value="select" > <option value="Select"> Select </option>-->
   <% while(rs7.next())
      { %>
         <option value="<%=rs7.getString("TypeValue") %>"> <%=rs7.getString("TypeValue") %> </option>
 <%  }  %> 
<!--<option value='1'>One</option> <option value='2'>Two</option> <option value='3'>Three</option> <option value='4'>Four</option> <option value='5'>Five</option> 
</select><input type="button" class="formElement" onclick=" alert("You have selected: " + arSelected.toString());">-->
  </div> 
</td> 
<% sql4="select * from t_typeofunits order by typename asc ";
   rs4=stmt1.executeQuery(sql4);
%>
      <td> <div align="left"> <B> 3. Unit Type </B></div>

<td> <div align="left">
<select name="utype" class="formElement"> <option value="Select" > Select </option>
    <% while(rs4.next())
       { %>
        <option value="<%=rs4.getString("typename") %>" > <%=rs4.getString("typename") %> </option>
<%     } %>
   </select>
 </div>
 </td>
</td> <td> </td>
</tr>
<tr>

      <td> <div align="left"> <B> 4. AVL PCB Version </B>  </div>
</td>

<td> <div align="left">
       <select name="avlpcb" class="formElement"> <option value="Select">Select </option> 
      <option value="TWA01V4">TWA01V4 </option> </select>
 </div>  </td> 
         <td> <div align="left"> <B> 5. Power Supply PCB Version </B></div> 
</td>

<td> <div align="left">
       <select name="powerpcb" class="formElement"> <option value="Select"> Select </option>
    <option value="APSU3V1"> APSU3V1 </option> 
    <option value="APSU4V0"> APSU4V0 </option> 
    <option value="TWA02V4"> TWA02V4 </option>  </select>
</div> </td>
      <td> <div align="left"> <B> 6. WMSN No. </B></div>
</td>
<td> <div align="left">
     <input type="text" name="wmsn" id="wmsn" size="18" class="formElement" />   
 </div> </td>
</tr>
<% sql5="select * from t_utmodule order by module asc";
   rs5=stmt1.executeQuery(sql5);
%>
<tr>
      <td> <div align="left"> <B> 7. Wavecom Module Version </B></div> 
</td>

<td> <div align="left">
       <select name="wave" class="formElement"> <option value="Select" > Select </option>
    <% while(rs5.next())
       { %>
        <option value="<%=rs5.getString("module") %>" > <%=rs5.getString("module") %> </option>
<%     } %>
   </select>
<% sql6="select * from t_utfirmware order by firmware asc";
   rs6=stmt1.executeQuery(sql6);
%></div>
</td> 
      <td> <div align="left"> <B> 8. Firmware Version </B> </div>
</td>

<td><div align="left">
     <select name="firmware" class="formElement"> <option value="Select" > Select </option>
    <% while(rs6.next())
       { %>
        <option value="<%=rs6.getString("firmware") %>" > <%=rs6.getString("firmware") %> </option>
<%     } %>
   </select>

   </div> </td>
   <td> <div align="left"> <B> <B> 9.Sim Presence in unit </B> </div></td>
 <td colspan="2"><div align="left">
      
                <input type="radio" name="simm" value="Yes" class="formElement" onClick="ShowSIM(0)"; CHECKED >Yes
                <input type="radio" name="simm" value="No" class="formElement" onClick="ShowSIM(1)"; >No
 </B>
</div>
 </td>     
</tr>
<tr>
      <td> <div align="left"> <B>10. SIM No.</div>
</td>

<td><div align="left">
                <input type="text" name="simno" id="simno" size="13" onClick="AJAXFunc1()"; class="formElement" readOnly  /> 
                 
  </div> </td>
   
  <td><div align="left">  <B> 11. Mobile No </B>  </div></td>
  <td><div align="left">
     <input type="text" name="mobno" id="mobno" size="13"  onClick()="AJAXFunc1(this)"; class="formElement" ReadOnly /> </div>
 </td>
   
     <td> <div align="left"> <B> <B> 12.Peripheral type </B> </div></td>
 <td colspan="1"><div align="left">
      
                <input type="radio" name="peri" value="Plain" class="formElement" onClick="displayRow(0);" CHECKED>Plain
                <input type="radio" name="peri" value="Voice" class="formElement" onClick="displayRow(1);" >Voice
 </B>
</div>
 </td>  
  </tr> 

<tr> 
   <td colspan="2"> <div align="left">
      <input type="checkbox" name="sim1" onChange="OnChangeChkBx(this);"> Not Same </input>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="simno1" class="formElement" size="13" style="visibility:hidden" /> </div> </td>
      
   
  
  <td colspan="2"><div align="left">
<input type="checkbox" name="mob1" onChange="OnChangeChkBx1(this);"> Not Same </input>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="text" name="mobno1" class="formElement" size="13" style="visibility:hidden" /> 
    </div></td>     
</tr>
<tr id="peritable" style="display:none">
     <td>
</td><td></td><td></td><td></td>
  <td colspan="2"> <div ><table border="1"  width="100%" ><tr><td><div align="left">
    <tr><td ><div align="left"><input type="checkbox" name="HDphone" value="hdphone" > <b>Head phone broken</input></div></td></tr>
    <tr><td><div align="left"><input type="checkbox" name="Buzzconn" value="BuzzconnOn"> <b>Buzzer connection ON </input></div></td></tr>
<tr><td><div align="left"><input type="checkbox" name="kpbroke" value="Keypadbroken"> <b> Keypad Broken </input></div></td></tr>
    <tr><td><div align="left"><input type="checkbox" name="Onlyincm" value="incoming working"> <b>Only incoming call working </input></div></td></tr>
    <tr><td><div align="left"><input type="checkbox" name="Led" value="led glow" > <b>LED out going glow for incoming cut</input></div></td></tr>
    <tr><td ><div align="left"><input type="checkbox" name="NotBuzz" value="doesn't Buzz"><b> Buzzer doesn't buzz for incoming call </input></div></td></tr></table></div>
</td>
</tr>

   </tr>

  <tr>
    <td  colspan="7" bgcolor="Lightgreen"><div align=""Center><b><font size="2" Color="maroon"> Visual Inspection</font></div> </td> 
  </tr> 
  <tr>
      <td> <div align="left"> <B> 1. RED LED </B>   </div>
</td>
<td>
        <div align="left"><input type="radio" name="led1" value="ON" class="formElement" onClick="ShowPowSupTest(0)"; CHECKED > ON
&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="led1" value="OFF" class="formElement" onClick="ShowPowSupTest(1)";> OFF

 </div> </td>
      <td> <div align="left"> <B> 2. GREEN LED </B></div>
</td>
<td>
             <div align="left"><input type="radio" name="led2" value="ON" class="formElement" onClick="ShowPowSupTest(0)"; CHECKED> ON
&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="led2" value="OFF" class="formElement" onClick="ShowPowSupTest(1)";> OFF
    </div> </td>
     <td> <div align="left"> <B> 3. GREEN LED </B></div> 
</td>
<td>
            <div align="left"><input type="radio" name="led3" value="BLINKING" class="formElement" CHECKED onClick="ShowVis6(0)";> BLINKING
</div></td><td><div align="left">
            <input type="radio" name="led3" value="NOT BLINKING" class="formElement" onClick="ShowVis6(1)";> NOT BLINKING
    </div> </td> 
  </tr>

  <tr>
      <td> <div align="left"> <B> 4. RED LED Connection</B>   </div>
</td> 
     <td> 
           <div align="left"> <input type="radio" name="led4" value="OK" class="formElement" CHECKED> OK
&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="led4" value="NOT OK" class="formElement"> NOT OK
   </div>
 </td>
      <td> <div align="left"> <B> 5. GREEN LED Connection</B></div>
</td>
<td>
             <div align="left"><input type="radio" name="led5" value="OK" class="formElement" CHECKED> OK
&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="led5" value="NOT OK" class="formElement"> NOT OK
    </div> </td>
    <td> <div align="left"> <B> 6. Other Connection </B></div>
</td>
<td>
           <div align="left">  <input type="radio" name="othcon" value="Correct" class="formElement" CHECKED onClick="displayconn(0)";> Correct
</div></td><td><div>
            <input type="radio" name="othcon" value="InCorrect" class="formElement" onClick="displayconn(1)";> InCorrect
    </div> </td>

</tr>
<tr>
     <td> <div align="left"> <B> 7. GPS Antenna </B> </div>
</td>
    <td><div align="left">
             <input type="radio" name="gpsant" value="YES" class="formElement" CHECKED> YES
&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="gpsant" value="NO" class="formElement"> NO
    </div> </td>
    <td> <div align="left"> <B> 8. GPS Antenna LED </B> </div>
</td>
<td><div align="left">
            <input type="radio" name="gpsantled" value="ON" class="formElement" CHECKED> ON
&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="gpsantled" value="OFF" class="formElement"> OFF
     </div> </td>
      <td> <div align="left"> <B> 9. Connection Details </B> </div>
</td>
<td><div align="left" id="condet" style="display:none">
            <textarea name="condet" class="formElement" >  </textarea>

     </div> </td></tr>
<tr><td colspan="3"><div align="left"><table >
    <tr><td  colspan="10" bgcolor="Lightgreen"> <div align="Center"><b><font size="2" color="maroon">Hardware Testing </font></div></td> 
</tr>
<tr> 
    <td> <div align="left"> <font color="maroon" size="1"> <B>Power Supply Testing </B> </font></div> </td> <td> </td> <td> </td><td> </td><td> </td>
</tr> 
<tr>
   <td colspan="2"> <div align="left"> <B> 1. Voltage at CN7-CN8 </B> </div>
     </td>

   <td ><div align="left">   
PIN1  <input type="text" name="cn7pin1" class="formElement" size="10" disabled="true" /></div></td>
<td><div align="left">
PIN2  <input type="text" name="cn7pin2" class="formElement" size="10" disabled="true" /> </div></td>
<td><div align="left">
PIN3  <input type="text" name="cn7pin3" class="formElement" size="10" disabled="true" /> 
   </div></td>

  </tr>
  <tr>
      <td colspan="2"> <div align="left"> <B> 2. If Voltage are in the range PIN1(3.4-4.2), PIN2(0), PIN3(3.4-4.2), then  </B> 
    </div> </td>

      <td > <div align="left"> OK &nbsp;&nbsp;&nbsp;<input type="radio" name="rnge" value="OK" class="formElement" disabled="true"></div></td><td></div align="left">
Not OK      <input type="radio" name="rnge" value="Not OK" class="formElement" disabled="true">
 </div> </td>
  </tr>   
  <tr>
      <td colspan="2"> <div align="left"> <B> 3. If No Expected Voltages at CN7-CN8, check for Input Voltage at Power Supply Input Pin </div> </td>
      <td colspan="2"> <div align="left"> Power Supply Pin &nbsp;&nbsp;&nbsp;<input type="text" name="cn7inpvol" class="formElement" disabled="true"/> </div> </td>
  </tr>  
  <tr>
      <td colspan="2"> <div align="left"> <B> 4. If Input Voltage at Power Supply Input pin is in the range (11V-12.5V), then Power Supply Failure  </B> 
    </div> </td>
      <td > <div align="left"> True <input type="radio" name="powsupfail" value="True" class="formElement" disabled="true"> </div></td><td><div align="left">
False <input type="radio" name="powsupfail" value="False" class="formElement" disabled="true">
 
</div> </td>
  </tr> 

  <tr><div align="left">
      <td colspan="2"> <div align="left"> <B> 5. If No expected Voltage at Power Supply Input, check Voltage at   </B> 
    </div> </td>
      <td> <div align="left"> <input type="radio" name="fusebx" value="Blown" class="formElement" disabled="true"> Fuse Blown </td></div><td><div align="left">
      <input type="radio" name="fusebx" value="OK" class="formElement" disabled="true"> Fuse OK
</div>  </td>
  </tr> 
<tr> <td> </td> </tr> 
  <tr>
       <td colspan="3"> <div align="left"> <font color="maroon" size="1"> <B> GSM LED Not Blinking </B> </font> </div> </td>
  </tr>
  <tr>
       <td colspan="2"> <div align="left"><B> 6. If RED LED is ON but GREEN is not Blinking, check Voltages at </B>
       </div></td>
       <td > <div align="left"> PIN9 &nbsp;&nbsp;<input type="text" name="pin9" class="formElement" size="10" disabled="true" /> </div></td><td><div>
        PIN40 <input type="text" name="pin40" class="formElement" size="10" disabled="true"/> </div>                       
       </td>
  </tr>

<tr>
       <td colspan="3"> <div align="left"> <font color="maroon" size="1"> <B> Module Testing </B> </font> </div> </td>
  </tr>
  <tr>
       <td colspan="2"> <div align="left"><B> 7. Check the continuty between 2 points on Wavecom Module as per instructed by Wavecom </B></div> </td> 

       <td > <div align="left"> <input type="radio" name="modtest" value="Short" class="formElement" > Short </div></td>
<td><div align="left"><input type="radio" name="modtest" value="Open" class="formElement" > Open </div></td>
<td><div align="left"><input type="radio" name="modtest" value="OK" class="formElement" checked="true"> OK 
 </div> </td>
  </tr>
</div>
</table></td>
<td colspan="7"><table>
<tr>
    <td  colspan="11" bgcolor="Lightgreen"><b><div align="Center"><font size="2 " color="maroon"> Software Testing </div></td> 
</tr>
<tr>
    <td colspan="2"> <div align="left"> <B> 1. Is code running? Check by giving command 'AT+WOPEN?"  </B></div>
    <td ><div align="left">
     AT+WOPEN=1 <input type="text" name="atwopen1" class="formElement" size="10" />
<br></td><td>
     AT+WOPEN=0 <input type="text" name="atwopen0" class="formElement" size="10"/>
    </td>

  
</tr> 

<tr>
   <td colspan="2"> <div align="left"><B> 2. If code is running, check the Software Version </B> 
</div>    </td>
     <td > <div align="left"> 
     <input type="text" name="swver" size="10" class="formElement" >
</div></td><td><div align="left">
<input type="radio" name="swvercor" value="Correct" class="formElement" checked="true" onClick="ShowSw(0)";  > Correct </div></td><td><div align="left">
      <input type="radio" name="swvercor" value="InCorrect" class="formElement" onClick="ShowSw(1)"; > InCorrect
</div>
   </td>
</tr>
<tr>
  <td> <div align="left"> <B> 3. Flash Memory Corruption </B> </div>   
  </td>
<td> </td>
  <td > <div align="left"> <input type="radio" name="falshcorr" value="YES" class="formElement" checked="true" > YES </div></td><td> <div align="left">
      <input type="radio" name="falshcorr" value="NO" class="formElement"> NO
</div>
   </td>
</tr>
<tr>
  <td colspan="2">  <div align="left"> <B> 4. If Software Version is correct, check for CAN Parameter Configuration </B> </div>   
  </td>

  <td colspan=""> <div align="left"> <input type="radio" name="canparam" value="Correct" class="formElement" checked="true"> Correct </div></td>
      <td><div><input type="radio" name="canparam" value="InCorrect" class="formElement"> InCorrect </div>
  </td>
</tr>
<tr>
  <td colspan="2"> <div align="left"> <B>5. GPS Data </B> </div>   
  </td>
  <td > <div align="left"> <input type="radio" name="gpsdata" value="Receiving"  checked="true"> Receiving </div></td>
     <td colspan="2"><div align="left"><input type="radio" name="gpsdata" value="Not Receiving" > Not Receiving 
  </div></td>

 </tr>


 <tr>
  <td> <div align="left"> <B>6. Firmware Version </B>  
  
 </div>   
  </td> 
<td> </td>
  <td > <div align="left"> 
  <input type="text" name="firmvertext" class="formElement" size="10" /> </div></td><td><div align="left">
  <input type="radio" name="firmver" value="Correct" class="formElement" onClick="ShowFirm(0)"; checked="true" > Correct </td> </div><td> <div align="left"> 
      <input type="radio" name="firmver" value="InCorrect" class="formElement" onClick="ShowFirm(1)"; > InCorrect  </div>
  </td>
 </tr>
 <tr>
  <td> <div align="left"> <B>7. Is Mail ID created </B>  
 </div>   
  </td>
<td> </td>
  <td colspan="3"> <div align="left"> 
  <input type="text" name="mailid" class="formElement"  /> &nbsp;&nbsp;&nbsp;&nbsp;
  <input type="radio" name="mailcrt" value="Yes" class="formElement" onClick="ShowMail(0)"; checked="true"> Yes
 &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" name="mailcrt" value="No" class="formElement" onClick="ShowMail(1)"; > No  </div>
  </td>
 </tr>
 <tr>
  <td colspan="2"> <div align="left"> <B>8. Is Unit Configured in Server DB </B>  
 </div>  
  </td>
      <td colspan="3"> <div align="left"> 
      <input type="radio" name="unitdb" value="Yes" class="formElement" checked="true"> Yes
 &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" name="unitdb" value="No" class="formElement"> No  </div>
  </td>
 </tr>
 <tr>
  <td colspan="2"> <div align="left"> <B>9. If configured, is Unit Configured correctly? </B>  
 </div>  
  </td>
      <td colspan="3"> <div align="left"> 
      <input type="radio" name="confcorr" value="Correct" class="formElement" checked="true"> Correct
 &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" name="confcorr" value="InCorrect" class="formElement" > InCorrect  </div>
  </td>
 </tr> 
 <tr>
  <td colspan="2"> <div align="left"> <B>10. If Software Version is correct, but downloaded through DOTA, then check working </B>  
 </div>  
  </td>
      <td colspan="3"> <div align="left"> 
      <input type="radio" name="dota" value="Correct" class="formElement" checked="true"> Correct
 &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" name="dota" value="InCorrect" class="formElement"> InCorrect  </div>
  </td>
 </tr>
<!-- 
<tr>
 <td> <div align="left"> <B> 5. Power Supply PCB Version </B></div> 
</td>

<td> <div align="left">
       <select name="powerpcb" class="formElement"> <option value="Select"> Select </option>
    <option value="APSU3V1"> APSU3V1 </option> 
    <option value="APSU4V0"> APSU4V0 </option> 
    <option value="TWA02V4"> TWA02V4 </option>  </select>
</div> </td>
</tr>-->
<tr>
  <td colspan="2"> <div align="left"> <B>11. Last Date of Data Received </B>  
 </div>  
  </td>
      <td colspan="3"> <div align="left"> 
       <input type="text" name="dterec" id="dterec" size="13" class="formElement" />    
  <input type="button" name="trigger1" id="trigger1" value="Rec. Date" class="formElement" >
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "dterec",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger1"       // ID of the button
             }
                           );
             </script>
       
        </div>
  </td>
 </tr> 
</table></td>
</tr>
<!--<% sql1="select * from qutcommentlist order by CmntList asc ";
   rs1=stmt1.executeQuery(sql1);
%>-->
<tr>
    <td  colspan="7" bgcolor="Lightgreen"><div align=""Center><b><font size="2" Color="maroon">Other</font></div> </td> 
</tr>
<tr>
  <td> <div align="left"> <B>1. Comment &nbsp;&nbsp;&nbsp; </B> </div> </td>
<td></td>
<td > <div align="Center">

<input type="text" name="comment" class="formElement"  />
</div></td>  <td> </td><td> </td>
</tr>

<% sql2="select * from qutdebitlist order by DebitList asc ";
   rs2=stmt1.executeQuery(sql2);
%>
<tr>

  <td> <div align="left"> <B>2. Debit Note &nbsp;&nbsp;&nbsp;  </B> </div> </td>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<td > <div align="left">
<td>
   <select name="debnote" class="formElement" onChange="OnChangeFunc2(this);"> <option value="Select"> Select </option> 
<% while(rs2.next())
   { %>
      <option value="<%=rs2.getString("DebitList") %>" > <%=rs2.getString("DebitList") %> </option> 
<% } %>
      <option value="Other"> Other </option></select>&nbsp;&nbsp;&nbsp;
   <input type="text" name="othdeb" class="formElement" style="visibility:hidden" />
 </div>
  </td>  
</tr>  
</table>

<br>
<br>
<table class="stats">
  <tr>
      <td colspan="3"> <input type="submit" name="submit" value="Submit" class="formElement" /> </td>
  </tr>
</table>

<%

} catch(Exception e) { out.println("Exception----->" +e); }

finally
{
con1.close();
con2.close();
}
%>
<br>
<br>
<table border="1" width="100%">
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>

</form>

</td></tr>
</table>

