<%@ page import="java.util.*" language="java"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import="java.util.*" import=" java.text.*"
	import="javax.swing.*" errorPage=""%>
<%@ include file="Connections/conn.jsp"%>
<%!Connection con1, con2;%>
<%
	try {
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		con2 = DriverManager.getConnection(MM_dbConn_STRING1,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

		Statement st = con1.createStatement();
		Statement stmt1 = con1.createStatement(), stmt2 = con2
				.createStatement(), stmt3 = con1.createStatement(), stmt4 = con1
				.createStatement(), stmt5 = con2.createStatement();
		ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null, rs5 = null, rs6 = null, rs7 = null, rs8 = null, rs9 = null, rs10 = null, rs11 = null;
		String configured = "", sql1 = "", sql2 = "", str = "", sql3 = "", sql4 = "", sql5 = "", sql6 = "", sql7 = "", vehcode = "", lastdatadate = "", instdate = "", utype = "", manufactby = "", Insttype = "", status = "", dispdate1 = "", orderno1 = "";
		String PSNo = "", PCBNo = "", BoxNo = "", BatteryNo = "";
		String getunid = request.getParameter("unid");
		int refno = 0;
		Format fmt = new SimpleDateFormat("yyyy-MM-dd");
		String curdate = fmt.format(new java.util.Date());
		String typevalue = session.getAttribute("typeval").toString();
		System.out.print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&" + typevalue);
		String mobno = "undefined", simno = "undefined", cust = "", wmsn = "";
		String cpwnsnno = "", cpmobno = "",cpsimno = "",cpcpimei = "",cppsno = "",cpBatteryNo="",cpBoxNo="",cpPCBNo="";
		String sqlcpHistory = "select * from db_gps.t_unitmasterhistory where UnitID='"+ getunid +"' and Mobno <> '-' and Simno <> '-'  order by EntDate desc limit 1";
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
	} finally {
		con1.close();
		con2.close();
	}
%>