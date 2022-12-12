<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Connections/conn.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Date"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TAT Report Details</title>
<script src="sorttable.js"></script>
<link href="css/css.css" rel="StyleSheet" type="text/css">
</head>
<body>

<%!
Connection con1=null;
Connection con2=null;
Statement stmt1,stmt2,stmt3,st,st1,st2,st3,st5;
%>
<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);


stmt1 = con2.createStatement();
stmt2 = con1.createStatement();
stmt3 = con1.createStatement();
st=con1.createStatement();
st1=con1.createStatement();
st2=con1.createStatement();
st3=con1.createStatement();
st5=con2.createStatement();

ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null;
String sql1="",sql2="", sql3="", sql4="", sql5="", sql6="",sql7="",que="",que1="";
String unitID_list="";
//String unitID_list=request.getParameter("uidList");
try
{
 unitID_list=session.getAttribute("uidList").toString();
}
catch(Exception e)
{
	unitID_list="";
}
//System.out.println(unitID_list);
String from=request.getParameter("data");
String to=request.getParameter("data1");
String total=request.getParameter("total");
//out.println(total);
//out.println(unitID_list);
%>
<table width="100%" class="sortable">
<tr>
<td align="center"><div id="report_heding" align="center"><font color="brown" size="3">TAT Report for <%
                       java.util.Date ShowDate = new SimpleDateFormat("yyyy-MM-dd").parse(from);
                      Format formatter2 = new SimpleDateFormat("dd-MMM-yyyy");
                       String showdate = formatter2.format(ShowDate);
                        out.print(showdate);
                        %> to <%
                       java.util.Date ShowDate1 = new SimpleDateFormat("yyyy-MM-dd").parse(to);
                        Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
                       String showdate1 = formatter1.format(ShowDate1);
                        out.print(showdate1); %></font></div>
</td>
</tr>
<tr>
<td>
 <input type="button" title="To print report click me" name="Print" value="Print" onclick="javascript:window.print();" class="formElement">
 </td>
