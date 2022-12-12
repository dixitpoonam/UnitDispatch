<script src="sorttable.js"></script>

<%@ include file="menuheader.jsp" %>

<%!
Connection con1;
%>

<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con1.createStatement(), stmt2 = con1.createStatement();
ResultSet rs1=null, rs2=null;
String sql1="", sql2="";

String orderno="";
String user=session.getValue("typeval").toString();
String ustyp=session.getValue("urole").toString();

orderno=request.getParameter("orderno");
%>

<table border="0" width="100%">
   <tr> 
        <td> <div align="center"> <font color="maroon" size="3"> <b> Details of Units Sent  </b> </font> </div> </td>
	<td align="right"> <a href="excelsntunits.jsp?orderno=<%=orderno%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/></a></u> &nbsp;&nbsp;&nbsp;
    <a href="#" onclick="javascript:window.print();"><img src="images/print.jpg" width="20px" height="20px" border="0"/> 
 </td> 
   </tr>
</table> 

<table border="1" width="70%" class="sortable">
   <tr> 
        <th> Sr. No </th>
        <th> Unit Id</th>
        <th> Status </th>
        <th> Sent / Received Date </th>
	<th> Received By </th>
   </tr>


<!-- *****************Details of which Unit Id's were sent and their status******************** -->
<% 
	int i=1;
	//sql1="select * from t_unitmasterhistory where OrderNo='"+orderno+"' group by Unitid";
	sql1="select UnitId, count(UnitId) as v1, DispDate, Status, RecBy from t_unitmasterhistory where OrderNo='"+orderno+"' group by UnitId order by DispDate desc";
		
	rs1=stmt1.executeQuery(sql1); 
	while(rs1.next())
	{   
		int unitcount=rs1.getInt("v1");
		
		String recdte=rs1.getString("DispDate");
		String status=rs1.getString("Status");
		String unitid=rs1.getString("UnitId");
		String recby="";
%>
		<tr>
			<td> <%=i %> </td>
			<td> <%=rs1.getString("UnitId") %> </td>
<%  
		if(unitcount>1)
		{
			sql2="select * from t_unitmasterhistory where OrderNo='"+orderno+"' and UnitId='"+unitid+"' and Status='Received' order by DispDate desc";
			rs2=stmt2.executeQuery(sql2);
			if(rs2.next())
			{
				recby=rs2.getString("RecBy");
			} 
 %>
			<td> Received  </td>
			
<%		} 
		else
		{ %>
			<td><%=rs1.getString("Status") %> </td>
			
<%		} 	

		if(recdte==null || recdte.equals("-"))
		{  %>
			<td> - </td>
<%		}		
		else
		{
%>	
			<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("DispDate"))) %> </td>
<%		}  
		
		if(unitcount>1)
		{ 
%>
			<td> <%=recby %> </td>
<%		}
		else
		{ %>
			<td> NA </td>
<%		} 
 %>
		</tr>
<%	
		i++;
	}
/* ************************************************************************************** */	

} catch(Exception e) { out.println("Exception----->"+e); }

finally
{
con1.close();
}
%>

</table>
<table border="1" width="100%" >
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
