<%@ include file="menuheader.jsp"%>

<html>
<head>
<script type="text/javascript">



function validate()
{
	//alert("hiii");
	var v1=document.getElementById("unitid").value;
//	alert(v1);
	var v2=document.getElementById("calender").value;
	var v3=document.getElementById("unittype").value;
	var v4=document.getElementById("accessories").value;
	var v5=document.getElementById("h/wversionPMF").value;
	var v6=document.getElementById("vendorname").value;
	var v7=document.getElementById("custname").value;
	//alert("vname="+v6+"cname="+v7);
	var v8=document.getElementById("s/wver_PMFMain").value;
	var v9=document.getElementById("h/wversionNIP").value;
	var v10=document.getElementById("s/wver_PMFIR").value;
	var v11=document.getElementById("s/wver_NIPCPU1").value;
	var v12=document.getElementById("s/wver_NIPCPU2").value;
	
	var v13=document.getElementById("txtpoweron").value;


	if(v1.length==0)
	{
		alert("Please Enter Unit ID");
		return false;
	}
	else if(v2.length==0)
	{
		alert("Please Select Manufacturing date");
		return false;
	}
	else if(v3=="Select")
	{
		alert("Please Select Unit Type");
		return false;
	}
	
	/*else if(v4=="Select" || v4=="")
	{
		alert("Please Select Accessories");
		return false;
	}*/
	
	else if(v6=="select")
	{
		alert("Please Select Vendor Name");
		return false; 
	}
	else if(v7=="select")
	{
		alert("Please Select Customer Name");
		return false; 
	}
	
	
	else if(v13.length==0)
	{
		alert("Please Enter value for Power on verified by");
		return false; 
	}
	if(v3=="PMF")
	{
		 if(v5=="Select")
		{
			alert("Please Select Hardware Version for PMF");
			return false; 
		}
		 if(v8=="Select")
		{
				alert("Please Select Software Version for PMF Main");
				return false; 
		}
		 if(v10=="Select")
		{
				alert("Please Select Software Version for PMF IR");
				return false; 
		}
			
	}
	else if(v3=="NIP")
	{
		 if(v9=="Select")
		{
			alert("Please Select Hardware Version for NIP");
			return false; 
		}			
		
		 if(v11=="Select")
		{
			alert("Please Select Software Version for NIP CPU1");
			return false; 
		}
		 if(v12=="Select")
		{
			alert("Please Select Software Version for NIP CPU2");
			return false; 
		}
	}
	var ans=confirm("Do you really want to submit the form");
	if(ans==true)
	return true;
	else
	return false;
}

function checkprevrecords(param)
{ 
   var count=(document.pmfdetails.unitid.value).length+1;
	
    var unitid=document.pmfdetails.unitid.value;
  
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
                                document.pmfdetails.unitid.value="";
                                document.getElementById("statchk").value="NO";
                              
                            }     

		     } 
         	  }
              var queryString = "?param=" +param+"&unitid="+unitid;
	     ajaxRequest.open("GET", "ajaxchkPMFdetails.jsp" + queryString, true);
	     ajaxRequest.send(null);  
   
}


function show()
{
	//alert("hello");
	var unit=document.getElementById("unittype").value;
	//alert(unit);
	if(unit=="PMF")
	{
		//alert("inside");
		document.getElementById("h/wPMF").style.display="block";
		document.getElementById("s/wPMF").style.display="block";
		document.getElementById("h/wNIP").style.display="none";
		document.getElementById("s/wNIP").style.display="none";
		
	}
	else if(unit=="NIP")
	{
		document.getElementById("h/wPMF").style.display="none";
		document.getElementById("s/wPMF").style.display="none";
		document.getElementById("h/wNIP").style.display="block";
		document.getElementById("s/wNIP").style.display="block";
	}


	var index = document.pmfdetails.unittype.selectedIndex;
	
}

</script>
</head>


<body>

	
	






<form name="pmfdetails" action="insertPMF.jsp" onsubmit="return validate();">

<%!
Connection con1;
%> 
<% 

ResultSet rs1=null, rs2=null, rs3=null, rs4=null, rs5=null;
Statement stmt1=null;
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

