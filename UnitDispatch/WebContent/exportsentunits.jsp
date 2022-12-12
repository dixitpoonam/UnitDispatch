<%@ page contentType="application/vnd.ms-excel;charset=gb2312" %>
<% response.setContentType("application/vnd.ms-excel");
	response.addHeader("Content-Disposition","attachment;filename=\"unitdata.xls\"");%>

<%@ include file="Connections/conn.jsp" %>

<%!
Connection con1;
%>





<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement();
ResultSet rs1=null;

String sql1="";

String reqno=request.getParameter("reqno");
String sentby=request.getParameter("sentby");

sql1="select * from t_unitmasterhistory where OrderNo='"+reqno+"' and Status='Sent' order by UnitId asc ";
//out.print(sql1);
rs1=stmt1.executeQuery(sql1);
%>

<center>
	<table border="1" width="50%">
	   <tr>
		<th> Sr. No</th>
		<th> Unit ID</th>
		<th> Unit Type</th>
		
	   </tr>

<%
	  int i=1;
	  while(rs1.next())
	  { 
		String unid=rs1.getString("UnitId");
%>
	     <tr>
		
		<td> <div align="center"> <%=i %> </div> </td>
		
		<td> <div align="center"><%=rs1.getString("UnitId") %> </div> </td>
		<td> <div align="center"><%=rs1.getString("typeunit") %> </div> </td>
		
	    </tr>
<%	
	        i++;  
	}	 %>

	   <tr>
		<td colspan="4" align="center"> <input type="submit" name="submit" value="Receive" class="formElement" /> </td>
	   </tr>			
	</table>
<input type="hidden" name="cntr" value="<%=i %>" />

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
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>

