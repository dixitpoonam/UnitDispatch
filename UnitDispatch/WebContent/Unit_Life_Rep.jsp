

<%@ include file="headeradmin.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Unit Dispatch</title>
<script src="sorttable.js"></script>

</head>
<body bgcolor="lightyellow">
<br></br>
<table border="0" width="28%" align="right">
            <tr>
                 <td background="images/orangebar.jpeg" width="50"> <div align="center">
                 <a href="Unit_Life_Rep.jsp?"> Unit Life Report</a>  </div> </td>
               <td background="images/orangebar.jpeg" width="50"> <div align="center">
                 <a href="logoutadmin.jsp"> Log Out </a>  </div> </td> 
            </tr> </table>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
          <tr>
<td>
              &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<div align="left"> <a href="javascript:history.go(-1)"> <img src="images/arrow.bmp" width="20px" height="20px" border="0" > </img> </a> </td>
      </td>
</tr>
         
       
        
        <tr>
          <td>
			<!-- body part come here -->
			<table width="100%" align="center" class="sortable">
			
			<tr>
			<td align="center" class="sorttable_nosort"><font color="brown" size="2" >Unit Life Report</font></td>
			</tr>
			<tr><td>
			<!-- if date range is not requred please remove this code start from this comment to -->
			
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
  	
  	
  	<%!
Connection con1;
Connection con2;
String refno=null;
%>
<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con2.createStatement();
Statement stmt2 = con1.createStatement();
Statement stmt3 = con1.createStatement();
Statement st=con1.createStatement();
Statement st1=con1.createStatement();
Statement st2=con1.createStatement();

ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null;
String sql1="",sql2="", sql3="", sql4="", sql5="", sql6="",sql7="",que="",que1="";
String data="",data1="",vendor="",Statustype="",technician="";




String user=session.getValue("urole").toString();
String type=session.getValue("typeval").toString();
//out.println(user);
String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

//String ustyp=session.getValue("urole").toString();
//out.println(ustyp);

