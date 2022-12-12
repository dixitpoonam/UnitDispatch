
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
Statement st=con1.createStatement();
Statement st1=con1.createStatement();

ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null;
String sql1="",sql2="", sql3="", sql4="", sql5="", sql6="",sql7="",que="",que1="";
String data="",data1="",vendor="",Statustype="",technician="";
String unit=request.getParameter("unitid");
System.out.println("unitID_list--->"+unit);
String from=request.getParameter("from");
System.out.println("from--->"+from);
String to=request.getParameter("to");
System.out.println("to--->"+to);
String username="-";

String prevdispdate="",prevrecdate="";
String recddate=null,recname="",custname="";

String qtdate="",qtby="";

String SIM_No="",SIM_Co="",Mobile_No="",WMSN_No="",Module_Type="",soft_ver="",GPS_No="",Unit_Type="",Inst_Type="",Peripherals="",boxtype="";




String user=session.getValue("urole").toString();
String type=session.getValue("typeval").toString();
//out.println(user);
String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

//String ustyp=session.getValue("urole").toString();
//out.println(ustyp);

%>
  	</td></tr>
	
			</table>
			
						<table width="100%" border="1" align="center" class="sortable">
						<tr>
						<th class="hed"> Sr.</th>
						<th class="hed"> Unit ID</th>
						<th class="hed"> Edited Date Time</th>
						<th class="hed">Dispatch Date</th>
						<th class="hed"> Edited By</th>
						<th class="hed">SIM No</th>
						<th class="hed">SIM Company</th>
						<th class="hed">Mobile No</th>
						<th class="hed"> WMSN No</th>
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
						
							sql2="select * from t_unitmasterhistory where Status not in ('Tested','Sent','Dispatched') and EntDate between '"+from+"' and '"+to+"' and UnitID='"+unit+"' ";
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
							
						
								String Entdatetime="",editedby="";
								String FirmwareChanged="",ModulePCBChanged="",PCBmodification="",PowerSupplyChanged="",GPSMouseChanged="",GSMAntennaChanged="",SoftwareSimCorrections="",OtherCorrections="",entdate="",enttime="";
								
										entdate=rs2.getString("EntDate");
										enttime=rs2.getString("EntTime");
										editedby=rs2.getString("EditedBy");
										SIM_No=rs2.getString("SimNo");
										SIM_Co=rs2.getString("SimCompany");
										Mobile_No=rs2.getString("MobNo");
										WMSN_No=rs2.getString("WMSN");
										Module_Type=rs2.getString("Module");
										soft_ver=rs2.getString("SwVer");
										GPS_No=rs2.getString("GPS");
										Unit_Type=rs2.getString("typeunit");
										Inst_Type=rs2.getString("InstType");
										Peripherals=rs2.getString("Peripherals");
										FirmwareChanged=rs2.getString("FirmwareChanged");
										ModulePCBChanged=rs2.getString("ModulePCBChanged");
										PCBmodification=rs2.getString("PCBmodification");
										PowerSupplyChanged=rs2.getString("PowerSupplyChanged");
										GPSMouseChanged=rs2.getString("GPSMouseChanged");
										GSMAntennaChanged=rs2.getString("GSMAntennaChanged");
										SoftwareSimCorrections=rs2.getString("SoftwareSimCorrections");
										OtherCorrections=rs2.getString("OtherCorrections");
										boxtype=rs2.getString("Box_type");
										Entdatetime=entdate+" "+enttime;
										
									
										
							
						%>
							<tr>
								<td> <%=i%></td>
								<td><%=unitid%></td>
							
								<td><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(Entdatetime))%> </td>
								<%	if(!(Dispdate.equals("-"))) 
							{%>
								<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(Dispdate))%></td>
								<%}
							else{ %>
							<td><%=Dispdate %></td>
							<%} %>
								
								<%%>
								<td><%=editedby%></td>
								<td><%=SIM_No %></td>
								<td><%=SIM_Co %></td>
								<td><%=Mobile_No %></td>
								<td><%=WMSN_No %></td>
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
						   // while%>
						   
						</table>
			
			<!-- body part come here -->
					<%
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