stmt1 = con1.createStatement();
Statement st=con1.createStatement();
Statement st1=con1.createStatement();
Statement st2=con1.createStatement();
Statement st3=con1.createStatement();
Statement st4=con1.createStatement();
Statement st5=con1.createStatement();
Statement st6=con1.createStatement();
Statement st7=con1.createStatement();
Statement st8=con1.createStatement();
String sql1="", sql2="", sql3="", sql4="", sql5="",sql6="",sql7="",sql8="";
String cnt="";

String user=session.getAttribute("user").toString();
String ustyp=session.getAttribute("urole").toString();

%> <%
java.util.Date d=new java.util.Date();
String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();
String tme= "" + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();

java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   String nwfrmtdte=formatter.format(datefrmdb);

%> <% 
    String insert=request.getParameter("inserted");
   if(insert==null)
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
%>
 

<center>
<table border="0" width="80%">
	<tr>
		<td>
			<div align="center"><font color="maroon" size="3"> <B>PMF Manufacturing Details </B></font></div>
		</td>
	</tr>
</table>
</center>
<center>

<div id="unitdets"></div>

<div id="wmsndets"></div>

<div id="simdets"></div>

<div id="mobdets"></div>


<table border="1" width="85%">
	<tr>
		<td>
		<table border="0" width="100%">
			<tr>
				<td width="40%"><font color="maroon"> Unit Id: </font></td>
				<td><input type="text" maxlength="7" name="unitid" id="unitid" class="formElement" onBlur="checkprevrecords('unit');" /></td>
			</tr>
		</table>
		</td>
		<td>
		<table border="0" width="100%">
			<tr>
				<td> <font color="maroon"> Manuf. Date </font> </td>
         <td  colspan="4"> <div align="left"> <input type="text" id="calender" name="calender" size="13" class="formElement" value="<%=nwfrmtdte %>" readonly/>
  
