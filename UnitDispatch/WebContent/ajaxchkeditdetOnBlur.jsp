<%@ page import="java.util.*" language="java"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import="java.util.*" import=" java.text.*"
	import="javax.swing.*" errorPage=""%>

<%@ include file="Connections/conn.jsp"%>
<%!Connection con1, con2;%>
<%
	// This page is called from main.jsp
	try {
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		con2 = DriverManager.getConnection(MM_dbConn_STRING1,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		Statement st = con1.createStatement();
		Statement stmt1 = con1.createStatement();
		Statement stmt2 = con2.createStatement();
		Statement st1 = con1.createStatement();
		Statement st2 = con1.createStatement();
		Statement st3 = con1.createStatement();

		ResultSet rs1 = null, rs2 = null, rs3 = null;
		String sql1 = "", sql2 = "", sql3 = "";
		String mobno = "", simno = "", wmsndb = "", unitdb = "", simnodb = "", mobnodb = "", status = "", insttype = "";
		String param = request.getParameter("param");
		String unitid = request.getParameter("unitid").trim();
		String wmsn = request.getParameter("wmsn").trim();
		String sim = request.getParameter("sim").trim();
		String mob = request.getParameter("mob").trim();
		String PSNo = request.getParameter("PSNo");
		String PCBNo = request.getParameter("PCBNo");
		String BoxNo = request.getParameter("BoxNo");
		String BatteryNo = request.getParameter("BatteryNo");
		String module = request.getParameter("module");
		String sysdate = new SimpleDateFormat("dd-MMM-yyyy")
				.format(new java.util.Date());

		String cpwnsnno = "", cpmobno = "",cpsimno = "",cpcpimei = "",cppsno = "",cpBatteryNo="",cpBoxNo="",cpPCBNo="";
		String sqlcpHistory = "select * from db_gps.t_unitmasterhistory where UnitID='"	+ unitid + "' and Mobno <> '-' and Simno <> '-'  limit 1";
		ResultSet rsCopy = stmt1.executeQuery(sqlcpHistory);
		if(rsCopy.next())
		{
			cpwnsnno = rsCopy.getString("WMSN");
			cpmobno = rsCopy.getString("MobNo");
			cpsimno = rsCopy.getString("SimNo");
			cpcpimei = rsCopy.getString("IMEINo");
			BatteryNo = rsCopy.getString("BatteryNo");
			cpBoxNo = rsCopy.getString("BoxNo");
			cpPCBNo = rsCopy.getString("PCBNo");
			cppsno = rsCopy.getString("PSNo");
		}
		out.print(cpwnsnno + "#");
		out.print(cpsimno + "#");
		out.print(cpmobno + "#");
		out.print(cppsno + "#");
		out.print(cpPCBNo + "#");
		out.print(cpBoxNo + "#");
		out.print(BatteryNo + "#");
		out.print(cpcpimei + "#");
		
	} catch (Exception e) {
		out.println(e);
	}

	finally {
		con1.close();
	}
%>