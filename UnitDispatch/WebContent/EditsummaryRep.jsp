
<%@ include file="menuheader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Edit Summary</title>
<script src="sorttable.js"></script>

</head>
<body bgcolor="lightyellow">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
        
       
        
        <tr>
          <td>
			<!-- body part come here -->
			<table width="100%" align="center" class="sortable">
			
			<tr>
			<td align="center" class="sorttable_nosort"><font color="block" size="2" > Dispatch Details Report</font></td>
			</tr>
			<tr><td>
			<!-- if date range is not requred please remove this code start from this comment to -->
			
			<script language="javascript">
 			function validate()
  			{
  				if(document.getElementById("data").value=="")
  				{
  			  		alert("Please select the from date");
  					return false;
  				}
  				if(document.getElementById("data1").value=="")
  				{
			  		alert("Please select the to date");
  					return false;
  				}
  				if(document.getElementById("vendor").value=="")
  				{
  					alert("Please select the vendor");
  					return false;
  	  			}
  				if(document.getElementById("Statustype").value=="")
  				{
  					alert("Please select the Statustype");
  					return false;
  	  			}
  				
  				return datevalidate();
  		  }
  		 function datevalidate()
		 {
		 	var date1=document.getElementById("data").value;
			var date2=document.getElementById("data1").value;
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
				alert("selected date should not be greater than todays date");
				document.getElementById("data").value="";
				document.getElementById("data1").value="";
				document.getElementById("data").focus;
				return false;
			}
			else if(year==dy1 && year==dy2)
			{
	  			if(dm1>month || dm2>month)
				{
					alert("selected date should not be greater than todays date");
					document.getElementById("data").value="";
					document.getElementById("data1").value="";
					document.getElementById("data").focus;
					return false;
				}
			}
			if(dm1==month)
			{
				if(dd1>day || dd2>day)
				{
					alert("selected date should not be greater than todays date");
					document.getElementById("data").value="";
					document.getElementById("data1").value="";
					document.getElementById("data").focus;
					return false;
				}
			}
			if(dy1>dy2)
			{
				alert("From date year is should not be greater than to date year");
				document.getElementById("data").value="";
				document.getElementById("data1").value="";
				document.getElementById("data").focus;
				return false;
			}
			else if(year==dy1 && year==dy2) if(dm1>dm2)
			{MimeMessage msg=new MimeMessage(session);
				alert("From date month is should not be greater than to date month 5");
				document.getElementById("data").value="";
				document.getElementById("data1").value="";
				document.getElementById("data").focus;
				return false;
			}
			if(dm1==dm2) 
			{
				if(dd1 > dd2)
				{
					alert("From date should not be greater than to date");
					document.getElementById("data").value="";
					document.getElementById("data1").value="";
					document.getElementById("data").focus;
					return false;
				}
			}
			return true;
		}

  	</script>
  	
  	
  	<%!
Connection con1;
Connection con2;
String refno=null;
%>
<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con2.createStatement();
Statement stmt2 = con1.createStatement();
Statement stmt3 = con1.createStatement();
Statement stmt4 = con1.createStatement();
Statement st=con1.createStatement();
Statement st1=con1.createStatement();

ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null;
String sql1="",sql2="", sql3="", sql4="", sql5="", sql6="",sql7="",que="",que1="";
String data="",data1="",vendor="",Statustype="",technician="";




String user=session.getValue("urole").toString();
String type=session.getValue("typeval").toString();
//out.println(user);
String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

//String ustyp=session.getValue("urole").toString();
//out.println(ustyp);

