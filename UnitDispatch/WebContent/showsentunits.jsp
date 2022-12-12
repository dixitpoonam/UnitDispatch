<script src="sorttable.js"></script>

<%@ include file="menuheader.jsp" %>

<%!
Connection con1, con2;
%>

<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con1.createStatement(), stmt2 = con2.createStatement(),stmt3=con1.createStatement();
ResultSet rs1=null, rs2=null,rs3=null;
String sql1="", sql2="",sql3;

String TypeValue=session.getValue("typeval").toString();
sql3= "Select * from t_admin where TypeValue = '"+TypeValue+"'";
String user = session.getValue("user").toString();
String ustyp=session.getValue("urole").toString();
%>


<table border="0" width="100%">
   <tr> 
        <td> <div align="center"> <font color="maroon" size="3"> <b> Units sent  </b> </font> </div> </td>
   </tr>
</table> 

<table border="1" width="100%" class="sortable">
   <tr> 
        <th> Sr. No </th>
        <th> Sent Date</th>
	<th> Sent To</th>
        <th> No. of Units </th>
        <th> Status </th>
        <th> Mode of Dispatch </th>
	<th> Dispatch Name </th>
        <th> Chalan No </th>
        <th> Details </th>
   </tr>
<%
/* ***************Those details will be shown which are sent by the user************** */
	int i=1;
	sql1="select * from t_unitorder where Reqby='"+user+"' order by ReqDate desc ";
	//out.print(sql1);
	rs1=stmt1.executeQuery(sql1);
	while(rs1.next())
	{ 
		String orderno=rs1.getString("Reqno");
		String chalanno="";
%>
		<tr>
			<td> <%=i %> </td>
			<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("ReqDate"))) %> </td>
			<td> <%=rs1.getString("Reqto")%> </td>
			<td> <%=rs1.getString("NoofUnits") %> </td>
			<td> <%=rs1.getString("Status") %> </td>
			<td> <%=rs1.getString("ModeofDispatch") %> </td>
			<td> <%=rs1.getString("DisName") %> </td>
<%
		sql2="select * from t_unitmasterhistory where OrderNo='"+orderno+"' ";
		//out.print(sql2);
		rs2=stmt2.executeQuery(sql2);
		if(rs2.next())
		{
			chalanno=rs2.getString("ChalanNo");
		}
%>
			<td> <%=chalanno %> </td>
			<td> <a href="sntunitsdets.jsp?orderno=<%=orderno %>"> Details </a> </td>
		</tr>	
<%	
		i++;
	}
/* ************************************************************************************* */	
%>

</table>	

<%
} catch(Exception e) { out.println("Exception----->"+e); }

finally
{
con1.close();
con2.close();
}
%>
<br>
<table border="1" width="100%" >
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>