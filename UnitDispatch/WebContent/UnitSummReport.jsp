<%@ include file="menuheader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script language="javascript">


			function getdetails(index){
				alert("hello");
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
  				if(document.getElementById("data").value=="")
  				{
  			  		alert("Please select the from date");
  					return false;
  				}
  				if(document.getElementById("data1").value=="")
  				{
			  		alert("Please select the to date");
  					return false;
  				}
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
  				
  				return datevalidate();
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
					size="2">Unit Summary Report</font></td>
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
 		Statement st = con1.createStatement();
 		Statement st1 = con1.createStatement();
 		Statement st2 = con1.createStatement();

 		ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null, rs5 = null, rs6 = null, rs7 = null, rs8 = null, rs9 = null, rs10 = null, rs11 = null, rs12 = null;
 		String sql1 = "", sql2 = "", sql3 = "", sql4 = "", sql5 = "", sql6 = "", sql7 = "", que = "", que1 = "", sql8 = "";
 		String data = "", data1 = "", vendor = "", Statustype = "", technician = "";

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
						<td align="left">
						<table>
							<tr style="border: none;">
								<td><input type="text" id="data" name="data"
									class="formElement" value="<%=today%>" size="10" readonly /></td>
								<td><input type="button" name="From Date" value="From Date"
									id="trigger" class="formElement" /> <script
									type="text/javascript">
  				Calendar.setup(
    			{
      			inputField  : "data",         // ID of the input field
      			ifFormat    : "%Y-%m-%d",     // the date format
      			button      : "trigger"       // ID of the button
    			}
  				);	
				</script></td>
							</tr>
						</table>
						</td>
						<td align="right">
						<table>
							<tr>
								<td><input type="text" id="data1" name="data1"
									class="formElement" value="<%=today%>" size="10" readonly />
								</td>
								<td><input type="button" name="To Date" value="To Date"
									id="trigger1" class="formElement" /> <script
									type="text/javascript">
  				Calendar.setup(
    			{
      			inputField  : "data1",         // ID of the input field
      			ifFormat    : "%Y-%m-%d",    // the date format
      			button      : "trigger1"       // ID of the button
    			}
  				);
				</script></td>
							</tr>
						</table>


						</td>
						<td>
						<table>
							<tr>

								<td><b>Vendor:</b></td>
								<td>
								<%
									if (user.equalsIgnoreCase("Administrator")) {
											//sql1="Select distinct(TypeValue) from t_admin where urole='manufacturer'";
											sql1 = "Select V_Name from t_vendorMaster";
											rs1 = stmt1.executeQuery(sql1);
								%> <select name="vendor" id="vendor" class="formElement">
									<option value="all">All</option>
									<%
										while (rs1.next()) {
									%>
									<option value="<%=rs1.getString("v_Name")%>"><%=rs1.getString("v_Name")%></option>

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
									<!-- <option value="Both">Both</option> -->
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
				String dd = request.getParameter("data");
					if (dd == null) {
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
						data = request.getParameter("data");
						data1 = request.getParameter("data1");
						Statustype = request.getParameter("Statustype");
						vendor = request.getParameter("vendor");
			%>
			<tr>
				<td class="sorttable_nosort">
				<div id="report_heding"><font color="brown" size="3">Unit
				Details for <%
					java.util.Date ShowDate = new SimpleDateFormat("yyyy-MM-dd")
									.parse(data);
							Format formatter2 = new SimpleDateFormat("dd-MMM-yyyy");
							String showdate = formatter2.format(ShowDate);
							out.print(showdate);
				%> to <%
					java.util.Date ShowDate1 = new SimpleDateFormat(
									"yyyy-MM-dd").parse(data1);
							Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
							String showdate1 = formatter1.format(ShowDate1);
							out.print(showdate1 + "&nbsp;&nbsp; Vendor:" + vendor
									+ "&nbsp;&nbsp; Status Type:" + Statustype);
				%>
				</font></div>
				<div align="right"><!-- 	<a href="#" onclick="javascript:window.open('printviewdispatch.jsp?data=<%=data%>&data1=<%=data1%>&Statustype=<%=Statustype%>&vendor=<%=vendor%>');" title="Print Report"><img src="images/print.jpg" width="15px" height="15px"></a>&nbsp; &nbsp; 
				<a href="viewdispatch_export.jsp?data=<%=data%>&data1=<%=data1%>&Statustype=<%=Statustype%>&vendor=<%=vendor%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a> -->
				<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
							.format(new java.util.Date())%>
				</div>
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
				<th align="center">Box Type Count
				</td>
				<th align="center">Sim Count
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
							//sql1="select distinct(TypeValue) from t_admin where URole = 'manufacturer' order by Name asc ";
							sql1 = "select V_ID,V_Name from t_vendorMaster";
							rs1 = stmt1.executeQuery(sql1);

							while (rs1.next()) {
								
								//String manuf = rs1.getString("TypeValue");
                                 String manuf = rs1.getString("V_ID");
                                 String vName = rs1.getString("V_Name");
								sql2 = "select * from t_unitmaster where EntDate between '"
										+ data
										+ "'and '"
										+ data1
										+ "' and InstType ='"
										+ Statustype
										+ "' and HoldBy='" + manuf + "'";
								session.setAttribute("sql", sql2);
								String newunits = "", repairunits = "", unittype = "";
								String box = "", sim = "";
								int plastic = 0, metal = 0, idea = 0, airtel = 0, vodafone = 0;

								int cntunit = 0;
								rs2 = stmt2.executeQuery(sql2);
								while (rs2.next()) {

									//unittype=rs2.getString("InstType");
									cntunit++;
									box = rs2.getString("Box_type");
									sim = rs2.getString("SimCompany");
									if (box == null)
										box = "";
									if (sim == null)
										sim = "";
									if (box.equalsIgnoreCase("Metal"))
										metal++;
									else if (box.equalsIgnoreCase("Plastic"))
										plastic++;
									if (sim.equalsIgnoreCase("Airtel"))
										airtel++;
									else if (sim.equalsIgnoreCase("vodafone"))
										vodafone++;
									else if (sim.equalsIgnoreCase("Idea"))
										idea++;

								}
			%>

			<tr>
				<td><font size="2"><%=i%></td>
				<td><font size="2"><%=vName%></td>
				<td><font size="2"> <a
					href="ajaxgetunitdetails.jsp?&from=<%=data%>&to=<%=data1%>&status=<%=Statustype%>&vendor=<%=manuf%>"><b><font
					size="2"><%=cntunit%></b></a></td>
				<td><font size="2">Metal=<a
					href="ajaxgetunitdetails.jsp?&from=<%=data%>&to=<%=data1%>&status=<%=Statustype%>&vendor=<%=manuf%>&metal=<%=metal%>"><font
					size="2"><%=metal%></a> &nbsp;&nbsp; Plastic=<a
					href="ajaxgetunitdetails.jsp?&from=<%=data%>&to=<%=data1%>&status=<%=Statustype%>&vendor=<%=manuf%>&plastic=<%=plastic%>"><font
					size="2"><%=plastic%></a></td>
				<td><font size="2">Airtel=<a
					href="ajaxgetunitdetails.jsp?&from=<%=data%>&to=<%=data1%>&status=<%=Statustype%>&vendor=<%=manuf%>&airtel=<%=airtel%>"><font
					size="2"><%=airtel%></a> &nbsp;&nbsp; Idea=<a
					href="ajaxgetunitdetails.jsp?&from=<%=data%>&to=<%=data1%>&status=<%=Statustype%>&vendor=<%=manuf%>&idea=<%=idea%>"><font
					size="2"><%=idea%></a>&nbsp;&nbsp; Vodafone=<a
					href="ajaxgetunitdetails.jsp?&from=<%=data%>&to=<%=data1%>&status=<%=Statustype%>&vendor=<%=manuf%>&vodafone=<%=vodafone%>"><font
					size="2"><%=vodafone%></a></td>
				</font>
			</tr>
			<tr>
				<td></td>
				<td id="popup<%=i%>"></td>

			</tr>
			<%
				i++;
							}
						} else {
							
							String v_ID = "";
							sql8 = "Select V_ID,V_Name from t_vendorMaster where V_Name = '"+vendor+"'";
							ResultSet rsV_ID = stmt1.executeQuery(sql8);
							if(rsV_ID.next())
							{
							    v_ID = rsV_ID.getString("V_ID");
							}
							//out.println("hi");
							sql2 = "select * from t_unitmaster where EntDate between '"
									+ data
									+ "'and '"
									+ data1
									+ "' and InstType ='"
									+ Statustype + "' and HoldBy='" + v_ID + "' ";
							session.setAttribute("sql", sql2);
							rs3 = stmt3.executeQuery(sql2);
							String box = "", sim = "";
							int plastic = 0, metal = 0, idea = 0, airtel = 0, vodafone = 0;
							int cntunit = 0;
							while (rs3.next()) {
								cntunit++;
								box = rs3.getString("Box_type");
								sim = rs3.getString("SimCompany");

								if (box.equalsIgnoreCase("Metal"))
									metal++;
								else if (box.equalsIgnoreCase("Plastic"))
									plastic++;
								if (sim.equalsIgnoreCase("Airtel"))
									airtel++;
								else if (sim.equalsIgnoreCase("vodafone"))
									vodafone++;
								else if (sim.equalsIgnoreCase("Idea"))
									idea++;

							}
			%>
			<tr>
				<td><font size="2"><%=1%></td>
				<td><font size="2"><%=vendor%></td>
				<td><font size="2"> <a
					href="ajaxgetunitdetails.jsp?&from=<%=data%>&to=<%=data1%>&status=<%=Statustype%>&vendor=<%=v_ID%>"><b><font
					size="2"><%=cntunit%></b></a></td>
				<td><font size="2">Metal=<a
					href="ajaxgetunitdetails.jsp?&from=<%=data%>&to=<%=data1%>&status=<%=Statustype%>&vendor=<%=v_ID%>&metal=<%=metal%>"><font
					size="2"><%=metal%></a> &nbsp;&nbsp; Plastic=<a
					href="ajaxgetunitdetails.jsp?&from=<%=data%>&to=<%=data1%>&status=<%=Statustype%>&vendor=<%=v_ID%>&plastic=<%=plastic%>"><font
					size="2"><%=plastic%></a></td>
				<td><font size="2">Airtel=<a
					href="ajaxgetunitdetails.jsp?&from=<%=data%>&to=<%=data1%>&status=<%=Statustype%>&vendor=<%=v_ID%>&airtel=<%=airtel%>"><font
					size="2"><%=airtel%></a> &nbsp;&nbsp; Idea=<a
					href="ajaxgetunitdetails.jsp?&from=<%=data%>&to=<%=data1%>&status=<%=Statustype%>&vendor=<%=v_ID%>&idea=<%=idea%>"><font
					size="2"><%=idea%></a>&nbsp;&nbsp; Vodafone=<a
					href="ajaxgetunitdetails.jsp?&from=<%=data%>&to=<%=data1%>&status=<%=Statustype%>&vendor=<%=v_ID%>&vodafone=<%=vodafone%>"><font
					size="2"><%=vodafone%></a></td>
				</font>
			</tr>
			<!-- <tr >
			
			<td id="box<%=1%>" style="display:none" colspan="4">
			Metal=<%=metal%> &nbsp;&nbsp;
			Plastic=<%=plastic%>
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