%>
  	<form action="" method="get" onsubmit="return validate();">
			<table border="0"  width="50%" align="center">
			
			<tr bgcolor="#87CEFA">
			<td align="left">
			  <table ><tr style="border: none;">
			  <td >
			  <input type="text" id="data" name="data" class="formElement" value="<%=today %>" size="10" readonly/>
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
			<input type="text" id="data1" name="data1" class="formElement"  value="<%=today %>" size="10" readonly />
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
			<td>
			<table ><tr>
			
			<td><b>Vendor:</b></td>
			<td>
			<%
			if(user.equalsIgnoreCase("Administrator"))
			{
			sql1="Select distinct(TypeValue) from t_admin where urole='manufacturer'";
			rs1=stmt1.executeQuery(sql1);
			
			%>
			<select name="vendor" id="vendor" class="formElement">
			<option value="all">All</option>
			<%while(rs1.next())
			{%>
			<option value="<%=rs1.getString("TypeValue") %>"><%=rs1.getString("TypeValue") %></option>
			
			<%} %>
			</select>  
			<%}
			else
			{
				%>
				<input type="text" readonly="readonly" value="<%=type %>" name="vendor" id="vendor"></input>
				<%			}
			%>
			
			</td>
			</tr></table>
			
			</td>
			<td>
			<table><tr><td>
			<b>Status&nbsp;Type:</b></td>
			<td>
				<select Name="Statustype" id="Statustype" class="formElement">
					<option value="New">New</option>
					<option value="Repaired">Repaired</option>
					<option value="Both">Both</option>
				</select>
			</td>
			</tr></table>
			</td>
			<td>
				<input type="submit" name="submit" id="submit" value="submit" class="formElement">
			</td>
		</tr>
		
		</table>
		</form>
		</td></tr>
	<%	String dd=request.getParameter("data");
	if(dd==null)
{
%>

<table class="stats">
<tr><td>
<center class='bodyText'><b>Please select option to display the Dispatch Report</b></center>
</td></tr>
</table>

<%
}
else
{
data=request.getParameter("data");
data1=request.getParameter("data1");
Statustype=request.getParameter("Statustype");
vendor=request.getParameter("vendor");
%>
			<tr>
			<td  class="sorttable_nosort">
			<div id="report_heding"><font color="brown" size="3">Dispatch Details for <%
                        java.util.Date ShowDate = new SimpleDateFormat("yyyy-MM-dd").parse(data);
                        Format formatter2 = new SimpleDateFormat("dd-MMM-yyyy");
                        String showdate = formatter2.format(ShowDate);
                        out.print(showdate);
                        %> to <%
                        java.util.Date ShowDate1 = new SimpleDateFormat("yyyy-MM-dd").parse(data1);
                        Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
                       String showdate1 = formatter1.format(ShowDate1);
                        out.print(showdate1); %></font></div>
				<div align="right">
				<a href="#" onclick="javascript:window.open('printviewdispatch.jsp?data=<%= data %>&data1=<%=data1 %>&Statustype=<%=Statustype %>&vendor=<%=vendor%>');" title="Print Report"><img src="images/print.jpg" width="15px" height="15px"></a>&nbsp; &nbsp; 
				<a href="viewdispatch_export.jsp?data=<%= data %>&data1=<%=data1 %>&Statustype=<%=Statustype %>&vendor=<%=vendor%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>
				<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
				</div>
			</td>
			</tr>
			</table>
			
						<table width="100%" border="1" align="center" class="sortable">
						<tr>
						<th class="hed"> Sr.</th>
						<th class="hed"> Unit ID</th>
						<th class="hed"> Dispatch Date</th>
						<th class="hed"> Entered Date</th>
						<th class="hed"> Dispatch Done By</th>
						<th class="hed"> Dispatch From</th>
						<th class="hed"> Customer Name</th>
						<th class="hed"> Customer Location</th>
						<th class="hed"> Technician</th>
						<th class="hed"> Status</th>
						<th class="hed"> Name/Courier No</th>
						<th class="hed"> Configured</th>
						<th class="hed"> Current Status Of Configuration</th>
						<th class="hed"> Received After Disp</th>
						<th class="hed"> Received Date Before Disp</th>
						<th class="hed"> Received By Before Disp</th>
						<th class="hed"> Received From Before Disp</th>
						<th class="hed"> Quick Tested After Disp</th>
						<th class="hed"> Quick Tested Date Before Disp</th>
						<th class="hed"> Quick Tested By Before Disp</th>
						<th class="hed"> Approx. Units Life</th>
						<th class="hed"> Received by Party</th>
						
						<th class="hed"> Entred By</th>
							
						</tr>		
						<%
						if(vendor.equals("all")&&Statustype.equals("Both") )
						{
							sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and Status='Dispatched' ";
							session.setAttribute("sql",sql2);
						}
						else if(Statustype.equals("Both"))
						{ 
							sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and user='"+vendor+"' and Status='Dispatched'";
							session.setAttribute("sql",sql2);
						}
						else if(vendor.equals("all"))
						{
						 	sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and InstType ='"+Statustype+"' and Status='Dispatched'";
						 	session.setAttribute("sql",sql2);
						}
						else
						{
							sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and InstType ='"+Statustype+"' and user='"+vendor+"' and Status='Dispatched'";
							session.setAttribute("sql",sql2);
						}
			
						int i=1;
						//out.println(sql2);
						rs2=stmt2.executeQuery(sql2);
						while(rs2.next())
						{	
							
							//to get disp address
							String name="",location="",fulladdress="";
							String orderno=rs2.getString("OrderNo");
							String unitid=rs2.getString("UnitId");
							String Dispdate=rs2.getString("DispDate");
							String EnteredDate=rs2.getString("EntDate");
							String username="-";
							String EnteredBy=rs2.getString("EntBy");
							//-------------------- Received by third party-----------------------
							String Receive="No";
							String str1="Select * from t_unitmasterhistory where DispDate='"+Dispdate+"' and UnitId='"+unitid+"' and Status='Dispatched' and (RecByTech='Yes' OR RecByCust='Yes') order by DispDate Limit 1";
							ResultSet rst1=st2.executeQuery(str1);
							if(rst1.next())
							{
								
								Receive="Yes";
							}
							//----------------------Previous dispatch date-----------------------------------
								
							String prevdispdate="",prevrecdate="";
							String recddate=null,recname="",custname="";

							String qtdate="",qtby="";
							que="Select Dispdate from t_unitmasterhistory where DispDate < '"+Dispdate+"' and UnitId='"+unitid+"' and Status='Dispatched' order by DispDate desc Limit 1";
							System.out.println(que);
							ResultSet rsget=st.executeQuery(que);
							if(rsget.next())
							{
								prevdispdate=rsget.getString("DispDate");
								
							          //---------- if previous dispatch date---then get the received date --------	
								que1="select * from db_CustomerComplaints.t_unitreceived where Unitid='"+unitid+"' and Rdate >'"+prevdispdate+"' and ReceiveFrom IN('Customer','Ware House','Technician') and InTransit='No' order by Rdate limit 1";
								System.out.println(que1);
								ResultSet rsget1=stmt1.executeQuery(que1);
								if(rsget1.next())
								{
									
									
									recddate=rsget1.getString("Rdate");
									recname=rsget1.getString("EntBy");
									custname=rsget1.getString("Name");
									if(recname==null || recname.equals(""))
										recname="-";
									if(custname==null || custname.equals(""))
										custname="-";
								}
								else
								{
									
									recname="-";
									recddate="-";
									 qtdate="-";
									 qtby="-";
									 custname="-";
								}
								
								
								
							}
							else
							{
								//---if no prev. diapatch date then prev. received date
								String quee="Select EntDate from t_unitmasterhistory where EntDate < '"+Dispdate+"' and UnitId='"+unitid+"' and Status='Received' order by EntDate Limit 1";
								
								ResultSet rsgt=st1.executeQuery(quee);
								if(rsgt.next())
								{
									prevrecdate=rsgt.getString("EntDate");
									
									
									que1="select * from db_CustomerComplaints.t_unitreceived where Unitid='"+unitid+"' and Rdate ='"+prevrecdate+"' and ReceiveFrom IN('Customer','Ware House','Technician') and InTransit='No' order by Rdate limit 1";
									System.out.println(que1);
									ResultSet rsget1=stmt1.executeQuery(que1);
									if(rsget1.next())
									{
										
										
										recddate=rsget1.getString("Rdate");
										recname=rsget1.getString("EntBy");
										custname=rsget1.getString("Name");
										if(recname==null || recname.equals(""))
											recname="-";
										if(custname==null || custname.equals(""))
											custname="-";
									}
									else
									{
										
										recname="-";
										recddate="-";
										 qtdate="-";
										 qtby="-";
										 custname="-";
									}
									
									
									
								}
								else
								{
									recname="-";
									recddate="-";
									 custname="-";
								}
							}
							
							
							
							//------- if received date then get the next quick test date------------------------
								
								if(!recddate.equals("-"))
								{
								//to check if qt or not aft receive
								sql7="select * from db_CustomerComplaints.hwunittest where Unitid='"+unitid+"' and TheDate>='"+recddate+"' order by TheDate asc limit 1" ;
								System.out.println(sql7);
								 rs7=stmt1.executeQuery(sql7);	
								 if(rs7.next())
								 {
									
									
									 qtdate=rs7.getString("TheDate");
									 qtby=rs7.getString("User");
									 
								 }
								 else
								 {
									 
									 
									 qtdate="-";
									 qtby="-";
									 
								 }
								}
							
							
							sql3="select Cust,DispatchAdd,tech from t_unitorder where reqno='"+orderno+"'";
							rs3=stmt1.executeQuery(sql3);
							
							if(rs3.next())
							{
								try{
									name=rs3.getString("Cust").trim();
									if(name.length()<= 0)
									{
										name="-";
									}
								}catch (Exception ex){name="-";}
								technician=rs3.getString("tech");
								if(technician==null|| technician.equals("null")|| technician.length()<=0)
								{
									technician="-";
								}
								location=rs3.getString("DispatchAdd");
							}
							
							
							
							
							sql4="select Address from t_dispatchaddress where location='"+location+"'";
							rs4=stmt1.executeQuery(sql4);
							if(rs4.next())
							{
								fulladdress=rs4.getString("Address");
								
							}
							
							//to check if config aft disp 
							 String vehconf="No";
							 String replace_date=null;
							 String installeddate=null;
							 String life="0";
							 String recd="No",receiveddt="";
							
							 String current_status="No";
							 String replaced="no";
							 String qt="No";
							
							 String sql10="select InstDate from t_unitreplacement where NewUnitID="+unitid+" and InstDate>='"+Dispdate+"' order by InstDate asc limit 1";
							 rs10=stmt3.executeQuery(sql10);
							 if(rs10.next())
							 {
								 // installation date after dispatch
								 installeddate=rs10.getString("InstDate");
								 vehconf="Yes";
								 current_status="Yes";
								 //replacement date after istallation
								 String sql8="select * from db_gps.t_unitreplacement where OldUnitID="+unitid+" and InstDate>='"+installeddate+"' order by InstDate asc limit 1";
								 rs8=stmt1.executeQuery(sql8);
								 if(rs8.next())
								 {
									 replace_date=rs8.getString("InstDate");
									 replaced="yes";
									 current_status="No";
								 }
								 if(replaced.equalsIgnoreCase("yes"))
								 {
								 String sql9="Select To_days('"+replace_date+"')- To_days('"+installeddate+"')";
									rs9=stmt1.executeQuery(sql9);
									if(rs9.next())
									{
										life=rs9.getString(1);
									}
									if(life==null||life.length()==0|| Integer.parseInt(life)<0  )
									{
										life="0";
									}
								 }
							 }
							 else
							 {
								 vehconf="No";
							 }
							 
							//if current status is no
							if(current_status.equalsIgnoreCase("yes"))
							{
								recd="No";
								
								
								 qt="No";
							}
							else
							{
								//to get the replacement date of the unit 
								//to check if received aft disp and qt done 
							
								sql6="select * from db_CustomerComplaints.t_unitreceived where Unitid='"+unitid+"' and Rdate>='"+Dispdate+"' order by Rdate asc limit 1";
									System.out.println(sql6);
									rs6=stmt1.executeQuery(sql6);
									if(rs6.next())
									{
										
										recd="Yes";
										receiveddt=rs6.getString("Rdate");
										
										
										//to check if qt or not aft receive
										sql7="select * from db_CustomerComplaints.hwunittest where Unitid='"+unitid+"' and TheDate>='"+receiveddt+"' order by TheDate asc limit 1" ;
										System.out.println(sql7);
										 rs7=stmt1.executeQuery(sql7);	
										 if(rs7.next())
										 {
											 qt="Yes";
											 refno=rs7.getString("RefNo");
											
											 
										 }
										 else
										 {
											 qt="No";
											 
											
											 
										 }
									}
									else
									{
										recd="No";
										
									}
							}
									
							if(vendor.equalsIgnoreCase("Transworld") || (rs2.getString("User").equalsIgnoreCase("Transworld") ))
							{
									sql7="Select user,EditedBy,EntBy from t_unitmasterhistory where Unitid="+unitid+" and EntDate<='"+Dispdate+"' and  FirmwareChanged <>'-' and ModulePCBChanged <>'-' and PCBmodification <>'-' and	PowerSupplyChanged <>'-' and GPSMouseChanged <>'-' and GSMAntennaChanged <>'-' and SoftwareSimCorrections <>'-' and OtherCorrections <>'-'  and User not in ('Anish','apr enterprises','pulraj') order by EntDate desc,EntTime desc limit 1";
									//sql7="Select editedby from t_unitmasterhistory where EntDate='"+EnteredDate+"' and Status<>'Dispatched' and User= 'Transworld'  order by EntDate desc,EntTime desc limit 1";
									rs11=stmt3.executeQuery(sql7);
									if(rs11.next())
									{
										username=rs11.getString("EditedBy");
										if(username.equalsIgnoreCase("Transworld"))
										{
											username=rs11.getString("EntBy");
										}
									}
										
							}
						%>
							<tr>
								<td> <%=i%></td>
								<td><%=rs2.getString("Unitid") %></td>
								<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rs2.getDate("DispDate"))%> </td>
								<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rs2.getDate("EntDate"))%> </td>
								<td><%=EnteredBy %></td>
								<td><%=rs2.getString("User") %></td>
								<td><%=name %></td>
								<td><%=fulladdress %></td>
									<td><%=technician %></td>
								<td><%=rs2.getString("InstType") %></td>
								<td><%=rs2.getString("Disname") %></td>
								<td> <%=vehconf %></td>
								<td> <%=current_status %></td>
								<td><%=recd %> </td>
								<%if(recddate!="-" && recddate!="") 
								{%>
								<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(recddate)) %></td>
								<%}
								else
									{%>
									<td><%=recddate%></td>
									<%} %>
								<td><%=recname%></td>
								<td><%=custname %></td>
								
								<!--<td> <%=qt %></td>-->
								<%
									if(qt.equals("Yes"))
											{
										
										%><td><a href="qt_details.jsp?refno=<%=refno %>"><%=qt %></a>
										
											<%}
									else
									{
										%>
										<td> <%=qt %></td>
									<%	
									}%>
									<%if(qtdate!="-" && qtdate!="")
										{%>
									<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(qtdate)) %></td>
									<%}
									else
									{ %>
										<td><%=qtdate%></td>
										<%} %>
									<td><%=qtby %></td>
								<td><%=life %></td>
								<td><%=Receive %></td>
								<% if(vendor.equalsIgnoreCase("Transworld"))
							{
								%>
									<td><%=username %></td>
								<%
							}
								else if(rs2.getString("User").equalsIgnoreCase("Transworld"))
								{
									%>
									<td><%=username %></td>
								<%}
								else 
								{
						%>
						<td><%=EnteredBy %></td>
						<%}%>
								
								
							</tr>	
						<% i++;
						   } // while%>
						   
						</table>
			
			<!-- body part come here -->
					<%}
} catch(Exception e) { 
	//out.println("Exception----->"+e); 
System.out.println("Exception----->"+e);	
}

finally
{
con1.close();
con2.close();
}
%>
			</td>
    </tr>
    </table>
       <table border="1" width="100%">
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
      
    </body>
    
</html>