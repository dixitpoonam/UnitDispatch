<%@ include file="menuheader.jsp"%>


  <%!Connection con1;
	Connection con2;
	Connection con3;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="org.omg.CORBA.Request"%><html>
<head>
<script type="text/javascript">
function GetPendingOrder_()
{ 
	var ORDER_NUMBER=document.Dispatch_shoaib.OrderNo.value;
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
     		    	  var mySplitResult = reslt.split("$");
        			  document.getElementById("ORDER_NO").innerHTML=mySplitResult[0];
        	        }
        	   };
               	   var queryString = "?ReqNo=" +ORDER_NUMBER;
 		   ajaxRequest.open("GET", "getPendingORder_Ajax.jsp" + queryString, true);
 		   ajaxRequest.send(null); 
}



function GetLocForTech()
{
	var tech=document.Dispatch_shoaib.dispto.value;
	//alert(tech);

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
     		    	  var mySplitResult = reslt.split("$");
       				document.getElementById("locations").value=mySplitResult[0].trim();
        	        }
        	   };
               	   var queryString = "?tech=" +tech;
 		   ajaxRequest.open("GET", "Ajaxgetlocfortech.jsp" + queryString, true);
 		   ajaxRequest.send(null);   
}

String.prototype.trim = function() {
	return this.replace(/^\s+|\s+$/g,"");
};

function ShowDate(ind)
{
  if(ind==0)
  {
     // document.statform.calender.style.visibility='hidden';
     // document.statform.trigger.style.visibility='hidden';
      //document.statform.calender.value="";
		document.getElementById("name").style.visibility='visible';
        shwnme="Yes";
      //shwdte="No";
  }
  else
  {
      //document.statform.calender.style.visibility='visible';
      //document.statform.trigger.style.visibility='visible';
 		document.getElementById("name").style.visibility='hidden';
        shwnme="No";
      //shwdte="Yes";
  }  
}

function Validate()
{
    if(document.Dispatch_shoaib.OrderNo.value == "")
    {
        alert("Please Insert Order No...!!");
        return false;
    }
    else if(document.Dispatch_shoaib.UserIDs.value == "")
    {
        alert("Please Insert Unit Ids To Dispatch Against Order...!!");
        return false;
    }
    else if(document.Dispatch_shoaib.dispto.value == "Select")
    {
        alert("Please Select The Technician To Dispatch Units....!!");
        return false;
    }
    else if (document.getElementById('Hand').checked)
    {
		if(document.Dispatch_shoaib.chalan.value == "")
		{
			alert("Please Insert The Challan Number....!!");
			return false;
		}
		else if(document.Dispatch_shoaib.dispname.value == "")
		{
			alert("Please Insert The Dispatch Name...!!");
			return false;
		}
			
	}
	else if (document.getElementById('Courier').checked) {
		if(document.Dispatch_shoaib.chalan.value == "")
		{
			alert("Please Insert The Challan Number....!!");
			return false;
		}
	}
	return true;	
}
</script>
<title>Manual Dispatch For Admin</title>
</head>

