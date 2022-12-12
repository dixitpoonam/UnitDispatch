

<%@ page contentType="application/vnd.ms-excel; charset=gb2312" %>
<% response.setContentType("application/vnd.ms-excel");
Format formatterx = new SimpleDateFormat("dd-MMM-yyyy");
String showdatex = formatterx.format(new java.util.Date());

String filename="report.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="/Connections/conn.jsp" %>

<%!
Connection con1;
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement(), stmt2=con1.createStatement(), stmt3=con1.createStatement(), stmt4=con1.createStatement();
ResultSet rs1=null, rs2=null, rs3=null, rs4=null;
String sql1="", sql2="", sql3="", sql4="";
%>
<table class="stats">
  <tr> <td> <font color="maroon"> NA = Not Available </font>  </td> </tr>	
  <tr>
	<th> Unit Id </th>
	<th> Mobile No </th>
	<th> SIM No </th>
	<th> WMSN </th>
	<th> Type </th>
	<th> Last Inst date</th>
	<th> Configured in Vehicle No</th>
	<th> Transporter</th>
	<th> Manufacturer </th>
	
  </tr>
<%
sql1="select * from t_unitmaster where UnitId >=500 order by UnitId asc ";
rs1=stmt1.executeQuery(sql1);
while(rs1.next())
{
	String unitid=rs1.getString("UnitId");
	String wmsn=rs1.getString("WMSN");
	String type=rs1.getString("typeunit");	
	String instdate="", vehcode="", transp="", vehno="", manuf="";
 %>
	<tr>
		<td> <%=rs1.getString("UnitId") %> </td>
		<td> <%=rs1.getString("MobNo") %> </td>
		<td> <%=rs1.getString("SIMNo") %> </td>
<%
		if(wmsn==null)
		{
			wmsn="NA";
		}
		if(type==null)
		{
			type="NA";
		}
		
%>
		<td> <%=wmsn %> </td>
		<td> <%=type %> </td>

<%
	sql2="select * from t_unitreplacement where NewUnitId='"+unitid+"' order by InstDate desc limit 1 ";
	rs2=stmt2.executeQuery(sql2);
	if(rs2.next())
	{
		instdate=rs2.getString("InstDate");
		vehcode=rs2.getString("VehCode");
		transp=rs2.getString("OwnerName");
	}

	sql3="select * from t_vehicledetails where VehicleCode='"+vehcode+"' ";
	rs3=stmt3.executeQuery(sql3);
	if(rs3.next())
	{
		vehno=rs3.getString("VehicleRegNumber");
	}

	sql4="select * from t_unitmasterhistory where UnitId='"+unitid+"' order by EntDate asc limit 1 ";
	rs4=stmt4.executeQuery(sql4);
	if(rs4.next())
	{
		manuf=rs4.getString("User");
	}

	if(instdate==null || instdate.equals("") || instdate.equals("-"))
	{ %>
		<td> -  </td> 
<%	}
	else
	{ %>
		<td> <%=instdate %> </td> 
		
<%	} %>

<%
	if(vehno==null || vehno.equals(""))
	{
		vehno="NA";
	}
	if(transp==null || transp=="")
	{
		transp="NA";
	}
	if(manuf==null || manuf.equals("") || manuf.equals("-"))
	{
		manuf="NA";
	}
%>
		<td> <%=vehno %> </td> 
		<td> <%=transp %> </td>
		<td> <%=manuf %> </td>
 	</tr>
<%
}
%>
</table>
<%
} catch(Exception e) {out.println(e);}

finally
{
con1.close();
}

%>
