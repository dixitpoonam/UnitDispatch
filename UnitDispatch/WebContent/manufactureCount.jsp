

<%@ include file="headeradmin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.Date"%>
<%@page import="org.jfree.ui.about.SystemPropertiesTableModel"%><html>
<head>

<title>Unit Dispatch</title>
<script src="sorttable.js"></script>

</head>
<body bgcolor="lightyellow">
  	<%!
		Connection con1;
		Connection con2;
		String refno=null;
		Statement stmt1,stmt2;
	%>
	<table><tr><td>in manufacture count</td></tr></table>
<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

stmt1 = con2.createStatement();
stmt2 = con1.createStatement();

String today=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
int manCount,trackCount;
String unitID_list=request.getParameter("unitid");
System.out.println("unitID_list--->"+unitID_list);
String from=request.getParameter("from");
System.out.println("from--->"+from);
String to=request.getParameter("to");
System.out.println("to--->"+to);
String manufacture="NO";
manufacture=request.getParameter("manufacture");
System.out.println("manufacture--->"+manufacture);
String trackfile="NO";
trackfile=request.getParameter("trackfile");
System.out.println("trackfile--->"+trackfile);
String qt=request.getParameter("qt");
System.out.println("qt--->"+qt);
String RDate=request.getParameter("RDate");
System.out.println("RDate--->"+RDate);
String RTime=request.getParameter("RTime");
System.out.println("RTime--->"+RTime);
if(manufacture.equalsIgnoreCase("Yes")){
%>	<table width="100%" border="1" align="center" class="sortable">
	<tr>
		<th class="hed"> Sr.</th>
		<th class="hed"> UnitID</th>
		<%if(manufacture.equalsIgnoreCase("Yes")){ %>
		<th class="hed"> ManufactureCount</th>
		<%}else{ %>
		<th class="hed"> ManufactureCount</th>
		<%} %>
		<th class="hed"> Tested_by</th>
		<th class="hed"> TesetdDateTime</th>
	
	</tr>
	<%
String sql="select TrackFileCount as manCount,ManufactureCount as trackCount,Tested_by,TesetdDateTime from db_gps.t_unitmasterhistory where Status='Tested' and EntDate between '"+from+"' and '"+to+"' and UnitID='"+unitID_list+"' ";
System.out.println("sql--->"+sql);
int i=1;
ResultSet rs=stmt2.executeQuery(sql);
while(rs.next()){
	 trackCount=rs.getInt("trackCount");
	 manCount=rs.getInt("manCount");
	 System.out.println("trackCount--->"+trackCount+"manCount--->"+manCount);

	if(manufacture.equalsIgnoreCase("Yes")){
		%>
		
			<tr>
				<td><%= i %> </td>
				<td><%=unitID_list  %></td>
				<td><%=manCount %></td>
				<td><%=rs.getString("Tested_by") %></td>
				<td><%=rs.getString("TesetdDateTime") %></td>
		
			</tr>
		
		<%
	}
	

	%>
	
<%	
	i++;
}
%>
</table><%
}else if(trackfile.equalsIgnoreCase("Yes")){
	%>
	
	
	
	<%
}else{
	System.out.println("in else statement--->");
	%><table width="100%" border="1" align="center" class="sortable">
	<tr>
		<th class="hed"> Sr.</th>
		<th class="hed"> UnitID</th>
		<th class="hed"> QuickTestDate</th>
		<th class="hed"> QuickTestTime</th>
		<th class="hed"> User</th>
		
	
	</tr>
	<%
	String sqlReceive="select TheDate,TheTime,User,RefNo from db_CustomerComplaints.hwunittest where Unitid='"+unitID_list+"' and concat(TheDate,' ',TheTime)>=concat('"+RDate+"',' ','"+RTime+"') order by concat(TheDate,' ',TheTime) asc";
	System.out.println("sqlReceive--->"+sqlReceive);
	ResultSet rsReceive=stmt1.executeQuery(sqlReceive);
	int j=1;
	while(rsReceive.next()){
		
	%>
	
			<tr>
				<td><%=j %></td>
				<td><%=unitID_list %></td>
				<td><%=rsReceive.getString("TheDate")%></td>
				<td><%=rsReceive.getString("TheTime")%></td>
				<td><%=rsReceive.getString("User")%></td>
				
			
			</tr>
		
	
	
	<%
	j++;
}
	%></table><%
}}catch(Exception e) { 
	//out.println("Exception----->"+e); 
System.out.println("Exception----->"+e);	
}

finally
{
	stmt1.close();
	stmt2.close();
	
}
%>
	
       <table border="1" width="100%">
<tr ><td bgcolor="white" class="copyright" width="100%"><center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center></td></tr>
</table>
      
    </body>
    
</html>