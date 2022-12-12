 <%@ include file="Connections/conn.jsp" %>
<link href="css/css.css" rel="StyleSheet" type="text/css">
<%!
Connection con1;
%>
<form name="testedunitsform" action="hwsearchunit.jsp" onsubmit="return validate();">


<table border="0" width="100%">
<tr>
   
<td colspan="11"><div align="center"><font color="maroon" size="3"> <B> Testing Report</b></font></div></td>

</tr>
 <tr><td><div align="center">
 <input type="button" title="To print report click me" name="Print" value="Print" onclick="javascript:window.print();" class="formElement">
 </td>
<td><div align="right"><b>
Date : <%
Format fmt = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
String curdate = fmt.format(new java.util.Date());
 out.print(curdate); %></div>
</td></tr>
  </tr></table>


<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);


Statement stmt1 = con1.createStatement();
ResultSet rs1=null;
String sql1="",simdisp,mobdisp;
String user=session.getValue("user").toString();
//out.println(user);
%>
<p>
<table class="stats" border="0">
  <tr>
      <td class="hed"> RefNo. </td>
      <td class="hed"> TheDate </td>
      <td class="hed"> Cust </td>
      <td class="hed"> Unit ID </td>
      <td class="hed"> UnitType </td>
      <td class="hed"> WMSN </td>
      <td class="hed"> MobileNo </td>
      <td class="hed"> SIMNo </td>
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
     String MobileNo1=rs1.getString("MobileNo1");
     String SIMNo=rs1.getString("SIMDB");
     String SIMNo1 =rs1.getString("SIMNo1");
     String RLED=rs1.getString("RLED");
     String  GLED =rs1.getString("GLED");
     String  Comment =rs1.getString("SWComment");
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
	<%
	if(SIMNo1.equals("-"))
	{
		simdisp=SIMNo ;
	}
	else
	{
		simdisp=SIMNo1;
	}
	if( MobileNo1.equals("-"))
	{
		mobdisp= MobileNo;
	}
	else
	{
		mobdisp= MobileNo1;		
	}
	%> 
	<td><%=mobdisp%></td>
	    <td><%=simdisp%> </td>
	<td><%=RLED%></td>
	<td><%=GLED%>  </td>
	<td> <%=Comment%> </td>
</tr>
<%
     i++;
     c1++;
    } %> 

</table><Br><br><br>
<%
      } 
     catch(Exception e) { out.println("Exception----->"+e); }

finally
{
con1.close();
}
%>


<tr><td colspan="11" align="center">
<input type="button" name="Print" value="Print" onclick="javascript:window.print();" class="formElement">
</td></tr>
</table>
