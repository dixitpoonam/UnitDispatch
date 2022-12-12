
<%@ page contentType="application/vnd.ms-excel;charset=gb2312" %>
<% response.setContentType("application/vnd.ms-excel");
	response.addHeader("Content-Disposition","attachment;filename=\"testview.xls\"");%>

<%@ include file="Connections/conn.jsp" %>

<%!
Connection con1;
%>
<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con1.createStatement();
ResultSet rs1=null;
String sql1="";
String user=session.getValue("user").toString();
//out.println(user);
%>

<table class="stats">
  <tr>
      <td class="hed"> RefNo. </td>
      <td class="hed"> TheDate </td>
      <td class="hed"> Cust </td>
      <td class="hed"> Unit ID </td>
      <td class="hed"> UnitType </td>
      <td class="hed"> WMSN </td>
      <td class="hed"> MobileNo </td>
      <td class="hed"> SIMNo </td>
      <td class="hed"> SIMNo1 </td>
      <td class="hed"> RLED </td>
      <td class="hed"> GLED </td>
      <td class="hed"> Comment </td>
  </tr>
  <tr> 
<%
  int c1=1, i=1;
  sql1="select * from hwunittest where User='"+user+"' ";
	//out.print(sql1);
  rs1=stmt1.executeQuery(sql1);
  while(rs1.next())
   {  
     String refno=rs1.getString("RefNo");
     String TheDate=rs1.getString("TheDate");
     String Cust=rs1.getString("Cust");
     String UnitID =rs1.getString("UnitID");
     String UnitType =rs1.getString("UnitType");
     String  WMSN =rs1.getString("WMSN");
     String MobileNo=rs1.getString("MobileDB");
     String SIMNo=rs1.getString("SIMDB");
     String SIMNo1 =rs1.getString("SIMNo1");
     String RLED=rs1.getString("RLED");
     String  GLED =rs1.getString("GLED");
     String  Comment =rs1.getString("Comment");
 %>
    <td> <%=refno %>  </td>
     <% if(TheDate==null || TheDate.equals("-"))
   { %>
     <td> - </td>
<% } 
   else
   { 
     java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(TheDate);
     Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
     String nwfrmtdte=formatter.format(datefrmdb);
%>
     <td> <%=nwfrmtdte %></td>
  <% }%>

     <td> <%=Cust%> </td>
     <td> <%=UnitID%>  </td>
     <td> <%=UnitType%>  </td>
     <td> <%=WMSN%>  </td>
     <td> <%=MobileNo%></td>
	<td> <%=SIMNo%></td>
	<td><%=SIMNo1%></td>	
	<td><%=RLED%></td>
	<td><%=GLED%>  </td>
	<td> <%=Comment%> </td>
</tr>
<%
     i++;
     c1++;
    } %> 
</table>
<%
      } 
     catch(Exception e) { out.println("Exception----->"+e); }

finally
{
con1.close();
}
%>

