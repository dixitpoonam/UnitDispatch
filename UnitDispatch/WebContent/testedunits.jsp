
<%
	/*
Modified by :- shoaib bagwan
Date - 18 -07 - 12
*/
%>
<%@ include file="menuheader.jsp"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.LASTORE"%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%><html> 
<head>
<style type="text/css">
#
.demo_container {
	width: 980px;
	margin: 0 auto;
}

#demo_top_wrapper {
	margin: 0 0 20px 0;
}

#demo_top {
	height: 100px;
	padding: 20px 0 0 0;
}

#my_logo {
	font: 70px Georgia, serif;
}

/* our menu styles */
#sticky_navigation_wrapper {
	width: 100%;
	height: 50px;
}

#sticky_navigation {
	width: 100%;
	height: 50px;
	background: url(trans-black-60.png);
	-moz-box-shadow: 0 0 5px #999;
	-webkit-box-shadow: 0 0 5px #999;
	box-shadow: 0 0 5px #999;
}

#sticky_navigation ul {
	list-style: none;
	margin: 0;
	padding: 5px;
}

#sticky_navigation ul li {
	margin: 0;
	padding: 0;
	display: inline;
}

#sticky_navigation ul li a {
	display: block;
	float: left;
	margin: 0 0 0 5px;
	padding: 0 20px;
	height: 40px;
	line-height: 40px;
	font-size: 14px;
	font-family: Arial, serif;
	font-weight: bold;
	color: #ddd;
	background: #333;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
}

#sticky_navigation ul li a:hover,#sticky_navigation ul li a.selected {
	color: #fff;
	background: #111;
}
</style>

<STYLE TYPE="text/css">
<!--
#dek {
	POSITION: absolute;
	VISIBILITY: hidden;
	Z-INDEX: 200;
}
-->
</STYLE>
</head>
<body>
	<!-------------- This coding is for to show Peripherals in Pop-up (drop down) ----------------->
	<DIV ID="dek"></DIV>
<body onLoad="JavaScript:loadSearchHighlight();" bgcolor="#FFE4E1">
	<script src="searchhi.js" type="text/javascript" language="JavaScript"></script>
	<script language="JavaScript">
		
//<!--
    function loadSearchHighlight()
    {
      SearchHighlight();
      document.searchhi.h.value = searchhi_string;
      if( location.hash.length > 1 ) location.hash = location.hash;
    }
    
	// -->
	</script>

	<script class="jsbin" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
	<script type="text/javascript">
$(function() {
	 
    // grab the initial top offset of the navigation
    var sticky_navigation_offset_top = $('#sticky_navigation').offset().top;
     
    // our function that decides weather the navigation bar should have "fixed" css position or not.
    var sticky_navigation = function(){
        var scroll_top = $(window).scrollTop(); // our current vertical position from the top
         
        // if we've scrolled more than the navigation, change its position to fixed to stick to top,
        // otherwise change it back to relative
        if (scroll_top > sticky_navigation_offset_top) {
            $('#sticky_navigation').css({ 'position': 'fixed', 'top':0, 'left':0 });
        } else {
            $('#sticky_navigation').css({ 'position': 'relative' });
        }  
    };
     
    // run our function on load
    sticky_navigation();
     
    // and run it again every time you scroll
    $(window).scroll(function() {
         sticky_navigation();
    });
 
});
</script>




	<script language="javascript">
Xoffset=-60;    // modify these values to ...
Yoffset= 20;    // change the popup position.
var old,skn,iex=(document.all),yyy=-1000;
var ns4=document.layers
var ns6=document.getElementById&&!document.all
var ie4=document.all
if (ns4)
skn=document.dek
else if (ns6)
skn=document.getElementById("dek").style
else if (ie4)
skn=document.all.dek.style
  if(ns4)document.captureEvents(Event.MOUSEMOVE);
  else{
  skn.visibility="visible"
  skn.display="none"
  }
  document.onmousemove=get_mouse; 
    function show(fullcomment)
    {
     var v=fullcomment.value;  
     //alert(v); 
    popup(v,"pink"); 
    }
  function popup(msg,bak){
  var content="<TABLE  WIDTH=150 BORDER=1 BORDERCOLOR=black CELLPADDING=2 CELLSPACING=0 "+
"BGCOLOR="+bak+"><TD ALIGN=center><FONT COLOR=black SIZE=2>"+msg+"</FONT></TD></TABLE>";
  yyy=Yoffset;
   if(ns4){skn.document.write(content);skn.document.close();skn.visibility="visible";}
   if(ns6){document.getElementById("dek").innerHTML=content;skn.display='';}
   if(ie4){document.all("dek").innerHTML=content;skn.display='';}
  }
  function get_mouse(e){
  var x=(ns4||ns6)?e.pageX:event.x+document.body.scrollLeft;
  skn.left=x+Xoffset;
  var y=(ns4||ns6)?e.pageY:event.y+document.body.scrollTop;
  skn.top=y+yyy;
  }
  function kill(){
  yyy=-1000;
  if(ns4){skn.visibility="hidden";}
  else if (ns6||ie4)
  skn.display="none";
  }
  function toggleDetails(id, show)
  {
  	var popup = document.getElementById("popup"+id);
  	if (show) {
  		popup.style.visibility = "visible";
  		popup.setfocus();
  		
  	} else {
  		popup.style.visibility = "hidden";
  	}
  }
  function toggleDetails1(id, show)
  {
  	var popupx = document.getElementById("popupx"+id);
  	if (show) {
  		popupx.style.visibility = "visible";
  		popupx.setfocus();
  		
  	} else {
  		popupx.style.visibility = "hidden";
  	}
  }
</script>
	<style>
.popup {
	visibility: hidden;
}
</style>
<script language="javascript">
function GetAdd(dropdown)
{ 
	var vv1=dropdown.selectedIndex;
	var SelValue1 = dropdown.options[vv1].value;
	try
	{
		var selectValue2 = document.sendman.VenderList.value;
		//alert(selectValue2);
	}
	catch(e)
	{
		//alert('An error has occurred: '+e.message);
	}
	
	document.getElementById("newadddets").style.display='none';
	document.sendman.newadd.value="";
	document.sendman.newfuladd.value="";

	shownewadd="No";	

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
                           //alert(reslt);
                           reslt = reslt.replace(/\s+/g,'');
                           document.sendman.fuladd.value = reslt;
                           
		      } 
         	   }
               var queryString = "?VendName=" +selectValue2;
 	      ajaxRequest.open("GET", "Ajaxgetadd.jsp" + queryString, true);
	     ajaxRequest.send(null); 
}

