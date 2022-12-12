<%@ page contentType="application/vnd.ms-excel; charset=gb2312" %>
<% response.setContentType("application/vnd.ms-excel");


String filename="unitsintransworld.xls";
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

Statement stmt1=con1.createStatement(), stmt2=con1.createStatement(), stmt3=con1.createStatement(), stmt4=con1.createStatement(), stmt5=con2.createStatement();

ResultSet rs1=null, rs2=null, rs3=null, rs4=null, rs5=null;
String sql1="", sql2="", sql3="", sql4="", sql5="";

String user=session.getValue("user").toString();
String ustyp=session.getValue("urole").toString();
%>

<table border="0" width="100%">
  <tr>
     <td> 
     </td>
        
  </tr>
</table>

<table border="1" width="100%" class="sortable">
  <tr>
      <th>   Sr. No </th>
      <th>   Unit ID    </th>
      <th>   Rec. Date </th>
	<th>   Dis. Date </th>	
  </tr>
<%
	int i=1, j=0;
	sql1="select distinct(UnitId) as unit from t_unitreceived";
	rs1=stmt1.executeQuery(sql1);
	while(rs1.next())
	{
		String unitid="";
		java.util.Date rdate=new java.util.Date(); 
		java.util.Date ddate=new java.util.Date();
		unitid=rs1.getString("unit");				
		
		sql3="select max(Rdate) as max from t_unitreceived where UnitId='"+unitid+"' ";
		rs3=stmt3.executeQuery(sql3);
		if(rs3.next())
		{
			rdate=rs3.getDate("max");		
		}

		sql2="select max(Ddate) as max from t_unitdispatch where UnitId='"+unitid+"' ";
		rs2=stmt2.executeQuery(sql2);
		if(rs2.next())
		{
			int days=0;
			ddate=rs2.getDate("max");

			sql4="select (TO_DAYS('"+rdate+"')-TO_DAYS('"+ddate+"'))";	
			rs4=stmt4.executeQuery(sql4);
			if(rs4.next())
			{
				days=rs4.getInt(1);
			}
		
			if(days>0)
			{%>
				<tr>
					<td> <%=i%> </td>
					<td> <%=unitid%> </td>
					<td> <%=rdate%> </td>
					<td> <%=ddate%> </td>
				</tr>
<%	
				i++;
			}
		

		}
		else
		{ %>
			<tr>
				<td> <B> <%=i%> </B> </td>
				<td> <B> <%=unitid%>  </B> </td>
				<td> <B> <%=rdate%> </B> </td>
				<td> - </td>
			</tr>		
<%
			i++;
		}	

		
		
	}


%>
</table>


<% } catch(Exception e) { out.println("Exception----->" +e); }

finally
{
con1.close();
con2.close();
}
%>

<br>
<br>
<table border="1" width="100%" >
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>

</form>