</tr>
</table>
						<table width="100%" border="1" align="center" class="sortable">
						<tr>
						<th class="hed"> Sr.</th>
						<th class="hed"> Unit ID</th>
						<th class="hed"> Unit Started from Field Date </th>
						<th class="hed"> Unit Started Location</th>
						<th class="hed"> Technician Name </th>
						<!--<th class="hed"> Ent By</th>-->
						<th class="hed"> Courier Name</th>
						<th class="hed"> Unit Received Date</th>
						<th class="hed"> Received By</th>
						<th class="hed"> Unit Received with Configuration</th>
						<th class="hed"> Start to Reach Physically(In Days)</th>
						<th class="hed"> QT Done Date</th>
						<th class="hed"> QT Done By</th>
						<th class="hed"> Reach Physically to QT Done(In Days)</th>
						<th class="hed"> Unit Repair/Manufactured </th>
						<th class="hed"> Unit Repair/Manufactured By</th>
						<th class="hed"> Repair Done after QT(In Days)</th>
						<th class="hed"> Unit Tested Date</th>
						<th class="hed"> Unit Tested By</th>
						<th class="hed"> Tested after Repair (In Days)</th>
						<th class="hed"> Total TAT (In Days)</th>
						<th class="hed"> Unit Dispatch Date</th>
						<th class="hed"> Unit Dispatch Done by</th>
						<th class="hed"> Unit Received Date</th>
						<th class="hed"> Unit Received Confirmation By</th>
						<th class="hed"> Unit Received after dispatch(In Days)</th>
						</tr>		
						<%
				/*	if(vendor.equals("all")&&Statustype.equals("Both") )
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
						{*/
								
						//sql2="select Distinct(UnitID) from db_CustomerComplaints.t_unitreceived where Rdate between '"+data+"'and '"+data1+"' and ReceiveFrom IN('Customer','Ware House','Technician')";
						
									
					
						//System.out.println("Sql2-->>"+sql2);
							
						//}
						int i=1;
						DecimalFormat c = new DecimalFormat("0.00000000");
						
						if(total.equals("yes"))
						{
							sql2="select * from db_CustomerComplaints.t_unitreceived where Rdate between '"+from+"'and '"+to+"' and (Rcevd='Closed' OR Rcevd='-') and  ReceiveFrom IN('Customer','Ware House','Technician')";
						}
						else
						{
							sql2="select * from db_CustomerComplaints.t_unitreceived where UnitID IN "+unitID_list+" and Rdate between '"+from+"'and '"+to+"' and (Rcevd='Closed' OR Rcevd='-') and  ReceiveFrom IN('Customer','Ware House','Technician')";
						}
						//	sql2="select * from db_CustomerComplaints.t_unitreceived where Rdate between '"+data+"'and '"+data1+"' and (Rcevd='Closed' OR Rcevd='-') and  ReceiveFrom IN('Customer','Ware House','Technician')";
						//System.out.println("Sql2==>"+sql2);
						rs2=st.executeQuery(sql2);
						while(rs2.next())
						{
							String actrecdaet="-",Rdate="-",Rtime="-",loc="-",courier="-",receiveby="-",techName="-",entby="-";
							
							String unitid=rs2.getString("UnitID"); 
							
							 actrecdaet=rs2.getString("ActualRecDate");
							 Rdate=rs2.getString("Rdate");
							 Rtime=rs2.getString("Rtime");
							 loc=rs2.getString("Lname");
							 techName=rs2.getString("TechName");
							 entby=rs2.getString("EntBy");
							 courier=rs2.getString("Courier");
							//	String courierby=rs2.getString("");
							 receiveby=rs2.getString("EntBy");
								if(Rdate==null || Rdate.equals("null"))
									Rdate="-";
								if(actrecdaet==null || actrecdaet.equals("null"))
									actrecdaet="-";
								
							
							double diff=0.00,diffdays=0.00,diffinhrs=0.00,time1=0.00,time2=0.00,min=0;
							long diffindays=0;
							//java.util.Date recdate=null;
							//System.out.println("Rdate"+Rdate);
							//System.out.println("actrecdaet"+actrecdaet);
							
							if(!Rdate.equals("-"))
							{
							if(!Rdate.equals("-"))
							{
							java.util.Date recdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(Rdate+" "+Rtime);
							 time1=recdate.getTime();
							// System.out.println("time1"+time1);
							}
							if(!actrecdaet.equals("-"))
							{
							 java.util.Date actdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(actrecdaet);
							 time2=actdate.getTime();
							// System.out.println("time2"+time2);
							 diff=time1-time2;
							//	System.out.println("diff"+diff);
							 diffindays=(long)(diff / (1000*60*60*24));
							//	System.out.println("diffindays"+diffindays);
							diffdays=(diff / (1000*60*60*24));
						//	System.out.println("diffindays----->"+diffdays);
							
							//calc hrs
							int day=(int)diffdays;
							double decihr=Double.parseDouble(c.format(diffdays-day));
							diffinhrs=(decihr *24);
							//diffinhrs=(diff / (1000*60*60));
							// System.out.println("diffinhrs---->"+diffinhrs);
							// to calc mins
							 int dd=(int)diffinhrs;
							 double decipart=Double.parseDouble(c.format(diffinhrs-dd));
							 min=decipart*60;
							 //System.out.println("diffinhrs========>"+diffinhrs+"min");
							
							}
							
							
							
							
							//System.out.print("recdate-->>"+recdate);
							//System.out.print("actdate-->>"+actdate);
							//System.out.print("diffindays-->>"+diffindays);
							String qtdate="-";
							String qtby="-",qttime="-",refno="";
							boolean qtFlag=false;
							//to check if qt or not aft receive
							sql7="select * from db_CustomerComplaints.hwunittest where Unitid='"+unitid+"' and concat(TheDate,' ',TheTime)>=concat('"+Rdate+"',' ','"+Rtime+"') order by concat(TheDate,' ',TheTime) asc limit 1" ;
							//System.out.println(sql7);
							 rs7=stmt1.executeQuery(sql7);	
							 if(rs7.next())
							 {
								
								qtFlag=true;
								 qtdate=rs7.getString("TheDate");
								 qttime=rs7.getString("TheTime");
								 qtby=rs7.getString("User");
								 refno=rs7.getString("RefNo");
							 }
							 else
							 {
								 
								 qtFlag=false;
								 qtdate="-";
								 qtby="-";
								 
							 }
							 double diffinhrsqt=0.00,diffqt=0.00,minqt=0.0,diffdaysqt=0.00;
							 long diffindaysqt=0;
							 double time3=0.00;
							// System.out.println("qtdate="+qtdate);
							 if(!(qtdate.equals("-")))
							 { //System.out.println("inside qtdate if");
								java.util.Date quickTdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(qtdate+" "+qttime);
								time3=quickTdate.getTime();
								
							//	System.out.println("rtime="+time1+"qttime="+time3);
								 diffqt=time3-time1;
								// System.out.println("diffqt="+diffqt);
								diffindaysqt=(long)(diffqt / (60*60*24*1000));
								// System.out.println("diffindaysqt="+diffindaysqt);
								diffdaysqt=(diffqt / (1000*60*60*24));
							//	System.out.println("diffindays----->"+diffdays);
							
								//calc hrs
								int day=(int)diffdaysqt;
								double decihr=Double.parseDouble(c.format(diffdaysqt-day));
								diffinhrsqt=(decihr *24);
								//diffinhrsqt=(diffqt / (60*60*1000));
								// to calc mins
								int dd=(int)diffinhrsqt;
								double decipart=Double.parseDouble(c.format(diffinhrsqt-dd));
								minqt=decipart*60;
								// System.out.println("diffinhrsqt="+diffinhrsqt);
							 }
							 
							 //----------------------------get the edit date------------------------------------------
							 
							 String entdate="-",enttime="-",editedby="-";
							 boolean editFlag=false;
							 if(!(qtdate.equals("-")))
							 {
							 	 sql7="Select * from t_unitmasterhistory where Unitid='"+unitid+"' and EditedBy <> '-' and EntDate>='"+qtdate+"' and  FirmwareChanged <>'-' and ModulePCBChanged <>'-' and PCBmodification <>'-' and	PowerSupplyChanged <>'-' and GPSMouseChanged <>'-' and GSMAntennaChanged <>'-' and SoftwareSimCorrections <>'-' and OtherCorrections <>'-' order by concat(EntDate,' ',EntTime) Limit 1";
							 	// System.out.println(sql7);
							 ResultSet rs=st2.executeQuery(sql7);
							 if(rs.next())
							 	{
								 	editFlag=true;
								 	entdate=rs.getString("EntDate");
									enttime=rs.getString("EntTime");
									editedby=rs.getString("EditedBy");
								
							 	}
							 }
							// System.out.println("entdate"+entdate+"enttime"+enttime+"editedby"+editedby);
							 double diffinhrsedit=0.00,mindt=0.0,diffdayedt=0.00;
							 long diffindayseditdt=0;
							 double time4=0.00;
							 
							 if(!(qtdate.equals("-")) && !entdate.equals("-"))
							 {
								// System.out.println("inside if");
								java.util.Date editeddate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(entdate+" "+enttime);
								time4=editeddate.getTime();
								
								//System.out.println("time4="+time4);
								double diffedit=time4-time3;
								//System.out.println("diffedit="+diffedit);
								diffindayseditdt=(long)(diffedit / (60*60*24*1000));
								//System.out.println("diffindayseditdt="+diffindayseditdt);
								diffdayedt=(diffedit / (1000*60*60*24));
								//System.out.println("diffindays----->"+diffdays);
							
								//calc hrs
								int day=(int)diffdayedt;
								double decihr=Double.parseDouble(c.format(diffdayedt-day));
								diffinhrsedit=(decihr *24);
								
								//diffinhrsedit=(diffedit / (60*60*1000));
								//System.out.println("diffinhrsedit="+diffinhrsedit);
								// to calc mins
								int dd=(int)diffinhrsedit;
								 double decipart=Double.parseDouble(c.format(diffinhrsedit-dd));
								 mindt=decipart*60;
							 }
							 
							 
							
							 //--------------------------------------------------------------------------------------
							
							 //------------------------ getting the tested date ------------------------
							 String testedBy="-",testDateTime="-";
							 boolean testFlag=false; 
							 String testedDt=null;
							 double testTime=0.00,diffTest=0.00,diffdaytst=0.00;
							 
							 double diffinhrstest=0.00,mintest=0.0;
							 long diffindaystestdt=0;
							 if(entdate!=null && !(entdate.equals("-")))
							 {
							 sql7="select * from t_unitmasterhistory where Unitid='"+unitid+"' and EntDate>='"+entdate+"' and testedunit='Yes' order by TesetdDateTime limit 1";
							 ResultSet testRst=st2.executeQuery(sql7);
							 if(testRst.next())
							 {
								 testFlag=true;
								 testedBy=testRst.getString("Tested_by");
								 testDateTime=testRst.getString("TesetdDateTime");
									testedDt=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(testDateTime));
							 }
							 }
							
							 if(testFlag)
							 {
								 
								 Date testDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(testDateTime);
							
								testTime=testDate.getTime();
								 diffTest=testTime-time4;
								diffindaystestdt=(long)(diffTest / (60*60*24*1000));
								
								diffdaytst=(diffTest / (1000*60*60*24));
								//System.out.println("diffindays----->"+diffdays);
															//calc hrs
								int day=(int)diffdaytst;
								double decihr=Double.parseDouble(c.format(diffdaytst-day));
								diffinhrstest=(decihr *24);
								//diffinhrstest=(diffTest / (60*60*1000));
								// to calc mins
								int dd=(int)diffinhrstest;
								double decipart=Double.parseDouble(c.format(diffinhrstest-dd));
								mintest=decipart*60;
								
																
							 }
							 
							 //------------TOTAl TAT Total TAT = (Unit Tested Date&Time - Unit Received Date&Time)------------------------------------------------------------------------------------
								
							 double diffinhrsTotTat=0.00,diffTotTat=0.00,mintot=0.0,diffdaytot=0.00;
							 long diffindaysTotTat=0;
							 if(testTime!=0.00)
							 {
								 if(time2!=0)
								 {
									 diffTotTat=testTime-time2;
								 }
								 else
								 {
									 diffTotTat=testTime-time1; 
								 }
								 diffindaysTotTat=(long)(diffTotTat / (1000*60*60*24));
								 diffdaytot=(diffTotTat / (1000*60*60*24));
								 //System.out.println("diffindays----->"+diffdays);
								 //calc hrs
								 int day=(int)diffdaytot;
								 double decihr=Double.parseDouble(c.format(diffdaytot-day));
								 diffinhrsTotTat=(decihr *24);
								 //diffinhrsTotTat=(diffTotTat / (1000*60*60));
								 // to calc mins
								 int dd=(int)diffinhrsTotTat;
								 double decipart=Double.parseDouble(c.format(diffinhrsTotTat-dd));
								 mintot=decipart*60;
							 }
							 //------------------------------------------------------------------------------------------------
							 
							 //--------------------------------------------------------------------------
							 //----------------getting the dispatch date--------------------------
							 	String dispdate="-",dispdoneby="-",disptime="";
							 	 if(!testDateTime.equals("-"))
								 {
								 	que="Select * from t_unitmasterhistory where DispDate >= '"+testedDt+"' and UnitId='"+unitid+"' and Status='Dispatched' order by DispDate Limit 1";
								//System.out.println(que);
							ResultSet rsget=st1.executeQuery(que);
						
							if(rsget.next())
							{
								dispdate=rsget.getString("DispDate");
								disptime=rsget.getString("DispTime");
								dispdoneby=rsget.getString("User");
								if(dispdoneby==null || dispdoneby.equals("null"))
									dispdoneby="-";
								
							}
							}
							 //--------------------------------------------------------------------------
						 
							 
							 //-----------------getting the received date---------------------------------------------------
							 
							 String receiveddate="-",recname="-",receivetime="";
							 if(!(dispdate.equals("-")))
							 {
							 que1="Select * from t_unitmasterhistory where DispDate='"+dispdate+"' and UnitId='"+unitid+"' and Status='Dispatched' and (RecByTech='Yes' OR RecByCust='Yes') order by DispDate Limit 1";
								//System.out.println(que1);
								ResultSet rsget1=st3.executeQuery(que1);
							if(rsget1.next())
							{
								if((rsget1.getString("RecByTech").equalsIgnoreCase("yes")))
								receiveddate=rsget1.getString("RecDateTime");
								else if((rsget1.getString("RecByCust").equalsIgnoreCase("yes")))
									receiveddate=rsget1.getString("RecByCustDate");
								if(receiveddate==null || receiveddate.equals("null"))
									receiveddate="-";
								//receivetime=rsget1.getString("Rtime");
								recname=rsget1.getString("User");
							}
							else
								receiveddate="-";
												
							 }
							 double diffinhrsdisp=0.00,diffdisp=0.00,mindisp=0.0,diffdayrec=0.00;
							 long diffindaysdisp=0;
							 if(!(dispdate.equals("-")) && !receiveddate.equals("-"))
							 {
								 java.util.Date dispatchdate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dispdate+" "+disptime);
								double time5=0.00;
								time5=dispatchdate.getTime();
									 
								 
								java.util.Date receivedt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(receiveddate);
								double time6=0.00;
								time6=receivedt.getTime();
								
								 diffdisp=time6-time5;
								diffindaysdisp=(long)(diffdisp / (1000*60*60*24));
								diffdayrec=(diffdisp / (1000*60*60*24));
								 //System.out.println("diffindays----->"+diffdays);
								 //calc hrs
								 int day1=(int)diffdayrec;
								 double decihr1=Double.parseDouble(c.format(diffdayrec-day1));
								 diffinhrsdisp=(decihr1 * 24);
								
								//diffinhrsdisp=(diffdisp / (1000*60*60));
								 int dd1=(int)diffinhrsdisp;
								 double decipart1=Double.parseDouble(c.format(diffinhrsdisp-dd1));
								 mindisp=decipart1*60;
								//System.out.println(diffinhrsdisp);
							 }
							 
							 String sconf="";
							 //************ unit received with or without config ***************
							 	String conf="";
						String dispdate1="",disptime1="";	 						 
					sql3="select * from t_unitmasterhistory where UnitID = '"+unitid+"' and concat(DispDate,DispTime) < '"+Rdate+Rtime+"' and ModeofDispatch NOT Like '%Transfer%' order by DispDate Desc limit 1";
					//out.print(sql3);
					rs3=stmt2.executeQuery(sql3);
					if(rs3.next())
					{
						dispdate1=rs3.getString("DispDate");
						disptime1=rs3.getString("DispTime");
					}
				/*	if(dispdate1.equals("-"))
					{
						sql3="select * from db_CustomerComplaints.t_unitreceived  where UnitId='"+unitid+"' and concat(Rdate,RTime) <= '"+Rdate+Rtime+"' order by Rdate desc limit 1";
						
					}*/
							 
					String InstDate1="-";
					sql6="select * from t_unitreplacement where OldUnitID='"+unitid.trim()+"' and  concat(EntDate,InstTime) >= '"+dispdate1+disptime1+"' and  concat(EntDate,InstTime) <= '"+Rdate+Rtime+"' order by EntDate desc limit 1";
					//out.println(sql6);
						rs6=st2.executeQuery(sql6);
						if(rs6.next())
						{
							//String InstDate=rs6.getString("EntDate");
							//String InstTime=rs6.getString("InstTime");
							//sql7="select * from t_unitreplacement where OldUnitID='"+unitid.trim()+"' and EntDate >= '"+InstDate+"' and EntDate <= '"+Rdate+"'";
							//rs7=st3.executeQuery(sql7);
							//if(rs7.next())
							//{
								
								conf="Yes";
							//}
							//else
							//{
								//conf="No";
							//}
							 
						}	
						else
						{
							if(!dispdate1.equals("-"))
							{
								sql6="select * from t_unitreplacement where NewUnitID='"+unitid.trim()+"' and  concat(EntDate,InstTime) >= '"+dispdate1+disptime1+"' and  concat(EntDate,InstTime) <= '"+Rdate+Rtime+"' order by EntDate desc limit 1";
							}
							else
							{
								if(dispdate1.equals("-"))
								{
									sql6="select * from db_CustomerComplaints.t_unitreceived where UnitID='"+unitid.trim()+"'";
									sql6="select * from t_unitreplacement where NewUnitID='"+unitid.trim()+"' and  concat(EntDate,InstTime) >= '"+dispdate1+disptime1+"' and  concat(EntDate,InstTime) <= '"+Rdate+Rtime+"' order by EntDate desc limit 1";
								}
								//sql6="select * from t_unitreplacement where NewUnitID='"+unitid.trim()+"'order by EntDate desc limit 1";
							}
							rs6=st2.executeQuery(sql6);
							if(rs6.next())
							{
								conf="Yes";
							}
							else
							{
								conf="No";
							}
						}
							 
							 
						/*	 if(!(Rdate.equals("-")) && !(dispdate.equals("-")))
							 {
								 sconf="select * from t_unitreplacement where OldUnitID='"+unitid+"' and EntDate between '"+Rdate+"' and '"+dispdate+"' order by EntDate limit 1";
								ResultSet rsconf=st2.executeQuery(sconf);
								if(rsconf.next())
								{
									conf="yes";
								}
								else
								{
									conf="no";
								}
							 }
							 else
							 {
								 sconf="select * from t_unitreplacement where OldUnitID='"+unitid+"' and EntDate >= '"+Rdate+"' order by EntDate limit 1";
								 ResultSet rsconf=st2.executeQuery(sconf);
									if(rsconf.next())
									{
										conf="yes";
									}
									else
									{
										conf="no";
									}
							 }*/
							%>
							
							 <tr>
								<td><%=i%></td>
								<td><%=unitid %></td>
								<td> <%=actrecdaet%></td>
								<td><%=loc %></td>
								<td> <%=techName%></td>
								<!--<td><%//=entby %></td>-->
								<td> <%=courier%></td>
								<td><%=Rdate+" "+Rtime %></td>
								<td> <%=receiveby%></td>
								<td><%=conf %></td>
								<td>Days=<%=diffindays %> &nbsp;&nbsp;Hrs=<%=(int)diffinhrs%>&nbsp;&nbsp;min=<%=(int)min %></td>
								<td> <%=qtdate+" "+qttime%></td>
								<%
								if(qtFlag)
								{%>
								
									<td><a href="#" onClick="window.open ('qt_details_window.jsp?unitid=<%=unitid %>&recDate=<%=Rdate%>&recTime=<%=Rtime %>&dispDate=<%=dispdate%>&dispTime=<%=disptime %>','width=600, height=350, location=0, menubar=0, scrollbars=1, status=0, toolbar=0, resizable=0');"><%=qtby %></a></td>	
								<%}
								else
								{
									%>
									
									<td><%=qtby %></td>	
								<%	
								}
								%>
								
								<td>Days=<%=diffindaysqt %>&nbsp;&nbsp;Hrs=<%=(int)diffinhrsqt %>&nbsp;&nbsp;min=<%=(int)minqt %></td>
								<td><%=entdate+" "+enttime%></td>
								<%
								if(editFlag)
								{%>
								
									<td><a href="#" onClick="window.open ('EditsummaryRep_window.jsp?unitid=<%=unitid %>&qtDate=<%=qtdate%>&qtTime=<%=qttime %>&dispDate=<%=dispdate%>&dispTime=<%=disptime %>','width=600, height=350, location=0, menubar=0, scrollbars=1, status=0, toolbar=0, resizable=0');"><%=editedby %></a></td>	
								<%}
								else
								{
									%>
									
									<td><%=editedby %></td>
								<%	
								}
								%>
								
								<td>Days=<%=diffindayseditdt %>&nbsp;&nbsp;Hrs=<%=(int)diffinhrsedit %>&nbsp;&nbsp;min=<%=(int)mindt %></td>
								<td><%=testDateTime %></td>
								<td><%=testedBy %></td>
								<td>Days=<%=diffindaystestdt %>&nbsp;&nbsp;Hrs=<%=(int)diffinhrstest %>&nbsp;&nbsp;min=<%=(int)mintest %></td>
								<td>Days=<%=diffindaysTotTat %>&nbsp;&nbsp;Hrs=<%=(int)diffinhrsTotTat %>&nbsp;&nbsp;min=<%=(int)mintot %></td>
								<td><%=dispdate+" "+disptime%></td>
								<td><%=dispdoneby %></td>
								<td><%=receiveddate+" "+receivetime %></td>
								<td><%=recname %></td>
								<td>Days=<%=diffindaysdisp %>&nbsp;&nbsp;Hrs=<%=(int)diffinhrsdisp %>&nbsp;&nbsp;min=<%=(int)mindisp %></td>
						<%	i++;
							}
						}  // while%>
						 </tr>  
						</table>
<%
} catch(Exception e) { out.println("Exception----->"+e); }

finally
{
con1.close();
con2.close();

}
%>
</body>
</html>