<%@ include file="Connections/conn.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Edit Summary</title>
<script src="sorttable.js"></script>
<link href="css/css.css" rel="StyleSheet" type="text/css">
</head>
<body >
<table border="0" cellspacing="0" cellpadding="0" width="100%">
        
       
        
        <tr>
          <td>
			<!-- body part come here -->
			<table width="100%" align="center" class="sortable">
			
			<tr>
			<td align="center" class=""><font color="block" size="2" > Dispatch Details Report</font></td>
			</tr>
			
			<!-- if date range is not requred please remove this code start from this comment to -->
			
			
  	
  	
  	<%!


%>
<% 
Connection con1=null;
Connection con2=null;
String refno=null;
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


String unitid=request.getParameter("unitid");
String qtdate=request.getParameter("qtDate");
String qtTime=request.getParameter("qtTime");
String dispDate=request.getParameter("dispDate");
String dispTime=request.getParameter("dispTime");


%>
  	
		
	<%	

%>
			<tr>
			<td  >
			<div id="report_heding"><font color="brown" size="3">Edit Details</font></div>
				<div align="right">
				<a href="#" onclick="javascript:window.open('printvieweditsumm_window.jsp?unitid=<%=unitid %>&qtDate=<%=qtdate%>&qtTime=<%=qtTime %>&dispDate=<%=dispDate%>&dispTime=<%=dispTime %>');" title="Print Report"><img src="images/print.jpg" width="15px" height="15px"></a>&nbsp; &nbsp; 
				<a href="vieweditsumm_excel_window.jsp?unitid=<%=unitid %>&qtDate=<%=qtdate%>&qtTime=<%=qtTime %>&dispDate=<%=dispDate%>&dispTime=<%=dispTime %>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>
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
							
							String username="-";
							
							String qtby="";
							String SIM_No="",SIM_Co="",Mobile_No="",WMSN_No="",Module_Type="",soft_ver="",GPS_No="",Unit_Type="",Inst_Type="",Peripherals="",boxtype="";
							int i=1;
							String Entdatetime="",editedby="";
							String FirmwareChanged="",ModulePCBChanged="",PCBmodification="",PowerSupplyChanged="",GPSMouseChanged="",GSMAntennaChanged="",SoftwareSimCorrections="",OtherCorrections="",entdate="",enttime="";
							if(dispDate!=null && !(dispDate.equalsIgnoreCase("-")))
							{		
							sql7="Select * from t_unitmasterhistory where Unitid="+unitid+" and EditedBy <> '-' and concat(EntDate,' ',EntTime) between '"+qtdate+" "+qtTime+"' and '"+dispDate+" "+dispTime+"' and  FirmwareChanged <>'-' and ModulePCBChanged <>'-' and PCBmodification <>'-' and	PowerSupplyChanged <>'-' and GPSMouseChanged <>'-' and GSMAntennaChanged <>'-' and SoftwareSimCorrections <>'-' and OtherCorrections <>'-' order by concat(EntDate,' ',EntTime)";
							}
							else
							{
								sql7="Select * from t_unitmasterhistory where Unitid="+unitid+" and EditedBy <> '-' and concat(EntDate,' ',EntTime)>= '"+qtdate+" "+qtTime+"' and  FirmwareChanged <>'-' and ModulePCBChanged <>'-' and PCBmodification <>'-' and	PowerSupplyChanged <>'-' and GPSMouseChanged <>'-' and GSMAntennaChanged <>'-' and SoftwareSimCorrections <>'-' and OtherCorrections <>'-' order by concat(EntDate,' ',EntTime) Limit 1";	
							}
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
						%>
							<tr>
								<td> <%=i%></td>
								<td><%=unitid%></td>
								<td><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(Entdatetime))%> </td>
								<td><%=editedby%></td>
								<td><%=SIM_No %></td>
								<td><%=SIM_Co %></td>
								<td><%=Mobile_No%></td>
								<td><%=WMSN_No %></td>
								<td><%=Module_Type%></td>
								<td><%=soft_ver%></td>
								<td><%=GPS_No %></td>
								<td><%=Unit_Type %> </td>
								<td><%=Inst_Type %> </td>
								<td><%=boxtype %> </td>
								<td><%=Peripherals %> </td>
								<td><%=FirmwareChanged %></td>
								<td><%=ModulePCBChanged %></td>
								<td><%=PCBmodification %></td>
								<td><%=PowerSupplyChanged %></td>
								<td><%=GPSMouseChanged %></td>
								<td><%=GSMAntennaChanged %></td>
								<td><%=SoftwareSimCorrections %></td>
								<td><%=OtherCorrections %> </td>
								
							</tr>	
						<% i++;
						}// inner while
						  %>
						   
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