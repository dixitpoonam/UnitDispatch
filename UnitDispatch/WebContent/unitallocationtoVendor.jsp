<%@ include file="menuheader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!Connection conGPS;
	Connection conCC;
	String refno = null;
	Statement stCutomerComplaints = null, stGPS = null, stGPS1 = null;
	int CURRENT_HOLDING = 0;
	String USER_NAME = "";

	public int nullIntconv(String str) {
		int conv = 0;
		if (str == null) {
			str = "0";
		} else if ((str.trim()).equals("null")) {
			str = "0";
		} else if (str.equals("")) {
			str = "0";
		}
		try {
			conv = Integer.parseInt(str);
		} catch (Exception e) {
		}
		return conv;
	}%>
<html>
<head>
<style type="text/css">
div.bad-field-error-message {
	border: 1px solid;
	background: #ecc6c6;
	padding: 0.5em 2em;
	margin-top: 1em;
	margin-bottom: 1em;
	margin-left: auto;
	margin-right: auto;
}

*.bad-field {
	color: red;
}
</style>
<title>Unit Dispatch -Unit Allocation</title>
<script type="text/javascript">
function validate()
{
	
	var VENDOR_NAME=document.UnitAllocation.VendorName.value;
	var UNIT_FROM=document.UnitAllocation.RangeStartFrom.value;
	var UNIT_TO=document.UnitAllocation.RangeEndsTo.value;

	if(VENDOR_NAME=="All")
	{
		alert("Please Select Vendor Name To Allocate The Units","Transworld");
		return false;
	}
	if(UNIT_FROM=="")
	{
		alert("Please Enter Starting UnitID Range","Transworld");
		return false;
	}
	
	if(UNIT_TO=="")
	{
		alert("Please Enter Ending UnitId Range","Transworld");
		return false;
	}

	if(shownewadd=="Yes")
	{
		var place=document.sendman.newadd.value;
		var fuladd=document.sendman.newfuladd.value;

		if(place=="")
		{
			alert("Please enter New Place");
			return false;
		}
		if(fuladd.length<=1)
		{
			alert("Please enter Full Address");
			return false;
		}
	}

	return true;
}
</script>
</head>
<body>
	<div>
		<table border="0" cellspacing="0" cellpadding="0" width="60%"
			align="center">
			<tr>
				<td>
					<!-- body part come here -->
					<table width="100%" align="center" class="sortable">
						<tr>
							<td align="center" class="sorttable_nosort"><font
								color="block" size="2">Unit Allocation To The Vendors</font></td>
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

										ResultSet rsPagination = null;
										ResultSet rsRowCnt = null;

										PreparedStatement psPagination = null;
										PreparedStatement psRowCnt = null;

										int iShowRows = 10; // Number of records show on per page
										int iTotalSearchRecords = 5; // Number of pages index shown

										int iTotalRows = nullIntconv(request.getParameter("iTotalRows"));
										int iTotalPages = nullIntconv(request
												.getParameter("iTotalPages"));
										int iPageNo = nullIntconv(request.getParameter("iPageNo"));
										int cPageNo = nullIntconv(request.getParameter("cPageNo"));

										int iStartResultNo = 0;
										int iEndResultNo = 0;

										if (iPageNo == 0) {
											iPageNo = 0;
										} else {
											iPageNo = Math.abs((iPageNo - 1) * iShowRows);
										}

										String sqlPagination = "SELECT SQL_CALC_FOUND_ROWS * FROM t_unitserialization limit "
												+ iPageNo + "," + iShowRows + "";

										psPagination = conGPS.prepareStatement(sqlPagination);
										rsPagination = psPagination.executeQuery();

										//// this will count total number of rows
										String sqlRowCnt = "SELECT FOUND_ROWS() as cnt";
										psRowCnt = conGPS.prepareStatement(sqlRowCnt);
										rsRowCnt = psRowCnt.executeQuery();

										if (rsRowCnt.next()) {
											iTotalRows = rsRowCnt.getInt("cnt");
										}

										stCutomerComplaints = conCC.createStatement();
										String today = new SimpleDateFormat("yyyy-MM-dd")
												.format(new java.util.Date());
										String data = "", data1 = "", vendor = "", Statustype = "", technician = "", Select = "", GuessErrorMsg = null;
								%>
								<form name="UnitAllocation" id="UnitAllocation" action="UnitAllocationInsert.jsp" onSubmit="return validate();">
									<%
								    System.out.println(request.getParameter("NOT_ALLOCATED_UNITS"));
									System.out.println(request.getParameter("ALLOCATED_UNITS"));
									if(request.getParameter("NOT_ALLOCATED_UNITS") != null)
									{
										%>
										<div class='bad-field-error-message'>You Can't Allocate Unit/s Again :-<b><%=request.getParameter("NOT_ALLOCATED_UNITS")%></b></div>
										<%
									}
									else if(request.getParameter("ALLOCATED_UNITS") != null)
									{
										if(request.getParameter("updated") == null)
										{
											%>
											<div class='bad-field-error-message'>Please fill all the  Values For allocating the unit's to vendor!!</div>
											<%
										}
										else
										{
											%>
											<div class='bad-field-error-message'>Unit/s From <b><%=request.getParameter("Start")%></b> To <b><%=request.getParameter("END")%></b> Allocated To <b><%=request.getParameter("VENDOR")%></b> Successfully!!</div>
											<div class='bad-field-error-message'>Allocated Unit ID/s Are As  <b><%=request.getParameter("ALLOCATED_UNITS")%></b></div>
											<%
										}
									}
										
									%>
									<table border="0" width="90%" align="center">
										<tr bgcolor="#87CEFA">

											<td><b>Units Allocate To :</b> <%
 	String VendorList = "SELECT V_ID,V_Name FROM t_vendorMaster";
 		ResultSet RsAllVendors = stCutomerComplaints
 				.executeQuery(VendorList);
 %>
												<select name="VendorName" id="VendorName">
													<option value="All">All</option>
													<%
														while (RsAllVendors.next()) {
													%>
													<option value<%=RsAllVendors.getString("V_Name")%>"><%=RsAllVendors.getString("V_Name")%></option>
													<%
														}
													%>
											</select></td>
											<td><b>Range Start From :</b> <input type="text"
												name="RangeStartFrom" id="RangeStartFrom"></td>
											<td><b>Range Up To :</b> <input type="text" name="RangeEndsTo"
												id="RangeEndsTo" width="10px;"></td>
											<td><input type="submit" name="submit" id="submit"
												value="Allocate" class="formElement"></td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
						<%
							String dd = request.getParameter("RangeStartFrom");
								if (dd == null) {
							}
						%>
						<table border="1" cellspacing="0" cellpadding="0" width="60%"
							align="center" class="stats" bordercolor="white">
							<tr>
								<th>Sr. No.</th>
								<th>Unit ID</th>
								<th>Vendor</th>
								<th>Status</th>
							</tr>
							<%
								int count = iPageNo;
									while (rsPagination.next()) {
							%>
							<tr>
								<td><%=++count%></td>
								<td><%=rsPagination.getString("UNITID")%></td>
								<td><%=rsPagination.getString("VENDOR")%></td>
								<td><%=rsPagination.getString("STATUS")%></td>
							</tr>
							<%
                           }
							%>
							<%
								//// calculate next record start record  and end record 
									try {
										if (iTotalRows < (iPageNo + iShowRows)) {
											iEndResultNo = iTotalRows;
										} else {
											iEndResultNo = (iPageNo + iShowRows);
										}

										iStartResultNo = (iPageNo + 1);
										iTotalPages = ((int) (Math.ceil((double) iTotalRows
												/ iShowRows)));

									} catch (Exception e) {
										e.printStackTrace();
									}
							%>
							<tr>
								<td colspan="5">
									<div>
										<%
											//// index of pages 

												int i = 0;
												int cPage = 0;
												if (iTotalRows != 0) {
													cPage = ((int) (Math.ceil((double) iEndResultNo
															/ (iTotalSearchRecords * iShowRows))));

													int prePageNo = (cPage * iTotalSearchRecords)
															- ((iTotalSearchRecords - 1) + iTotalSearchRecords);
													if ((cPage * iTotalSearchRecords) - (iTotalSearchRecords) > 0) {
										%>
										<a
											href="unitallocationtoVendor.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>">
											<< Previous</a>
										<%
											}

													for (i = ((cPage * iTotalSearchRecords) - (iTotalSearchRecords - 1)); i <= (cPage * iTotalSearchRecords); i++) {
														if (i == ((iPageNo / iShowRows) + 1)) {
										%>
										<a href="unitallocationtoVendor.jsp?iPageNo=<%=i%>"
											style="cursor: pointer; color: red"><b><%=i%></b></a>
										<%
											} else if (i <= iTotalPages) {
										%>
										<a href="unitallocationtoVendor.jsp?iPageNo=<%=i%>"><%=i%></a>
										<%
											}
													}
													if (iTotalPages > iTotalSearchRecords && i < iTotalPages) {
										%>
										<a href="unitallocationtoVendor.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>"> >> Next</a>
										<%
											}
												}
										%>
										<b>Rows <%=iStartResultNo%> - <%=iEndResultNo%> Total
											Result <%=iTotalRows%>
										</b>
									</div>
								</td>
							</tr>
						</table>
						</form>
</body>
</html>
<%
	try {
			if (psPagination != null) {
				psPagination.close();
			}
			if (rsPagination != null) {
				rsPagination.close();
			}

			if (psRowCnt != null) {
				psRowCnt.close();
			}
			if (rsRowCnt != null) {
				rsRowCnt.close();
			}

			if (conGPS != null) {
				conGPS.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
%>
</table>
</table>
</div>
<br>
<br>
<%
	} catch (Exception E) {
E.printStackTrace();
	} finally {

	}
%>

</body>
</html>