<body>
<%
try
{
String a = request.getParameter("dispatched");
String b = request.getParameter("unitsexceed");
if(a == "yes" || a.equalsIgnoreCase("yes"))
{
%>
<table align="center">
<tr align="center"><td align="center"><font size="4">Manual Dispatch Completed....!!</font></td></tr>
</table>
<%
}
else if(b == "yes" || b.equalsIgnoreCase("yes"))
{
	%>
	<table align="center">
	<tr align="center"><td align="center"><font size="4">No Of Unit Dispatching More Than Order....!!</font></td></tr>
	</table>
	<%
}
}
catch(Exception e)
{
	
}
%>
<form name="Dispatch_shoaib" action = "Manual_Dispatched_Reason.jsp" id="Dispatch_shoaib" onsubmit="return Validate()">
<%
	try {
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		con2 = DriverManager.getConnection(MM_dbConn_STRING1,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		con3 = DriverManager.getConnection(MM_dbConn_STRING2,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		String sql2 = "", sql3 = "", sql4 = "",sql5="";
		String disloc = "", fuladd = "", cnt = "", insttyp = "", reqto = "", dispto = "";
		ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null,rs5=null;
		Statement stmt1 = con1.createStatement(), stunitmastertrack = con1
				.createStatement(), stmt2 = con2.createStatement(), stmt3 = con2
				.createStatement(), stmt5 = con2.createStatement(), stmt6 = con1
				.createStatement(), stmt7 = con1.createStatement(), stmt8 = con1
				.createStatement(), stmt9 = con1.createStatement(), stmt10 = con1
				.createStatement(), stmt111 = con1.createStatement(), stmt11 = con3
				.createStatement(), stmtSoftVerCheck = con2
				.createStatement();
		java.util.Date tdydte1 = new java.util.Date();
		Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
		String tdydte = formatter1.format(tdydte1);
%>
<center>
<table border="1" width="70%">
	<tr>
		<td width="50%">
		<div align="left">

		<table border="0" width="100%">
			<tr>
				<td colspan="2">
				<div align="center"><label for="addre"> <font
					color="maroon" size="2"> <B> <u> Dispatch
				Information </u> </B></font> </label></div>
				</td>
			</tr>
			<tr>
				<td>
				<div align="center"><b>Order No: </b></div>
				</td>
				<td><input type="text" name="OrderNo" size="19" id="OrderNo"
					class="formElement" value="" onblur="GetPendingOrder_()" /></td>
			</tr>
			<tr>
				<td>
				<div align="center" "><b>Pend. Units :</b> 
				<font color="maroon"></font></div>
				</td>
				<td id="ORDER_NO"></td>
				<td>
			</tr>
			
			<tr>
				<td>
				<div align="center"><b>Unit Id's: </b></div>
				</td>
				<td><input type="text" name="UserIDs" size="50"
					class="formElement" value="" title="Insert Comma Separated Unit Id's" /></td>
			</tr>
			<tr>
				<td>
				<div align="center"><b>Dispatch Date: </b> <font
					color="maroon"> </font></div>
				</td>
				<td id="dateoptions"><input type="text" id="calender"
					name="calender" size="15" class="formElement" value="<%=tdydte%>"
					readonly /> <input type="button" name="trigger" id="trigger"
					value="Dispatch Date" class="formElement"> <script
					type="text/javascript">
            		 Calendar.setup(
            		 {
             			inputField  : "calender",         // ID of the input field
               			ifFormat    : "%Y-%m-%d",     // the date format
		                button      : "trigger"       // ID of the button
             		 }
                         		);
             		</script> &nbsp;&nbsp;&nbsp;</td>

			</tr>
			<%
				sql5 = "select distinct(TechName) as TechName from t_techlist where Available='Yes' order by TechName asc ";
				rs5 = stmt5.executeQuery(sql5);
			%>
			<tr>
				<td>
				<div align="left"><b>Dispatch To : </b> <font color="maroon">
				</font></div>
				</td>
				<td><select name="dispto" class="formElement" id="dispto"
					onChange="GetLocForTech();">
					<option value="Select">Select</option>
					<%
						while (rs5.next()) {
					%>
					<option value="<%=rs5.getString("TechName")%>"><%=rs5.getString("TechName")%></option>
					<%
						}
					%>
				</select></td>
			</tr>
			<tr>
				<td colspan="">
				<div align="center"><b> Dispatch Address </b></div>
				</td>
				<td>
				<div style="vertical-align: top;"><textarea id = "locations" name="locations" class="formElement" style="vertical-align:top;" readonly>  </textArea></div>
				</td>
			</tr>

		</table>
		</div>
		</td>
		<td>
		<table border="0" width="100%">
			<tr>
				<td><B> Mode of Dispatch: </B></td>
				<td><input type="radio" name="mode" id = "Hand" value="Hand"
					class="formElement" onClick="ShowDate(0)" ; CHECKED>By Hand
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="mode" id = "Courier"
 					value="Courier" class="formElement" onClick="ShowDate(1)";>By
				Courier</td>
			</tr>
			<tr>
				<td>
				<div align="left"><b>Chalan No:</b></div>
				</td>
				<td><input type="text" name="chalan" class="formElement" /></td>
			</tr>
			<tr id="name" style="visibility: visible">
				<td>
				<div align="left"><b>Name:</b></div>
				</td>
				<td><input type="text" name="dispname" size="14"
					class="formElement" value="" /></td>
			</tr>
		</table>

		</td>
	</tr>
</table>
<table border="0" width="100%">
	<tr>
		<td>
		<div align="center"><input type="submit" name="submit"
			value="Manual Dispatch" class="formElement" /></div>
		</td>
	</tr>
</table>
</center>
</form>

<%
	} catch (Exception e) {
		out.println("Exception----->" + e);
		e.printStackTrace();
	} finally {
		//
		con1.close();
		con2.close();
	}
%>
<br>
<table border="1" width="100%">
	<tr>
		<td bgcolor="white" class="copyright" width="100%">
		<center>Copyright &copy; 2008 by Transworld Compressor
		Technologies Ltd. All Rights Reserved.</center>
		</td>
	</tr>
</table>
</body>
</html>