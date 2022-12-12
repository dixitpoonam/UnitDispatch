<%@ include file="menuheader.jsp" %>
<%!
Connection con1,con2;
%>
<form name="showsntunitsbymanuf" method="post" action="" onSubmit="return Validate()";>
<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement(),stmt2=con2.createStatement(),stmt3 = con1.createStatement(),stmtVendor = con1.createStatement();
ResultSet rs1=null;
String sql1="";
String reqno="",vendorname="",vendoreRole="";
String user=session.getValue("typeval").toString();
String UserID = session.getValue("user").toString();
String ustyp=session.getValue("urole").toString();
System.out.println("--------------"+user);
String recei=request.getParameter("received");
if(recei==null)
{
}
else
  { %>
	<table border="0" width="100%">
          <tr>
              <td> <div align="center"> <font color="maroon"><B> Successfully Received </B></font> </div></td>
          </tr>
        </table>
<%} %>
<%
String mainVendor = "select V_Role,V_TypeValue from db_CustomerComplaints.t_vendorMaster where V_ID = '"+session.getValue("typeval").toString()+"'";
//System.out.println("Main Vendor--"+mainVendor);
ResultSet rsVendor = stmtVendor.executeQuery(mainVendor);
if(rsVendor.next())
{
   vendorname = rsVendor.getString("V_TypeValue");
   vendoreRole = rsVendor.getString("V_Role");
  // System.out.println("Vendor Name----"+vendorname);
  // System.out.println("Vendor Role----"+vendoreRole);
}

if(ustyp.equals("administrator") && vendoreRole.contains("administrator"))
{
	sql1="select * from t_unitorder where Status in ('Sent', 'Partially Received', 'Partially Sent')";
}
else if(ustyp.equals("administrator") && vendoreRole.contains("manufacturer"))
{
	sql1="select * from t_unitorder where Status in ('Sent', 'Partially Received', 'Partially Sent') and reqto = '"+session.getValue("typeval").toString()+"'";
}
else
{
	//sql1="select * from t_unitorder where Status in ('Sent', 'Partially Received', 'Partially Sent') and Cust='"+user+"'";
	//System.out.println("User Name Here-----"+UserID);
	String UName = "";
	String sqlUName = "Select Name from t_admin where UName like '"+UserID+"'";
	System.out.println("User Name Here-----"+UserID);
	ResultSet rsName = stmt3.executeQuery(sqlUName);
	if(rsName.next())
	{
	   	UName = rsName.getString("Name");
	   	System.out.println("---User Name Like--"+UName);
	}
	sql1="select * from t_unitorder where Status in ('Sent', 'Partially Received', 'Partially Sent') and DisName='"+UserID+"'";
}
rs1=stmt1.executeQuery(sql1);
%>

<table border="0" width="100%">
    <tr>
	<td> <div align="center" > <font color="maroon" size="2" > <B> Internal Unit Transfer Details </B></font> </div> </td>
    </tr>
</table>
     	<table class="stats">
	    <tr>
		<th> Sr. No</th>
		<th> Sent Date</th>
		<th> No. of Sent Units</th> 
		<th> Mode of Dispatch</th> 		
		<th> Dispatch Name</th> 
		<th> Sent By</th> 	
		<th>Tested Units</th>
		<th> Show </th>
	   </tr>	
<%
	int i=1;
	while(rs1.next())
	{ 
		String reqby=rs1.getString("ReqTo");
		reqno=rs1.getString("Reqno");
		//System.out.println("reqno------------------>>>"+reqno);
		String testedunit="No";
		String str="select * from t_unitmaster where OrderNo='"+reqno+"'";
		ResultSet rsget=stmt2.executeQuery(str);
		while(rsget.next())
		{
			testedunit=rsget.getString("testedunit");
		}
		%>
		<td> <%=i %> </td>
		<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("ReqDate"))) %> </td>
		<td> <%=rs1.getString("NoofUnits") %> </td>
		<td> <%=rs1.getString("ModeofDispatch") %> </td>
		<td> <%=rs1.getString("DisName") %> </td>
		<td> <%=rs1.getString("Reqby") %> </td>
		<td> <%=testedunit%> </td>
		<td> <a href="sntunitsdet.jsp?reqno=<%=reqno %>&sentby=<%=rs1.getString("Reqby")%>&testedunits=<%=testedunit %>&unitspend=<%=rs1.getString("RemUnits") %>&status=<%=rs1.getString("Status") %>"> Show Details</a> </td>
	    </tr>
<%	
		i++;
	}  %>
	</table>
<%
} catch(Exception e) { out.println("Exception----->" +e); }
finally
{
con1.close();
}
%>
<br>
<table border="1" width="100%" >
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</form>