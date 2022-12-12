<%@ include file="Connections/conn.jsp"%>
<%@ page import="java.util.*" language="java"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import="java.util.*" import=" java.text.*"
	import="javax.swing.*" errorPage=""%>
<html>
<head>
</head>
<body>
<%!Connection con1;%>
<%
	try {
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING1,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		Statement stmt1 = con1.createStatement();
		Statement stmt2 = con1.createStatement(), stmtVendor = con1
				.createStatement();
		ResultSet rs1 = null, rs2 = null;
		String sql1 = "", sql2 = "";
		String vendorName = "", vendorID = "", vendoreRole = "";
		String getVendor = request.getParameter("vendor");
		System.out.println("Vendor Name----"+getVendor);
		String empname = session.getAttribute("empName").toString();
		String urole = session.getAttribute("urole").toString();
		System.out.println("Employee Name----->"+empname);

		sql2 = "Select V_ID,V_Role,V_Name,V_TypeValue from db_CustomerComplaints.t_vendorMaster where V_Name = '"
				+ getVendor + "'";

		rs2 = stmt2.executeQuery(sql2);
		if (rs2.next()) {
			vendorID = rs2.getString("V_ID");
			vendoreRole = rs2.getString("V_Role");
			System.out.println("Vendor ID --- "+vendorID);
			System.out.println("Vendor ID --- "+vendoreRole);
		}
	
		System.out.println("Type Vaule from Session---"+session.getValue("typeval").toString());
		
		
		if (vendoreRole.contains("administrator") && session.getValue("typeval").toString().equalsIgnoreCase(vendorID)) {
			sql1 = "select * from t_admin where TypeValue = " + vendorID + " and UserType = 'dispatch' and Name <> '"+empname+"'";
		} else if(vendoreRole.contains("administrator") && !session.getValue("typeval").toString().equalsIgnoreCase(vendorID))
		{
			sql1 = "select * from t_admin where TypeValue = " + vendorID + " and UserType = 'dispatch' and URole = 'administrator' and Name <> '"+empname+"'";
		}
		else if(vendoreRole.contains("manufacturer") && !session.getValue("typeval").toString().equalsIgnoreCase(vendorID) && urole.equalsIgnoreCase("administrator"))
		{
			sql1 = "select * from t_admin where TypeValue = " + vendorID + " and UserType = 'dispatch' and URole = 'administrator'";
		}
		else if(vendoreRole.contains("manufacturer") && !session.getValue("typeval").toString().equalsIgnoreCase(vendorID) && urole.equalsIgnoreCase("manufacturer"))
		{
			sql1 = "select * from t_admin where TypeValue = " + vendorID + " and UserType = 'dispatch' and URole = 'manufacturer'";
		}
		else {
			sql1 = "select * from t_admin where TypeValue = " + vendorID + " and UserType = 'dispatch' and Name <> '"+empname+"'";	
		}
		System.out.println(sql1);
		rs1 = stmt1.executeQuery(sql1);
%>
<option value="select">select</option>
<%
	while (rs1.next()) {
%>
<option value="<%=rs1.getString("Name")%>"><%=rs1.getString("Name")%>
</option>
<%
	}
		out.println(vendorName);
	} catch (Exception e) {
		out.println(e);
	} finally {
		con1.close();
	}
%>