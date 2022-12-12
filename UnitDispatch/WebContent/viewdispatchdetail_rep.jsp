<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="headeradmin.jsp" %> 

<html>
<head>
<script src="sorttable.js"></script>
</head>
<body bgcolor="lightyellow">
<br></br>
<table border="0" width="30%" align="right">
            <tr>
                 <td background="images/orangebar.jpeg" width="50"> <div align="center">
                 <a href="Unit_Life_Rep.jsp?"> Unit Life Report</a>  </div> </td>
               <td background="images/orangebar.jpeg" width="50"> <div align="center">
                 <a href="logoutadmin.jsp"> Log Out </a>  </div> </td> 
            </tr>
          </table>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
        
        <td>
              &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<div align="left"> <a href="javascript:history.go(-1)"> <img src="images/arrow.bmp" width="20px" height="20px" border="0" > </img> </a> </td>
      </td>
        
        
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
String data="",data1="",vendor="",Statustype="",technician="-",dispatch=null,dispatchPrint="-",internal="",external="";
//String user=session.getValue("typeval").toString();
//out.println(user);
String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

//String ustyp=session.getValue("urole").toString();
//out.println(ustyp);

%>
  			
		<!-- if date range is not requred please remove this code start from this comment to -->
		</td></tr>
<%	
data=request.getParameter("from");
data1=request.getParameter("to");
Statustype=request.getParameter("status");
vendor=request.getParameter("vendor");
internal=request.getParameter("internal");
external=request.getParameter("external");


if(internal!=null )
{
	if(Statustype.equals("Both"))
	sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and user='"+vendor+"' and Status in('Sent') ";
	else
		sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and InstType ='"+Statustype+"' and user='"+vendor+"' and Status in('Sent') ";
	session.setAttribute("sql",sql2);
}
else if(external!=null)
{
	if(Statustype.equals("Both"))
	sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and user='"+vendor+"' and Status in('Dispatched') ";
	else
	sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and InstType ='"+Statustype+"' and user='"+vendor+"' and Status in('Dispatched') ";	
	session.setAttribute("sql",sql2);
}
else if(vendor!=null && vendor.equalsIgnoreCase("all"))
{
	if(Statustype.equals("Both"))
 	sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and Status in('Dispatched','Sent') ";
	else
	sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and InstType ='"+Statustype+"' and Status in('Dispatched','Sent') ";
 	session.setAttribute("sql",sql2);
}
else
{
	if(Statustype.equals("Both"))
	 	sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and user='"+vendor+"' and Status in('Dispatched','Sent') ";
		else
		sql2="select * from t_unitmasterhistory where DispDate between '"+data+"'and '"+data1+"' and user='"+vendor+"' and InstType ='"+Statustype+"' and Status in('Dispatched','Sent') ";
	 	session.setAttribute("sql",sql2);
}
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
				<a href="#" onclick="javascript:window.open('dailydispatchprint.jsp?data=<%= data %>&data1=<%=data1 %>&Statustype=<%=Statustype %>&vendor=<%=vendor%>&internal=<%=internal %>&external=<%=external %>');" title="Print Report"><img src="images/print.jpg" width="15px" height="15px"></a>&nbsp; &nbsp; 
				<a href="exportviewdispatch.jsp?data=<%= data %>&data1=<%=data1 %>&Statustype=<%=Statustype %>&vendor=<%=vendor%>&internal=<%=internal %>&external=<%=external %>"  title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>
				<%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new java.util.Date())%>
				</div>
			</td>
			</tr>
			</table>
			
			<table width="100%" border="1" align="center" class="sortable">
			<tr>
			<th class="hed"> Sr.</th>
			<th class="hed"> Date</th>
			<th class="hed"> Customer Name</th>
			<th class="hed"> Customer Location</th>
			<th class="hed"> Full Address</th>
			<th class="hed"> Technician Name</th>
			<th class="hed"> Unit ID</th>
			<th class="hed"> Inst Type</th>
			<th class="hed"> Dispatch From</th>
			<th class="hed"> ModeofDispatch</th>
			<th class="hed"> Chalan No.</th>
			<th class="hed"> Name/Courier No</th>
			<th class="hed"> Type of Dispatch</th>
			</tr>		
			<%
			int i=1;
			rs2=stmt2.executeQuery(sql2);
			while(rs2.next())
			{	
				
				dispatch= rs2.getString("Status");
				if(dispatch!=null && dispatch.equalsIgnoreCase("Sent"))
				{
					dispatchPrint="Internal Transfer";
				}
				else if(dispatch!=null && dispatch.equalsIgnoreCase("Dispatched"))
				{
					dispatchPrint="External Transfer";
				}
				
			%>
				<tr>
			<td> <%=i%></td>
			<td><%=new SimpleDateFormat("dd-MMM-yyyy").format(rs2.getDate("DispDate"))%></td>
			<%
			String name="-",location="-",fulladdress="-";
			String orderno=rs2.getString("OrderNo");
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
				if(technician==null|| technician.equalsIgnoreCase("null")|| technician.length()<=0)
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
			
			
			%>
				
			<td> <%=name %></td>
			<td><%=location %> </td>
			<td><%=fulladdress %></td>
			<td><%=technician %></td>
			<td> <%=rs2.getString("Unitid") %></td>
			<td><%=rs2.getString("InstType") %></td>
			<td><%=rs2.getString("User") %></td>
			<td> <%=rs2.getString("ModeofDispatch") %></td>
			<td> <%=rs2.getString("ChalanNo") %></td>
			<td> <%=rs2.getString("Disname") %></td>
			<td> <%=dispatchPrint %></td>
			</tr>	
			<% i++;
			   } %>
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