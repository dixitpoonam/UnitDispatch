<%@ page contentType="application/vnd.ms-excel;charset=gb2312" %>
<% response.setContentType("application/vnd.ms-excel");
	response.addHeader("Content-Disposition","attachment;filename=\"view_dispatch.xls\"");%>

<%@ include file="Connections/conn.jsp" %>

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
Statement st=con1.createStatement();
Statement st1=con1.createStatement();
Statement st2=con1.createStatement();
Statement stmt1 = con2.createStatement();
Statement stmt2 = con1.createStatement();
Statement stmt3 = con1.createStatement();
ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null;
String sql1="",sql2="", sql3="", sql4="", sql5="", sql6="",sql7="",que="",que1="";
String data="",data1="",vendor="",Statustype="",technician="";

String user=session.getValue("urole").toString();
//out.println(user);
String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

//String ustyp=session.getValue("urole").toString();
//out.println(ustyp);


	data=request.getParameter("data");
	data1=request.getParameter("data1");
	Statustype=request.getParameter("Statustype");
	vendor=request.getParameter("vendor");
%>
  	
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
				String Receive="No";
				String str1="Select * from t_unitmasterhistory where DispDate='"+Dispdate+"' and UnitId='"+unitid+"' and Status='Dispatched' and (RecByTech='Yes' OR RecByCust='Yes') order by DispDate Limit 1";
				ResultSet rst1=st2.executeQuery(str1);
				if(rst1.next())
				{
					
					Receive="Yes";
				}
				String prevdispdate="",prevrecdate="";
				String recddate=null,recname="",custname="";

				String qtdate="",qtby="";

				que="Select Dispdate from t_unitmasterhistory where DispDate < '"+Dispdate+"' and UnitId='"+unitid+"' and Status='Dispatched' order by DispDate desc Limit 1";
				System.out.println(que);
				ResultSet rsget=st.executeQuery(que);
				if(rsget.next())
				{
					prevdispdate=rsget.getString("DispDate");
					
					
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
					
					<td> <%=qt %></td>
					
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
 catch(Exception e) { out.println("Exception----->"+e); }

finally
{
con1.close();
con2.close();
}
%>
			
       <table border="1" width="100%">
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>