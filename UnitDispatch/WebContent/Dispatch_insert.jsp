<%@page import="com.sun.xml.internal.bind.v2.runtime.Name"%><%@page
	import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ include file="Connections/conn.jsp"%>
<%
	/*
	 Auther : SHOAIB F. BAGWAN
	 DATE 01 aug 2012
	 DATE OF MODIFY :
	 */
%>
<%!Connection con1, con2;%>
<%
	try {
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING1,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		con2 = DriverManager.getConnection(MM_dbConn_STRING,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

		Statement st = con1.createStatement(), stmt1 = con1
				.createStatement(), stmt2 = con2.createStatement(), stmt3 = con2
				.createStatement(), stmt4 = con2.createStatement(), stmt0 = con1
				.createStatement(), stmt01 = con1.createStatement(), stmt7 = con1
				.createStatement(), stmt8 = con2.createStatement();
		ResultSet rsID = null, rsInsert = null, rsvendorID = null;
		String Sqlid = "", SqlInsert = "", SqlvendorID = "";
		String dtToday = "", EName = "", Uid = "", pass = "", Email = "", uRole = "", uType = "", tValue1 = "", tValue = "", EntBy = "", id = "";

		EntBy = session.getAttribute("user").toString();
		dtToday = request.getParameter("calender");
		EName = request.getParameter("Name");
		Uid = request.getParameter("uID");
		pass = request.getParameter("pass");
		Email = request.getParameter("email");
		uRole = request.getParameter("uRole");
		uType = request.getParameter("uType");
		tValue1 = request.getParameter("tValue");

		SqlvendorID = "Select V_ID from t_vendorMaster where v_Name ='"
				+ tValue1 + "'";
		rsvendorID = stmt1.executeQuery(SqlvendorID);
		if (rsvendorID.next()) {
			tValue = rsvendorID.getString("v_ID");
		}

		Sqlid = "Select MAX(id)+1 as id from t_admin";
		rsID = stmt1.executeQuery(Sqlid);
		if (rsID.next()) {
			id = rsID.getString("id").toString();
		}

		SqlInsert = "Insert into t_admin(id,Name,UName,pass,Email,URole,UserType,TypeValue,Active,UpdatedDateTime,EntBy) values("
				+ id
				+ ",'"
				+ EName
				+ "','"
				+ Uid
				+ "','"
				+ pass
				+ "','"
				+ Email
				+ "','"
				+ uRole
				+ "','"
				+ uType
				+ "','"
				+ tValue
				+ "','Yes','"
				+ dtToday
				+ " 00:00:00','"
				+ EntBy + "')";
		System.out.println(SqlInsert);
		stmt1.executeUpdate(SqlInsert);
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		con1.close();
		con2.close();
		response.sendRedirect("DispatchID.jsp");
	}
%>