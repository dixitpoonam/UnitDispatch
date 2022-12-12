<%@ include file="menuheader.jsp"%>
<!-- 
  Module Name : Main Page after Successful Validation
  Creator : SHOAIB F BAGWAN
  Date of Creation : 24/06/2012
  Modifier :
  Date of Modification :7/08/2012
  Reason of Modification :Designinig & Validation
  Description :Quick Test Page after Used Into The UnitDispatch Validation
-->
<script language="javascript">
var simnotsame="No";
var mobnotsame="No";
var powsuptest="No";
var gsmled="No";
var swver="Yes";
var firmver="Yes";
var mailid="Yes";
var phidmg="No";
//var othcomment="No";
//var othdebit="No";
var condet="No";
function formvalidate()
{ 
	var v1=document.mainform.unitid.value;
	var v2=document.mainform.cust.value;
	var v3=document.mainform.utype.value;
	var v4=document.mainform.avlpcb.value;
	var v5=document.mainform.powerpcb.value;
	var v6=document.mainform.wmsn.value;
	var v7=document.mainform.wave.value;
	var v8=document.mainform.firmware.value;
 	var v10=document.mainform.mobno1.value;
	var v11=document.mainform.simno1.value;
  	var v15=document.mainform.cn7inpvol.value;
	var v18=document.mainform.atwopen1.value;
	var v20=document.mainform.swver.value; 
	//var v21=document.mainform.firmvertext.value; 
	var v25=document.mainform.Comment.value;
	var v26=document.mainform.debnote.value;
	var v27= document.mainform.correct.value;
	//var v27=document.mainform.othcomment.value;
	//var v28=document.mainform.othdeb.value;  
	var v28=document.mainform.physical.value;
	//var v32 = valButton(document.getElementById("pwrsupply"));
	var v30 = valButton(document.mainform.pcbmodreq);
	var v31 = valButton(document.mainform.pcbmod);
    var v32 = valButton(document.mainform.pwrsupply);
        var v29=document.getElementById("msgtxt").value;
       v29 = v29.replace(/^\s+|\s+$/g,"");//trim
      if(!(v29.length==0))
  	{
    	  var msg=v29.substring(0,22);
    	 // alert(msg);
  	  	if(msg=="The Unit is Configured")
  	  	{
  	  		alert("The Unit is configured in Vehicle so you cannot QuickTest it");
       		return false;
  	  	}
  	  	else if(!(v29=="Received" || v29=="New Unit"))
    	  	{
  		alert("The Unit has not been received so you cannot QuickTest it");
     		return false;
    	  	}
    	  	
  	}
	 
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
	if(v2.length==0)
  	{
  		alert("Please enter Customer Name");
     		return false;
  	}
 	if(isNaN(v2))
  	{
  	} 
  	else
  	{
  		alert("Please enter proper Customer Name");
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

	
    if (v32 == null) 
    {
         alert('Please select Power supply');
         return false;
    }
  	
	
    if (v30 == null) 
    {
         alert('Please select PCB modification required');
         return false;
    }
    
   
    if (v31 == null) 
    {
         alert('Please select PCB modifications');
         return false;
    }

    if(v26.length=="")
	{ 
		
        	alert("Please select debit Note from the list");
       		return false;
   		
	}
	if(v27.length=="")
	{ 
		
        	alert("Please select Correction Done from the list");
       		return false;
   		
	}
    
	if(swver=="Yes")
	{
		if(v20.length=="")
		{
			alert("Enter Software version in Software Testing");
			return false;
		}
		
	}
	
	if(v21=="Select")
	{
		alert("Please select Firmware version in Software Testing");
		return false;
	}
    	
	if(v25.length=="")
	{ 
		
       			alert("Please select comment from the list");
			return false;
		
       	}
        
                    if(phidmg=="Yes")
           {
               
               if(v28.length=="")
                   {
                       alert("Please Select Physical Damage Comment from the list");
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
function ShowSIM(id)
{
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
    		//document.mainform.simno.style.visibility='visible';
     		simtext="Yes";
  	}
}
function ShowNewProbText()
{ 
       	
      othcomment="Yes";
      document.mainform.othcomment.style.visibility="visible";
    
}
function ShowNewProbText1()
{ 
       	
      othdebit="Yes";
      document.mainform.othdeb.style.visibility="visible";
    
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

function valButton(btn) {
    var cnt = -1;
    for (var i=btn.length-1; i > -1; i--) {
        if (btn[i].checked) {cnt = i; i = -1;}
    }
    if (cnt > -1) return btn[cnt].value;
    else return null;
}


function displayRow(ind)
{
	var row = document.getElementById("peritable");
	if(ind==0) 
		row.style.display = 'none';
	else
		row.style.display = '';
}


function AJAXFunc1()
{ 
	//alert("hi");
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
     	 	   if(ajaxRequest.readyState ==4)
                        {
                           	var reslt=ajaxRequest.responseText;
                         	//alert(reslt);
  				var reslt=ajaxRequest.responseText;
                           	var mySplitResult = reslt.split("#");
                           var wmsn= mySplitResult[0].replace(/^\s+|\s+$/g,"");   
                           	document.mainform.wmsn.value = wmsn;
                          	document.mainform.mobno.value = mySplitResult[1];
                           	document.mainform.simno.value = mySplitResult[2];
                           	document.mainform.cust.value = mySplitResult[3];
			    			document.mainform.warranty.value = mySplitResult[4];
                           	document.mainform.utype.value = mySplitResult[5];
                           	document.mainform.manufactby.value = mySplitResult[7]; 
                            document.mainform.msgtxt.value= mySplitResult[8];
                            document.mainform.unitlife.value= mySplitResult[9];
                            document.mainform.iswarranty.value= mySplitResult[10];    
                            document.mainform.recdate.value= mySplitResult[11];
                            document.mainform.duration.value= mySplitResult[12];
                            document.mainform.psno.value= mySplitResult[13];
                            document.mainform.pcbno.value= mySplitResult[14];
                            document.mainform.boxno.value= mySplitResult[15];
                            document.mainform.batteryno.value= mySplitResult[16];
                            document.getElementById('cpwmsnno').innerHTML = mySplitResult[17];
                            document.getElementById('cpsimno').innerHTML = mySplitResult[18];
                            document.getElementById('cpmobno').innerHTML = mySplitResult[19];
                            document.getElementById('cppsno').innerHTML = mySplitResult[20];
                            document.getElementById('cppcbno').innerHTML = mySplitResult[21];
                            document.getElementById('cpboxno').innerHTML = mySplitResult[22];
                            document.getElementById('cpbatteryno').innerHTML = mySplitResult[23];
				//document.mainform.dterec.value = mySplitResult[6];
                                 //alert(mySplitResult[8]);
		      } 
     	 	   
         	   }
               var queryString = "?unid=" +vv1;
 	      ajaxRequest.open("GET", "AjaxgetQTdata.jsp" + queryString, true);
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

function OnChangeTxtBx()
{ 
	if(document.mainform.phydmg.checked == true)
	{ 
		document.mainform.physical.style.visibility="visible";
                document.mainform.insrt.value="Yes";
		phidmg="Yes";
	}
	else
	{
		document.mainform.physical.style.visibility="hidden";
                 document.mainform.insrt.value="No";
		phidmg="No";
	}
}
               
function localityChange(frm)
{
//	alert("in function");
	//var count = document.stop.cnt.value;
	var locality = document.getElementById("correct");
	//alert(locality.value);
	
	if(locality.value=='other')
	{
	//alert("other is selected");
	 document.mainform.comment.style.visibility="visible";
	 alert("Enter comment other than available  other comments in text box");
	}
}

function copy1(type)
{
	if(type == 'msn')
	{
		
		document.getElementById('wmsn').value = document.getElementById("cpwmsnno").innerHTML;
	}
	else if(type == 'sim')
	{
		document.getElementById('simno').value = document.getElementById("cpsimno").innerHTML;
	}
	else if(type == 'mob')
	{
		document.getElementById('mobno').value = document.getElementById("cpmobno").innerHTML;
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


<table width="95%" align="Center" border="1">
	<tr>
		<td></td>
	</tr>

	<%!Connection con1, con2;
	String entby = "", userrole = "", typevalue1 = "";%>
	<tr>
		<td>
		<form name="mainform" action="QTinsert.jsp"	onSubmit="return formvalidate()";>
		<%
			entby = session.getAttribute("user").toString();
			userrole = session.getAttribute("urole").toString();
			typevalue = session.getAttribute("typeval").toString();
		%> <%
 	try {
 		Class.forName(MM_dbConn_DRIVER);
 		con1 = DriverManager.getConnection(MM_dbConn_STRING1,
 				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
 		con2 = DriverManager.getConnection(MM_dbConn_STRING,
 				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
 		Statement stmt1 = con1.createStatement(), stmt2 = con2
 				.createStatement(), stmt3 = con1.createStatement(), stmt4 = con2
 				.createStatement(),stmtActualLife=con2.createStatement(),stmtALife=con2.createStatement(),stmtTotalLife=con2.createStatement(),stmtTLife=con2.createStatement();
 		ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null, rs5 = null, rs6 = null, rs7 = null, rs8 = null, rs9 = null, rs10 = null, rs11 = null;
 		String sql1 = "", sql2 = "", sql3 = "", sql4 = "", sql5 = "", sql6 = "", sql7 = "", sql8 = "", sqlComments = "", sqlLatestDispatch = "", sqlLatestReceive = "",sqlReplace="",sqlActualLife="",sqlTotalLife="";
 		int Counter = 1;
 		String LatestReceived = "", LatestDispatched = "",Actuallife="",TotalLife="";

 		//String empname=request.getParameter("empname");
 		//String emptype=request.getParameter("role");
 %> <%
 	String inserted = request.getParameter("inserted");
 		if (inserted == null) {
 		} else {
 			String ref = request.getParameter("refno");
 %> <br>
		<br>
		<table class="stats">
			<tr>
				<td>
				<div align="center"><font color="maroon" size="2"> <B>
				Successfully Inserted. Reference No = <%=ref%> </B></font></div>
				</td>
			</tr>
		</table>
		<%
			}
		%> <input type="hidden" name="UserRole" value="<%=userrole%>" /> <input
			type="hidden" name="EntBy" value="<%=entby%>" /> <input
			type="hidden" name="typevalue" value="<%=typevalue%>" /> <%
 	java.util.Date d = new java.util.Date();
 		String dte = "" + (d.getYear() + 1900) + "-"
 				+ (1 + d.getMonth()) + "-" + d.getDate();
 		java.util.Date datefrmdb = new SimpleDateFormat("yyyy-MM-dd")
 				.parse(dte);
 		Format formatter = new SimpleDateFormat("dd-MMM-yyyy");
 		String nwfrmtdte = formatter.format(datefrmdb);
 		java.util.Date datefrmdb1 = new SimpleDateFormat("yyyy-MM-dd")
 				.parse(dte);
 		Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
 		String nwfrmtdte1 = formatter1.format(datefrmdb1);
 %> <input type="hidden" name="tdydte" value="<%=nwfrmtdte1%>" /> <br>
		<br>
		<!--
-->
		<table class="stats" width="100%">
			<tr>
				<td>
				<div align="left"><label for="dte"> <B> Date:<font
					color="maroon"><%=nwfrmtdte%> </font></B></label></div>
				</td>
				<td>
				<div align="left"><font size="3" color="maroon"><b>Testing
				Detail Form </b></font></div>
				</td>
			</tr>

		</table>
		<table width="100%">
			<tr>
				<td>
				<center><input type="text" name="msgtxt" id="msgtxt"
					style="border: none; color: red" size="30" /></center>
				</td>
			</tr>
		</table>
		<!--
     class="stats"
-->
		<table width="100%">
			
			<tr>
				<td colspan="9" bgcolor="Lightgreen">
				<div><b><font size="2" Color="maroon">
				Technicians Comments</font></b></div>
				</td>
			</tr>

			<%
				sqlLatestDispatch = "select concat(max(Dispdate),max(DispTime)) as latestDispatch from db_gps.t_unitmasterhistory where Status in ('Dispatched','InterDisp') and Unitid='"
							+ request.getParameter("unid")
							+ "' group by Dispdate order by Dispdate desc limit 1";
					rs10 = stmt4.executeQuery(sqlLatestDispatch);
					if (rs10.next()) {
						LatestDispatched = rs10.getString("latestDispatch");
					}

					System.out.println("Latest dispatch--->" + LatestDispatched);
					sqlLatestReceive = "select Concat(Rdate,Rtime) as RdateTime from db_CustomerComplaints.t_unitreceived where Unitid= '"
							+ request.getParameter("unid")
							+ "' group by Rdate order by Rdate desc limit 1";
					rs11 = stmt4.executeQuery(sqlLatestReceive);
					if (rs11.next()) {
						LatestReceived = rs11.getString("RdateTime");
					}

					System.out.println("Latest Receive--->" + LatestReceived);
					sqlComments = "select * from t_techspecialrep where cmmt_type='Unit' and unitid = '"
							+ request.getParameter("unid")
							+ "' and EntDateTime >= '"
							+ LatestDispatched
							+ "' and EntDateTime <= '"
							+ LatestReceived
							+ "'order by EntDateTime desc limit 3";
					System.out.println("Comment Query-->" + sqlComments);
					rs9 = stmt3.executeQuery(sqlComments);
			%>
			
			<tr>
			  <td>
			  <a href="#" onClick="window.open ('spcmntabtveh.jsp?unitid=<%=request.getParameter("unid")%>','win1','width=780,height=300,location=0,menubar=0,scrollbars=1,status=0,toolbar=0,resizable=0')"><font color="Red" size="2">More..</font></a>
					<tr bgcolor="#BDBDBD">
						<td width="1px;">
						<div align="center" style="size: 2px"><b> Sr.No </b></div>
						</td>
						<td>
						<div align="center"><b> Ent Date Time </b></div>
						</td>
						<td>
						<div align="center"><b> Comment   </b></div>
						</td>
						<td>
						<div align="center"><b> Extra Comment   </b></div>
						</td>
						<td>
						<div align="center"><b> Action to be Taken by </b></div>
						</td>
						<td>
						<div align="center"><b> Red Light Status </b></div>
						</td>
						<td>
						<div align="center"><b> Green Light Status  </b></div>
						</td>
						<td>
						<div align="center"><b> GPS Blue Light Status  </b></div>
						</td>
						<td>
						<div align="center"><b> Ringing   </b></div>
						</td>
					</tr>
					<%
						while (rs9.next()) {
					%>
					<tr bgcolor="#EFEFEF">
						<td width="1px;">
						<div align="right"><%=Counter%></div>
						</td>
						<td>
						<div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
							.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
									.parse(rs9.getString("EntDateTime")))%>
						</div>
						</td>
						<td>
						<div align="left"><%=rs9.getString("SpComment")%>
						</div>
						</td>
						<td>
						<div align="left"><%=rs9.getString("ClosingExtra_comment")%>
						</div>
						</td>
						<td>
						<div align="left"><%=rs9.getString("ActionToBeTakenBy")%>
						</div>
						</td>
						<td>
						<div align="left"><%=rs9.getString("RedLight")%>
						</div>
						</td>
						<td>
						<div align="left"><%=rs9.getString("GreenLight")%>
						</div>
						</td>
						<td>
						<div align="left"><%=rs9.getString("GPSLight")%>
						</div>
						</td>
						<td>
						<div align="left"><%=rs9.getString("Ringing")%>
						</div>
						</td>
					</tr>
					<%
						Counter++;
							}
					%>
				</td>
			</tr>
			
			<tr bgcolor="lightgreen">
				<td colspan="11"">
				<div align="Center"><b><font size="2" color="maroon">Unit
				Details</font></b></div>
				</td>
			</tr>
			<tr>
				<td width="16%">
				<div align="left"><B> 1. Unit ID </B></div>
				</td>
				<td>
				<div align="left"><input type="text" name="unitid" id="unitid"
					size="13" class="formElement" onBlur="AJAXFunc1()"
					; value="<%=request.getParameter("unid")%>" /></div>
				</td>
				<%
					sql1 = "select distinct(TypeValue) from t_security where TypeofUser in('Transporter', 'Manufacturer') order by TypeValue asc ";
						rs1 = stmt2.executeQuery(sql1);
				%>
				<td width="16%">
				<div align="left"><B> 2. Customer </B></div>
				</td>
				<td width="16%">
				<div align="left"><input type="text" name="cust" id="cust"
					size="18" class="formElement" readonly /></div>
				</td>
				<%
					sql2 = "select * from t_typeofunits order by typename asc ";
						rs2 = stmt1.executeQuery(sql2);
				%>
				<td>
				<div align="left"><B> 3. Unit Type </B></div>
				</td>
				<td>
				<div align="left"><select name="utype" class="formElement">
					<option value="Select">Select</option>
					<option value="SMTP">SMTP</option>
					<option value="FTP">FTP</option>
					<option value="IP">IP</option>
				</select></div>
				</td>

			</tr>
			<tr>
				<td>
				<div align="left"><B> 4. AVL PCB Version </B></div>
				</td>
				<td>
				<div align="left"><select name="avlpcb" class="formElement">
					<option value="Select">Select</option>
					<option value="TWA01V4">TWA01V4</option>
					<option value="TWP1V63">TWP1 V6.3</option>
					<option value="TWP1_62">TWP1_6.2</option>
					<option value="TWP1V63">TW P2_3.1</option>
					<option value="TWP1_62">TW P2_3.0</option>
					<option value="TW-SIMARM60_2V1">TW-SIMARM60-2V1</option>
					<option value="TWP2_V3_0">TW P2 V3.0</option>
					<option value="TWP2_V3_1">TW P2 V3.1</option>


				</select></div>
				</td>
				<td width="15%">
				<div align="left"><B> 5. Power Supply PCB Version </B></div>
				</td>
				<td>
				<div align="left"><select name="powerpcb" class="formElement">
					<option value="Select">Select</option>
					<option value="APSU3V1">APSU3V1</option>
					<option value="APSU4V0">APSU4V0</option>
					<option value="TWA02V4">TWA02V4</option>
					<option value="APSU4V0_PC">APSU4V0+PC</option>
				</select></div>
				</td>
				<td>
				<div align="left"><B> 6. WMSN No. </B></div>
				</td>
				<td>
				<div align="left"><input type="text" name="wmsn" id="wmsn"
					align="left" size="20" maxlength="15" class="formElement" /></div>
				<div align="left"><a href="#" onclick="copy('msn')";><B>Previous
				Record - </B></a></div>
				<div align="left"><label id="cpwmsnno" style="color: blue">
				</label></div>
				</td>
			</tr>
			<%
				sql3 = "select * from t_utmodule order by module asc";
					rs3 = stmt1.executeQuery(sql3);
			%>
			<tr>
				<td width="15%">
				<div align="left"><B> 7. Wavecom Module Version </B></div>
				</td>
				<td>
				<div align="left"><select name="wave" class="formElement">
					<option value="Select">Select</option>
					<%
						while (rs3.next()) {
					%>
					<option value="<%=rs3.getString("module")%>"><%=rs3.getString("module")%>
					</option>
					<%
						}
					%>
				</select> <%
 	sql4 = "select * from t_utfirmware order by firmware asc";
 		rs4 = stmt1.executeQuery(sql4);
 %>
				</div>
				</td>
				<td>
				<div align="left"><B> 8. Firmware Version </B></div>
				</td>
				<td>
				<div align="left"><select name="firmware" class="formElement">
					<option value="Select">Select</option>
					<%
						while (rs4.next()) {
					%>
					<option value="<%=rs4.getString("firmware")%>"><%=rs4.getString("firmware")%>
					</option>
					<%
						}
					%>
				</select></div>
				</td>
				<td width="15%">
				<div align="left"><B> 9.Sim Presence in unit </B></div>
				</td>
				<td colspan="2">
				<div align="left"><input type="radio" name="simm" value="Yes"
					class="formElement" onClick="ShowSIM(0)" ; CHECKED>Yes <input
					type="radio" name="simm" value="No" class="formElement"
					onClick="ShowSIM(1)"; >No</div>
				</td>
			</tr>
			<tr>
				<td>
				<div align="left"><B>10. SIM No.</B></div>
				</td>
				<td>
				<div align="left"><input type="text" name="simno" id="simno"
					size="13" class="formElement" /></div>
				<div align="left"><a href="#" onclick="copy('sim')";><B>Previous
				Record - </B></a></div>
				<div align="left"><label id="cpsimno" style="color: blue"></label></div>
				</td>
				<td>
				<div align="left"><B> 11. Mobile No</B>
				</td>
				<td>
				<div align="left"><input type="text" name="mobno" id="mobno"
					size="13" class="formElement" /></div>
				</div>
				<div align="left"><a href="#" onclick="copy('mob')";><B>Previous
				Record - </B></a></div>
				<div align="left"><label id="cpmobno" style="color: blue"></label></div>
				</td>
				<td>
				<div align="left"><B> 12.Peripheral type</B></div>
				</td>
				<td colspan="1">
				<div align="left"><input type="radio" name="peri"
					value="Plain" class="formElement" onClick="displayRow(0);" CHECKED>Plain
				<input type="radio" name="peri" value="Voice" class="formElement"
					onClick="displayRow(1);">Voice</div>
				</td>
			</tr>
			<tr>
				<td colspan="1">
				<div align="left"><input type="checkbox" name="sim1"
					onChange="OnChangeChkBx(this);" /> Not Same</div>
				</td>
				<td colspan="1">
				<div align="left"><input type="text" name="simno1"
					class="formElement" size="13" maxlength="8"
					style="visibility: hidden" /></div>
				</td>
				<td colspan="1">
				<div align="left"><input type="checkbox" name="mob1"
					onChange="OnChangeChkBx1(this);" /> Not Same</div>
				</td>
				<td colspan="1">
				<div align="left"><input type="text" name="mobno1"
					class="formElement" size="13" maxlength="10"
					style="visibility: hidden" /></div>
				</td>
				<td colspan="1">
				<div align="left"><b>13.Unit Warranty</b></div>
				</td>
				<td><b><font color="maroon"><input type="text"
					name="warranty"
					style="font-family: Verdana; color: #660060; border: 2px solid #C0C0C0; background-color: #DOE0C0"
					class="formElement" readOnly /></font></b></td>
			</tr>
			<tr>
				<td colspan="1">
				<div align="left"><b>14.Unit Life</b></div>
				</td>
				<td><b><font color="maroon"><input type="text"
					name="unitlife"
					style="font-family: Verdana; color: #660060; border: 2px solid #C0C0C0; background-color: #DOE0C0"
					class="formElement" readOnly /></font></b></td>
				<td colspan="1">
				<div align="left"><b>15.Vehicle warranty:</b></div>
				</td>
				<td><b><font color="maroon"><input type="text"
					name="iswarranty"
					style="font-family: Verdana; color: #660060; border: 2px solid #C0C0C0; background-color: #DOE0C0"
					class="formElement" readOnly /></font></b></td>
			</tr>
			<tr>
				<td colspan="1">
				<div align="left"><b>16.Receive Date:</b></div>
				</td>
				<td><b><font color="maroon"><input type="text"
					name="recdate"
					style="font-family: Verdana; color: #660060; border: 2px solid #C0C0C0; background-color: #DOE0C0"
					class="formElement" readOnly /></font></b></td>
				<td colspan="1">
				<div align="left"><b>17.Duration(HH:mm):</b></div>
				</td>
				<td><b><font color="maroon"><input type="text"
					name="duration"
					style="font-family: Verdana; color: #660060; border: 2px solid #C0C0C0; background-color: #DOE0C0"
					class="formElement" readOnly /></font></b></td>
			</tr>
			<tr>
				<td colspan="1">
				<div align="left"><b>18.PS No</b></div>
				</td>
				<td><b><font color="maroon"><input type="text"
					name="psno" id="psno"
					style="font-family: Verdana; color: #660060; border: 2px solid #C0C0C0; background-color: #DOE0C0"
					class="formElement" /></font></b>
				<div align="left"><a href="#" onclick="copy('ps')";><B>Previous
				Record - </B></a></div>
				<div align="left"><label id="cppsno" style="color: blue"></label></div>
				</td>
				<td colspan="1">
				<div align="left"><b>19.PCB NO:</b></div>
				</td>
				<td><b><font color="maroon"><input type="text"
					name="pcbno" id="pcbno"
					style="font-family: Verdana; color: #660060; border: 2px solid #C0C0C0; background-color: #DOE0C0"
					class="formElement" /></font></b>
				<div align="left"><a href="#" onclick="copy('pcb')";><B>Previous
				Record - </B></a></div>
				<div align="left"><label id="cppcbno" style="color: blue"></label></div>
				</td>
			</tr>
			<tr>
				<td colspan="1">
				<div align="left"><b>20.Box No:</b></div>
				</td>
				<td><b><font color="maroon"><input type="text"
					name="boxno" id="boxno"
					style="font-family: Verdana; color: #660060; border: 2px solid #C0C0C0; background-color: #DOE0C0"
					class="formElement" /></font></b>
				<div align="left"><a href="#" onclick="copy('box')";><B>Previous
				Record - </B></a></div>
				<div align="left"><label id="cpboxno" style="color: blue"></label></div>
				</td>
				<td colspan="1">
				<div align="left"><b>21.Battery No:</b></div>
				</td>
				<td><b><font color="maroon"><input type="text"
					name="batteryno" id="batteryno"
					style="font-family: Verdana; color: #660060; border: 2px solid #C0C0C0; background-color: #DOE0C0"
					class="formElement" /></font></b>
				<div align="left"><a href="#" onclick="copy('battery')";><B>Previous
				Record - </B></a></div>
				<div align="left"><label id="cpbatteryno" style="color: blue"></label></div>
				</td>
			</tr>
			<tr id="peritable" style="display: none">
				<td colspan="8">
				<div align="right">
				<table width="100%">
					<tr>
						<td>
						<div align="left"><input type="checkbox" name="HDphone"
							value="hdphone" /><b>Head phone broken</b></div>
						</td>

						<td>
						<div align="left"><input type="checkbox" name="Buzzconn"
							value="BuzzconnOn" /> <b>Buzzer connection ON </b></div>
						</td>
						<td>
						<div align="left"><input type="checkbox" name="kpbroke"
							value="Keypadbroken"> <b> Keypad Broken </b></div>
						</td>
					</tr>
					<tr>

						<td>
						<div align="left"><input type="checkbox" name="Onlyincm"
							value="incoming working"> <b>Only incoming call
						working </b></div>
						</td>

						<td>
						<div align="left"><input type="checkbox" name="Led"
							value="led glow"> <b>LED out going glow for incoming
						cut </b></div>
						</td>

						<td>
						<div align="left"><input type="checkbox" name="NotBuzz"
							value="does not Buzz"> <b> Buzzer doesn't buzz for
						incoming call</b></div>
						</td>
					</tr>
				</table>
				</div>
				</td>
			</tr>





			<tr>
				<td colspan="9" bgcolor="Lightgreen">
				<div align="Center"><b><font size="2" Color="maroon">
				Visual Inspection</font></b></div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<div align="left"><B> 1. RED LED </B></div>
				</td>
				<td colspan="4">
				<div align="left"><input type="radio" name="led1" value="ON"
					class="formElement" onClick="ShowPowSupTest(0)" ; CHECKED>
				ON &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="led1"
					value="OFF" class="formElement" onClick="ShowPowSupTest(1)";>
				OFF</div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<div align="left"><B> 2. GREEN LED </B></div>
				</td>
				<td colspan="4">
				<div align="left"><input type="radio" name="led3" value="OFF"
					class="formElement" onClick="ShowPowSupTest(1);">
				&nbsp;&nbsp;&nbsp;&nbsp; OFF &nbsp;&nbsp;&nbsp;&nbsp; <input
					type="radio" name="led3" value="BLINKING" class="formElement"
					CHECKED onClick="ShowVis6(0);">&nbsp;&nbsp;&nbsp;&nbsp;BLINKING
				&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="led3"
					value="NOT BLINKING" class="formElement" onClick="ShowVis6(1);">
				&nbsp;&nbsp;&nbsp;&nbsp; NOT BLINKING</div>
				</td>
			</tr>

			<tr>

				<td colspan="3">
				<div align="left"><B> 3. GPS Antenna LED </B></div>
				</td>
				<td colspan="4">
				<div align="left"><input type="radio" name="gpsantled"
					id="gpsantled" value="ON" class="formElement" CHECKED> ON
				&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="gpsantled"
					id="gpsantled" value="OFF" class="formElement"> OFF</div>
				</td>

			</tr>
			<tr>

				<td colspan="3">
				<div align="left"><B> 4.Power supply </B></div>
				</td>
				<td colspan="4">
				<div align="left"><input type="radio" name="pwrsupply"
					id="pwrsupply" value="Old" class="formElement"> Old
				&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="pwrsupply"
					id="pwrsupply" value="New" class="formElement"> New</div>
				</td>

			</tr>
			<tr>

				<td colspan="3">
				<div align="left"><B> 5.PCB modification required </B></div>
				</td>
				<td colspan="4">
				<div align="left"><input type="radio" name="pcbmodreq"
					id="pcbmodreq" value="Yes" class="formElement"> Yes
				&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="pcbmodreq"
					id="pcbmodreq" value="No" class="formElement"> No</div>
				</td>

			</tr>
			<tr>

				<td colspan="3">
				<div align="left"><B> 6.PCB modifications</B></div>
				</td>
				<td colspan="4">
				<div align="left"><input type="radio" name="pcbmod"
					id="pcbmod" value="Correct" class="formElement"> Correct
				&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="pcbmod"
					id="pcbmod" value="Incorrect" class="formElement">
				Incorrect</div>
				</td>

			</tr>


			

           <tr>
				<td colspan="9" bgcolor="Lightgreen">
				<div><b><font size="2" Color="maroon">
				Unit Life(Actual/Total)</font></b></div>
				</td>
			</tr>
           <%
           
           sqlTotalLife ="Select * from db_gps.t_unitreplacement where InstDate between'"+LatestDispatched+"' and '"+LatestReceived+"' and InstType='Rep' order by InstDate desc";
           ResultSet rsTotalLife = stmtTotalLife.executeQuery(sqlTotalLife);
           if(rsTotalLife.next())
           {
        	   TotalLife = rsTotalLife.getString("UnitLife");
           }
           
           
           
           sqlActualLife="select * from db_gps.t_unitreplacement where NewUnitID='"+request.getParameter("unid")+"' and EntDate >= '"+LatestDispatched+"' and EntDate <= '"+LatestReceived+"' order by InstDate ASC limit 1";
           ResultSet rsReplace = stmtActualLife.executeQuery(sqlActualLife); 
           if(rsReplace.next())
           {
        	   String InstDate=rsReplace.getString("EntDate");
				String InstTime=rsReplace.getString("InstTime");
				sqlActualLife="select * from db_gps.t_unitreplacement where OldUnitID='"+request.getParameter("unid")+"' and EntDate >= '"+InstDate+"' and EntDate <= '"+LatestReceived+"'";
				System.out.println(sqlActualLife);
				ResultSet rsALife =stmtALife.executeQuery(sqlActualLife);
				if(rsALife.next())
				{
					Actuallife=rsALife.getString("UnitLife");
				}
           }
           
           %>
           <tr>
            <td>
              <div>
                <table border="1" align="center" class="sortable">
					<tr bgcolor="#BDBDBD">
						<td>
						<div align="center"><b> Total Life (No .Of Days) </b></div>
						</td>
						<td>
						<div align="center"><b> Actual Life (No. Of Days) </b></div>
						</td>
				   </tr>
				   <tr>
				   <td>
				   <div align="center"><%=TotalLife %></div>
				   </td>
				   <td>
				   <div align="center"><%=Actuallife %></div>
				   </td>
				   </tr>
				</table>
              </div>
            </td>
           </tr>

			<tr>
				<td colspan="9" bgcolor="Lightgreen">
				<div><b><font size="2" Color="maroon">
				Hardware Testing</font></b></div>
				</td>
			</tr>
			<tr>
				<td colspan="9">
				<div align="left"><font color="maroon" size="1"> <B>Power
				Supply Testing </B> </font></div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<div align="left"><B>1. If No Expected Voltages at
				CN7-CN8, check for Input Voltage at Power Supply Input Pin </B></div>
				</td>
				<td colspan="4">
				<div align="left"><input type="radio" name="cn7inpvol"
					value="Ok" class="formElement" CHECKED> Ok
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <input type="radio"
					name="cn7inpvol" value="Not Ok" class="formElement">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Not OK</div>
				</td>

			</tr>
			<tr>
				<td colspan="3">
				<div align="left"><B> 2.Check Power Supply output Voltage
				</B></div>
				</td>
				<td colspan="4">
				<div align="left"><input type="radio" name="fusebx" value="ok"
					class="formElement" CHECKED> OK
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
					name="fusebx" value="Not OK" class="formElement"> Not OK</div>
				</td>
			</tr>

			<tr>
				<td colspan="9">
				<div align="left"><font color="maroon" size="1"> <B>
				Module Testing </B> </font></div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<div align="left"><B> 1. Check the continuty between 2
				points on Wavecom Module as per instructed by Wavecom </B></div>
				</td>
				<td colspan="4">
				<div align="left"><input type="radio" name="modtest"
					value="Short" class="formElement"> Short &nbsp;&nbsp;&nbsp;
				<input type="radio" name="modtest" value="Open" class="formElement">
				Open &nbsp;&nbsp;&nbsp; <input type="radio" name="modtest"
					value="OK" class="formElement" checked="checked"> OK</div>
				</td>
			</tr>
			<tr>
				<td bgcolor="lightgreen" colspan="9"><font size="2"
					color="maroon"><b> Software Testing </b></font></td>
			</tr>
			<tr>
				<td colspan="3">
				<div align="left"><B> 1. Is code running? Check by giving
				command 'AT+WOPEN?" </B></div>
				</td>
				<td colspan="4">
				<div align="left"><input type="radio" name="atwopen1"
					value="atwopen1" class="formElement" size="10" checked="checked" />
				&nbsp;&nbsp;&nbsp;&nbsp;AT+WOPEN=1 &nbsp;&nbsp;&nbsp;&nbsp; <input
					type="radio" name="atwopen1" value="atwopen0" class="formElement"
					size="10" /> &nbsp;&nbsp;&nbsp;&nbsp; AT+WOPEN=0</div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<div align="left"><B> 2. If code is running, check the
				Software Version </B></div>
				</td>
				<td colspan="4">
				<div align="left"><input type="text" name="swver" size="10" />
				&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="swvercor"
					value="Correct" class="formElement" checked="checked"
					onClick="ShowSw	(0)";  >Correct &nbsp;&nbsp;&nbsp;&nbsp; <input
					type="radio" name="swvercor" value="InCorrect" class="formElement"
					onClick="ShowSw(1)"; > InCorrect</div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<div align="left"><B> 3. Flash Memory Corruption </B></div>
				</td>
				<td colspan="4">
				<div align="left"><input type="radio" name="falshcorr"
					value="YES" class="formElement" checked="checked">
				YES&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="falshcorr"
					value="NO" class="formElement"> NO</div>
				</td>
			</tr>

			<tr>
				<td colspan="3">
				<div align="left"><B>4. GPS Data </B></div>
				</td>
				<td colspan="4">
				<div align="left"><input type="radio" name="gpsdata"
					value="Recieve" class="formElement" checked="checked">
				Recieve &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="gpsdata"
					value="NotRecieve" class="formElement"> Not Recieve</div>
				</td>
			</tr>
			<!--<tr>
	<td colspan="3"><div align="left">
		<B>5. Firmware Version </B>  
	</div></td> 
<%//sql5="select * from t_utfirmware order by firmware asc";
				//rs5=stmt1.executeQuery(sql5);%>
	<td colspan="4"><div align="left">
		<select name="firmvertext" class="formElement">
		<option value="Select" > Select </option>
	<%// while(rs5.next())
				//{%>
        	<option value="<%//=rs5.getString("firmware")%>" > <%//=rs5.getString("firmware")%> </option>
	<%//}%>
		</select>
	</div></td>
	
</tr>-->

			<%
				sql5 = "select * from hw_comment where CommentName='Unit' order by Comment asc ";
					rs5 = stmt1.executeQuery(sql5);
			%>
			<tr>
				<td bgcolor="lightgreen" colspan="9"><font size="2"
					color="maroon"><b> Other Details </b></font></td>
			</tr>
			<tr>
				<td colspan="2">
				<div align="left">
				<table width="100%">
					<tr>
						<td>
						<div align="left"><B>1. Comment &nbsp;&nbsp;&nbsp;</B></div>
						</td>
						<td>
						<div align="left"><select id="Comment" name="Comment"
							multiple="multiple" size="7" class="formElement">
							<%
								while (rs5.next()) {
							%>
							<option value="<%=rs5.getString("Comment")%>"><%=rs5.getString("Comment")%>
							</option>
							<%
								}
							%>

						</select> &nbsp;&nbsp;&nbsp;</div>
						</td>
					</tr>
				</table>
				</div>
				</td>

				<td colspan="2"><input type="hidden" id="inrt" name="insrt">
				<table width="100%">
					<tr>
						<%
							sql7 = "select * from hw_comment where CommentName='Physical' ";
								rs7 = stmt1.executeQuery(sql7);
						%>
						<td colspan="">
						<div align="left"><input type="checkbox" name="phydmg"
							onChange="OnChangeTxtBx(this);"> <b>2.&nbsp;Physical
						Damage: </b></div>
						</td>
						<td colspan="">
						<div align="left"><select name="physical"
							class="formElement" multiple="multiple" size="3"
							style="visibility: hidden" id="physical">



							<%
								while (rs7.next()) {
							%>
							<option value="<%=rs7.getString("Comment")%>"><%=rs7.getString("Comment")%>
							</option>
							<%
								}
							%>
						</select></div>
						</td>
					</tr>
				</table>
				</td>
				<td colspan="3">
				<table width="100%">
					<tr>
						<%
							sql6 = "select * from hw_comment where CommentName='Debit' order by Comment asc ";
								rs6 = stmt1.executeQuery(sql6);
						%>
						<td colspan="2">
						<div align="left"><B>3.Debit Note &nbsp;&nbsp;&nbsp;</B></div>
						</td>
						<td colspan="3">
						<div align="left"><select name="debnote" class="formElement"
							multiple="multiple" size="7">


							<%
								while (rs6.next()) {
							%>
							<option value="<%=rs6.getString("Comment")%>"><%=rs6.getString("Comment")%>
							</option>
							<%
								}
							%>
						</select></div>
						</td>

					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<div align="left"><B>4.Other Comment &nbsp;&nbsp;&nbsp;</B> <%
 	sql7 = "select * from hw_comment where CommentName='SentTo'   order by Comment";
 		rs7 = stmt1.executeQuery(sql7);
 %> <select name="correct" class="formElement" id="correct"
					multiple="multiple" size="5" onchange="localityChange(this)">


					<%
						while (rs7.next()) {
					%>
					<option value="<%=rs7.getString("Comment")%>"><%=rs7.getString("Comment")%>
					</option>
					<%
						}
					%>
					<option value="other">Other</option>
				</select></div>
				<br></br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea
					id="comment" name="comment" rows="3" class="formElement"
					style="visibility: hidden"></textarea></td>
				<td colspan="5">
				<div align="left"><B>5.Manufactured By &nbsp;&nbsp;</B> <input
					type="text" name="manufactby" size="15" class="formElement"
					readOnly /></div>
				</td>
			</tr>
			<tr>
				<td bgcolor="lightgreen" colspan="9"><font size="2"
					color="maroon"><b> Special Comments </b></font></td>
			</tr>
			<tr>
				<td colspan="6" width="70%">
				<div align="left"><B>1.Action Suggested
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</B><textarea name="actionSuggested"
					class="formElement"></textarea></div>
				</td>
			</tr>
		</table>

		<table class="stats">
			<tr>
				<td colspan="9">
				<div align="center"><input type="submit" name="submit"
					value="Submit" size="18" class="formElement" /></div>
				</td>
			</tr>
		</table>
		<%
			}//try
			catch (Exception e) {
				out.println("Exception----->" + e);
			} finally {
				con1.close();
				con2.close();
			}
		%>
		</form>
		</td>
	</tr>

	<tr>
		<td>
		<table border="1" width="100%">
			<tr>
				<td bgcolor="white" class="copyright" width="100%">
				<div align="center">Copyright &copy; 2008 by Transworld
				Compressor Technologies Ltd. All Rights Reserved.</div>
				</td>
			</tr>
		</table>


		</td>
	</tr>
</table>


