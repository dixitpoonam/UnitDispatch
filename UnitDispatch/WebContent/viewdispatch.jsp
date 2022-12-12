<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="headeradmin.jsp" %> 

<html>
<head>
<script src="sorttable.js"></script>
</head>
<body bgcolor="lightyellow">
<table border="0" cellspacing="0" cellpadding="0" width="100%">
        
        
        
        <table border="0" width="30%" align="right">
            <tr>
                 <td background="images/orangebar.jpeg" width="50"> <div align="center">
                 <a href="Unit_Life_Rep.jsp?"> Unit Life Report</a>  </div> </td>
               <td background="images/orangebar.jpeg" width="50"> <div align="center">
                 <a href="logoutadmin.jsp"> Log Out </a>  </div> </td> 
            </tr>
          </table>
      <!--   <tr>
         <td> <div align="right"><a href="unitliferep.jsp" style=""><font size="2">Unit Life Reports</font></a></div></td>
        <td> <div align="right"><a href="logoutadmin.jsp" style=""><font size="2">Logout </font></a></div></td>
       
        </tr> -->
        
        <tr>
          <td>
			<!-- body part come here -->
			<table width="100%" align="center" class="sortable">
			
			<tr>
			<td align="center" class="sorttable_nosort"><font color="block" size="2" >View Dispatch</font></td>
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
Statement stmt1 = null;
Statement stmt2 = null;
Statement stmt3 = null;
Statement stmt4 = null, stmt5 = null, stmt6 = null,stmt7 = null;
ResultSet rs1=null,rs2=null, rs3=null, rs4=null;

%>
<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

 stmt1 = con2.createStatement();
 stmt2 = con1.createStatement();
 //stmt3 = con1.createStatement();
 //stmt4 = con1.createStatement();
 //stmt5 = con1.createStatement();
 //stmt6 = con2.createStatement();
 //stmt7 = con2.createStatement();
String sql1="",sql2="", sql3="", sql4="", sql5="", sql6="",sql7="";
String data="",data1="",vendor="",Statustype="",technician="-",dispatch=null,dispatchPrint="-";
//String user=session.getValue("typeval").toString();
//out.println(user);
String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

//String ustyp=session.getValue("urole").toString();
//out.println(ustyp);

