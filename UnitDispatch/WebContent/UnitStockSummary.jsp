<%@ include file="menuheader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript">
			function getdetails(index){
			//	alert("hello");
				   /*var popup = document.getElementById("box"+index);
           	popup.style.visibility = "visible";*/
           
				//alert("hi");
				document.getElementById('box'+index).style.display = 'block';
				//document.forms['unitsummary'].elements['box1'+index].style.display = 'block';
					
			}
			</script>
<script language="javascript">
			function validate()
  			{
  				/*if(document.getElementById("data").value=="")
  				{
  			  		alert("Please select the from date");
  					return false;
  				}
  				if(document.getElementById("data1").value=="")
  				{
			  		alert("Please select the to date");
  					return false;
  				}*/
  				if(document.getElementById("vendor").value=="")
  				{
  					alert("Please select the vendor");
  					return false;
  	  			}
  				if(document.getElementById("Statustype").value=="")
  				{
  					alert("Please select the Statustype");
  					return false;
  	  			}
  				return true;
  				//return datevalidate();
  		  }
  		
			 function datevalidate()
			 {
			 	var date1=document.getElementById("data").value;
				var date2=document.getElementById("data1").value;
				var dm1,dd1,dy1,dm2,dd2,dy2;
				dy1=date1.substring(0,4);
				dy2=date2.substring(0,4);
				dm1=date1.substring(5,7);
				dm2=date2.substring(5,7);
				dd1=date1.substring(8,10);
				dd2=date2.substring(8,10);
				var date=new Date();
				var month=date.getMonth()+1;
				var day=date.getDate();
				var year=date.getFullYear();
				if(dy1>year || dy2>year)
				{
					alert("selected date should not be greater than todays date");
					document.getElementById("data").value="";
					document.getElementById("data1").value="";
					document.getElementById("data").focus;
					return false;
				}
				else if(year==dy1 && year==dy2)
				{
		  			if(dm1>month || dm2>month)
					{
						alert("selected date should not be greater than todays date");
						document.getElementById("data").value="";
						document.getElementById("data1").value="";
						document.getElementById("data").focus;
						return false;
					}
				}
				if(dm1==month)
				{
					if(dd1>day || dd2>day)
					{
						alert("selected date should not be greater than todays date");
						document.getElementById("data").value="";
						document.getElementById("data1").value="";
						document.getElementById("data").focus;
						return false;
					}
				}
				if(dy1>dy2)
				{
					alert("From date year is should not be greater than to date year");
					document.getElementById("data").value="";
					document.getElementById("data1").value="";
					document.getElementById("data").focus;
					return false;
				}
				else if(year==dy1 && year==dy2) if(dm1>dm2)
				{MimeMessage msg=new MimeMessage(session);
					alert("From date month is should not be greater than to date month 5");
					document.getElementById("data").value="";
					document.getElementById("data1").value="";
					document.getElementById("data").focus;
					return false;
				}
				if(dm1==dm2) 
				{
					if(dd1 > dd2)
					{
						alert("From date should not be greater than to date");
						document.getElementById("data").value="";
						document.getElementById("data1").value="";
						document.getElementById("data").focus;
						return false;
					}
				}
				return true;
			}
 			

  	</script>
<title>Unit Dispatch</title>
<script src="sorttable.js"></script>