function GetAllVendors(dropdown)
{
	var vv1=dropdown.selectedIndex;
	var SelValue1 = dropdown.options[vv1].value;
		var xmlhttp;
		if (window.XMLHttpRequest)
		  {
		  // code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		  }
		else if (window.ActiveXObject)
		  {
		  // code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		else
		  {
		  alert("Your browser does not support XMLHTTP!");
		  }
		xmlhttp.onreadystatechange=function()
		{
		if(xmlhttp.readyState==4)
		  {
	//	  alert(xmlhttp.responseText);
		  document.getElementById("dispuser").innerHTML=xmlhttp.responseText;
		  }
		}
		var queryString = "?vendor=" +SelValue1;
		xmlhttp.open("GET","AjaxgetAllVendors.jsp" + queryString,true);
		xmlhttp.send(null);
}

function SearchCrit(ind)
{ 
	if(ind=="1")
	{
		document.getElementById("dateoptions").style.display='none';
		document.getElementById("unitoptions").style.display="";
	}
	else
	{
		document.getElementById("dateoptions").style.display="";
		document.getElementById("unitoptions").style.display='none';
 	}
}

function validate()
{
	
	
		var vendorList = document.sendman.VenderList.value;
	    var dispadd=document.sendman.newfuladd.value;
		var dispuser=document.sendman.dispuser.value;
		var mode=document.sendman.mode.value;
		var dispname=document.sendman.disname.value;
		var chalan=document.sendman.chalan.value;
		var comment=document.sendman.comm.value;
		

		if(vendorList=="Select")
		{
			alert("Please Select The Vendor Name From The List To Dispatch Unit.");
			return false;
		}
		else if(dispname=="")
		{
			alert("Please enter dispatch Name");
			return false;
		}
		else if(chalan=="")
		{
			alert("Please enter Chalan no.");
			return false;
		}
		else if(comment==null)
		{
		alert("Please Insert The Comment For Dispatch");
		return false;
		}
	/*	else if(shownewadd=="Yes")
		{
			var place=document.sendman.newadd.value;
			var fuladd=document.sendman.newfuladd.value;

			if(place=="")
			{
				alert("Please enter New Place");
				return false;
			}
			if(fuladd.length<=1)
			{
				alert("Please enter Full Address");
				return false;
			}
		} 
	*/

		return true;
}

function validate1()
{
	if(document.srch.srchcrit[0].checked==true)
	{   
		var dte1=document.srch.calender.value;
		var dte2=document.srch.calender1.value;		
	
		if(dte1=="" || dte2=="")
		{
			alert("Please select Date");
			return false;
		}
		return datevalidate();
	}
	else
	{
		var iChars = "!@#$%^&*()+=-[]\\\';./{}|\":<>?";
		var units=document.srch.units.value;
		if(units.length < 2)
		{
			alert("Please enter Unit Id / Id's");
			return false;
		}

		for (var i = 0; i < units.length; i++) 
		{
  			if (iChars.indexOf(units.charAt(i)) != -1) 
			{
			  	alert ("Special Characters are not allowed");
			  	return false;
  			}
  		}

		/*if(isNaN(units))
		{
			alert("Alphabets not allowed");
			return false;
		} */
		return true;
	}
}

function datevalidate()
{
	var date1=document.getElementById("calender").value;
	var date2=document.getElementById("calender1").value;

	var dm1,dd1,dy1,dm2,dd2,dy2;
	dy1=date1.substring(0,4);
	dy2=date2.substring(0,4);
	dm1=date1.substring(5,7);
	dm2=date2.substring(5,7);
	dd1=date1.substring(8,10);
	dd2=date2.substring(8,10);

	var date=new Date();
	var month=date.getMonth()+1;
	var day=date.getDate();
	var year=date.getFullYear();
	
	if(dy1>year || dy2>year)
	{
		alert("Selected date should not be greater than Todays date (Year)");
		//document.getElementById("calender").value="";
		//document.getElementById("calender1").value="";
		//document.getElementById("calender").focus;

		return false;
	}
	else if(year==dy1 && year==dy2) 
	{
		if(dm1>month || dm2>month)
		{
			alert("Selected date should not be greater than Todays date (Month)");
			//document.getElementById("calender").value="";
			//document.getElementById("calender1").value="";
			//document.getElementById("calender").focus;

			return false;
		}
	}

	if(dm1==month)
	{
		if(dd1>day || dd2>day)
		{
			alert("Selected date should not be greater than Todays date (Day)");
			//document.getElementById("calender").value="";
			//document.getElementById("calender1").value="";
			//document.getElementById("calender").focus;
	
			return false;
		}
	}

	if(dy1>dy2)
	{
		alert("From date year should not be greater than To date year");
		//document.getElementById("data").value="";
		//document.getElementById("data1").value="";
		//document.getElementById("data").focus;

		return false;
	}
	
	else if(year==dy1 && year==dy2) 
	{
		if(dm1>dm2)
		{
			alert("From date month should not be greater than To date month");
			//document.getElementById("data").value="";
			//document.getElementById("data1").value="";
			//document.getElementById("data").focus;
			return false;
		}
	}
	
	if(dm1==dm2)
	 {
		if(dd1 > dd2)
		{
			alert("From date should not be greater than To date");
			//document.getElementById("data").value="";
			//document.getElementById("data1").value="";
			//document.getElementById("data").focus;

			return false;
		}
	}
	return true;
}
</script>
	<script src="sorttable.js"></script>
</body>
<%!Connection con1;
	Connection con2;%>
<%
	try {
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING,
		MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		con2 = DriverManager.getConnection(MM_dbConn_STRING1,
		MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

		Statement stmt1 = con1.createStatement();
		Statement stmt2 = con2.createStatement();
		Statement stmt3 = con1.createStatement(), stmtreceive = con1
		.createStatement();
		Statement stmt4 = con1.createStatement(), stmt5 = con1
		.createStatement(), stmt6 = con2.createStatement(), stmt7 = con2
		.createStatement(), stmtNewUnit = con2
		.createStatement(),stmtVendor = con2.createStatement(),stmtDispName = con2.createStatement(),stmtAdmin = con2.createStatement(),stmtadmin2 = con2.createStatement();
		ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null, rs5 = null, rs6 = null, rs7 = null, rsNewUnit = null, rs9 = null;
		String sql1 = "", sql2 = "", sql3 = "", sql4 = "", sql5 = "", sql6 = "", sql7 = "", sqlNewUnit = "", unitwarranty = "";
		String cnt = "", instdate = "";
		String dispdate="";
		
		
		String user = session.getValue("typeval").toString();
		String EntBy = session.getValue("user").toString();
		System.out.println("------Ent By"+EntBy);
		String userType = session.getValue("userType").toString();
		//out.println(user);
		//String time=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
		String ustyp = session.getValue("urole").toString();
		String vendorname ="";
		String vendoreRole="";
		
		String mainVendor = "select V_Role,V_TypeValue from db_CustomerComplaints.t_vendorMaster where V_ID = '"+session.getValue("typeval").toString()+"'";
		System.out.println("Main Vendor--"+mainVendor);
		ResultSet rsVendor = stmtVendor.executeQuery(mainVendor);
		if(rsVendor.next())
		{
		   vendorname = rsVendor.getString("V_TypeValue");
		   vendoreRole = rsVendor.getString("V_Role");
		   System.out.println("Vendor Name----"+vendorname);
		   System.out.println("Vendor Role----"+vendoreRole);
		}
		
		//sql6 = "select * from t_admin where URole='manufacturer' order by Name asc ";
		System.out.println("User Role---"+session.getValue("urole").toString());
		System.out.println("User Type---"+session.getValue("userType").toString());
		System.out.println("Type value---"+session.getValue("typeval").toString());

		java.util.Date d = new java.util.Date();
		Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
		String tdydte = formatter1.format(d);
		//out.print(tdydte);

		java.util.Date tdydte1 = new java.util.Date();
		long ms = d.getTime();
		ms = ms - 1000 * 60 * 60 * 24 * 7;
		tdydte1.setTime(ms);
		String sevdaybfre = formatter1.format(tdydte1);
		String date1 = request.getParameter("calender");
		String date2 = request.getParameter("calender1");
		String units = request.getParameter("units");
		if (date1 != null) {
	sevdaybfre = date1;
	tdydte = date2;
		}
		String msg = "";
		String srchcrit = request.getParameter("srchcrit");

		if (srchcrit == null || srchcrit.equals("Date")) {
	String printdate1 = new SimpleDateFormat("dd-MMM-yyyy")
			.format(new SimpleDateFormat("yyyy-MM-dd")
					.parse(sevdaybfre));
	String printdate2 = new SimpleDateFormat("dd-MMM-yyyy")
			.format(new SimpleDateFormat("yyyy-MM-dd")
					.parse(tdydte));
	msg = "Manufactured Units from " + printdate1 + " till "
			+ printdate2;
		} else {
	msg = "Manufactured Units";
		}
%>
</center>
<table border="1" width="100%">
	<tr>
		<td>
			<form name="srch" method="get" action="" onSubmit="return validate1();">
				<table border="0" width="100%">
					<tr>
						<td><B> Search By: </B> <input type="radio" name="srchcrit"
							value="Date" checked onClick="SearchCrit(0);">Date</input> <input
							type="radio" name="srchcrit" value="Unit"
							onClick="SearchCrit(1);">Unit ID / ID's</input></td>
						<td id="unitoptions" style="display: none" width="70%"><textarea
								name="units" class="formElement"> </textarea> <B> Note: </B>
							Please separate Unit ID's by comma ',' only
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="submit"
							value="Submit" class="formElement" /></td>
						<td id="dateoptions"><input type="text" id="calender"
							name="calender" size="13" class="formElement"
							value="<%=sevdaybfre%>" readonly /> <input type="button"
							name="trigger" id="trigger" value="From Date" class="formElement">
							<script type="text/javascript">
            		 Calendar.setup(
            		 {
             			inputField  : "calender",         // ID of the input field
               			ifFormat    : "%Y-%m-%d",     // the date format
		                button      : "trigger"       // ID of the button
             		 }
                         		);
             		</script> &nbsp;&nbsp;&nbsp; <input type="text" id="calender1"
							name="calender1" size="13" class="formElement"
							value="<%=tdydte%>" readonly /> <input type="button"
							name="trigger1" id="trigger1" value="To Date" class="formElement">
							<script type="text/javascript">
            		 Calendar.setup(
            		 {
             			inputField  : "calender1",         // ID of the input field
               			ifFormat    : "%Y-%m-%d",     // the date format
		                button      : "trigger1"       // ID of the button
             		 }
                         		);
             		</script> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit"
							name="submit" value="Submit" class="formElement" /></td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	<tr>
		<td>
			<table border="0" width="100%">
				<tr>

					<td>
						<div align="center">
							<font color="maroon" size="2"> <B> <%=msg%>
							</B></font>
						</div>
					</td>

				</tr>
			</table>

			<form name="sendman" id="sendman" method="post" action="sendmaninsrt.jsp" onSubmit="return validate();">
				<%
					String sent = request.getParameter("sent");
						if (sent == null) {
						} else {
				%>
				<table border="0" width="100%">
					<tr>
						<td>
							<div align="center">
								<font color="maroon"><B>Sent Successfully </B></font>
							</div>
						</td>
					</tr>
				</table>
				<%
					}
						String nounitselected = request.getParameter("nounitselected");
						if (nounitselected == null) {
						} else {
				%>
				<table border="0" width="100%">
					<tr>
						<td>
							<div align="center">
								<font color="maroon"><B> No Unit was selected. Please
										select Unit/s to dispatch it </B></font>
							</div>
						</td>
					</tr>
				</table>
				<%
					}

						String inserted = request.getParameter("inserted");
						if (inserted == null) {
						} else {
				%>
				<table border="0" width="100%">
					<tr>
						<td>
							<div align="center">
								<font color="maroon"><B> Successfully Updated </B></font>
							</div>
						</td>
					</tr>
				</table>
				<%
					}
				%>
				<table width="100%" border="0">
					<tr>
						<td>
							<div align="left">
								<B> Note: In every report, there is a facility to sort in
									Ascending/Descending order by clicking on respective column
									header. </B>
							</div>
						</td>
						<td><font color="maroon" size="1"><u><a
									href="TestedunitExport.jsp?srchcrit=<%=srchcrit%>&calender=<%=sevdaybfre%>&calender1=<%=tdydte%>&units=<%=units%>">
										<img src="images/excel.jpg" width="15px" height="15px"
										border="0" />
								</a></u></font></td>
						<td>
							<div align="center">
								<font color="maroon" size="1"><u><a href="#"
										onclick="javascript:window.print();"><img
											src="images/print.jpg" width="25px" height="25px" border="0" />
									</a></u></font>
							</div>
						</td>
					</tr>
				</table>
				<table border="1" class="sortable">
					<div id="sticky_navigation_wrapper">
						<div id="sticky_navigation">
							<div class="demo_container">
								<tr>
									<th></th>
									<th>Sr No.</th>
									<th>Entered On</th>
									<th>Unit in Warranty</th>
									<th>Unit ID</th>
									<th>Unit Life</th>
									<th>Receive Date</th>
									<th>Dutation</th>
									<th>SIM No</th>
									<th>SIM Company</th>
									<th>Mobile No</th>
									<th>WMSN No</th>
									<th>PS No</th>
									<th>PCB No</th>
									<th>Box No</th>
									<th>Battery No</th>
									<th>Module Type</th>
									<th>Software Version</th>
									<th>GPS No</th>
									<th>Unit Type</th>
									<th>Inst. Type</th>
									<th>Peripherals</th>
									<th>Tested/Untested</th>
									<th>Status</th>
									<!-- There are some extra features for admin. And extra viewable columns -->
									<%
										if (ustyp.equals("administrator")) {
									%>
									<th>Manuf. By</th>
									<%
										}
									%>
									<th class="sorttable_nosort"></th>
								</tr>
							</div>
						</div>
					</div>
					<%
						int c1 = 1, i = 1;
							// ***********if search criteria is null or date, it is in IF, otherwise in ELSE******************
							if (srchcrit == null || srchcrit.equals("Date")) {
								if (ustyp.equals("administrator")
										&& vendoreRole.contains("administrator")) {
									sql1 = "select * from t_unitmaster where User <> 'null' and EntDate between '"
											+ sevdaybfre
											+ "' and '"
											+ tdydte
											+ "' and Status not in('Waiting For Dispatch')  order by EntDate desc ";
									// out.print(sql1);
								} else {
									/* sql1 = "select * from t_unitmaster where User='"+ user
											+ "' and EntDate between '"
											+ sevdaybfre
											+ "' and '"
											+ tdydte
											+ "' and Status not in('Dispatched','Waiting For Dispatch')  order by EntDate desc ";
									//out.print(sql1);
									 */
									sql1 = "select * from t_unitmaster where EntBy='"
											+ EntBy
											+ "' and EntDate between '"
											+ sevdaybfre
											+ "' and '"
											+ tdydte
											+ "' and Status not in('Dispatched','Waiting For Dispatch')  order by EntDate desc ";
								}
								System.out.println(sql1);
								int shoaib = 0;
								rs1 = stmt1.executeQuery(sql1);
								while (rs1.next()) {
									String reqinfo = "match", dispstatus = "", unitstatus = "", teststatus = "", insttype = "", chk = "";
									String unid = rs1.getString("UnitID");
									System.out.println("UnitID@@@@" + unid);
									String pvoice = rs1.getString("PVoice");
									String pjrmbuzz = rs1.getString("PJrmBuzz");
									String pbuzz = rs1.getString("PBuzzer");
									String ptemp1 = rs1.getString("PTemp1");
									String ptemp2 = rs1.getString("PTemp2");
									String pdoor1 = rs1.getString("PDoor1");
									String pdoor2 = rs1.getString("PDoor2");
									String phorn = rs1.getString("PHorn");
									String pscard = rs1.getString("PScard");
									String pflowsen1 = rs1.getString("PFlowSen1");
									String pflowsen2 = rs1.getString("PFlowSen2");
									String pplain = rs1.getString("Plain");
									String withperi = rs1.getString("peripherals");
									System.out.println("withPeri0000" + withperi);
									String entdte = rs1.getString("EntDate");
									String swver = rs1.getString("SwVer");
									String manufby = rs1.getString("User");
									String insttyp = rs1.getString("InstType");
									String status = rs1.getString("Status");
									String simco = rs1.getString("SimCompany");
									String testedunit = rs1.getString("testedunit");
									String psno = rs1.getString("PSNo");
									String pcbno = rs1.getString("PCBNo");
									String boxno = rs1.getString("BoxNo");
									String batteryno = rs1.getString("BatteryNo");
									String OrderNo = rs1.getString("OrderNo");
									String Entryby = rs1.getString("Entby");
									dispdate=rs1.getString("DispDate");
									
									
									
									System.out.println("Request No---" + OrderNo);
									System.out.println("iiiiiiiiiiiiiiiidddddddd---"
											+ shoaib);
									shoaib++;
									//  out.print("unitid="+unid+"status="+status+" ");
									String time = rs1.getString("EntTime");
									if (time == null) {
										time = "00:00:00";
									}
									String utype = rs1.getString("typeunit");
									String peripheral = "";
									/* ************Checking of what peripherals this Unit is made and dispalying the same********* */

									/*
									 if(insttyp.equals("New"))
									 {
									 insttype="New Unit Cannot Be Dispatched";
									 reqinfo="unmatch";
									 }
									 */
									String sqlDispName = "select * from t_unitorder where Reqno = "
											+ OrderNo + "";
									String DispName1 = "";
									String ReqBy1 = "";
									ResultSet rsDispName = stmtVendor
											.executeQuery(sqlDispName);
									if (rsDispName.next()) {
										DispName1 = rsDispName.getString("DisName");
										ReqBy1 = rsDispName.getString("Reqby");
									}

									System.out.println("Requested By--->" + ReqBy1);
									System.out.println("dispatched to (name) By--->" + DispName1);
									if (status.equals("Dispatched")	|| status == "Dispatched") {
										chk = "Dispatched";
										reqinfo = "unmatch";
										// out.print(reqinfo);
									}
									if (status.equals("Sent")) {
										if (Entryby.equalsIgnoreCase(session.getValue(
												"user").toString())) {
											chk = "Sent From " + ReqBy1 + " To "
													+ DispName1 + " --Receive Unit First";
										} else {
											chk = "Sent From " + ReqBy1 + " To "
													+ DispName1 + "";
										}
										reqinfo = "unmatch";

										// out.print(reqinfo);
									}
									if (status.equals("Waiting For Dispatch")) {
										chk = "Waiting for dispatch";
										reqinfo = "unmatch";
									}

									System.out.println("Status----->" + status);
									System.out.println("Entry By----->" + Entryby);
									System.out.println("User Name----->"
											+ session.getValue("user").toString());

									if ((status.equals("Received") || status == "Received")
											&& Entryby.equalsIgnoreCase(session.getValue(
													"user").toString())) {
										chk = "Received";
									} else {
										chk = "Sent From " + ReqBy1 + " To " + DispName1
												+ "";
									}

									System.out.println(unid);
									if ((status.equals("Received") || status == "Received")
											&& Entryby.equalsIgnoreCase(session.getValue(
													"user").toString())) {
										sql7 = "select * from db_gps.t_unitmasterhistory where Status in ('Dispatched','Sent') and Unitid='"
												+ unid + "'";
										System.out.println("sql7-->" + sql7);
										rs9 = stmt3.executeQuery(sql7);
										if (rs9.next()) {
											sql2 = "select * from db_CustomerComplaints.t_unitreceived where Unitid='"
													+ unid
													+ "' and Concat(Rdate,Rtime)>=(select concat(max(Dispdate),max(DispTime)) from db_gps.t_unitmasterhistory where Status in ('Dispatched','Sent') and Unitid='"
													+ unid
													+ "' group by Dispdate order by Dispdate desc limit 1) group by Rdate order by Rdate desc limit 1";
											// out.print("sql2"+sql2);
											System.out.println("sql2-->" + sql2);
											rs2 = stmt2.executeQuery(sql2);
											if (rs2.next()) {
												//out.print(reqinfo);
												unitstatus = "";
											} else {
												//out.print(reqinfo);
												unitstatus = "Unit has not been received yet";
												reqinfo = "unmatch";
											}
										} else {
											unitstatus = "";
										}

										sqlNewUnit = "select * from db_CustomerComplaints.t_unitreceived where Unitid='"
												+ unid + "'";
										rsNewUnit = stmtNewUnit.executeQuery(sqlNewUnit);
										if (rsNewUnit.next()) {
											if (session.getValue("urole").toString()
													.contains("administrator")) {
												teststatus = "";
											} else {
												sql7 = "select * from db_CustomerComplaints.hwunittest where Unitid='"
														+ unid
														+ "' and Concat(TheDate,TheTime)>=(select concat(max(RDate),max(RTime)) from db_CustomerComplaints.t_unitreceived where Unitid='"
														+ unid
														+ "' group by Rdate order by Rdate desc limit 1)group by TheDate order by TheDate desc limit 1";
												//out.print(sql7);
												rs7 = stmt7.executeQuery(sql7);
												if (rs7.next()) {
													teststatus = "";
													// out.print(reqinfo);
												} else if (testedunit
														.equalsIgnoreCase("Yes")) {
													teststatus = "";
												} else {
													// out.print(reqinfo);
													teststatus = "Unit has not been quick tested yet";
													reqinfo = "unmatch";
												}
											}
										} else {
											if (session.getValue("urole").toString()
													.contains("administrator")) {
												teststatus = "";
											} else {
												sql7 = "select * from db_CustomerComplaints.hwunittest where Unitid='"
														+ unid
														+ "' group by TheDate order by TheDate desc limit 1";
												//out.print(sql7);
												rs7 = stmt7.executeQuery(sql7);
												if (rs7.next()) {
													teststatus = "";
													// out.print(reqinfo);
												} else if (testedunit
														.equalsIgnoreCase("Yes")) {
													teststatus = "";
												} else {
													// out.print(reqinfo);
													teststatus = "Unit has not been quick tested yet";
													reqinfo = "unmatch";
												}
											}
										}
									}

									//out.print(reqinfo);
									if (null == pvoice || pvoice.equals("null")) {
										peripheral = "";
									} else {
										peripheral = "Voice";
									}

									if (null == pjrmbuzz || pjrmbuzz.equals("null")) {
										peripheral = peripheral + "";
									} else {
										if (peripheral.length() > 3) {
											peripheral = peripheral + "+JRM+Buzzer";
										} else {
											peripheral = peripheral + "JRM+Buzzer";
										}

									}

									if (null == pbuzz || pbuzz.equals("null")) {
										peripheral = peripheral + "";
									} else {
										if (peripheral.length() > 3) {
											peripheral = peripheral + "+Buzzer Only";
										} else {
											peripheral = peripheral + "Buzzer Only";
										}

									}

									if (null == ptemp1 || ptemp1.equals("null")) {
										peripheral = peripheral + "";
									} else {
										if (peripheral.length() > 3) {
											peripheral = peripheral + "+1 Temp";
										} else {
											peripheral = peripheral + "1 Temp";
										}
									}

									if (null == ptemp2 || ptemp2.equals("null")) {
										peripheral = peripheral + "";
									} else {
										if (peripheral.length() > 3) {
											peripheral = peripheral + "+2 Temp";
										} else {
											peripheral = peripheral + "2 Temp";
										}

									}

									if (null == pdoor1 || pdoor1.equals("null")) {
										peripheral = peripheral + "";
									} else {
										if (peripheral.length() > 3) {
											peripheral = peripheral + "+1 Door";
										} else {
											peripheral = peripheral + "1 Door";
										}

									}

									if (null == pdoor2 || pdoor2.equals("null")) {
										peripheral = peripheral + "";
									} else {
										if (peripheral.length() > 3) {
											peripheral = peripheral + "+2 Door";
										} else {
											peripheral = peripheral + "2 Door";
										}

									}

									if (null == phorn || phorn.equals("null")) {
										peripheral = peripheral + "";
									} else {
										if (peripheral.length() > 3) {
											peripheral = peripheral + "+Horn";
										} else {
											peripheral = peripheral + "Horn";
										}

									}

									if (null == pscard || pscard.equals("null")) {
										peripheral = peripheral + "";
									} else {
										if (peripheral.length() > 3) {
											peripheral = peripheral + "+Smart Card";
										} else {
											peripheral = peripheral + "Smart Card";
										}

									}

									if (null == pflowsen1 || pflowsen1.equals("null")) {
										peripheral = peripheral + "";
									} else {
										if (peripheral.length() > 3) {
											peripheral = peripheral + "+1 Flow Sensor";
										} else {
											peripheral = peripheral + "1 Flow Sensor";
										}

									}

									if (null == pflowsen2 || pflowsen2.equals("null")) {
										peripheral = peripheral + "";
									} else {
										if (peripheral.length() > 3) {
											peripheral = peripheral + "+2 Flow Sensor";
										} else {
											peripheral = peripheral + "2 Flow Sensor";
										}

									}

									if (null == pplain || pplain.equals("null")) {
										peripheral = peripheral + "";
									} else {
										if (peripheral.length() > 3) {
											peripheral = peripheral + "+Plain";
										} else {
											peripheral = peripheral + "Plain";
										}

									}

									if (null == withperi || withperi.equals("null")) {
										peripheral = peripheral + "";
									} else {
										if (peripheral.length() > 3) {
											System.out.println("Peri@@@@@######-->"
													+ peripheral);
											System.out.println("Peri-->" + withperi);
											ArrayList<String> AL = new ArrayList<String>();
											StringTokenizer st = new StringTokenizer(
													withperi, "+");
											while (st.hasMoreTokens()) {
												String tokens = st.nextToken();
												System.out.println(tokens);
												AL.add(tokens);
												System.out
														.println("*************************"
																+ AL);
											}
										//	System.out.println("*************************"+ AL.get(AL.size() - 1));
											//   if(AL.get(AL.size() - 1).contains("With Battery"))
											//  {
											//	 peripheral=peripheral+"+"+AL.get(AL.size() - 1);
											// }

											if (AL.contains("With Battery")) {
												if (AL.get(AL.indexOf("With Battery")) == AL
														.get(AL.size() - 1)) {
													peripheral = peripheral
															+ "+"
															+ AL.get(AL
																	.indexOf("With Battery"));
												} else {
													peripheral = peripheral + "+"
															+ AL.get(AL.size() - 2) + "+"
															+ AL.get(AL.size() - 1);
												}
											}
											System.out.println(peripheral);
										} else {
											peripheral = peripheral + withperi;
										}
									}
									/* *************************************************************************************** */
					%>
					<input type="hidden" name="unid<%=i%>" value="<%=unid%>" />
					<tr>
						<%
							String UroleEnt = "";
										String chkURole = "Select URole from t_admin where UName = '"
												+ Entryby + "' and UserType = 'dispatch'";
										ResultSet rschkURole = stmtadmin2
												.executeQuery(chkURole);
										if (rschkURole.next()) {
											UroleEnt = rschkURole.getString("Urole");
										}

										boolean flag1 = false;
										String chkadmin = "Select Name,URole from t_admin where Name = '"
												+ session.getValue("empName").toString()
												+ "' and URole = 'service1'";
										System.out.println("check Admin Table--->" + chkadmin);
										ResultSet rschkadmin = stmtAdmin.executeQuery(chkadmin);
										if (rschkadmin.next()) {
											flag1 = true;
										}

										System.out.println("status like-->" + status);
										if (ustyp.equals("administrator")) {
											if (flag1) {
												//if((status.equals("Received") || status == "Received") && Entryby.equalsIgnoreCase(session.getValue("user").toString()))
												if ((status.equals("Received") || status == "Received")
														&& UroleEnt
																.equalsIgnoreCase("administrator")) {
						%>
						<td><input type="checkbox" name="dis<%=i%>" value="dis<%=i%>" /><br />
							<%
								}
													//else if((status.equals("Sent") || status == "Sent") && DispName1.equalsIgnoreCase(session.getValue("user").toString()))
													else if ((status.equals("Sent") || status == "Sent")
															&& UroleEnt
																	.equalsIgnoreCase("administrator")) {
							%>
						<td><font color="red"><%="Sent From " + ReqBy1 + " To "
											+ DispName1%></font><br />
						 <%
 	} else {
 %>
						<td><font color="red"><%=chk%></font><br /> <%
 	}
 					} else {
 						if (status.equals("Dispatched")
 								|| status
 										.equals("Waiting For Dispatch")) {
 %>
						<td><font color="red"><%=chk%></font><br /> <%
 	} else if ((status.equals("Received") || status == "Received")
 								&& Entryby.equalsIgnoreCase(session
 										.getValue("user").toString())) {
 %>
						<td><input type="checkbox" name="dis<%=i%>" value="dis<%=i%>" /><br />
							<font color="red"><%="Sent From " + ReqBy1 + " To "
											+ Entryby%></font><br />
							<%
								} else if ((status.equals("Received") || status == "Received")
															&& !(ReqBy1.equalsIgnoreCase(session
																	.getValue("user").toString()))) {
							%>
						<td><font color="red"><%="Sent From " + ReqBy1 + " To "
											+ Entryby%></font><br />
							<%
								} else if ((status.equals("Sent") || status == "Sent")
															&& DispName1.equalsIgnoreCase(session
																	.getValue("user").toString())) {
							%>
						<td><font color="red"><%="Sent From " + ReqBy1 + " To "
											+ Entryby%></font><br />
						<br />
						<font color="green">Receive Unit First</font> <%
 	} else if (status.equals("Sent")
 								|| status == "Sent") {
 %>
						<td><font color="red"><%="Sent From " + ReqBy1 + " To "
											+ DispName1%></font><br />
							<%
								} else {
							%>
						<td><input type="checkbox" name="dis<%=i%>" value="dis<%=i%>" /><br />
							<font color="red"><%="Sent From " + ReqBy1 + " To "
											+ Entryby%></font><br />
							<%
								}

												}
							%> <font color="bule"><%=unitstatus%></font><br /> <font
							color="green"><%=teststatus%></font><br /> <!--font color="#CC34BD"><%=insttype%></font>--></td>
						<%
							} else if (reqinfo == "unmatch"
												|| reqinfo.equals("unmatch")) {
						%>
						<td><font color="red"><%=chk%></font><br /> <font
							color="bule"><%=unitstatus%></font><br /> <font color="green"><%=teststatus%></font><br />
							<!--font color="#CC34BD"><%=insttype%></font>--></td>
						<%
							} else {
						%>
						<td><input type="checkbox" name="dis<%=i%>" value="dis<%=i%>" />
						</td>
						<%
							}
						%>
						<td><%=i%></td>
						<%
							if (entdte == null || entdte.equals("-")) {
						%>
						<td>-</td>
						<%
							} else {
											java.util.Date datefrmdb = new SimpleDateFormat(
													"yyyy-MM-dd").parse(entdte);
											Format formatter = new SimpleDateFormat(
													"dd-MMM-yyyy");
											String nwfrmtdte = formatter.format(datefrmdb);
						%>
						<td sorttable_customkey="dd-MMM-yyyy"><%=nwfrmtdte + " " + time%></td>
						<%
							}
						%>
						<%
							String flag = "true";
										sql3 = "select InstDate from t_unitreplacement where NewUnitID = '"
												+ unid + "' order by InstDate asc limit 1";
										//out.print(sql3);
										rs3 = stmt3.executeQuery(sql3);
										if (rs3.next()) {
											flag = "true";
											instdate = rs3.getString("InstDate");
										} else {
											flag = "false";
											instdate = "NA";
										}
										//out.print("inst dte="+instdate);
										if (flag.equals("true")) {
											sql4 = "select (TO_DAYS('" + tdydte
													+ "')-TO_DAYS('" + instdate + "'))";
											//out.print(sql4);
											rs4 = stmt4.executeQuery(sql4);
											if (rs4.next()) {
												int ww = rs4.getInt(1);
												int dysrem = 365 - ww;
												if (ww < 365) {
													unitwarranty = "Yes";
						%>
						<td>Yes (<%=dysrem%> days rem)
						</td>
						<%
							} else {
													unitwarranty = "No";
						%>
						<td><font color="red" size="2">No</font></td>
						<%
							}
											}
											//else
											//{
						%>
						<!--  <td> NA </td> -->
						<%
							//}
										} else {
											unitwarranty = "NA";
						%>
						<td>NA</td>
						<%
							}
										System.out.println("User Name--->" + Entryby);
										System.out.println("User Name--->"
												+ session.getValue("user").toString());

										if ((status.equals("Received") || status == "Received")
												&& Entryby.equalsIgnoreCase(session.getValue(
														"user").toString())
												&& !UroleEnt.equalsIgnoreCase("administrator")) {
						%>
						<td>
							<div align="left">
								<font color="maroon"> <a
									href="javascript:toggleDetails1(<%=i%>,true);"
									title="Click Here"> <%=rs1.getString("UnitID")%>
								</a> <br />
									<div class="popup" id="popupx<%=i%>">
										<table border="0">
											<tr>
												<td><a
													href="editpage.jsp?unid=<%=unid%>&warranty=<%=unitwarranty%>"
													onclick="toggleDetails(<%=i%>,false);">Edit Details</a></td>
											</tr>
											<tr>
												<td><a
													href="QuickTest.jsp?unid=<%=unid%>&warranty=<%=unitwarranty%>"
													onclick="toggleDetails(<%=i%>,false);">Quick Test</a></td>
											</tr>
											<tr>
												<td><a href="javascript:toggleDetails1(<%=i%>,false);">Close</a></td>
											</tr>
										</table>
									</div>
						</td>
						<%
							} else {
						%>
						<td>
							<div align="left">
								<font color="maroon"> <a
									href="javascript:toggleDetails1(<%=i%>,true);"
									title="Click Here"> <%=rs1.getString("UnitID")%>
								</a> <br />
								</font>
							</div>
						</td>
						<%
							}
										String unitlife = "";
										String sql66 = "select * from t_unitreplacement where OldUnitID='"
												+ unid + "' order by InstDate DESC limit 1";
										ResultSet rs66 = stmtreceive.executeQuery(sql66);
										System.out.println(sql66);
										if (rs66.next()) {
											unitlife = rs66.getString("UnitLife");
											//out.print(unitlife+"#");
										} else {
											out.print("-");
											out.print("-");
										}
										String receivedate = "", gapDuration = "";
										String sql99 = "select * from db_CustomerComplaints.t_unitreceived where UnitID='"
												+ unid + "' order by Rdate Desc limit 1";
										ResultSet rs99 = stmtreceive.executeQuery(sql99);
										System.out.println(sql99);
										if (rs99.next()) {
											java.util.Date dd = new java.util.Date();
											java.util.Date datefrmdb11 = new SimpleDateFormat(
													"yyyy-MM-dd HH:mm:ss")
													.parse(new SimpleDateFormat(
															"yyyy-MM-dd HH:mm:ss").format(dd));
											receivedate = rs99.getString("Rdate") + " "
													+ rs99.getString("Rtime");
											//	System.out.println(receivedate);
											long mili = datefrmdb11.getTime();
											//	System.out.println("mili-->"+mili+""+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(receivedate));
											long mili1 = new SimpleDateFormat(
													"yyyy-MM-dd HH:mm:ss").parse(receivedate)
													.getTime();
											//	System.out.println("mili1-->"+mili1);
											//mili=mili-mili1;
											long diff = mili - mili1;
											//	System.out.println(diff);
											long secdiff = diff / 1000;
											long mindiff = secdiff / 60;
											long hrdiff = secdiff / 60 / 60;
											mindiff = (secdiff / 60) - (hrdiff * 60);

											gapDuration = hrdiff + ":" + mindiff;
											//	System.out.println("gapDuration--->"+gapDuration);
											//datefrmdb.setTime(mili);
											//System.out.println("datetime----------->"+datefrmdb);
											//timediffrence=
										}
										//out.print(receivedate+"#");
										//out.print(gapDuration+"#");
						%>
						<td><%=unitlife%></td>
						<td><%=receivedate%></td>
						<td><%=gapDuration%></td>
						<td><%=rs1.getString("SIMNo")%></td>
						<td><%=simco%></td>
						<td><%=rs1.getString("MobNo")%></td>
						<td><%=rs1.getString("WMSN")%></td>
						<td><%=psno%></td>
						<td><%=pcbno%></td>
						<td><%=boxno%></td>
						<td><%=batteryno%></td>
						<td><%=rs1.getString("Module")%></td>
						<td><%=swver%></td>
						<td><%=rs1.getString("GPS")%></td>
						<%
							if (null == utype || utype.equals("null")) {
						%>
						<td>-</td>
						<%
							} else {
						%>
						<td><%=utype%></td>
						<%
							}
						%>
						<td><%=rs1.getString("InstType")%></td>
						<%
							int len1 = peripheral.length();
										//out.println(len1);
										if (len1 == 0) {
						%>
						<td>-</td>
						<%
							} else if (len1 <= 5) {
						%>
						<td><%=peripheral%></td>
						<%
							}

										else {

											String halfp = "";
											halfp = peripheral.substring(0, 5);
											System.out.println("Peri---$$$$" + peripheral);
						%>
						<input type="hidden" id="fullp<%=c1%>" name="fullp<%=c1%>"
							value="<%=peripheral%>" />
						<td><%=halfp%>.....
							<div id="sh<%=c1%>" name="sh<%=c1%>">
								<a href="#" ONMOUSEOVER="show(fullp<%=c1%>)"
									; ONMOUSEOUT="kill()">Show </a>
							</div></td>
						<%
							c1++;
										}
										String testuntest = "";
										sql5 = "select * from allconnectedunits where UnitId='"
												+ unid
												+ "' and concat(TheDate,' ',TheTime) >= '"
												+ entdte + " " + time + "' ";
										//out.print(sql5);
										rs5 = stmt5.executeQuery(sql5);
										if (rs5.next()) {
											testuntest = "Tested";
										} else {
											testuntest = "UnTested";
										}
						%>

						<td><%=testuntest%></td>
						<td><%=rs1.getString("Status")%></td>
						<%
							if (ustyp.equals("administrator")) {
						%>
						<td><%=manufby%></td>
						<%
							}
										if (!ustyp.equals("administrator")) {
						%>

						<td><a
							href="editpage.jsp?unid=<%=unid%>&warranty=<%=unitwarranty%>">
								Edit </a></td>
					</tr>
					<%
						}
									i++;
								}
							} //close of IF (searc criteria, whether Date or Units)
							else {
								String nextstr = "";
								String reqinfo = "match", dispstatus = "", unitstatus = "", teststatus = "", chk = "", insttype = "";

								StringTokenizer strtok = new StringTokenizer(units, ",");
								while (strtok.hasMoreTokens()) {
									nextstr = "'%" + strtok.nextToken() + "%'";

									if (ustyp.equals("administrator")
											&& vendoreRole.contains("administrator")) {
										sql1 = "select * from t_unitmaster where User <> 'null' and UnitId like "
												+ nextstr
												+ " and Status not in('Waiting For Dispatch')  order by EntDate desc ";
									} else {
										/*	sql1 = "select * from t_unitmaster where User='"
													+ user
													+ "' and UnitId like "
													+ nextstr
													+ " and Status not in('Dispatched','Waiting For Dispatch')  order by EntDate desc "; */

										sql1 = "select * from t_unitmaster where EntBy='"
												+ EntBy
												+ "' and UnitId like "
												+ nextstr
												+ " and Status not in('Dispatched','Waiting For Dispatch')  order by EntDate desc ";
									}

									System.out
											.println("SSSSSSSSSSSSSQQQQQQQQQQQQQQQQQQQQQQQQQQQQLLLLLLLLLLLLLLL"
													+ sql1);
									rs1 = stmt1.executeQuery(sql1);
									int shoaib = 0;
									while (rs1.next()) {
										String unid = rs1.getString("UnitID");
										String pvoice = rs1.getString("PVoice");
										String pjrmbuzz = rs1.getString("PJrmBuzz");
										String pbuzz = rs1.getString("PBuzzer");
										String ptemp1 = rs1.getString("PTemp1");
										String ptemp2 = rs1.getString("PTemp2");
										String pdoor1 = rs1.getString("PDoor1");
										String pdoor2 = rs1.getString("PDoor2");
										String phorn = rs1.getString("PHorn");
										String pscard = rs1.getString("PScard");
										String pflowsen1 = rs1.getString("PFlowSen1");
										String pflowsen2 = rs1.getString("PFlowSen2");
										String pplain = rs1.getString("Plain");
										String entdte = rs1.getString("EntDate");
										String swver = rs1.getString("SwVer");
										String manufby = rs1.getString("User");
										String insttyp = rs1.getString("InstType");
										String status = rs1.getString("Status");
										String utype = rs1.getString("typeunit");
										String time = rs1.getString("EntTime");
										String simco = rs1.getString("SimCompany");
										String testedunit = rs1.getString("testedunit");
										String psno = rs1.getString("PSNo");
										String pcbno = rs1.getString("PCBNo");
										String boxno = rs1.getString("BoxNo");
										String batteryno = rs1.getString("BatteryNo");
										String OrderNo = rs1.getString("OrderNo");
										dispdate=rs1.getString("DispDate");
										
										
										
										String Entryby = rs1.getString("Entby");
										System.out.println("Request No---" + OrderNo);
										System.out.println("iiiiiiiiiiiiiiiidddddddd---"
												+ shoaib);
										shoaib++;

										if (time == null) {
											time = "00:00:00";
										}
										/*   
										    if(insttyp.equals("New"))
											{
												insttype="New Unit Cannot Be Dispatched";
												reqinfo="unmatch";
											}
										 */

										//String str="select * from t_unitmaster where OrderNo='"+reqno+"'"; 

										String sqlDispName = "select * from t_unitorder where Reqno = "
												+ OrderNo + "";
										String DispName1 = "";
										String ReqBy1 = "";
										ResultSet rsDispName = stmtVendor
												.executeQuery(sqlDispName);
										if (rsDispName.next()) {
											DispName1 = rsDispName.getString("DisName");
											ReqBy1 = rsDispName.getString("Reqby");
										}

										if (status.equals("Dispatched")
												|| status == "Dispatched") {
											chk = "Dispatched";
											reqinfo = "unmatch";
											// out.print(reqinfo);
										}
										if (status.equals("Sent")) {
											if (Entryby.equalsIgnoreCase(session.getValue(
													"user").toString())) {
												
												
												chk = "Sent From " + ReqBy1 + " To "
												+ DispName1
												+ "   --Receive Unit First";
												
												/**
												
												if(dispdate!=null || (!dispdate.equalsIgnoreCase("-")))	
												{
												chk = "Sent From " + ReqBy1 + " To "
														+ DispName1
														+ "  on "+ "  "+new SimpleDateFormat("dd-MMM-yy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dispdate))+"  --Receive Unit First";
												}else{
													
													chk = "Sent From " + ReqBy1 + " To "
													+ DispName1
													+ "   --Receive Unit First";
													
												}
											
											**/
											
											} else {
												chk = "Sent From " + ReqBy1 + " To "
														+ DispName1 + "";
											}
											reqinfo = "unmatch";
											// out.print(reqinfo);
										}
										if (status.equals("Waiting For Dispatch")) {
											chk = "Waiting for dispatch";
											reqinfo = "unmatch";
										}

										System.out.println("Status----->" + status);
										System.out.println("Entry By----->" + Entryby);
										System.out.println("User Name----->"
												+ session.getValue("user").toString());

										if ((status.equals("Received") || status == "Received")
												&& Entryby.equalsIgnoreCase(session
														.getValue("user").toString())) {
											chk = "Received";
										} else {
											//chk = "Sent From "+ReqBy1+" To "+DispName1+"";
											
											System.out.println("dispdate-###########---->" + dispdate);
											
											if(dispdate!=null && !(dispdate.equalsIgnoreCase("-")))
											{	
											chk = "Unit Given To " + Entryby + " on    "+new SimpleDateFormat("dd-MMM-yy").format(new SimpleDateFormat("yyyy-MM-dd").parse(dispdate)) +"  ";
											}else{
												
												chk = "Unit Given To " + Entryby + " ";
												
											}
											
											}

										if ((status.equals("Received") || status == "Received")
												&& Entryby.equalsIgnoreCase(session
														.getValue("user").toString())) {
											sql7 = "select * from db_gps.t_unitmasterhistory where Status in ('Dispatched','Sent') and Unitid='"
													+ unid + "'";
											rs9 = stmt3.executeQuery(sql7);
											if (rs9.next()) {
												sql2 = "select * from db_CustomerComplaints.t_unitreceived where Unitid='"
														+ unid
														+ "' and Concat(Rdate,Rtime)>=(select concat(max(Dispdate),max(DispTime)) from db_gps.t_unitmasterhistory where Status in ('Dispatched','Sent') and Unitid='"
														+ unid
														+ "' group by Dispdate order by Dispdate desc limit 1) group by Rdate order by Rdate desc limit 1";
												// out.print("sql2"+sql2);
												rs2 = stmt2.executeQuery(sql2);
												if (rs2.next()) {
													//out.print(reqinfo);
													unitstatus = "";
												} else {
													//out.print(reqinfo);
													unitstatus = "Unit has not been received yet";
													reqinfo = "unmatch";
												}
											} else {
												unitstatus = "";
											}

											if (session.getValue("urole").toString()
													.contains("administrator")) {
												teststatus = "";
											} else {
												sql7 = "select * from db_CustomerComplaints.hwunittest where Unitid='"
														+ unid
														+ "' and Concat(TheDate,TheTime)>=(select concat(max(RDate),max(RTime)) from db_CustomerComplaints.t_unitreceived where Unitid='"
														+ unid
														+ "' group by Rdate order by Rdate desc limit 1)group by TheDate order by TheDate desc limit 1";
												//out.print(sql7);
												// out.print(sql7);
												rs7 = stmt7.executeQuery(sql7);

												if (rs7.next()) {
													teststatus = "";
													// out.print(reqinfo);
												} else if (testedunit
														.equalsIgnoreCase("Yes")) {
													teststatus = "";
												} else {
													// out.print(reqinfo);
													teststatus = "Unit has not been quick tested yet";
													reqinfo = "unmatch";
												}
											}

										}
										/* ************Checking of what peripherals this Unit is made and dispalying the same********* */
										String peripheral = "";
										if (null == pvoice || pvoice.equals("null")) {
											peripheral = "";
										} else {
											peripheral = "Voice";
										}

										if (null == pjrmbuzz || pjrmbuzz.equals("null")) {
											peripheral = peripheral + "";
										} else {
											if (peripheral.length() > 3) {
												peripheral = peripheral + "+JRM+Buzzer";
											} else {
												peripheral = peripheral + "JRM+Buzzer";
											}

										}

										if (null == pbuzz || pbuzz.equals("null")) {
											peripheral = peripheral + "";
										} else {
											if (peripheral.length() > 3) {
												peripheral = peripheral + "+Buzzer Only";
											} else {
												peripheral = peripheral + "Buzzer Only";
											}

										}

										if (null == ptemp1 || ptemp1.equals("null")) {
											peripheral = peripheral + "";
										} else {
											if (peripheral.length() > 3) {
												peripheral = peripheral + "+1 Temp";
											} else {
												peripheral = peripheral + "1 Temp";
											}
										}

										if (null == ptemp2 || ptemp2.equals("null")) {
											peripheral = peripheral + "";
										} else {
											if (peripheral.length() > 3) {
												peripheral = peripheral + "+2 Temp";
											} else {
												peripheral = peripheral + "2 Temp";
											}

										}

										if (null == pdoor1 || pdoor1.equals("null")) {
											peripheral = peripheral + "";
										} else {
											if (peripheral.length() > 3) {
												peripheral = peripheral + "+1 Door";
											} else {
												peripheral = peripheral + "1 Door";
											}

										}

										if (null == pdoor2 || pdoor2.equals("null")) {
											peripheral = peripheral + "";
										} else {
											if (peripheral.length() > 3) {
												peripheral = peripheral + "+2 Door";
											} else {
												peripheral = peripheral + "2 Door";
											}

										}

										if (null == phorn || phorn.equals("null")) {
											peripheral = peripheral + "";
										} else {
											if (peripheral.length() > 3) {
												peripheral = peripheral + "+Horn";
											} else {
												peripheral = peripheral + "Horn";
											}

										}

										if (null == pscard || pscard.equals("null")) {
											peripheral = peripheral + "";
										} else {
											if (peripheral.length() > 3) {
												peripheral = peripheral + "+Smart Card";
											} else {
												peripheral = peripheral + "Smart Card";
											}

										}

										if (null == pflowsen1 || pflowsen1.equals("null")) {
											peripheral = peripheral + "";
										} else {
											if (peripheral.length() > 3) {
												peripheral = peripheral + "+1 Flow Sensor";
											} else {
												peripheral = peripheral + "1 Flow Sensor";
											}

										}

										if (null == pflowsen2 || pflowsen2.equals("null")) {
											peripheral = peripheral + "";
										} else {
											if (peripheral.length() > 3) {
												peripheral = peripheral + "+2 Flow Sensor";
											} else {
												peripheral = peripheral + "2 Flow Sensor";
											}

										}

										if (null == pplain || pplain.equals("null")) {
											peripheral = peripheral + "";
										} else {
											if (peripheral.length() > 3) {
												peripheral = peripheral + "+Plain";
											} else {
												peripheral = peripheral + "Plain";
											}

										}
										/* *************************************************************************************** */
					%>
					<input type="hidden" name="unid<%=i%>" value="<%=unid%>" />

					<tr>
						<%
							String UroleEnt = "";
											String chkURole = "Select URole from t_admin where UName = '"
													+ Entryby + "' and UserType = 'dispatch'";
											ResultSet rschkURole = stmtadmin2
													.executeQuery(chkURole);
											if (rschkURole.next()) {
												UroleEnt = rschkURole.getString("Urole");
											}

											boolean flag1 = false;
											String chkadmin = "Select Name,URole from t_admin where Name = '"
													+ session.getValue("empName").toString()
													+ "' and URole = 'service1'";
											System.out.println("check Admin Table--->"
													+ chkadmin);
											ResultSet rschkadmin = stmtAdmin
													.executeQuery(chkadmin);
											if (rschkadmin.next()) {
												flag1 = true;
											}

											if (ustyp.equals("administrator")) {
												if (flag1) {
													//if((status.equals("Received") || status == "Received") && Entryby.equalsIgnoreCase(session.getValue("user").toString()))
													if ((status.equals("Received") || status == "Received")
															&& UroleEnt
																	.equalsIgnoreCase("administrator")) {
						%>
						<td><input type="checkbox" name="dis<%=i%>" value="dis<%=i%>" /><br />
							<%
								}
														//else if((status.equals("Dispatched") || status == "Dispatched") && Entryby.equalsIgnoreCase(session.getValue("user").toString()))
														else if ((status.equals("Dispatched") || status == "Dispatched")
																&& UroleEnt
																		.equalsIgnoreCase("administrator")) {
							%>
						<td><input type="checkbox" name="dis<%=i%>" value="dis<%=i%>" /><br />
							<%
								}
														//else if((status.equals("Tested") || status == "Tested") && Entryby.equalsIgnoreCase(session.getValue("user").toString()))
														else if ((status.equals("Tested") || status == "Tested")
																&& UroleEnt
																		.equalsIgnoreCase("administrator")) {
							%>
						<td><input type="checkbox" name="dis<%=i%>" value="dis<%=i%>" /><br />
							<%
								} else {
							%>
						<td><font color="red"><%=chk%></font><br /> <%
 	}
 						} else {
 							if (status.equals("Dispatched")
 									|| status
 											.equals("Waiting For Dispatch")) {
 %>
						<td><font color="red"><%=chk%></font><br /> <%
 	} else {
 %>
						<td><input type="checkbox" name="dis<%=i%>" value="dis<%=i%>" /><br />
							<font color="red"><%="Sent From " + ReqBy1
												+ " To " + DispName1%></font><br />
							<%
								}
													}
							%> <font color="bule"><%=unitstatus%></font><br /> <font
							color="green"><%=teststatus%></font><br /> <!--font color="#CC34BD"><%=insttype%></font>--></td>
						<%
							} else if (reqinfo == "unmatch"
													|| reqinfo.equals("unmatch")) {
						%>
						<td><font color="red"><%=chk%></font><br /> <font
							color="bule"><%=unitstatus%></font><br /> <font color="green"><%=teststatus%></font><br />
							<!--font color="#CC34BD"><%=insttype%></font>--></td>
						<%
							} else {
						%>
						<td><input type="checkbox" name="dis<%=i%>" value="dis<%=i%>" />
						</td>
						<%
							}
						%>
						<td><%=i%></td>
						<%
							if (entdte == null || entdte.equals("-")) {
						%>
						<td>-</td>
						<%
							} else {
												java.util.Date datefrmdb = new SimpleDateFormat(
														"yyyy-MM-dd").parse(entdte);
												Format formatter = new SimpleDateFormat(
														"dd-MMM-yyyy");
												String nwfrmtdte = formatter.format(datefrmdb);
						%>
						<td sorttable_customkey="dd-MMM-yyyy"><%=nwfrmtdte + " " + time%></td>
						<%
							}
						%>
						<%
							String flag = "true";
											sql3 = "select InstDate from t_unitreplacement where NewUnitID = '"
													+ unid + "' order by InstDate asc limit 1";
											//out.print(sql3);
											rs3 = stmt3.executeQuery(sql3);
											if (rs3.next()) {
												flag = "true";
												instdate = rs3.getString("InstDate");
											} else {
												flag = "false";
												instdate = "NA";
											}
											//out.print("inst dte="+instdate);

											if (flag.equals("true")) {
												sql4 = "select (TO_DAYS('" + tdydte
														+ "')-TO_DAYS('" + instdate + "'))";
												//out.print(sql4);
												rs4 = stmt4.executeQuery(sql4);
												if (rs4.next()) {
													int ww = rs4.getInt(1);
													int dysrem = 365 - ww;
													if (ww < 365) {
														unitwarranty = "Yes";
						%>
						<td>Yes (<%=dysrem%> days rem)
						</td>
						<%
							} else {
														unitwarranty = "No";
						%>
						<td><font color="red" size="2">No</font></td>
						<%
							}
												}
												//else
												//{
						%>
						<!--  <td> NA </td> -->
						<%
							//}
											} else {
												unitwarranty = "NA";
						%>
						<td>NA</td>
						<%
							}
				if ((status.equals("Received") || status == "Received") && Entryby.equalsIgnoreCase(session.getValue("user").toString()) && !UroleEnt.equalsIgnoreCase("administrator")) {
						%>
						<td>
							<div align="left">
								<font color="maroon"> <a
									href="javascript:toggleDetails1(<%=i%>,true);"
									title="Click Here"> <%=rs1.getString("UnitID")%>
								</a> <br />
									<div class="popup" id="popupx<%=i%>">
										<table border="0">
											<tr>
												<td><a
													href="editpage.jsp?unid=<%=unid%>&warranty=<%=unitwarranty%>"
													onclick="toggleDetails(<%=i%>,false);">Edit Details</a></td>
											</tr>
											<tr>
												<td><a href="QuickTest.jsp?vid=<%=i%>&unid=<%=unid%>&warranty=<%=unitwarranty%>"
													onclick="toggleDetails(<%=i%>,false);">Quick Test</a></td>
											</tr>
											<tr>
												<td><a href="javascript:toggleDetails1(<%=i%>,false);">Close</a></td>
											</tr>
										</table>
									</div>
								</font>
							</div>
						</td>
						<%
							} else {
						%>
						<td>
							<div align="left">
								<font color="maroon"> <a
									href="javascript:toggleDetails1(<%=i%>,true);"
									title="Click Here"> <%=rs1.getString("UnitID")%>
								</a> <br />
								</font>
							</div>
						</td>
						<%
							}
											String unitlife = "";
											String sql66 = "select * from t_unitreplacement where OldUnitID='"
													+ unid + "' order by InstDate DESC limit 1";
											ResultSet rs66 = stmtreceive.executeQuery(sql66);
											System.out.println(sql66);
											if (rs66.next()) {
												unitlife = rs66.getString("UnitLife");
												//out.print(unitlife+"#");
											} else {
												out.print("-");
												out.print("-");
											}
											String receivedate = "", gapDuration = "";
											String sql99 = "select * from db_CustomerComplaints.t_unitreceived where UnitID='"
													+ unid + "' order by Rdate Desc limit 1";
											ResultSet rs99 = stmtreceive.executeQuery(sql99);
											System.out.println(sql99);
											if (rs99.next()) {
												java.util.Date dd = new java.util.Date();
												java.util.Date datefrmdb11 = new SimpleDateFormat(
														"yyyy-MM-dd HH:mm:ss")
														.parse(new SimpleDateFormat(
																"yyyy-MM-dd HH:mm:ss")
																.format(dd));
												receivedate = rs99.getString("Rdate") + " "
														+ rs99.getString("Rtime");
												//			System.out.println(receivedate);
												long mili = datefrmdb11.getTime();
												//			System.out.println("mili-->"+mili+""+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(receivedate));
												long mili1 = new SimpleDateFormat(
														"yyyy-MM-dd HH:mm:ss").parse(
														receivedate).getTime();
												//			System.out.println("mili1-->"+mili1);
												//mili=mili-mili1;
												long diff = mili - mili1;
												//			System.out.println(diff);
												long secdiff = diff / 1000;
												long mindiff = secdiff / 60;
												long hrdiff = secdiff / 60 / 60;
												mindiff = (secdiff / 60) - (hrdiff * 60);

												gapDuration = hrdiff + ":" + mindiff;
												//			System.out.println("gapDuration--->"+gapDuration);
												//datefrmdb.setTime(mili);
												//System.out.println("datetime----------->"+datefrmdb);
												//timediffrence=
											}
						%>
						<td><%=unitlife%></td>
						<td><%=receivedate%></td>
						<td><%=gapDuration%></td>
						<td><%=rs1.getString("SIMNo")%></td>
						<td><%=simco%></td>
						<td><%=rs1.getString("MobNo")%></td>
						<td><%=rs1.getString("WMSN")%></td>
						<td><%=psno%></td>
						<td><%=pcbno%></td>
						<td><%=boxno%></td>
						<td><%=batteryno%></td>
						<td><%=rs1.getString("Module")%></td>
						<td><%=swver%></td>
						<td><%=rs1.getString("GPS")%></td>
						<%
							if (null == utype || utype.equals("null")) {
						%>
						<td>-</td>
						<%
							} else {
						%>
						<td><%=utype%></td>
						<%
							}
						%>
						<td><%=rs1.getString("InstType")%></td>
						<%
							int len1 = peripheral.length();
											//out.println(len1);
											if (len1 == 0) {
						%>
						<td>-</td>
						<%
							} else if (len1 <= 5) {
						%>
						<td><%=peripheral%></td>
						<%
							}

											else {

												String halfp = "";
												halfp = peripheral.substring(0, 5);
						%>
						<input type="hidden" id="fullp<%=c1%>" name="fullp<%=c1%>"
							value="<%=peripheral%>">
						</input>
						<td><%=halfp%>.....
							<div id="sh<%=c1%>" name="sh<%=c1%>">
								<a href="#" ONMOUSEOVER="show(fullp<%=c1%>)"
									; ONMOUSEOUT="kill()">Show </a>
							</div></td>
						<%
							c1++;
											}
											String testuntest = "";
											sql5 = "select * from allconnectedunits where UnitId='"
													+ unid
													+ "' and concat(TheDate,' ',TheTime) >= '"
													+ entdte + " " + time + "' ";
											rs5 = stmt5.executeQuery(sql5);
											if (rs5.next()) {
												testuntest = "Tested";
											} else {
												testuntest = "UnTested";
											}
						%>

						<td><%=testuntest%></td>
						<td><%=rs1.getString("Status")%></td>
						<%
							if (ustyp.equals("administrator")) {
						%>
						<td><%=manufby%></td>
						<%
							}
						%>

						<td><a
							href="editpage.jsp?unid=<%=unid%>&warranty=<%=unitwarranty%>">
								Edit </a></td>
					</tr>
					<%
						i++;
									}
								} // close of while (string tokenizer)
							} // close of else (whether search criteria is Unit or Date)
					%>
					<tr>
						<td colspan="25"><input type="hidden" name="cntr"
							value="<%=i%>" />
							<center>
								<table border="1" width="50%">
									<tr>
										<td colspan="2">
											<div align="center">
												<font color="maroon"> <B> <u> Dispatch
															Information </u>
												</B>
												</font>
											</div>
										</td>
									</tr>

									<%
										if (session.getValue("urole").toString()
													.contains("administrator")
													&& vendoreRole.contains("administrator")) {
												sql6 = "select * from t_vendorMaster order by V_Name asc ";
												System.out.println("sql1" + sql6);
												rs6 = stmt6.executeQuery(sql6);
											} else if (session.getValue("urole").toString()
													.contains("administrator")
													&& !vendoreRole.contains("administrator")) {
												sql6 = "select * from t_vendorMaster where V_TypeValue = '"
														+ vendorname
														+ "' or V_Role = 'administrator'  order by V_Name asc ";
												System.out.println("sql2" + sql6);
												rs6 = stmt6.executeQuery(sql6);
											} else if (!session.getValue("urole").toString()
													.contains("administrator")
													&& vendoreRole.contains("administrator")) {
												sql6 = "select * from t_vendorMaster where V_TypeValue = '"
														+ vendorname + "' order by V_Name asc ";
												System.out.println("sql3" + sql6);
												rs6 = stmt6.executeQuery(sql6);
											} else if (!session.getValue("urole").toString()
													.contains("administrator")
													&& !vendoreRole.contains("administrator")) {
												sql6 = "select * from t_vendorMaster where  V_TypeValue = '"
														+ vendorname
														+ "' or V_Role = 'administrator'  order by V_Name asc ";
												System.out.println("sql4" + sql6);
												rs6 = stmt6.executeQuery(sql6);
											}
									%>
									<tr>
										<td>
											<div align="left">
												<b> Dispatch Address </b>
											</div>
										</td>
										<td>
											<table border="0" width="100%">
												<tr>
													<td><select name="VenderList" id="VenderList"
														class="formElement" onchange="GetAllVendors(this);">
															<option>Select</option>
															<%
																while (rs6.next()) {
															%>
															<option value="<%=rs6.getString("V_Name")%>"><%=rs6.getString("V_Name")%></option>
															<%
																}
																	//<!-- dispadd -->
															%>
													</select> <select name="dispuser" id="dispuser" class="formElement"
														onChange="GetAdd(this);">
													</select> &nbsp;&nbsp;&nbsp; <textarea name="fuladd" id="fuladd"
															class="formElement" readonly>  </textarea></td>
												</tr>
												<tr id="newadddets" style="display: none">
													<td>Place <input type="text" name="newadd" id="newadd"
														class="formElement" /> &nbsp;&nbsp;&nbsp; Address <textarea
															name="newfuladd" id="newfuladd" class="formElement"> </textarea></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<div align="left">
												<B> Mode of Dispatch: </B>
											</div>
										</td>
										<td><input type="radio" name="mode" id="mode" value="Hand"
											class="formElement" CHECKED>By Hand
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
											name="mode" id="mode" value="Courier" class="formElement">By
											Courier</td>
									</tr>
									<tr>
										<td>
											<div align="left">
												<b>Name:</b>
											</div>
										</td>
										<td><input type="text" name="disname" id="disname" class="formElement"
											size="14" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
									<tr>
										<td>
											<div align="left">
												<b>Chalan No:</b>
											</div>
										</td>
										<td><input type="text" name="chalan" id="chalan" class="formElement" />
										</td>
									</tr>
									<tr>
										<td>
											<div align="left">
												<b>Comment for dispatch:</b>
											</div>
										</td>
										<td><textarea id="comm" name="comm"> </textarea></td>
									</tr>
									<tr>
										<td colspan="2">
											<div align="center">
												<input type="submit" name="submit" value="Dispatch"
													class="formElement" />
											</div>
									</tr>
								</table>
								<%
					} catch (Exception e) {

						System.out.println("Exception----->" + e);
						out.println("Exception----->" + e);

					}

					finally {
						con1.close();
						con2.close();
					}
				%>
								<table border="1" width="100%">
									<tr>
										<td bgcolor="white" class="copyright" width="100%">
											<center>Copyright &copy; 2008 by Transworld
												Compressor Technologies Ltd. All Rights Reserved.</center>
										</td>
									</tr>
								</table></td>
					</tr>
				</table>
			</form>