<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.omg.CORBA.Request"%>
<%@ include file="menuheader.jsp"%>
<%@ page import="java.io.*, java.util.* , java.text.*"%>
<html>
<head>
<%!Connection conGPS;
	Connection conCC;
	String refno = null;
	Statement stmtUserList = null, stmtGPS = null, stmtGPS1 = null, stCustomerComplaints = null;%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function Displayer(n) {
		var check = document.getElementById('Section' + n);

		if (check.style.display == 'none') {
			check.style.display = 'inline';
		} else {
			check.style.display = 'none';
		}

	}
</script>
<style type="text/css">
<!--
h1 {
	font-size: 22px;
	font-family: Arial;
	font-style: normal;
	font-weight: bold;
	margin: 14px 0px 7px 0px;
	padding: 0px;
}

h2 {
	font-size: 17px;
	font-family: Arial;
	font-style: normal;
	font-weight: bold;
	padding: 0px;
	margin: 14px 0px 7px 0px;
}

h3 {
	font-size: 14px;
	font-family: Arial;
	font-style: normal;
	font-weight: bold;
	padding: 0px;
	margin: 14px 0px 7px 0px;
}

p {
	font-size: 12px;
	font-family: Arial;
	font-style: normal;
	font-weight: normal;
	line-height: 130%;
	margin: 7px 0px 7px 0px;
}

ul {
	list-style-position: inside;
	list-style-type: square;
	margin: 7px 0px 7px 0px;
	padding: 0px;
}

li {
	font-size: 12px;
	font-family: Arial;
	font-style: normal;
	font-weight: normal;
	margin: 1px 0px 1px 0px;
	padding: 0px;
}

a {
	color: #0000ff;
	text-decoration: underline;
}

a:hover {
	color: #0000ff;
	text-decoration: none;
}

.cbFormLabel {
	font-size: 12.5px;
	font-family: Arial;
	font-style: normal;
	font-weight:;
}

.cbFormLabelError {
	font-size: 12px;
	font-family: Arial;
	font-style: normal;
	font-weight: normal;
}

.cbFormError {
	color: #ff0000;
	font-size: 12px;
	font-family: Arial;
	font-style: normal;
	font-weight: bold;
	text-align: left;
	vertical-align: middle;
	margin-left: 5px;
}

.cbFormTable {
	border-collapse: collapse;
}

.cbFormTableRow {
	padding: 7px;
}

.cbFormLabelCell {
	text-align: left;
	vertical-align: top;
	width: auto;
	font-size: 12.5px;
	font-family: Arial;
	padding: 3px;
	white-space: normal;
}

.cbFormTextField {
	color: #000000;
	font-size: 12px;
	font-family: Arial;
	font-style: normal;
	font-weight: normal;
}

.cbFormTextArea {
	color: #000000;
	font-size: 12px;
	font-family: Arial;
	font-style: normal;
	font-weight: normal;
}

.cbFormPassword {
	color: #000000;
	font-size: 12px;
	font-family: Arial;
	font-style: normal;
	font-weight: normal;
	padding: 1px 1px 1px 1px;
}

.cbFormFieldCell {
	font-size: 12px;
	text-align: left;
	vertical-align: top;
	padding: 3px;
	white-space: nowrap;
}

.cbFormDataCell {
	text-align: left;
	vertical-align: top;
	width: auto;
	padding: 3px;
	white-space: normal;
}

.cbHTMLBlockContainer {
	text-align: left;
	vertical-align: top;
	padding: 3px;
}

.cbFormNestedTable {
	height: 100%;
	border-collapse: collapse;
	padding: 0px;
	border: none;
}

.cbFormNestedTableContainer {
	text-align: left;
	vertical-align: top;
	padding: 0px;
}

.cbFormLabelRequired {
	font-size: 12px;
	font-family: Arial;
	font-style: normal;
	font-weight:;
}

.cbFormRequiredMarker {
	font-size: 12px;
	font-family: Arial;
	margin-left: 2px;
	font-style: normal;
	font-weight: bold;
}

.cbFormData {
	font-size: 12px;
	font-family: Arial;
	font-style: normal;
	font-weight: normal;
}

.cbFormCalendar {
	padding-left: 5px;
}

.cbFormErrorMarker {
	margin-right: 5px;
}

.cbFormSelect {
	color: #000000;
	font-size: 12px;
	font-family: Arial;
	font-style: normal;
	font-weight: normal;
}

.cbFormFile {
	color: #000000;
	font-size: 12px;
	font-family: Arial;
	font-style: normal;
	font-weight: normal;
}