</head>
<body bgcolor="lightyellow">
<table border="0" cellspacing="0" cellpadding="0" width="100%">



	<tr>
		<td><!-- body part come here -->
		<table width="100%" align="center" class="sortable">

			<tr>
				<td align="center" class="sorttable_nosort"><font color="block"
					size="2">Unit Stock Summary Report</font></td>
			</tr>
			<tr>
				<td><!-- if date range is not requred please remove this code start from this comment to -->



				<%!Connection con1;
	Connection con2;
	String refno = null;%> <%
 	try {
 		Class.forName(MM_dbConn_DRIVER);
 		con1 = DriverManager.getConnection(MM_dbConn_STRING,
 				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
 		con2 = DriverManager.getConnection(MM_dbConn_STRING1,
 				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

 		Statement stmt1 = con2.createStatement();
 		Statement stmt2 = con1.createStatement();
 		Statement stmt3 = con1.createStatement();
 		Statement stmt4 = con2.createStatement();
 		Statement st = con1.createStatement();
 		Statement st1 = con1.createStatement();
 		Statement st2 = con1.createStatement();

 		ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null, rs5 = null, rs6 = null, rs7 = null, rs8 = null, rs9 = null, rs10 = null, rs11 = null;
 		String sql1 = "", sql2 = "", sql3 = "", sql4 = "", sql5 = "", sql6 = "", sql7 = "", que = "", que1 = "";
 		String data = "", data1 = "", vendor = "",vendorName="", Statustype = "", technician = "";

 		String user = session.getValue("urole").toString();
 		String type = session.getValue("typeval").toString();
 		//out.println(user);
 		String today = new SimpleDateFormat("yyyy-MM-dd")
 				.format(new java.util.Date());

 		//String ustyp=session.getValue("urole").toString();
 		//out.println(ustyp);
 %>
				<form action="" method="get" onsubmit="return validate();">
				<table border="0" width="50%" align="center">

					<tr bgcolor="#87CEFA">
						<!-- <td align="left">
			  <table ><tr style="border: none;">
			  <td >
			  <input type="text" id="data" name="data" class="formElement" value="<%=today%>" size="10" readonly/>
			  </td>
			  <td>
				<input type="button" name="From Date" value="From Date" id="trigger" class="formElement"/>
				<script type="text/javascript">
  				Calendar.setup(
    			{
      			inputField  : "data",         // ID of the input field
      			ifFormat    : "%Y-%m-%d",     // the date format
      			button      : "trigger"       // ID of the button
    			}
  				);	
				</script>
			  </td>
			  </tr></table>
			</td>
			<td align="right">
			<table><tr><td>
			<input type="text" id="data1" name="data1" class="formElement"  value="<%=today%>" size="10" readonly />
			</td>
			<td>
			 	<input type="button" name="To Date" value="To Date" id="trigger1" class="formElement"/>
				<script type="text/javascript">
  				Calendar.setup(
    			{
      			inputField  : "data1",         // ID of the input field
      			ifFormat    : "%Y-%m-%d",    // the date format
      			button      : "trigger1"       // ID of the button
    			}
  				);
				</script>
			</td>
			</tr></table>
			  	
			  	
  			 </td >
  			 -->
						<td>
						<table>
							<tr>

								<td><b>Vendor:</b></td>
								<td>
								<%
									if (user.equalsIgnoreCase("Administrator")) {
											//sql1 = "Select distinct(TypeValue) from t_admin where urole='manufacturer'";
											sql1 = "Select * from t_vendorMaster";
											rs1 = stmt1.executeQuery(sql1);
								%> <select name="vendor" id="vendor" class="formElement">
									<option value="all">All</option>
									<%
										while (rs1.next()) {
									%>
									<option value="<%=rs1.getString("V_Name")%>"><%=rs1.getString("V_Name")%></option>

									<%
										}
									%>
								</select> <%
 	} else {
 %> <input type="text" readonly="readonly" value="<%=type%>"
									name="vendor" id="vendor"></input> <%
 	}
 %>
								</td>
							</tr>
						</table>

						</td>
						<td>
						<table>
							<tr>
								<td><b>Status&nbsp;Type:</b></td>
								<td><select Name="Statustype" id="Statustype"
									class="formElement">
									<option value="New">New</option>
									<option value="Repaired">Repaired</option>
									<option value="Both">Both</option>
								</select></td>
							</tr>
						</table>
						</td>
						<td><input type="submit" name="submit" id="submit"
							value="submit" class="formElement"></td>
					</tr>

				</table>
				</form>
				</td>
			</tr>
			<%
				vendor = request.getParameter("vendor");
					if (vendor == null) {
			%>

			<table class="stats">
				<tr>
					<td>
					<center class='bodyText'><b>Please select option to
					display the Dispatch Report</b></center>
					</td>
				</tr>
			</table>

			<%
				} else {
						/*data=request.getParameter("data");
						 data1=request.getParameter("data1");*/
						Statustype = request.getParameter("Statustype");
						vendor = request.getParameter("vendor");
			%>
			<tr>
				<td class="sorttable_nosort">
				<div id="report_heding"><font color="brown" size="3">Unit
				Stock Details for <%
					/* java.util.Date ShowDate = new SimpleDateFormat("yyyy-MM-dd").parse(data);
																																																																																																																																																							 Format formatter2 = new SimpleDateFormat("dd-MMM-yyyy");
																																																																																																																																																							 String showdate = formatter2.format(ShowDate);
																																																																																																																																																							 out.print(showdate);*/
				%> <%
 	/*  java.util.Date ShowDate1 = new SimpleDateFormat("yyyy-MM-dd").parse(data1);
 																																																																																																																																																			  Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
 																																																																																																																																																			 String showdate1 = formatter1.format(ShowDate1);*/
 			out.print("Vendor:" + vendor + "&nbsp;&nbsp; Status Type:"
 					+ Statustype);
 %> </font></div>
				<div align="right"><!-- 	<a href="#" onclick="javascript:window.open('printviewdispatch.jsp?data=<%=data%>&data1=<%=data1%>&Statustype=<%=Statustype%>&vendor=<%=vendor%>');" title="Print Report"><img src="images/print.jpg" width="15px" height="15px"></a>&nbsp; &nbsp; 
				<a href="viewdispatch_export.jsp?data=<%=data%>&data1=<%=data1%>&Statustype=<%=Statustype%>&vendor=<%=vendor%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a> -->
				<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
							.format(new java.util.Date())%></div>
				</td>
			</tr>
		</table>
		<form name="unitsummary" method=get>
		<table border="1" width="100%">

			<tr>
				<th align="center">Sr.No
				</td>
				<th align="center">Name
				</td>
				<th align="center">Unit Count
				</td>
				<th align="center">Status
				</td>
				<th align="center">Faulty / Ok
				</td>
			</tr>
			<%
				/*
sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and Status='Dispatched' ";
session.setAttribute("sql",sql2);
}
else if(Statustype.equals("Both"))
{ 
sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and user='"+vendor+"' and Status='Dispatched'";
session.setAttribute("sql",sql2);
}*/
               
						if (vendor.equals("all")) {
							int i = 1;
							sql1 = "select distinct(TypeValue) from t_admin where URole = 'manufacturer' order by Name asc ";
							rs1 = stmt1.executeQuery(sql1);

							while (rs1.next()) {
								String manuf = rs1.getString("TypeValue");
								if (Statustype.equalsIgnoreCase("both"))
									sql2 = "select * from t_unitmaster where HoldBy='"
											+ manuf + "' ";
								else
									sql2 = "select * from t_unitmaster where InstType ='"
											+ Statustype
											+ "' and HoldBy='"
											+ manuf
											+ "' ";
								session.setAttribute("sql", sql2);
								
								 String sqlV_ID = "Select V_ID,V_Name from db_CustomerComplaints.t_vendorMaster where V_ID = '"+manuf+"'";
					                ResultSet rsV_ID = stmt4.executeQuery(sqlV_ID);
					                if(rsV_ID.next())
					                {
					                	vendor = rsV_ID.getString("V_ID");
					                	vendorName = rsV_ID.getString("V_Name");
					                }
							System.out.println("VEndor ID==="+vendor);
							System.out.println("VEndor Name==="+vendorName);
								String newunits = "", repairunits = "", unittype = "";
								String status = "", tested = "";
								int faultyyes = 0, received = 0, sent = 0, faultyno = 0;

								int cntunit = 0;
								rs2 = stmt2.executeQuery(sql2);
								while (rs2.next()) {

									//unittype=rs2.getString("InstType");
									cntunit++;
									status = rs2.getString("Status");
									tested = rs2.getString("testedunit");
									if (status == null)
										status = "";
									if (tested == null)
										tested = "";
									if (status.equalsIgnoreCase("Received"))
										received++;
									else if (status.equalsIgnoreCase("Sent"))
										sent++;
									if (tested.equalsIgnoreCase("Yes"))
										faultyno++;
									else if (tested.equalsIgnoreCase("No"))
										faultyyes++;

								}
			%>

			<tr>
				<td><font size="2"><%=i%></td>
				<td><font size="2"><%=manuf%></td>
				<td><font size="2"> <a
					href="ajaxunitstock.jsp?&status=<%=Statustype%>&vendor=<%=manuf%>"><b><font
					size="2"><%=cntunit%></b></a></td>
				<td><font size="2">Received=<a
					href="ajaxunitstock.jsp?&status=<%=Statustype%>&vendor=<%=manuf%>&received=<%=received%>"><font
					size="2"><%=received%></a> &nbsp;&nbsp; Sent=<a
					href="ajaxunitstock.jsp?&status=<%=Statustype%>&vendor=<%=manuf%>&sent=<%=sent%>"><font
					size="2"><%=sent%></a></td>
				<td><font size="2">Faulty=<a
					href="ajaxunitstock.jsp?&status=<%=Statustype%>&vendor=<%=manuf%>&faultyyes=<%=faultyyes%>"><font
					size="2"><%=faultyyes%></a> &nbsp;&nbsp; OK=<a
					href="ajaxunitstock.jsp?&status=<%=Statustype%>&vendor=<%=manuf%>&faultyno=<%=faultyno%>"><font
					size="2"><%=faultyno%></a>&nbsp;&nbsp; 
			</tr>
			<tr>
				<td></td>
				<td id="popup<%=i%>"></td>

			</tr>


			<%
				i++;
							}

						} else {
							//out.println("hi");
							        String sqlV_ID = "Select V_ID,V_Name from db_CustomerComplaints.t_vendorMaster where V_Name like '"+vendor+"'";
					                ResultSet rsV_ID = stmt4.executeQuery(sqlV_ID);
					                if(rsV_ID.next())
					                {
					                	vendor = rsV_ID.getString("V_ID");
					                	vendorName = rsV_ID.getString("V_Name");
					                }
							System.out.println("VEndor ID==="+vendor);
					        if (Statustype.equalsIgnoreCase("both"))
								sql2 = "select * from t_unitmaster where HoldBy='"
										+ vendor + "' ";
							else
								sql2 = "select * from t_unitmaster where InstType ='"
										+ Statustype
										+ "' and HoldBy='"
										+ vendor
										+ "' ";
							session.setAttribute("sql", sql2);
							rs3 = stmt3.executeQuery(sql2);
							String status = "", tested = "";
							int faultyyes = 0, received = 0, sent = 0, faultyno = 0;

							int cntunit = 0;
							while (rs3.next()) {
								//unittype=rs2.getString("InstType");
								cntunit++;
								status = rs3.getString("Status");
								tested = rs3.getString("testedunit");
								if (status == null)
									status = "";
								if (tested == null)
									tested = "";
								if (status.equalsIgnoreCase("Received"))
									received++;
								else if (status.equalsIgnoreCase("Sent"))
									sent++;
								if (tested.equalsIgnoreCase("Yes"))
									faultyno++;
								else if (tested.equalsIgnoreCase("No"))
									faultyyes++;

							}
			%>
			<tr>
				<td><font size="2"><%=1%></td>
				<td><font size="2"><%=vendorName%></td>
				<td><font size="2"> <a
					href="ajaxunitstock.jsp?&status=<%=Statustype%>&vendor=<%=vendor%>"><b><font
					size="2"><%=cntunit%></b></a></td>
				<td><font size="2">Received=<a
					href="ajaxunitstock.jsp?&status=<%=Statustype%>&vendor=<%=vendor%>&received=<%=received%>"><font
					size="2"><%=received%></a> &nbsp;&nbsp; Sent=<a
					href="ajaxunitstock.jsp?&status=<%=Statustype%>&vendor=<%=vendor%>&sent=<%=sent%>"><font
					size="2"><%=sent%></a></td>
				<td><font size="2">Faulty=<a
					href="ajaxunitstock.jsp?&status=<%=Statustype%>&vendor=<%=vendor%>&faultyyes=<%=faultyyes%>"><font
					size="2"><%=faultyyes%></a> &nbsp;&nbsp; OK=<a
					href="ajaxunitstock.jsp?&status=<%=Statustype%>&vendor=<%=vendor%>&faultyno=<%=faultyno%>"><font
					size="2"><%=faultyno%></a>&nbsp;&nbsp; 
			</tr>
			<!-- <tr >
			
			<td id="box<%=1%>" style="display:none" colspan="4">
			
			</td>
				
			</tr> -->


			<%
				}
			%>

			<!-- body part come here -->
			<%
				}
				} catch (Exception e) {
					//out.println("Exception----->"+e); 
					System.out.println("Exception----->" + e);
				}

				finally {
					con1.close();
					con2.close();
				}
			%>
			</td>
			</tr>
		</table>
		</form>
		<table border="1" width="100%">
			<tr>
				<td bgcolor="white" class="copyright" width="100%">
				<center>Copyright &copy; 2008 by Transworld Compressor
				Technologies Ltd. All Rights Reserved.</center>
				</td>
			</tr>
		</table>
</body>

</html>