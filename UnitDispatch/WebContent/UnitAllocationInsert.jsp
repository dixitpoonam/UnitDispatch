<%@ page import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage="" import=" java.sql.Timestamp"%>
<%@ include file="headeradmin.jsp"%>
<%!Connection conn1;
	Statement stGPS=null,stGPS1=null,stGPS2=null,stCustomerComplaints=null;
	String QUERY1, QUERY2, QUERY3;
%>

<html>
<head>
</head>
<script type="text/javascript">
	
</script>
<body>
<%
	try {
		Class.forName(MM_dbConn_DRIVER);
		conn1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		stGPS = conn1.createStatement();
		stGPS1 = conn1.createStatement();
		stGPS2 = conn1.createStatement();
		int START = Integer.parseInt(request.getParameter("RangeStartFrom"));
		int END = Integer.parseInt(request.getParameter("RangeEndsTo"));
		String VENDOR_NAME = request.getParameter("VendorName");
		String ALLOCATED_UNITS = "",NOT_ALLOCATED_UNITS = "";
		java.util.Date dte = new java.util.Date();
		int UNITID;
		for(UNITID = START; UNITID <= END; UNITID++)
		{
			String VALIDATE_UNITSERIALIZATION = "SELECT UNITID FROM t_unitserialization WHERE UNITID = "+UNITID+" AND STATUS IN ('AVAILABLE') AND VENDOR LIKE 'ALL'";
			ResultSet rsValidate_Unit = stGPS1.executeQuery(VALIDATE_UNITSERIALIZATION);
			if(rsValidate_Unit.next())
			{
				String VALIDATE_UNITMASTER = "SELECT UNITID FROM t_unitmaster WHERE UNITID = "+UNITID+"";
				ResultSet rsVALIDATE_UNITMASTER = stGPS2.executeQuery(VALIDATE_UNITMASTER);
				if(rsVALIDATE_UNITMASTER.next())
				{
						NOT_ALLOCATED_UNITS += rsVALIDATE_UNITMASTER.getString("UNITID") + ",";
				}
				else
				{
					String QUERY = "UPDATE t_unitserialization SET VENDOR = '"+VENDOR_NAME+"', STATUS = 'AVAILABLE'  WHERE UNITID = "+UNITID+"";
					stGPS.executeUpdate(QUERY);
					ALLOCATED_UNITS += UNITID +",";
					System.out.println("Updated----->>"+QUERY);
				}
			}
			else
			{
				NOT_ALLOCATED_UNITS += UNITID + ",";
			}
		}

		response.sendRedirect("unitallocationtoVendor.jsp?updated=y&Start="+START+"&END="+END+"&VENDOR="+VENDOR_NAME+"&ALLOCATED_UNITS="+ALLOCATED_UNITS+"&NOT_ALLOCATED_UNITS="+NOT_ALLOCATED_UNITS);
	} catch (Exception e) {
		//
		out.print("Exception --->" + e);
	} finally {
		conn1.close();
	}
%>
</body>
</html>