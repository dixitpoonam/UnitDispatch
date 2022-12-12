

<%@ include file="menuheader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.Date"%>
<%@page import="org.jfree.ui.about.SystemPropertiesTableModel"%><html>
<head>

<title>Unit Dispatch</title>
<script src="sorttable.js"></script>

</head>
<body bgcolor="lightyellow">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
        
       
        
        <tr>
          <td>
			<!-- body part come here -->
			<table width="100%" align="center" class="sortable">
			
			<!--<tr>
			<td align="center" class="sorttable_nosort"><font color="block" size="2" >TAT Report</font></td>
			</tr>-->
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
			{
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
Statement stmt1,stmt2,stmt3,st,st1,st2,st3,st5,stCount,stold,st6;
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
st6=con1.createStatement();
st1=con1.createStatement();
st2=con1.createStatement();
st3=con1.createStatement();
st5=con2.createStatement();
stCount= con1.createStatement();
stold=con1.createStatement();
/*Statement stmt1 = con2.createStatement();
Statement stmt2 = con1.createStatement();
Statement stmt3 = con1.createStatement();
Statement st=con2.createStatement();
Statement st4=con2.createStatement();
Statement st1=con1.createStatement();
Statement st2=con1.createStatement();
Statement st3=con1.createStatement();
Statement st5=con2.createStatement();
*/

ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null;
String sql1="",sql2="", sql3="", sql4="", sql5="", sql6="",sql7="",que="",que1="";
String data="",data1="";




String user=session.getValue("urole").toString();
String type=session.getValue("typeval").toString();
//out.println(user);
String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
String dispatch=request.getParameter("dispatch");
String unitID_list=request.getParameter("uidList");
String from=request.getParameter("from");
String to=request.getParameter("to");
String total=request.getParameter("total");

session.setAttribute("uidList",unitID_list);

//System.out.println(total);
//System.out.println(unitID_list);
//System.out.println(to);

//String ustyp=session.getValue("urole").toString();
//out.println(ustyp);

%>
  	<!--<form action="" method="get" onsubmit="return validate();">
			<table border="0"  width="50%" align="center">
			
			<tr bgcolor="#87CEFA">
			<td align="left">
			  <table ><tr style="border: none;">
			  <td >
			  <input type="text" id="data" name="data" class="formElement" value="<%//=today %>" size="10" readonly/>
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
			<input type="text" id="data1" name="data1" class="formElement"  value="<%//=today %>" size="10" readonly />
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
	/*		if(user.equalsIgnoreCase("Administrator"))
			{
			sql1="Select distinct(TypeValue) from t_admin where urole='manufacturer'";
			rs1=stmt1.executeQuery(sql1);*/
			
			%>
			<select name="vendor" id="vendor" class="formElement">
			<option value="all">All</option>
			<%/*while(rs1.next())
			{*/%>
			<option value="<%//=rs1.getString("TypeValue") %>"><%//=rs1.getString("TypeValue") %></option>
			
			<%//} %>
			</select>  
			<%//}
		//	else
		//	{
				%>
				<input type="text" readonly="readonly" value="<%//=type %>" name="vendor" id="vendor"></input>
				<%		//	}
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
		</form>-->
		</td></tr>
	<%//	String dd=request.getParameter("data");
	//if(dd==null)
//{
%>

<!--<table class="stats">
<tr><td>
<center class='bodyText'><b>Please select option to display the Report</b></center>
</td></tr>
</table>-->

<%
//}
//else
//{
//data=request.getParameter("data");
//data1=request.getParameter("data1");
if(dispatch.equalsIgnoreCase("Yes")){

	
	%><tr>
	<td  class="sorttable_nosort">
			<div id="report_heding" align="center"><font color="brown" size="3">TAT Report for <%
                       java.util.Date ShowDate = new SimpleDateFormat("yyyy-MM-dd").parse(from);
                      Format formatter2 = new SimpleDateFormat("dd-MMM-yyyy");
                       String showdate = formatter2.format(ShowDate);
                        out.print(showdate);
                        %> to <%
                       java.util.Date ShowDate1 = new SimpleDateFormat("yyyy-MM-dd").parse(to);
                        Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
                       String showdate1 = formatter1.format(ShowDate1);
                        out.print(showdate1); %></font></div>
				<div class="bodyText" align="right">
				<a href="ExcelOkAndDispatchDone.jsp?total=<%=total%>&from=<%=from %>&to=<%=to%>&dispatch=<%=dispatch%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a> 
				<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
				</div>
			</td>
	</tr>
	</table>
	
				<table width="100%" border="1" align="center" class="sortable">
				<tr>
				<th class="hed"> Sr.</th>
				<th class="hed"> Unit ID</th>
				<th class="hed"> Last Dispatch Date </th>
				<th class="hed"> Unit Started from Field Date </th>
				<th class="hed"> Unit Started Location</th>
				<th class="hed"> Technician Name </th>
				<th class="hed"> Courier Name</th>
				<th class="hed"> Unit Received Date</th>
				<th class="hed"> Received By</th>
				<th class="hed"> Unit Received with Configuration</th>
				<th class="hed"> Last Manufactured By</th>
				<th class="hed"> Unit Life</th>
				<th class="hed"> Unit Warranty</th>
				<th class="hed"> Start to Reach Physically(HH:MM)</th>
				<th class="hed"> QT Done Date</th>
				<th class="hed"> QT Done By</th>
				<th class="hed"> Reach Physically to QT Done(HH:MM)</th>
				<th class="hed"> Unit Repair/Manufactured </th>
				<th class="hed"> Unit Repair/Manufactured By</th>
				<th class="hed"> Repair Done after QT(HH:MM)</th>
				<th class="hed"> Manufacture Count</th>
				<th class="hed"> Trackfile Count</th>
				<th class="hed"> QuickTest Count</th>
				<th class="hed"> Unit Tested Date</th>
				<th class="hed"> Unit Tested By</th>
				<th class="hed"> Tested after Repair (HH:MM)</th>
				<th class="hed"> Total TAT (In Days)</th>
				<th class="hed"> Unit Dispatch Date</th>
				<th class="hed"> Unit Dispatch Done by</th>
				<th class="hed"> Unit Received Date</th>
				<th class="hed"> Unit Received Confirmation By</th>
				<th class="hed"> Unit Received after dispatch(HH:MM)</th>
				</tr>		
				<%
				int i=1;
				DecimalFormat c = new DecimalFormat("0.00000000");
				String sql="select * from db_gps.t_unitmasterhistory where Status='Dispatched' and  DispDate between '"+from+"' and '"+to+"' group by UnitID";
				ResultSet ts=st6.executeQuery(sql);
//				System.out.println("sql==>"+sql);
				while(ts.next()){
				sql2="select * from db_CustomerComplaints.t_unitreceived where UnitID='"+ts.getString("UnitID")+"' and  Rdate >='"+ts.getString("DispDate")+"' and (Rcevd='Closed' OR Rcevd='-') and  ReceiveFrom IN('Customer','Ware House','Technician') limit 1";
				//	sql2="select * from db_CustomerComplaints.t_unitreceived where Rdate between '"+from+"'and '"+to+"' and (Rcevd='Closed' OR Rcevd='-') and  ReceiveFrom IN('Customer','Ware House','Technician')";
				//	sql2="select * from db_CustomerComplaints.t_unitreceived where Rdate between '"+data+"'and '"+data1+"' and (Rcevd='Closed' OR Rcevd='-') and  ReceiveFrom IN('Customer','Ware House','Technician')";
				System.out.println("Sql2==>"+sql2);
				rs2=st.executeQuery(sql2);
				
				if(rs2.next())
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
						
						String sqloldman="select EntBy from t_unitmasterhistory where Status='-' and UnitID='"+unitid+"' and EntDate<='"+Rdate+"' order by EntDate DESC limit 1";
						String oldmanby="-";
						ResultSet rsoldman=stold.executeQuery(sqloldman);
						//out.println(sqloldman);
						if(rsoldman.next()){
							oldmanby=rsoldman.getString("EntBy");
						//	out.println(oldmanby);
						}
					
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
					int QtCount=0;
					String sql77="select count(*) as QtCount from db_CustomerComplaints.hwunittest where Unitid='"+unitid+"' and concat(TheDate,' ',TheTime)>=concat('"+Rdate+"',' ','"+Rtime+"') order by concat(TheDate,' ',TheTime) asc limit 1" ;
					System.out.println(sql77);
					 ResultSet rs77=stmt1.executeQuery(sql77);
					 if(rs77.next())
					 {
						QtCount=rs77.getInt("QtCount");
						System.out.println(rs77.getString("QtCount"));
					 }
					//to check if qt or not aft receive
					sql7="select TheDate,TheTime,User,RefNo from db_CustomerComplaints.hwunittest where Unitid='"+unitid+"' and concat(TheDate,' ',TheTime)>=concat('"+Rdate+"',' ','"+Rtime+"') order by concat(TheDate,' ',TheTime) asc limit 1" ;
					System.out.println(sql7);
					 rs7=stmt1.executeQuery(sql7);	
					 if(rs7.next())
					 {
						
						qtFlag=true;
						
						if(rs7.getString("TheDate").equalsIgnoreCase("null")){
							qtdate="-";
						}else{
						 qtdate=rs7.getString("TheDate");
						}
						if(rs7.getString("TheTime").equalsIgnoreCase("null")){
							qttime="-";
						}else{
							qttime=rs7.getString("TheTime");
						}
						if(rs7.getString("User").equalsIgnoreCase("null")){
							qtby="-";
						}else{
							 qtby=rs7.getString("User");
						}
						if(rs7.getString("RefNo").equalsIgnoreCase("null")){
							refno="-";
						}else{
							 refno=rs7.getString("RefNo");
						}
						
						
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
					 	System.out.println(sql7);
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
						 if(testDateTime==null||testDateTime.equalsIgnoreCase("null")){
							 testedDt="-";
						 }else{
							
							 testedDt=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(testDateTime));
						 }
						 System.out.println("testedDt="+testedDt);
					 }
					 }
					
					 if(testFlag)
					 {
						 Date testDate=new Date();
						 if(testDateTime==null||testDateTime.equalsIgnoreCase("null")){
							 testedDt="-";
						 }else{
							
							 testDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(testDateTime);
						 }
						
					
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
						dispdoneby=rsget.getString("EntBy");
						if(dispdoneby==null || dispdoneby.equals("null"))
							dispdoneby="-";

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
							recname=rsget1.getString("RecConfirmByRep");
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
						 
				String InstDate1="-",unitlife="0",isWarranty="-";
				sql6="select * from t_unitreplacement where OldUnitID='"+unitid.trim()+"' and  concat(EntDate,InstTime) >= '"+dispdate1+disptime1+"' and  concat(EntDate,InstTime) <= '"+Rdate+Rtime+"' order by EntDate desc limit 1";
				//out.println(sql6);
					rs6=st2.executeQuery(sql6);
					if(rs6.next())
					{
						String InstDate=rs6.getString("EntDate");
						//String InstTime=rs6.getString("InstTime");
						//sql7="select * from t_unitreplacement where OldUnitID='"+unitid.trim()+"' and EntDate >= '"+InstDate+"' and EntDate <= '"+Rdate+"'";
						//rs7=st3.executeQuery(sql7);
						//if(rs7.next())
						//{
							unitlife=rs6.getString("UnitLife");
								isWarranty=rs6.getString("WasWarranty");
							conf=InstDate;
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
							String InstDate=rs6.getString("EntDate");
							conf=InstDate;
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
							<td><%=ts.getString("DispDate")%></td>
							<td> <%=actrecdaet%></td>
							<td><%=loc %></td>
							<td> <%=techName%></td>
							<!--<td><%//=entby %></td>-->
							<td> <%=courier%></td>
							<td><%=Rdate+" "+Rtime %></td>
							<td> <%=receiveby%></td>
							<td><%=conf %></td>
							<td><%=oldmanby%></td>
							<td><%=unitlife%></td>
							<td><%=isWarranty%></td>
							<%
							int value=(Long.valueOf(diffindays).intValue()*24)+(int)diffinhrs;
							%>
							<td><%=value%>:<%=(int)min %></td>
							<td> <%=qtdate+" "+qttime%></td>
							<%
							if(qtFlag)
							{%>
							
								<td><a href="#" onClick="window.open ('qt_details_window.jsp?unitid=<%=unitid %>&recDate=<%=Rdate%>&recTime=<%=Rtime %>&dispDate=<%=dispdate%>&dispTime=<%=disptime %>&qtcount=No','width=600, height=350, location=0, menubar=0, scrollbars=1, status=0, toolbar=0, resizable=0');"><%=qtby %></a></td>	
							<%}
							else
							{
								%>
								
								<td><%=qtby %></td>	
							<%	
							}
							int value1=(Long.valueOf(diffindaysqt).intValue()*24)+(int)diffinhrsqt;
							%>
							
							<td><%=value1%>:<%=(int)minqt %></td>
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
							int manCount=0,trackCount=0;
							String RecievedDate="",QuickTestDate="";
							String sqlCount="select count(*) as mancount from db_gps.t_unitmasterhistory where Status not in ('Tested','Sent','Dispatched') and EntDate between '"+from+"' and '"+to+"' and UnitID='"+unitid+"' ";
							System.out.println("sqlCount--->"+sqlCount);
							ResultSet rsCount=stCount.executeQuery(sqlCount);
							if(rsCount.next()){
								manCount=rsCount.getInt("mancount");
								
								System.out.println("manCount--->"+manCount);
							}
							String sqlRecieved="Select * from db_CustomerComplaints.t_unitreceived where UnitID='"+unitid+"' and TypeValue='2' and Status<>'Deleted' and InTransit<>'Yes' order by Rdate desc limit 1";
							ResultSet rsRecieved=stCount.executeQuery(sqlRecieved);
							if(rsRecieved.next()){
								RecievedDate=rsRecieved.getString("Rdate");
								System.out.println("RecievedDate--->"+RecievedDate);
							}
							String sqlQuickTest="select TheDate  from db_CustomerComplaints.hwunittest where UnitID='"+unitid+"' and TheDate>='"+RecievedDate+"'order by TheDate ASC limit 1";
							ResultSet rsQuickTest=stCount.executeQuery(sqlQuickTest);
							System.out.println("sqlQuickTest--->"+sqlQuickTest);
							if(rsQuickTest.next()){
								QuickTestDate=rsQuickTest.getString("TheDate");
								System.out.println("QuickTestDate--->"+QuickTestDate);
							}
							try{
								String sqltrackfile="select count(*) as trackFileCount from db_gps.t_ftpdump where UnitID='"+unitid+"' and StoredDateTime>='"+QuickTestDate+" 00:00:00'";
								ResultSet rsTrackFile=stCount.executeQuery(sqltrackfile);
								System.out.println("sqlQuickTest--->"+sqltrackfile);
								if(rsTrackFile.next()){
									trackCount=rsTrackFile.getInt("trackFileCount");
									System.out.println("trackCount--->"+trackCount);
								}
								}catch(Exception e){
									e.printStackTrace();
								}
								int value2=(Long.valueOf(diffindayseditdt).intValue()*24)+(int)diffinhrsedit;
							%>
							
							<td><%=value2%>:<%=(int)mindt %></td>
							<%if(manCount==0){%> <td><%=manCount %></td><%}else{ %>
							<td><a href="manDetails.jsp?unitid=<%=unitid %>&from=<%=from%>&to=<%=to%>&manufacture=Yes"><font size="2"><%=manCount%></font></a></td>
							<%} %>
							<td><%=trackCount %></td>
							<%if(QtCount==0){%> <td><%=QtCount %></td><%}else{ %>
							<td><a href="#" onClick="window.open ('qt_details_window.jsp?unitid=<%=unitid %>&recDate=<%=Rdate%>&recTime=<%=Rtime %>&dispDate=<%=dispdate%>&dispTime=<%=disptime %>&qtcount=yes','width=600, height=350, location=0, menubar=0, scrollbars=1, status=0, toolbar=0, resizable=0');"><%=QtCount %></font></a></td>
							<%
							}	%>
							<td><%=testDateTime %></td>
							<td><%=testedBy %></td>
							<%
							int value3=(Long.valueOf(diffindaystestdt).intValue()*24)+(int)diffinhrstest;
							%>
							<td><%=value3%>:<%=(int)mintest %></td>
							<%
							int value4=(Long.valueOf(diffindaysTotTat).intValue()*24)+(int)diffinhrsTotTat;
							%>
							<td><%=value4%>:<%=(int)mintot %></td>
							<td><%=dispdate+" "+disptime%></td>
							<td><%=dispdoneby %></td>
							<td><%=receiveddate+" "+receivetime %></td>
							<td><%=recname %></td>
							<%
							int value5=(Long.valueOf(diffindaysdisp).intValue()*24)+(int)diffinhrsdisp;
							%>
							<td><%=value5%>:<%=(int)mindisp %></td>
							
					<%	i++;
					
						
					}else{}
					}
					
					}
				}}
				%></table><%





	
}else{
%>
			<tr>
			<td  class="sorttable_nosort">
			<div id="report_heding" align="center"><font color="brown" size="3">TAT Report for <%
                       java.util.Date ShowDate = new SimpleDateFormat("yyyy-MM-dd").parse(from);
                      Format formatter2 = new SimpleDateFormat("dd-MMM-yyyy");
                       String showdate = formatter2.format(ShowDate);
                        out.print(showdate);
                        %> to <%
                       java.util.Date ShowDate1 = new SimpleDateFormat("yyyy-MM-dd").parse(to);
                        Format formatter1 = new SimpleDateFormat("dd-MMM-yyyy");
                       String showdate1 = formatter1.format(ShowDate1);
                        out.print(showdate1); %></font></div>
				<div class="bodyText" align="right">
				<a href="ExcelOkAndDispatchDone.jsp?total=<%=total%>&from=<%=from %>&to=<%=to%>&dispatch=<%=dispatch%>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a> 
				<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
				</div>
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
						<th class="hed"> Last Manufactured By</th>
						<th class="hed"> Unit Life</th>
						<th class="hed"> Unit Warranty</th>
						<th class="hed"> Start to Reach Physically(HH:MM)</th>
						<th class="hed"> QT Done Date</th>
						<th class="hed"> QT Done By</th>
						<th class="hed"> Reach Physically to QT Done(HH:MM)</th>
						<th class="hed"> Unit Repair/Manufactured </th>
						<th class="hed"> Unit Repair/Manufactured By</th>
						<th class="hed"> Repair Done after QT(HH:MM)</th>
						<th class="hed"> Manufacture Count</th>
						<th class="hed"> Trackfile Count</th>
						<th class="hed"> QuickTest Count</th>
						<th class="hed"> Unit Tested Date</th>
						<th class="hed"> Unit Tested By</th>
						<th class="hed"> Tested after Repair (HH:MM)</th>
						<th class="hed"> Total TAT (HH:MM)</th>
						<th class="hed"> Unit Dispatch Date</th>
						<th class="hed"> Unit Dispatch Done by</th>
						<th class="hed"> Unit Received Date</th>
						<th class="hed"> Unit Received Confirmation By</th>
						<th class="hed"> Unit Received after dispatch(HH:MM)</th>
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
							sql2="select * from db_CustomerComplaints.t_unitreceived where Rdate between '"+from+"'and '"+to+"' and (Rcevd='Closed' OR Rcevd='-') and  ReceiveFrom IN('Customer','Ware House','Technician')";
						}
						//	sql2="select * from db_CustomerComplaints.t_unitreceived where Rdate between '"+data+"'and '"+data1+"' and (Rcevd='Closed' OR Rcevd='-') and  ReceiveFrom IN('Customer','Ware House','Technician')";
						System.out.println("Sql2==>"+sql2);
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
								
								String sqloldman="select EntBy from t_unitmasterhistory where Status='-' and UnitID='"+unitid+"' and EntDate<='"+Rdate+"' order by EntDate DESC limit 1";
								String oldmanby="-";
								ResultSet rsoldman=stold.executeQuery(sqloldman);
								//out.println(sqloldman);
								if(rsoldman.next()){
									oldmanby=rsoldman.getString("EntBy");
								//	out.println(oldmanby);
								}
							
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
							int QtCount=0;
							String sql77="select count(*) as QtCount from db_CustomerComplaints.hwunittest where Unitid='"+unitid+"' and concat(TheDate,' ',TheTime)>=concat('"+Rdate+"',' ','"+Rtime+"') order by concat(TheDate,' ',TheTime) asc limit 1" ;
							System.out.println(sql77);
							 ResultSet rs77=stmt1.executeQuery(sql77);
							 if(rs77.next())
							 {
								QtCount=rs77.getInt("QtCount");
								System.out.println(rs77.getString("QtCount"));
							 }
							//to check if qt or not aft receive
							sql7="select TheDate,TheTime,User,RefNo from db_CustomerComplaints.hwunittest where Unitid='"+unitid+"' and concat(TheDate,' ',TheTime)>=concat('"+Rdate+"',' ','"+Rtime+"') order by concat(TheDate,' ',TheTime) asc limit 1" ;
							System.out.println(sql7);
							 rs7=stmt1.executeQuery(sql7);	
							 if(rs7.next())
							 {
								
								qtFlag=true;
								
								if(rs7.getString("TheDate").equalsIgnoreCase("null")){
									qtdate="-";
								}else{
								 qtdate=rs7.getString("TheDate");
								}
								if(rs7.getString("TheTime").equalsIgnoreCase("null")){
									qttime="-";
								}else{
									qttime=rs7.getString("TheTime");
								}
								if(rs7.getString("User").equalsIgnoreCase("null")){
									qtby="-";
								}else{
									 qtby=rs7.getString("User");
								}
								if(rs7.getString("RefNo").equalsIgnoreCase("null")){
									refno="-";
								}else{
									 refno=rs7.getString("RefNo");
								}
								
								
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
							 	System.out.println(sql7);
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
								 if(testDateTime==null||testDateTime.equalsIgnoreCase("null")){
									 testedDt="-";
								 }else{
									
									 testedDt=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(testDateTime));
								 }
								 System.out.println("testedDt="+testedDt);
							 }
							 }
							
							 if(testFlag)
							 {
								 Date testDate=new Date();
								 if(testDateTime==null||testDateTime.equalsIgnoreCase("null")){
									 testedDt="-";
								 }else{
									
									 testDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(testDateTime);
								 }
								
							
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
								dispdoneby=rsget.getString("EntBy");
								if(dispdoneby==null || dispdoneby.equals("null"))
									dispdoneby="-";

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
									recname=rsget1.getString("RecConfirmByRep");
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
								 
						String InstDate1="-",unitlife="0",isWarranty="-";
						sql6="select * from t_unitreplacement where OldUnitID='"+unitid.trim()+"' and  concat(EntDate,InstTime) >= '"+dispdate1+disptime1+"' and  concat(EntDate,InstTime) <= '"+Rdate+Rtime+"' order by EntDate desc limit 1";
						//out.println(sql6);
							rs6=st2.executeQuery(sql6);
							if(rs6.next())
							{
								String InstDate=rs6.getString("EntDate");
								//String InstTime=rs6.getString("InstTime");
								//sql7="select * from t_unitreplacement where OldUnitID='"+unitid.trim()+"' and EntDate >= '"+InstDate+"' and EntDate <= '"+Rdate+"'";
								//rs7=st3.executeQuery(sql7);
								//if(rs7.next())
								//{
									unitlife=rs6.getString("UnitLife");
										isWarranty=rs6.getString("WasWarranty");
									conf=InstDate;
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
									String InstDate=rs6.getString("EntDate");
									conf=InstDate;
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
									<td><%=oldmanby%></td>
									<td><%=unitlife%></td>
									<td><%=isWarranty%></td>
									<%
									int value=(Long.valueOf(diffindays).intValue()*24)+(int)diffinhrs;
									%>
									<td><%=value%>:<%=(int)min %></td>
									<td> <%=qtdate+" "+qttime%></td>
									<%
									if(qtFlag)
									{%>
									
										<td><a href="#" onClick="window.open ('qt_details_window.jsp?unitid=<%=unitid %>&recDate=<%=Rdate%>&recTime=<%=Rtime %>&dispDate=<%=dispdate%>&dispTime=<%=disptime %>&qtcount=No','width=600, height=350, location=0, menubar=0, scrollbars=1, status=0, toolbar=0, resizable=0');"><%=qtby %></a></td>	
									<%}
									else
									{
										%>
										
										<td><%=qtby %></td>	
									<%	
									}
									int value1=(Long.valueOf(diffindaysqt).intValue()*24)+(int)diffinhrsqt;
									%>
									
									<td><%=value1%>:<%=(int)minqt %></td>
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
									int manCount=0,trackCount=0;
									String RecievedDate="",QuickTestDate="";
									String sqlCount="select count(*) as mancount from db_gps.t_unitmasterhistory where Status not in ('Tested','Sent','Dispatched') and EntDate between '"+from+"' and '"+to+"' and UnitID='"+unitid+"' ";
									System.out.println("sqlCount--->"+sqlCount);
									ResultSet rsCount=stCount.executeQuery(sqlCount);
									if(rsCount.next()){
										manCount=rsCount.getInt("mancount");
										
										System.out.println("manCount--->"+manCount);
									}
									String sqlRecieved="Select * from db_CustomerComplaints.t_unitreceived where UnitID='"+unitid+"' and TypeValue='2' and Status<>'Deleted' and InTransit<>'Yes' order by Rdate desc limit 1";
									ResultSet rsRecieved=stCount.executeQuery(sqlRecieved);
									if(rsRecieved.next()){
										RecievedDate=rsRecieved.getString("Rdate");
										System.out.println("RecievedDate--->"+RecievedDate);
									}
									String sqlQuickTest="select TheDate  from db_CustomerComplaints.hwunittest where UnitID='"+unitid+"' and TheDate>='"+RecievedDate+"'order by TheDate ASC limit 1";
									ResultSet rsQuickTest=stCount.executeQuery(sqlQuickTest);
									System.out.println("sqlQuickTest--->"+sqlQuickTest);
									if(rsQuickTest.next()){
										QuickTestDate=rsQuickTest.getString("TheDate");
										System.out.println("QuickTestDate--->"+QuickTestDate);
									}
									try{
										String sqltrackfile="select count(*) as trackFileCount from db_gps.t_ftpdump where UnitID='"+unitid+"' and StoredDateTime>='"+QuickTestDate+" 00:00:00'";
										ResultSet rsTrackFile=stCount.executeQuery(sqltrackfile);
										System.out.println("sqlQuickTest--->"+sqltrackfile);
										if(rsTrackFile.next()){
											trackCount=rsTrackFile.getInt("trackFileCount");
											System.out.println("trackCount--->"+trackCount);
										}
										}catch(Exception e){
											e.printStackTrace();
										}
										int value2=(Long.valueOf(diffindayseditdt).intValue()*24)+(int)diffinhrsedit;
									%>
									
									<td><%=value2%>:<%=(int)mindt %></td>
									<%if(manCount==0){%> <td><%=manCount %></td><%}else{ %>
									<td><a href="manDetails.jsp?unitid=<%=unitid %>&from=<%=from%>&to=<%=to%>&manufacture=Yes"><font size="2"><%=manCount%></font></a></td>
									<%} %>
									<td><%=trackCount %></td>
									<%if(QtCount==0){%> <td><%=QtCount %></td><%}else{ %>
									<td><a href="#" onClick="window.open ('qt_details_window.jsp?unitid=<%=unitid %>&recDate=<%=Rdate%>&recTime=<%=Rtime %>&dispDate=<%=dispdate%>&dispTime=<%=disptime %>&qtcount=yes','width=600, height=350, location=0, menubar=0, scrollbars=1, status=0, toolbar=0, resizable=0');"><%=QtCount %></font></a></td>
									<%
									}	%>
									<td><%=testDateTime %></td>
									<td><%=testedBy %></td>
									<%
									int value3=(Long.valueOf(diffindaystestdt).intValue()*24)+(int)diffinhrstest;
									%>
									<td><%=value3%>:<%=(int)mintest %></td>
									<%
									int value4=(Long.valueOf(diffindaysTotTat).intValue()*24)+(int)diffinhrsTotTat;
									%>
									<td><%=value4%>:<%=(int)mintot %></td>
									<td><%=dispdate+" "+disptime%></td>
									<td><%=dispdoneby %></td>
									<td><%=receiveddate+" "+receivetime %></td>
									<td><%=recname %></td>
									<%
									int value5=(Long.valueOf(diffindaysdisp).intValue()*24)+(int)diffinhrsdisp;
									%>
									<td><%=value5%>:<%=(int)mindisp %></td>
									
							<%	i++;
							
								
							}else{}
							}
							
							}
						} // while%>
						 </tr>  
						</table>
			
			<!-- body part come here -->
					<%}
} catch(Exception e) { 
	//out.println("Exception----->"+e); 
System.out.println("Exception----->"+e);	
}

finally
{
	stmt1.close();
	stmt2.close();
	stmt3.close();
	st.close();
	st1.close();
	st2.close();
	st3.close();
	st5.close();
	con1.close();
	con2.close();
}
%>
			</td>
    </tr>
    </table>
       <table border="1" width="100%">
<tr ><td bgcolor="white" class="copyright" width="100%"><center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center></td></tr>
</table>
      
    </body>
    
</html>