%>
  	<form action="" method="get" onsubmit="return validate();">
			<table border="0"  width="50%" align="center">
			
			<tr bgcolor="#87CEFA">
			<td align="left">
			  <table ><tr style="border: none;">
			  <td >
			  <input type="text" id="data" name="data" class="formElement" value="<%=today %>" size="10" readonly/>
			  </td>
			  <td>
				<input type="button" name="From Date" value="From Date" id="trigger" class="formElement"/>
				<script type="text/javascript">
  				Calendar.setup(
    			{
      			inputField  : "data",         // ID of the input field
      			ifFormat    : "%Y-%m-%d",     // the date format
      			button      : "trigger"       // ID of the button
    			}
  				);	
				</script>
			  </td>
			  </tr></table>
			</td>
			<td align="right">
			<table><tr><td>
			<input type="text" id="data1" name="data1" class="formElement"  value="<%=today %>" size="10" readonly />
			</td>
			<td>
			 	<input type="button" name="To Date" value="To Date" id="trigger1" class="formElement"/>
				<script type="text/javascript">
  				Calendar.setup(
    			{
      			inputField  : "data1",         // ID of the input field
      			ifFormat    : "%Y-%m-%d",    // the date format
      			button      : "trigger1"       // ID of the button
    			}
  				);
				</script>
			</td>
			</tr></table>
			  	
			  	
  			 </td >
			<td>
			<table ><tr>
			
			<td><b>Vendor:</b></td>
			<td>
			<%
			if(user.equalsIgnoreCase("Administrator"))
			{
			//sql1="Select distinct(TypeValue) from t_admin where urole='manufacturer' ";
			sql1="Select * from t_vendorMaster";
			rs1=stmt1.executeQuery(sql1);
			
			%>
			<select name="vendor" id="vendor" class="formElement">
			<option value="all">All</option>
			<%while(rs1.next())
			{%>
			<option value="<%=rs1.getString("v_Name") %>"><%=rs1.getString("v_Name") %></option>
			
			<%} %>
			</select>  
			<%}
			else
			{
				%>
				<input type="text" readonly="readonly" value="<%=type %>" name="vendor" id="vendor"></input>
				<%			}
			%>
			
			</td>
			</tr></table>
			
			</td>
			<td>
			<table><tr><td>
			<b>Status&nbsp;Type:</b></td>
			<td>
				<select Name="Statustype" id="Statustype" class="formElement">
					<option value="New">New</option>
					<option value="Repaired">Repaired</option>
					<option value="Both">Both</option>
				</select>
			</td>
			</tr></table>
			</td>
			<td>
				<input type="submit" name="submit" id="submit" value="submit" class="formElement">
			</td>
		</tr>
		
		</table>
		</form>
		</td></tr>
	<%	String dd=request.getParameter("data");
	if(dd==null)
{
%>

<table class="stats">
<tr><td>
<center class='bodyText'><b>Please select option to display the Report</b></center>
</td></tr>
</table>

<%
}
else
{
data=request.getParameter("data");
data1=request.getParameter("data1");
Statustype=request.getParameter("Statustype");
vendor=request.getParameter("vendor");
%>
			<tr>
			<td  class="sorttable_nosort">
			<div id="report_heding"><font color="brown" size="3">Dispatch Details for <%
                        java.util.Date ShowDate = new SimpleDateFormat("yyyy-MM-dd").parse(data);
                        Format formatter2 = new SimpleDateFormat("dd-MMM-yyyy");
                        String showdate = formatter2.format(ShowDate);
                        out.print(showdate);
                        %> to <%
                        java.util.Date ShowDate1 = new SimpleDateFormat("yyyy-MM-dd").parse(data1);
                        Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
                       String showdate1 = formatter1.format(ShowDate1);
                        out.print(showdate1+"&nbsp;&nbsp; Vendor:"+vendor+"&nbsp;&nbsp; Status Type:"+Statustype); %> </font></div>
				<div align="right">
				<a href="#" onclick="javascript:window.open('printvieweditsumm.jsp?data=<%= data %>&data1=<%=data1 %>&Statustype=<%=Statustype %>&vendor=<%=vendor%>');" title="Print Report"><img src="images/print.jpg" width="15px" height="15px"></a>&nbsp; &nbsp; 
				<a href="vieweditsumm_excel.jsp?data=<%= data %>&data1=<%=data1 %>&Statustype=<%=Statustype %>&vendor=<%=vendor%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>
				<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
				</div>
			</td>
			</tr>
			</table>
			
						<table width="100%" border="1" align="center" class="sortable">
						<tr>
						<th class="hed"> Sr.</th>
						<th class="hed"> Unit ID</th>
						<th class="hed"> Edited Date Time</th>
						<th class="hed">Dispatch Date</th>
						<th class="hed">Received Date Before Dispatch</th>
						<th class="hed"> Edited By</th>
						<th class="hed">SIM No</th>
						<th class="hed">SIM Company</th>
						<th class="hed">Mobile No</th>
						<th class="hed"> WMSN No</th>
						<th class="hed"> PS No</th>
						<th class="hed"> PCB No</th>
						<th class="hed"> Box No</th>
						<th class="hed"> Battery No</th>
						<th class="hed"> Module Type</th>
						<th class="hed">Software Version</th>
						<th class="hed">GPS No</th>
						<th class="hed">Unit Type</th>
						<th class="hed">Inst. Type</th>
						<th class="hed">Box Enclosure Type</th>
						<th class="hed">Peripherals</th>
						<th class="hed"> FirmwareChanged</th>
						<th class="hed"> ModulePCBChanged</th>
						<th class="hed"> PCBmodification</th>
						<th class="hed"> PowerSupplyChanged</th>
						<th class="hed"> GPSMouseChanged</th>
						<th class="hed"> GSMAntennaChanged</th>
						<th class="hed"> SoftwareSimCorrections</th>
						<th class="hed"> OtherCorrections</th>
						
						</tr>		
						<%
						String VendorNumber = "";
						String VendorID="Select V_ID from t_vendorMaster where V_Name = '"+vendor+"'";
						ResultSet rsVendorID=stmt1.executeQuery(VendorID);
						if(rsVendorID.next())
						{
						  	VendorNumber = rsVendorID.getString("V_ID");
						}
						
						if(vendor.equals("all")&&Statustype.equals("Both") )
						{
							sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and Status='Dispatched' ";
							session.setAttribute("sql",sql2);
						}
						else if(Statustype.equals("Both"))
						{ 
							sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and user='"+VendorNumber+"' and Status='Dispatched'";
							session.setAttribute("sql",sql2);
						}
						else if(vendor.equals("all"))
						{
						 	sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and InstType ='"+Statustype+"' and Status='Dispatched'";
						 	session.setAttribute("sql",sql2);
						}
						else
						{
							sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and InstType ='"+Statustype+"' and user='"+VendorNumber+"' and Status='Dispatched'";
							session.setAttribute("sql",sql2);
						}
			
						int i=1;
						System.out.println(sql2);
						rs2=stmt2.executeQuery(sql2);
						while(rs2.next())
						{	
							
							//to get disp address
							String name="",location="",fulladdress="";
							
							String unitid=rs2.getString("UnitId");
							String Dispdate=rs2.getString("DispDate");
							//String EnteredDate=rs2.getString("EntDate");
							String username="-";
				
							String prevdispdate="",prevrecdate="";
							String recddate=null,recname="",custname="";

							String qtdate="",qtby="";
							que="Select Dispdate from t_unitmasterhistory where DispDate < '"+Dispdate+"' and UnitId='"+unitid+"' and Status='Dispatched' order by DispDate desc Limit 1";
							System.out.println(que);
							ResultSet rsget=st.executeQuery(que);
							if(rsget.next())
							{
								prevdispdate=rsget.getString("DispDate");
								
							          //---------- if previous dispatch date---then get the received date --------	
								que1="select * from db_CustomerComplaints.t_unitreceived where Unitid='"+unitid+"' and Rdate >'"+prevdispdate+"' and ReceiveFrom IN('Customer','Ware House','Technician') and InTransit='No' order by Rdate limit 1";
								System.out.println(que1);
								ResultSet rsget1=stmt1.executeQuery(que1);
								if(rsget1.next())
								{
									
									
									recddate=rsget1.getString("Rdate");
									/*recname=rsget1.getString("EntBy");
									custname=rsget1.getString("Name");
									if(recname==null || recname.equals(""))
										recname="-";
									if(custname==null || custname.equals(""))
										custname="-";*/
								}
								else
								{
									
									//recname="-";
									recddate="-";
									/* qtdate="-";
									 qtby="-";
									 custname="-";*/
								}
								
								
								
							}
							else
							{
								//---if no prev. diapatch date then prev. received date
								String quee="Select EntDate from t_unitmasterhistory where EntDate < '"+Dispdate+"' and UnitId='"+unitid+"' and Status='Received' order by EntDate Limit 1";
								
								ResultSet rsgt=st1.executeQuery(quee);
								if(rsgt.next())
								{
									prevrecdate=rsgt.getString("EntDate");
									
									
									que1="select * from db_CustomerComplaints.t_unitreceived where Unitid='"+unitid+"' and Rdate ='"+prevrecdate+"' and ReceiveFrom IN('Customer','Ware House','Technician') and InTransit='No' order by Rdate limit 1";
									System.out.println(que1);
									ResultSet rsget1=stmt1.executeQuery(que1);
									if(rsget1.next())
									{
										
										
										recddate=rsget1.getString("Rdate");
										recname=rsget1.getString("EntBy");
										custname=rsget1.getString("Name");
										if(recname==null || recname.equals(""))
											recname="-";
										if(custname==null || custname.equals(""))
											custname="-";
									}
									else
									{
										
										//recname="-";
										recddate="-";
										 /*qtdate="-";
										 qtby="-";
										 custname="-";*/
									}
									
									
									
								}
								else
								{
									//recname="-";
									recddate="-";
									// custname="-";
								}
							}
							
							
							
							String SIM_No="",SIM_Co="",Mobile_No="",WMSN_No="",Module_Type="",soft_ver="",GPS_No="",Unit_Type="",Inst_Type="",Peripherals="",boxtype="";
							
							
						
								String Entdatetime="",editedby="";
								String FirmwareChanged="",ModulePCBChanged="",PCBmodification="",PowerSupplyChanged="",GPSMouseChanged="",GSMAntennaChanged="",SoftwareSimCorrections="",OtherCorrections="",entdate="",enttime="";
								if(vendor.equals("all"))		
									sql7="Select * from t_unitmasterhistory where Unitid="+unitid+" and EditedBy <> '-' and EntDate<='"+Dispdate+"' and  FirmwareChanged <>'-' and ModulePCBChanged <>'-' and PCBmodification <>'-' and	PowerSupplyChanged <>'-' and GPSMouseChanged <>'-' and GSMAntennaChanged <>'-' and SoftwareSimCorrections <>'-' and OtherCorrections <>'-' order by concat(EntDate,' ',EntTime) desc Limit 1";
								else
									sql7="Select * from t_unitmasterhistory where Unitid="+unitid+" and EditedBy <> '-' and EntDate<='"+Dispdate+"' and  FirmwareChanged <>'-' and ModulePCBChanged <>'-' and PCBmodification <>'-' and	PowerSupplyChanged <>'-' and GPSMouseChanged <>'-' and GSMAntennaChanged <>'-' and SoftwareSimCorrections <>'-' and OtherCorrections <>'-'  and User='"+VendorNumber+"' order by concat(EntDate,' ',EntTime) desc Limit 1";	
									//sql7="Select editedby from t_unitmasterhistory where EntDate='"+EnteredDate+"' and Status<>'Dispatched' and User= 'Transworld'  order by EntDate desc,EntTime desc limit 1";
									System.out.println(sql7);
									rs11=stmt3.executeQuery(sql7);
									while(rs11.next())
									{
										entdate=rs11.getString("EntDate");
										enttime=rs11.getString("EntTime");
										editedby=rs11.getString("EditedBy");
										SIM_No=rs11.getString("SimNo");
										SIM_Co=rs11.getString("SimCompany");
										Mobile_No=rs11.getString("MobNo");
										WMSN_No=rs11.getString("WMSN");
										Module_Type=rs11.getString("Module");
										soft_ver=rs11.getString("SwVer");
										GPS_No=rs11.getString("GPS");
										Unit_Type=rs11.getString("typeunit");
										Inst_Type=rs11.getString("InstType");
										Peripherals=rs11.getString("Peripherals");
										FirmwareChanged=rs11.getString("FirmwareChanged");
										ModulePCBChanged=rs11.getString("ModulePCBChanged");
										PCBmodification=rs11.getString("PCBmodification");
										PowerSupplyChanged=rs11.getString("PowerSupplyChanged");
										GPSMouseChanged=rs11.getString("GPSMouseChanged");
										GSMAntennaChanged=rs11.getString("GSMAntennaChanged");
										SoftwareSimCorrections=rs11.getString("SoftwareSimCorrections");
										OtherCorrections=rs11.getString("OtherCorrections");
										boxtype=rs11.getString("Box_type");
										Entdatetime=entdate+" "+enttime;
							String psno="",pcbno="",boxno="",batteryno="";
							String sql8="select * from db_gps.t_unitmaster where UnitID='"+unitid+"'";	
							ResultSet rs88=stmt4.executeQuery(sql8);
							if(rs88.next()){
								psno=rs88.getString("PSNo");
								pcbno=rs88.getString("PCBNo");
								boxno=rs88.getString("BoxNo");
								batteryno=rs88.getString("BatteryNo");
							}
									
										
							
						%>
							<tr>
								<td> <%=i%></td>
								<td><%=unitid%></td>
							
								<td><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(Entdatetime))%> </td>
								<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(Dispdate))%></td>
							<%	if(!(recddate.equals("-"))) 
							{%>
								<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(recddate))%></td>
								<%}
							else{ %>
								<td><%=recddate %></td>
								<%} %>
								<td><%=editedby%></td>
								<td><%=SIM_No %></td>
								<td><%=SIM_Co %></td>
								<td><%=Mobile_No %></td>
								<td><%=WMSN_No %></td>
								<td><%=psno%></td>
								<td><%=pcbno%></td>
								<td><%=boxno%></td>
								<td><%=batteryno%></td>
								<td><%=Module_Type %></td>
								<td> <%=soft_ver %></td>
								<td> <%=GPS_No %></td>
								<td><%=Unit_Type %> </td>
									<td><%=Inst_Type %> </td>
									<td><%=boxtype %> </td>
										<td><%=Peripherals %> </td>
								<td><%=FirmwareChanged %></td>
								<td><%=ModulePCBChanged %></td>
								<td><%=PCBmodification %></td>
								<td><%=PowerSupplyChanged %></td>
								<td><%=GPSMouseChanged %></td>
								<td> <%=GSMAntennaChanged %></td>
								<td> <%=SoftwareSimCorrections %></td>
								<td><%=OtherCorrections %> </td>
								
							</tr>	
						<% i++;
						}// inner while
						   } // while%>
						   
						</table>
			
			<!-- body part come here -->
					<%}
} catch(Exception e) { 
	//out.println("Exception----->"+e); 
System.out.println("Exception----->"+e);	
}

finally
{
con1.close();
con2.close();
}
%>
			</td>
    </tr>
    </table>
       <table border="1" width="100%">
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
      
    </body>
    
</html>