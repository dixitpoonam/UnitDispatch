<%@ page contentType="application/vnd.ms-excel; charset=gb2312" %>
<% response.setContentType("application/vnd.ms-excel");
Format formatterx = new SimpleDateFormat("dd-MMM-yyyy");
String showdatex = formatterx.format(new java.util.Date());

String filename="qtreport.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="Connections/conn.jsp" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Quick Test details</title>

</head>
<body>

<%
Connection con3=null;
String recDate=null,recTime=null,dispDate=null,dispTime=null,unitid=null;
try
{
	Class.forName(MM_dbConn_DRIVER);
	con3= DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1 = con3.createStatement();
	ResultSet rs1=null;
	String sql1="";
	recDate=request.getParameter("recDate");
	recTime=request.getParameter("recTime");
	dispDate=request.getParameter("dispDate");
	dispTime=request.getParameter("dispTime");
	unitid=request.getParameter("unitid");
	
%>
<table width="100%" class="sortable">
<tr>
<td align="center">Quick Test Details
</td>
</tr>
<tr>

</tr>
</table>

<table width="100%" border="1" align="center" class="sortable">

			<tr>
			
			<th class="hed"> Ref No</th>
			<th class="hed"> Date</th>
			<th class="hed"> Customer Name</th>
			<th class="hed"> Customer DB</th>
			<th class="hed"> Unit ID</th>
			<th class="hed"> Unit Type</th>
			<th class="hed"> WMSN</th>
			<th class="hed"> Mobile No DB</th>
			<th class="hed"> Sim No DB</th>
			<th class="hed"> RLED</th>
			<th class="hed"> GLED</th>
			<th class="hed"> GLED Blink</th>
			<th class="hed"> RLEDConn</th>
			<th class="hed"> GLED Ok</th>
			<th class="hed"> Other Conn</th>
			<th class="hed"> Firmware</th>
			<th class="hed"> Comment</th>
			<th class="hed"> Debit Note</th>
			<th class="hed"> Manufactured By</th>
			<th class="hed"> Correction Done</th>
			<th class="hed"> Ent By</th>
			</tr>	
			<%
			if(dispDate!=null && !(dispDate.equalsIgnoreCase("-")))
			{
			sql1="select * from hwunittest where unitid='"+unitid+"' and concat(TheDate,' ',TheTime) between '"+recDate+" "+recTime+"' and '"+dispDate+" "+dispTime+"' order by TheDate,TheTime";
			}
			else{
				sql1="select * from hwunittest where unitid='"+unitid+"' and concat(TheDate,' ',TheTime) >= '"+recDate+" "+recTime+"' order by TheDate,TheTime";	
			}
			rs1=stmt1.executeQuery(sql1);
			while(rs1.next())
			{%>
				<tr>
				
				<td><%=rs1.getString("RefNo") %></td>
				<td><%=rs1.getString("TheDate")%> </td>
				<td><%=rs1.getString("Cust")%> </td>
				<td><%=rs1.getString("Custdb")%> </td>
				<td><%=rs1.getString("UnitID")%> </td>
				<td><%=rs1.getString("UnitType")%> </td>
				<td><%=rs1.getString("WMSN")%> </td>
				<td><%=rs1.getString("MobileDB")%> </td>
				<td><%=rs1.getString("SIMDB")%> </td>
				<td><%=rs1.getString("RLED")%> </td>
				<td><%=rs1.getString("GLED")%> </td>
				<td><%=rs1.getString("GLEDBlink")%> </td>
				<td><%=rs1.getString("RLEDConn")%> </td>
				<td><%=rs1.getString("GLEDOk")%> </td>
				<td><%=rs1.getString("OthConn")%> </td>
				<td><%=rs1.getString("Firmware")%> </td>
				<td><%=rs1.getString("SWComment")%> </td>
				<td><%=rs1.getString("SWDebitNote")%> </td>
				<td><%=rs1.getString("ManufactBy")%> </td>
				<td><%=rs1.getString("Correctiondone")%> </td>
				<td><%=rs1.getString("User")%> </td>
				</tr>
				<% }
				
				
				
			%>
			</table>
			<%
} catch(Exception e) { out.println("Exception----->"+e); }

finally
{
con3.close();
}
%>

 <table border="1" width="100%">
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
				
</body>
</html>