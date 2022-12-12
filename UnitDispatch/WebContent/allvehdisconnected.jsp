<%@ page contentType="application/vnd.ms-excel; charset=gb2312" %>

<% response.setContentType("application/vnd.ms-excel");

    response.addHeader("Content-Disposition", "attachment;filename=alldisconnectedvehs.xls");
%>
<%@ include file="Connections/conn.jsp" %>

<%!
Connection con1, con2;
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement(), stmt2=con1.createStatement(), stmt3=con1.createStatement(), stmt4=con1.createStatement();
ResultSet rs1=null, rs2=null, rs3=null, rs4=null;
String sql1="", sql2="", sql3="", sql4="";

		java.util.Date tdydte = new java.util.Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd");
		String tdydte1=formatter.format(tdydte);

%>
	<table width="100%">
		<tr>
			<td> <B> Sr. No. </B> </td>
			<td> <B> Vehicle No </B> </td>
			<td> <B> Transporter </B> </td>
			<td> <B> Unit Id </B> </td>
			<td> <B> Mobile No</B> </td>
			<td> <B> Last Data Date</B> </td>
			<td> <B> Last Data Location</B> </td>
			<td> <B> Last Replacement date </B> </td>			
		</tr>
<%
	String vehcode="", vehno="", trans="", lastdate="", lastloc="";
	int i=1;

	sql1="select * from t_onlinedata where TheDate <= '2009-03-24' and Status not in('Deleted', 'Removed') and Transporter <> '% del' order by Transporter asc";
	
	rs1=stmt1.executeQuery(sql1);
	while(rs1.next())
	{
		String unitid="", mobno="", repdate="";		

		vehcode=rs1.getString("VehicleCode");
		vehno=rs1.getString("VehicleRegNo");
 		trans=rs1.getString("Transporter");
		lastdate=rs1.getString("TheDate");
		lastloc=rs1.getString("Location");

		sql2="select * from t_vehicledetails where VehicleCode='"+vehcode+"' ";
		rs2=stmt2.executeQuery(sql2);	
		if(rs2.next())
		{
			unitid=rs2.getString("UnitId");
		}

		
		sql3="select * from t_unitmaster where UnitId='"+unitid+"' ";
		rs3=stmt3.executeQuery(sql3);
		if(rs3.next())
		{
			mobno=rs3.getString("MobNo");
		}

		
		sql4="select * from t_unitreplacement where VehregNo='"+vehno+"' order by InstDate desc limit 1";
		rs4=stmt4.executeQuery(sql4);
		if(rs4.next())
		{
			repdate=rs4.getString("InstDate");
		}
%>
		<tr>
			<td> <%=i%> </td>
			<td> <%=vehno%> </td>
			<td> <%=trans%> </td>
			<td> <%=unitid%> </td>
			<td> <%=mobno%> </td>
			<td> <%=lastdate%> </td>
			<td> <%=lastloc%> </td>
			<td> <%=repdate%> </td>
		</tr>	
<%
		i++;
	}
%>
	</table>
<%
} catch(Exception e) { out.println("Exception----->" +e); }

finally
{
con1.close();
con2.close();

}
%>