%>
  			<form action="" method="get" onsubmit="return validate();">
			<table border="0" width="70%" align="center">
			
			<tr bgcolor="#87CEFA">
			<td align="left">
			  <input type="text" id="data" name="data" class="formElement" value="<%=today %>" size="10" readonly/>
  					
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
			<td align="right">
			  	<input type="text" id="data1" name="data1" class="formElement"  value="<%=today %>" size="10" readonly />
			  	
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
			</td >
			<td><b>Vendor:</b>
			<%
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
			</td>
			<td><b>Status Type:</b>
		<select name="Statustype" id="Statustype" class="formElement">
				<option value="Both">Both</option>
				<option value="New">New</option>
				<option value="Repaired">Repaired</option>
		</select>
			</td>
			<td>
				<input type="submit" name="submit" id="submit" value="submit" class="formElement"/>
			</td>
		</tr>
		
		</table>
		</form>
		<!-- if date range is not requred please remove this code start from this comment to -->
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
                        out.print(showdate1+"&nbsp;&nbsp; Vendor:"+vendor+"&nbsp;&nbsp; Status Type:"+Statustype); %></font></div>
				<div align="right">
					</div>
			</td>
			</tr>
			</table>
			
			<table width="100%" border="1" align="center" class="sortable">
			<tr>
			<th align="center"> Sr.No</td>
			<th align="center"> Name</td>
			<th align="center"> Unit Count</td>
			<th align="center"> Internal Transfer Count</td>
			<th align="center"> External Transfer Count</td>
			</tr>		
			<%
			
			if(vendor.equals("all"))
			{
				String manuf="";
				int i=1,totcount=0;
				
		    	sql1="select distinct(TypeValue) from t_admin where URole = 'manufacturer' order by Name asc ";
		    	rs1=stmt1.executeQuery(sql1);
		    
		    	while(rs1.next())
				{
				         manuf=rs1.getString("TypeValue");

				if(vendor.equals("all")&&Statustype.equals("Both") )
				{
					sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and user='"+manuf+"' and Status in('Dispatched','Sent') ";
					session.setAttribute("sql",sql2);
				}
				else
				{
			 	sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and user='"+manuf+"' and InstType ='"+Statustype+"' and Status in('Dispatched','Sent') ";
			 	session.setAttribute("sql",sql2);
				}
			System.out.println(sql2);
				rs2=stmt2.executeQuery(sql2);
				int internal=0,external=0,unitcount=0;
				while(rs2.next())
				{	
					
					
					
					
					dispatch= rs2.getString("Status");
					if(dispatch!=null && dispatch.equalsIgnoreCase("Sent"))
					{
						internal++;
						
						dispatchPrint="Internal Transfer";
					}
					else if(dispatch!=null && dispatch.equalsIgnoreCase("Dispatched"))
					{
						external++;
						dispatchPrint="External Transfer";
					}
					unitcount++;
					
					
				}
			
				
		    	totcount=totcount+unitcount;
		    	
		    	%>
				<tr>
			<td> <%=i%></td>
		
			<td><%=manuf%></td>
			
					<td> <a href="viewdispatchdetail_rep.jsp?&vendor=<%=manuf %>&from=<%=data %>&to=<%=data1 %>&status=<%=Statustype %>"><font size="2"><%=unitcount%></font></a></td>
			<td>Internal=<a href="viewdispatchdetail_rep.jsp?&vendor=<%=manuf %>&from=<%=data %>&to=<%=data1 %>&status=<%=Statustype %>&internal=<%=internal %>"><font size="2"><%=internal %></a></td>
			<td>External=<a href="viewdispatchdetail_rep.jsp?&vendor=<%=manuf %>&from=<%=data %>&to=<%=data1 %>&status=<%=Statustype %>&external=<%=external %>"><font size="2"><%=external %> </td>
			
			</tr>
			
			<%	i++;
				}
		    	%>
		    	<tr><td colspan="2"></td>
			<td><a href="viewdispatchdetail_rep.jsp?&&vendor=all&from=<%=data %>&to=<%=data1 %>&status=<%=Statustype %>"><font size="2">View All</a></td>
			<td colspan="2">&nbsp;</td></tr>
		    	<%
			}
			else 
			{ 
				if(Statustype.equals("Both"))
				{
				sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and user='"+vendor+"' and Status in('Dispatched','Sent') ";
				session.setAttribute("sql",sql2);
				}
				else
				{
					sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and InstType ='"+Statustype+"' and user='"+vendor+"' and Status in('Dispatched','Sent') ";
					session.setAttribute("sql",sql2);
				}
				int i=1,internal=0,external=0,unitcount=0;
				rs2=stmt2.executeQuery(sql2);
				while(rs2.next())
				{	
					
					dispatch= rs2.getString("Status");
					if(dispatch!=null && dispatch.equalsIgnoreCase("Sent"))
					{
						internal++;
						
						dispatchPrint="Internal Transfer";
					}
					else if(dispatch!=null && dispatch.equalsIgnoreCase("Dispatched"))
					{
						external++;
						dispatchPrint="Excernal Transfer";
					}
					unitcount++;
				}
			
			
			
			
			%>
				<tr>
			<td> <%=i%></td>
		
			<td><%=vendor%></td>
			
					<td> <a href="viewdispatchdetail_rep.jsp?&vendor=<%=vendor %>&from=<%=data %>&to=<%=data1 %>&status=<%=Statustype %>"><font size="2"><%=unitcount%></font></a></td>
			<td>Internal=<a href="viewdispatchdetail_rep.jsp?&vendor=<%=vendor %>&from=<%=data %>&to=<%=data1 %>&status=<%=Statustype %>&internal=<%=internal %>"><font size="2"><%=internal %></a></td>
			<td>External=<a href="viewdispatchdetail_rep.jsp?&vendor=<%=vendor %>&from=<%=data %>&to=<%=data1 %>&status=<%=Statustype %>&external=<%=external %>"><font size="2"><%=external %> </td>
			
			</tr>	
			<% i++;
			}} %>
			</table>
			<!-- body part come here -->
					<%
} catch(Exception e) { out.println("Exception----->"+e); }

finally
{
	try {
		if(rs2!=null)
			rs2.close();
		if(rs3!=null)
			rs3.close();
		if(rs4!=null)
			rs4.close();
		if(stmt1!=null)
			stmt1.close();
		if(stmt2!=null)
			stmt2.close();
		if(con1!=null)
			con1.close();
		if(con2!=null)
			con2.close();
	} catch (SQLException e) {

		e.printStackTrace();
	}

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