<%@page import="com.sun.org.apache.bcel.internal.generic.DREM"%>
<%@page import="javax.xml.transform.Result"%>
<%@ include file="menuheader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*, java.util.* , java.text.*"%>
<html>
<head>
<%!Connection conGPS;
	Connection conCC;
	String refno = null;
	Statement stmtUserList = null, stmtGPS = null, stmtGPS1 = null,
			stCustomerComplaints = null;
	int CURRENT_HOLDING = 0;
	String USER_NAME = "";%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Unit Dispatch</title>
</head>
<body>
	<table border="0" cellspacing="0" cellpadding="0" width="60%"
		align="center">
		<tr>
			<td>
				<!-- body part come here -->
				<table width="100%" align="center" class="sortable">
					<tr>
						<td align="center" class="sorttable_nosort"><font
							color="block" size="2">Unit Hold By Status</font></td>
					</tr>
					<tr>
						<td>
							<%
								try {
									Class.forName(MM_dbConn_DRIVER);
									conGPS = DriverManager.getConnection(MM_dbConn_STRING,
											MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
									conCC = DriverManager.getConnection(MM_dbConn_STRING1,
											MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

									stmtUserList = conCC.createStatement();
									stmtGPS = conGPS.createStatement();
									stmtGPS1 = conGPS.createStatement();
									stCustomerComplaints = conCC.createStatement();
									String today = new SimpleDateFormat("yyyy-MM-dd")
											.format(new java.util.Date());
									String data = "", data1 = "", vendor = "", Statustype = "", technician = "", Select = "";
							%>
							<form action="">
								<table border="0" width="70%" align="center">
									<tr bgcolor="#87CEFA">
										<td>
											<%
												String UserList = "SELECT Distinct(Name) FROM t_admin WHERE typevalue = "
															+ session.getValue("typeval").toString()
															+ " AND UserType = 'dispatch'";
													ResultSet RsUserList = stmtUserList.executeQuery(UserList);
											%> <select name="type" id="type">
												<option value="All">All</option>
												<%
													while (RsUserList.next()) {
												%>
												<option value<%=RsUserList.getString("Name")%>"><%=RsUserList.getString("Name")%></option>
												<%
													}
												%>
										</select>
										</td>
										<td align="left"><input type="text" id="data" name="data"
											class="formElement" value="<%=today%>" size="10" readonly />
											<input type="button" name="From Date" value="From Date"
											id="trigger" class="formElement" /> <script
												type="text/javascript">
												Calendar.setup({
													inputField : "data", // ID of the input field
													ifFormat : "%Y-%m-%d", // the date format
													button : "trigger" // ID of the button
												});
											</script></td>
										<td align="right"><input type="text" id="data1"
											name="data1" class="formElement" value="<%=today%>" size="10"
											readonly /> <input type="button" name="To Date"
											value="To Date" id="trigger1" class="formElement" /> <script
												type="text/javascript">
												Calendar.setup({
													inputField : "data1", // ID of the input field
													ifFormat : "%Y-%m-%d", // the date format
													button : "trigger1" // ID of the button
												});
											</script></td>
										<td><input type="submit" name="submit" id="submit"
											value="submit" class="formElement"></td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
					<%
						String dd = request.getParameter("data");
							if (dd == null) {
					%>
					<table class="stats">
						<tr>
							<td>
								<center class='bodyText'>
									<b>Please select option to display the Report</b>
								</center>
							</td>
						</tr>
					</table>
					<%
						} else {
					%>
					<table class="stats">
						<tr></tr>
						<tr>
							<th>Sr. No</th>
							<th>Name</th>
							<th>Unit Issued</th>
							<th>Unit Dispatched</th>
							<th>Unit Remaining</th>
						</tr>
						<%
							data = request.getParameter("data");
									data1 = request.getParameter("data1");
									Select = request.getParameter("type");
									String admin = "";
									if (Select.equalsIgnoreCase("All")) {
										admin = "SELECT Name,Uname FROM t_admin WHERE TypeValue = '"
												+ session.getValue("typeval").toString()
												+ "' AND UserType = 'dispatch' AND Active = 'Yes'";
									} else {
										admin = "SELECT Name,Uname FROM t_admin WHERE TypeValue = '"
												+ session.getValue("typeval").toString()
												+ "' AND NAME = '"
												+ request.getParameter("type")
												+ "' AND UserType = 'dispatch' AND Active = 'Yes'";
									}
									int SRNO = 1;

									System.out.println("First--" + admin);
									ResultSet rsAdmin = stmtUserList.executeQuery(admin);
									while (rsAdmin.next()) {
										USER_NAME = rsAdmin.getString("Name");
										String Entby = "SELECT COUNT(*) AS CURRENT_HOLDING FROM t_unitmasterhistory WHERE User = '"
												+ rsAdmin.getString("Name")
												+ "' AND Status = 'Sent' AND DispDate BETWEEN '"
												+ data + "' AND '" + data1 + "'";
										ResultSet rsEntby = stmtGPS.executeQuery(Entby);
										if (rsEntby.next()) {
											CURRENT_HOLDING = rsEntby.getInt("CURRENT_HOLDING");
										}
										int DISPATCHED_COUNT = 0, REMAINING_COUNT = 0;
										String UnitMaster = "SELECT Unitid,Entdate,DispDate From t_unitmasterhistory WHERE Status = 'Sent' AND User = '"+ rsAdmin.getString("Name")+ "' AND DispDate BETWEEN '"	+ data+ "' AND '"+ data1 + "' group by UnitID";
										ResultSet rsUnitMaster = stmtGPS1.executeQuery(UnitMaster);
										while (rsUnitMaster.next()) {
											String Dispatched = "select * from db_CustomerComplaints.t_unitreceived where UnitID='"
													+ rsUnitMaster.getString("UnitID")
													+ "' and  Rdate >='"
													+ rsUnitMaster.getString("DispDate")
													+ "' and (Rcevd='Closed' OR Rcevd='-') and  ReceiveFrom NOT IN('Customer','Ware House','Technician') limit 1";
											//	String Dispatched = "SELECT * FROM t_unitmasterhistory WHERE DispDate > '"+rsUnitMaster.getString("DispDate")+"' AND UnitId = '"+rsUnitMaster.getString("UnitID")+"' AND Status in ('Dispatched','Dispatch') group by UnitID";
											ResultSet rsDispName = stCustomerComplaints
													.executeQuery(Dispatched);
											if (rsDispName.next()) {
												DISPATCHED_COUNT = DISPATCHED_COUNT + 1;
											} else {
												REMAINING_COUNT = REMAINING_COUNT + 1;
											}
										}
						%>
						<tr>
							<td><div align="right"><%=SRNO%></div></td>
							<td><div align="left"><%=USER_NAME%></div></td>
							<td><div align="right"><%=CURRENT_HOLDING%></div></td>
							<td><div align="right"><%=DISPATCHED_COUNT%></div></td>
							<td><div align="right">
									<a
										href="TATForInternalUsers.jsp?UserName=<%=USER_NAME%>&Date1=<%=data%>&Date2=<%=data1%>"><%=REMAINING_COUNT%></a>
								</div></td>
						</tr>
						<%
							SRNO++;
									}
								}
						%>
					</table>
					<%
						} catch (Exception E) {
							E.printStackTrace();
						} finally {
							conGPS.close();
							conCC.close();
						}
					%>
				
</body>
</html>