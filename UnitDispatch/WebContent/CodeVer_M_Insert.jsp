<%@ page import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage="" import=" java.sql.Timestamp"%>
<%@ include file="headeradmin.jsp"%>
<%!Connection conn1;
	Statement st, st1;
	String QUERY1, QUERY2, QUERY3;
	int MAX_RNO;%>

<html>
<head>
<title>Master Page _Code Version</title>
</head>
<script type="text/javascript">
	
</script>
<body>
<%
	try {
		Class.forName(MM_dbConn_DRIVER);
		conn1 = DriverManager.getConnection(MM_dbConn_STRING1,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

		st = conn1.createStatement();
		st1 = conn1.createStatement();
		String CODE_VER = request.getParameter("CODE_VER");
		System.out.println(CODE_VER);

		String USER_NAME = session.getAttribute("user").toString();

		System.out.println(USER_NAME);

		java.util.Date dte = new java.util.Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss  ");
		String today = formatter.format(dte);

		System.out.print(today);

		QUERY1 = " SELECT MAX( Rno ) AS Rno	FROM db_CustomerComplaints.t_utcodever ";
		ResultSet rst = st.executeQuery(QUERY1);
		if (rst.next()) {
			MAX_RNO = rst.getInt("Rno") + 1;
		}

		QUERY3 = "SELECT codever FROM db_CustomerComplaints.t_utcodever where codever = '"
				+ CODE_VER + "'";
		ResultSet rst1 = st1.executeQuery(QUERY3);

		if (rst1.next()) {
			response.sendRedirect("CodeVer_M.jsp?insert=N");
		} else {
			QUERY2 = "INSERT INTO db_CustomerComplaints.t_utcodever (Rno,codever,valid,peripheral,UpdatedDateTime,EntBy) VALUES("
				+ MAX_RNO
				+ ", '"
				+ CODE_VER
				+ "', 'Yes','-', '"
				+ today + "','" + USER_NAME + "')";
		System.out.println("****" + QUERY2);
		st1.executeUpdate(QUERY2);

		response.sendRedirect("CodeVer_M.jsp?insert=Y");
		}
	} catch (Exception e) {
		//
		out.print("Exception --->" + e);
	} finally {
		conn1.close();
	}
%>
</body>
</html>