<!--<input type="image" src="images/FromDate.bmp" id="trigger"> --> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input type="button" name="trigger" id="trigger" value="Manuf. Date" class="formElement">
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger"       // ID of the button
             }
                           );
             </script> </div> </td>
         </tr>
		</table>
		</td>
		</tr>
	<tr>
		<td>
		<table border="0" width="100%">
			<tr>
				<td width="40%"><font color="maroon"> Unit Type:</font></td>
				<td><select id="unittype" name="unittype" class="formElement" onchange="show()">
					<option value="Select">Select</option>
						<option value="PMF">PMF</option>
					<option value="NIP">NIP</option>
				</select></td>
			</tr>
		</table>
		</td>
		<% 	sql2="select Comment_value from t_PMFdetails where Comment_type='accessories' order by Comment_value";
   			rs2=st.executeQuery(sql2);
		%>
		<td>
		<table border="0" width="100%">
			<tr>
				<td width="40%"><font color="maroon"> Accessories: </font></td>
				<td><select id="accessories" name="accessories" class="formElement" multiple="multiple" size="3">
				
					<%while(rs2.next())
						{%>
					<option value="<%=rs2.getString("Comment_value") %>"><%=rs2.getString("Comment_value") %></option>	
				<%} %>
					
				</select></td>
			</tr>
		</table>
		</td>
	</tr>

	<tr>
		<td>
		<table border="0" width="100%">
			<tr>
			<%
				sql3="select Comment_value from t_PMFdetails where Comment_type='H/W_PMF' order by Comment_value";
	   			rs3=st1.executeQuery(sql3);
	   			sql4="select Comment_value from t_PMFdetails where Comment_type='H/W_NIP' order by Comment_value";
	   			rs4=st2.executeQuery(sql4);
	   			
	   					
			%>
				<td width="40%"><font color="maroon"> Hardware Version:</font></td>
				
				<td>
				<div id="h/wPMF" style="display: none">
				<font color="maroon">PMF <select id="h/wversionPMF" name="h/wversionPMF" class="formElement">
					<option value="Select">Select</option>
					<%while(rs3.next())
						{%>
					<option value="<%=rs3.getString("Comment_value") %>"><%=rs3.getString("Comment_value") %></option>	
				<%} %>
					
				</select></font></div>
				<div id="h/wNIP" style="display: none">	<font color="maroon"> NIP <select id="h/wversionNIP" name="h/wversionNIP" class="formElement">
					<option value="Select">Select</option>
					<%while(rs4.next())
						{%>
					<option value="<%=rs4.getString("Comment_value") %>"><%=rs4.getString("Comment_value") %></option>	
				<%} %>
					
				</select></font></div></td>
			</tr>
		</table>
		</td>
		<td>
		<%
			String sql9="select Name from t_vendordetailsPMF";
		ResultSet rs9=st7.executeQuery(sql9);
		String sql10="select Name from  t_custdetailPMF";
		ResultSet rs10=st8.executeQuery(sql10);

		%>
		<table border="1" width="100%" style="vertical-align: top;">
		<tr>
			<td width="40%" style="border-right: none">
				<font color="maroon">Vendor Name:</font>
			</td>
			<td style="border-left: none;">
				<select id="vendorname" name="vendorname" class="formelement">
				<option value="select">Select</option>
				<%while(rs9.next())
					{%>
				<option value="<%=rs9.getString("Name") %>"><%=rs9.getString("Name") %></option>
			<%} %>
				</select>	
			</td>
		</tr>
		<td width="40%" style="border-right: none">
				<font color="maroon">Customer Name:</font>
			</td>
			<td style="border-left: none;">
				<select name="custname" id="custname" class="formelement">
				<option value="select">Select</option>
				<%while(rs10.next())
					{%>
				<option value="<%=rs10.getString("Name") %>"><%=rs10.getString("Name") %></option>
			<%} %>
				</select>	
			</td>
		<tr>
		</tr>
		</table>
		</td>
	</tr>
	
	<tr>
		<td>
		<table border="0" width="100%">
			<tr>
			<%
				sql5="select Comment_value from t_PMFdetails where Comment_type='S/W_PMF_MAIN_CPU' order by Comment_value";
	   			rs5=st3.executeQuery(sql5);
	   			sql6="select Comment_value from t_PMFdetails where Comment_type='S/W_PMF_IR_CPU' order by Comment_value";
	   			ResultSet rs6=st4.executeQuery(sql6);
	   			
	   			sql7="select Comment_value from t_PMFdetails where Comment_type='S/W_NIP_CPU1' order by Comment_value";
	   			ResultSet rs8=st5.executeQuery(sql7);
	   			sql8="select Comment_value from t_PMFdetails where Comment_type='S/W_NIP_CPU2' order by Comment_value";
	   			ResultSet rs7=st6.executeQuery(sql8);
	   					
			%>
				<td width="40%" rowspan=2><font color="maroon"> Software Version:</font></td>
				
				<td id="s/wPMF" style="display: none"><font color="maroon"> PMF Main CPU:&nbsp;</font><select id="s/wver_PMFMain" name="s/wver_PMFMain" class="formElement">
					<option value="Select">Select</option>
					<%while(rs5.next())
						{%>
					<option value="<%=rs5.getString("Comment_value") %>"><%=rs5.getString("Comment_value") %></option>	
				<%} %>
					
				</select> <br></br>
				<font color="maroon"> PMF IR CPU:&nbsp;</font><select id="s/wver_PMFIR" name="s/wver_PMFIR" class="formElement">
					<option value="Select">Select</option>
					<%while(rs6.next())
						{%>
					<option value="<%=rs6.getString("Comment_value") %>"><%=rs6.getString("Comment_value") %></option>	
				<%} %>
					
				</select></td>
			</tr>
			<tr>
			<td id="s/wNIP" style="display: none"><font color="maroon"> NIP CPU1:&nbsp;</font><select id="s/wver_NIPCPU1" name="s/wver_NIPCPU1" class="formElement">
					<option value="Select">Select</option>
					<%while(rs8.next())
						{%>
					<option value="<%=rs8.getString("Comment_value") %>"><%=rs8.getString("Comment_value") %></option>	
				<%} %>
					
				</select><br></br>
				<font color="maroon"> NIP CPU2:&nbsp;</font><select id="s/wver_NIPCPU2" name="s/wver_NIPCPU2" class="formElement">
					<option value="Select">Select</option>
					<%while(rs7.next())
						{%>
					<option value="<%=rs7.getString("Comment_value") %>"><%=rs7.getString("Comment_value") %></option>	
				<%} %>
					
				</select></td>
			</tr>
		</table>		</td>
		<td valign="top">
		
		
		<table border="0" >
			<tr>
				<td><font color="maroon"> Power On Test Verified by:</font></td>
				<td><input type="text" name="txtpoweron" id="txtpoweron" value="" class="formElement"/></td>
				
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