.cbFormDataLink {
	color: #0000ff;
	font-size: 12px;
	font-family: Arial;
	font-style: normal;
	font-weight: normal;
	text-decoration: underline;
}

input.button_text {
	overflow: visible;
	padding: 0 7px;
	width: auto;
}

.cbFormDataLink:hover {
	color: #0000ff;
	font-size: 12px;
	font-family: Arial;
	font-style: normal;
	font-weight: normal;
	text-decoration: none;
}

.cbSubmitButton {
	font-weight: normal;
	width: auto;
	height: auto;
	margin: 0 3px;
}

.cbSubmitButton_hover {
	font-weight: normal;
	width: auto;
	height: auto;
	margin: 0 3px;
}

.cbSubmitButtonContainer {
	padding: 3px;
	text-align: center;
	vertical-align: middle;
}
-->
</style>
</head>
<body>
	<%
		Class.forName(MM_dbConn_DRIVER);
	conGPS = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	conCC = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

	stmtUserList = conCC.createStatement();
	stmtGPS = conGPS.createStatement();
	stmtGPS1 = conGPS.createStatement();
	stCustomerComplaints = conCC.createStatement();
	String today = new SimpleDateFormat("yyyy-MM-dd")
			.format(new java.util.Date());
	String data = "", data1 = "", vendor = "", Statustype = "", technician = "", Select = "",date1="",date2="";
	%>
	<div style="background:#E6E6E6; width: 900px; margin-left: 80px">
		<h2 style="background: color:#ffffff; cursor: pointer;"
			onClick="Displayer(1)">&nbsp;+ 1. Pending Units&nbsp;</h2>
		<table id="Section1" style="display: none;">
			<tr>
				<td colspan="3" class="cbFormNestedTableContainer">
					<table class="cbFormNestedTable" cellspacing="0">
						<tr>
							<td colspan="4" class="cbFormNestedTableContainer">
								<table class="cbFormNestedTable" cellspacing="0" border="1">
									<tr>
										<th class="cbFormLabelCell cbFormLabelRequired"><b>SR.
												NO.</b></th>
										<th class="cbFormLabelCell cbFormLabelRequired"><b>UNIT
												ID</b></th>
									    </tr>
										<%
										int CountFirst = 1;
											String UNITMASTER = "SELECT Unitid,Entdate,DispDate From t_unitmasterhistory WHERE Status = 'Sent' AND User LIKE '"+request.getParameter("UserName")+ "' AND DispDate BETWEEN '"+request.getParameter("Date1")+ "' AND '"+request.getParameter("Date2")+ "' group by UnitID";
											ResultSet rsUnitMaster = stmtGPS.executeQuery(UNITMASTER);
										    while(rsUnitMaster.next())
										    {
										    	%>
										    	<tr>
										    	<%
										    	String NotDispatched = "select * from t_unitreceived where UnitID='"+ rsUnitMaster.getString("Unitid")+ "' and  Rdate >='"+ rsUnitMaster.getString("DispDate")+ "' and  ReceiveFrom NOT IN('Customer','Ware House','Technician')  And Transporter like '"+request.getParameter("UserName")+"' limit 1";
										    	ResultSet rsDispName = stCustomerComplaints.executeQuery(NotDispatched);
												if (rsDispName.next()) {
													%>
													<td><%=CountFirst%></td>
													<td><%=rsUnitMaster.getString("Unitid")%></td>
													<%
													CountFirst++;	
												}	
												%>
										    	</tr>
										    	<%
										    }
										%>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

	<div style="background: #E6E6E6; width: 900px; margin-left: 80px">
		<h2 style="background: color:#ffffff; cursor: pointer;"
			onClick="Displayer(2)">&nbsp;+ 2. Pending Units Not
			Repaired&nbsp;</h2>
		<table id="Section2" style="display: none;">
			<tr>
				<td colspan="2" class="cbFormNestedTableContainer">
					<table class="cbFormNestedTable" cellspacing="0">
						<tr>
							<td colspan="2" class="cbFormNestedTableContainer">
								<table class="cbFormNestedTable" cellspacing="0" border="1">
									<tr>
										<th class="cbFormLabelCell cbFormLabelRequired"><b>SR.
												NO.</b></th>
										<th class="cbFormLabelCell cbFormLabelRequired"><b>UNIT
												ID</b></th>
									</tr>
										<%
										int CountNotRepaired = 1;
											String NotRepaired = "SELECT Unitid,Entdate,DispDate From t_unitmasterhistory WHERE Status = 'Sent' AND User LIKE '"+request.getParameter("UserName")+ "' AND DispDate BETWEEN '"+request.getParameter("Date1")+ "' AND '"+request.getParameter("Date2")+ "' group by UnitID";
											System.out.println(NotRepaired);
											ResultSet rsNotRepaired = stmtGPS.executeQuery(NotRepaired);
										    while(rsNotRepaired.next())
										    {
										    	%>
										    	<tr>
										    	<%
										    	String NotDispatched = "select * from t_unitreceived where UnitID='"+ rsNotRepaired.getString("Unitid")+ "' and  Rdate >='"+ rsNotRepaired.getString("DispDate")+ "' and (Rcevd='Closed' OR Rcevd='-') and  EntBy like '"+request.getParameter("UserName")+ "' limit 1";
										    	System.out.println(NotDispatched);
										    	ResultSet rsDispName = stCustomerComplaints.executeQuery(NotDispatched);
												if (rsDispName.next()) {
													String RepairedUnit = "SELECT Unitid,Entdate,DispDate From t_unitmasterhistory WHERE UnitId = '"+rsNotRepaired.getString("Unitid")+"' And InstType Like 'Repaired' group by UnitID";
													System.out.println(RepairedUnit);
													ResultSet rsRepairedUnit = stmtGPS1.executeQuery(RepairedUnit);
													if (rsRepairedUnit.next()) {
														%>
														<td><%=CountNotRepaired%></td>
														<td><%=rsNotRepaired.getString("Unitid")%></td>
														<%
														CountNotRepaired++; 		
													}	
												}	
												%>
										    	</tr>
										    	<%
										    }
										%>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

	<div style="background: #E6E6E6; width: 900px; margin-left: 80px">
		<h2 style="background: color:#ffffff; cursor: pointer;"
			onClick="Displayer(3)">&nbsp;+ 3. Pending Units Not QT&nbsp;</h2>
		<table id="Section3" style="display: none;">
			<tr>
				<td colspan="2" class="cbFormNestedTableContainer">
					<table class="cbFormNestedTable" cellspacing="0">
						<tr>
							<td colspan="2" class="cbFormNestedTableContainer">
								<table class="cbFormNestedTable" cellspacing="0" border="1">
									<tr>
										<th class="cbFormLabelCell cbFormLabelRequired"><b>SR.
												NO.</b></th>
										<th class="cbFormLabelCell cbFormLabelRequired"><b>UNIT
												ID</b></th>
									</tr>
										<%
										
										int Tested = 1;
											String QuickTested = "SELECT Unitid,Entdate,DispDate From t_unitmasterhistory WHERE Status = 'Sent' AND User LIKE '"+request.getParameter("UserName")+ "' AND DispDate BETWEEN '"+request.getParameter("Date1")+ "' AND '"+request.getParameter("Date2")+ "' group by UnitID";
											ResultSet rsQuickTested = stmtGPS.executeQuery(QuickTested);
										    while(rsQuickTested.next())
										    {
										    	%>
										    	<tr>
										    	<%
										    	String NotDispatched = "select * from t_unitreceived where UnitID='"+ rsQuickTested.getString("Unitid")+ "' and  Rdate >='"+ rsQuickTested.getString("DispDate")+ "' and (Rcevd='Closed' OR Rcevd='-') and  ReceiveFrom NOT IN('Customer','Ware House','Technician') limit 1";
										    	ResultSet rsDispName = stCustomerComplaints.executeQuery(NotDispatched);
												if (rsDispName.next()) {
													String RepairedUnit = "SELECT Unitid,TheDate From hwunittest WHERE UnitId = '"+rsDispName.getString("Unitid")+"' And TheDate >= '"+rsDispName.getString("Rdate")+"' group by UnitID";
													ResultSet rsRepairedUnit = stmtUserList.executeQuery(RepairedUnit);
													if (rsRepairedUnit.next()) {
												         		
													}	
													else
													{
														%>
														<td><%=Tested%></td>
														<td><%=rsDispName.getString("Unitid")%></td>
														<%
														Tested++;	
													}
												}	
												%>
										    	</tr>
										    	<%
										    }
										%>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

	<div style="background: #E6E6E6; width: 900px; margin-left: 80px">
		<h2 style="background: color:#ffffff; cursor: pointer;"
			onClick="Displayer(4)">&nbsp;+ 4. Pending Units Not
			Received&nbsp;</h2>
		<table id="Section4" style="display: none;">
			<tr>
				<td colspan="2" class="cbFormNestedTableContainer">
					<table class="cbFormNestedTable" cellspacing="0">
						<tr>
							<td colspan="2" class="cbFormNestedTableContainer">
								<table class="cbFormNestedTable" cellspacing="0" border="1">
									<tr>
										<th class="cbFormLabelCell cbFormLabelRequired"><b>SR.
												NO.</b></th>
										<th class="cbFormLabelCell cbFormLabelRequired"><b>UNIT
												ID</b></th>
									</tr>
										<%
										int CountReceived = 1;
											String NotReceived = "SELECT Unitid,Entdate,DispDate From t_unitmasterhistory WHERE Status = 'Sent' AND User LIKE '"+request.getParameter("UserName")+ "' AND DispDate BETWEEN '"+request.getParameter("Date1")+ "' AND '"+request.getParameter("Date2")+ "' group by UnitID";
											ResultSet rsNotReceived = stmtGPS.executeQuery(NotReceived);
										    while(rsNotReceived.next())
										    {
										    	%>
										    	<tr>
										    	<%
										    	String NotDispatched = "select * from t_unitreceived where UnitID='"+ rsNotReceived.getString("Unitid")+ "' and  Rdate >='"+ rsNotReceived.getString("DispDate")+ "' and (Rcevd='Closed' OR Rcevd='-') and  ReceiveFrom NOT IN('Customer','Ware House','Technician') limit 1";
										    	ResultSet rsDispName = stCustomerComplaints.executeQuery(NotDispatched);
												if (rsDispName.next()) {
															
												}	
												else
												{
													%>
													<td><%=CountReceived%></td>
													<td><%=rsNotReceived.getString("Unitid")%></td>
													<%
													CountReceived++;
												}
												%>
										    	</tr>
										    	<%
										    }
										%>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

	<div style="background:#E6E6E6; width: 900px; margin-left: 80px">
		<h2 style="background: color:#ffffff; cursor: pointer;"
			onClick="Displayer(5)">&nbsp;+ 5. Pending Units OK But Not
			Dispatched&nbsp;</h2>
		<table id="Section5" style="display: none;">
			<tr>
				<td colspan="2" class="cbFormNestedTableContainer">
					<table class="cbFormNestedTable" cellspacing="1">
						<tr>
							<td colspan="2" class="cbFormNestedTableContainer">
								<table class="cbFormNestedTable" cellspacing="0" border="1">
								<tr>
										<th class="cbFormLabelCell cbFormLabelRequired"><b>SR.
												NO.</b></th>
										<th class="cbFormLabelCell cbFormLabelRequired"><b>UNIT
												ID</b></th>
									</tr>
								<%
								 int CoutNotDispatched = 1;
											String AllSent = "SELECT Unitid,Entdate,DispDate From t_unitmasterhistory WHERE Status = 'Sent' AND User LIKE '"+request.getParameter("UserName")+ "' AND DispDate BETWEEN '"+request.getParameter("Date1")+ "' AND '"+request.getParameter("Date2")+ "' group by UnitID";
											ResultSet rsAllSent = stmtGPS.executeQuery(AllSent);
										    while(rsAllSent.next())
										    {
										    	%>
										    	<tr>
										    	<%
										    	String QTested = "select * from t_unitreceived where UnitID='"+ rsAllSent.getString("Unitid")+ "' and  Rdate >='"+ rsAllSent.getString("DispDate")+ "' and (Rcevd='Closed' OR Rcevd='-') and  ReceiveFrom NOT IN('Customer','Ware House','Technician') limit 1";
										    	
										    	ResultSet rsQTested = stCustomerComplaints.executeQuery(QTested);
												if (rsQTested.next()) {
													String RepairedUnit = "SELECT Unitid,TheDate From hwunittest WHERE UnitId = '"+rsQTested.getString("Unitid")+"' And TheDate >= '"+rsQTested.getString("Rdate")+"' group by UnitID";
													ResultSet rsRepairedUnit = stmtUserList.executeQuery(RepairedUnit);
													if (rsRepairedUnit.next()) {
														String que="Select * from t_unitmasterhistory where DispDate >= '"+rsRepairedUnit.getString("TheDate")+"' and UnitId='"+rsRepairedUnit.getString("Unitid")+"' and Status='Dispatched' order by DispDate Limit 1";
														ResultSet rsque = stmtGPS1.executeQuery(que);
														if(rsque.next())
														{
															
														}
														else
														{
															%>
															<td><%=CoutNotDispatched%></td>
															<td><%=rsRepairedUnit.getString("Unitid")%></td>
															<%
															CoutNotDispatched++;	
														}
													}	
													
												}	
												%>
										    	</tr>
										    	<%
										    }
										%>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>