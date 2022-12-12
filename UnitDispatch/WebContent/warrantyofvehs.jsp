<%@ page contentType="application/vnd.ms-excel; charset=gb2312" %>
<% response.setContentType("application/vnd.ms-excel");
Format formatterx = new SimpleDateFormat("dd-MMM-yyyy");
String showdatex = formatterx.format(new java.util.Date());

String filename="report.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="Connections/conn.jsp" %>


<%!
Connection con1, con2;
%>

<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con1.createStatement(), stmt2 = con2.createStatement(), stmt3 = con2.createStatement();

String sql1="", sql2="";
ResultSet rs1=null, rs2=null;

%>
<table border="1" width="100">
	<tr>
		<td> Sr No</td>
		<td> Transporter</td>
		<td> Vehicle No</td>
		<td> Unit Id</td>
		<td> Unit in Warranty</td>
		<td> No of days</td>
	</tr>
<%
	int i=1;
	sql1="select * from t_vehicledetails where MobilePhNo <> '0' order by OwnerName asc ";
	rs1=stmt2.executeQuery(sql1);
	while(rs1.next())
	{
		String instdate=rs1.getString("InstalledDate");
		String unitwarranty="";
 %>
		<tr>
			<td> <%=i %> </td>
			<td> <%=rs1.getString("OwnerName")%> </td>
			<td> <%=rs1.getString("VehicleRegNumber")%> </td>
			<td> <%=rs1.getString("UnitId")%> </td>
<%      int ww=0;
	sql2="select (TO_DAYS('2009-02-21')-TO_DAYS('"+instdate+"'))";
	
	rs2=stmt3.executeQuery(sql2);
	if(rs2.next())
	{
		ww=0;	
		ww=rs2.getInt(1);
	        int dysrem=365-ww;
		if(ww <365)
		{ 
			unitwarranty="Yes";
		}
		else
		{
			unitwarranty="No";
		}
	}
%>
			<td> <%=unitwarranty %> </td>
			<td> <%=ww%> </td>
			
		</tr>			
<%	
		i++;
	}
%>
</table>

<% 
 con1.close();
 con2.close();
  
} catch(Exception e) { out.println("Exception----->"+e); }

finally
{

}
%>
     
<br>
<br>
<table border="0" width="100%" >
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>

</form>
