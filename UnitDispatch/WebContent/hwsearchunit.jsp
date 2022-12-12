<!-- 
  Module Name : Search Result Page after Testview page 
  Creator : Vikram I Nalawade
  Date of Creation : 22/08/08
  Description : Search Result Page after Testview page -->


<%@ include file="headeradmin.jsp" %>
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
String searchval=request.getParameter("s1");
%>
<p><table border="0" width="100%">
  <tr>
<td> <div align="left"> <a href="main1.jsp"> <img src="images/home-icon.jpg" width="40px" height="40px" border="0"/> </a> </div> </td>
<td> <div align="center"> <font color="maroon" size="3"> <B> Search Result </B></font>  </div></td>
<td> <div align="right"> <a href="logoutadmin.jsp"> Log Out </a> </div> </td></tr>  </table>
<p>
<table  class="hed" border="1" width="100%">
  <tr bgcolor="Lightgreen" width="100%">
	 <td class="hed"><b> Sr.No </td>
      <td class="hed"><b> TheDate </td>
	 <td class="hed"><b> Ref.No </td>
      <td class="hed"><b> Cust </td>
      <td class="hed"><b> Unit ID </td>
      <td class="hed"><b> UnitType </td>
      <td class="hed"><b> WMSN </td>
      <td class="hed"><b> MobileNodb </td>
	<td class="hed"><b> MobileNotsame </td>
      <td class="hed"><b> SIMNodb </td>
	<td class="hed"><b> SimNotSame </td>
      <td class="hed"><b> RLED </td>
      <td class="hed"><b> GLED </td>
	<td class="hed"><b> Firmware </td>
	<td class="hed"><b> Code </td>
      <td class="hed"><b> Comment </td>
  </tr>

<%
  
   int c1=1, i=1,j=1;
  sql1="select * from hwunittest where RefNo like '"+searchval+"' or TheDate like '"+searchval+"' or Cust like                                                                    '"+searchval+"' or UnitID like '"+searchval+"' or UnitType like '"+searchval+"' or WMSN like '"+searchval+"'or MobileDB like '"+searchval+"' or SIMDB like '"+searchval+"'  ";  
   
  
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
     String  firmware =rs1.getString("Firmware");
     String  code =rs1.getString("SWswver");
 %>
    <td> <%=j %> </td>
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
	<td> <%=refno %> </td>
     <td> <%=Cust%> </td>
     <td> <%=UnitID%>  </td>
     <td> <%=UnitType%>  </td>
     <td> <%=WMSN%>  </td>
	<%
	if(MobileNo.equals("null")||MobileNo1.equals("null")||SIMNo1.equals("null")||SIMNo.equals("null"))
	   {
		MobileNo="-";
		MobileNo1="-";
		SIMNo1="-";
		SIMNo="-";
          }
	
	 %>
	<td><%=MobileNo%></td>
	    <td><%=MobileNo1%> </td>
	<td><%=SIMNo%> </td>
	<td><%=SIMNo1%> </td>
	<td><%=RLED%></td>
	<td><%=GLED%>  </td>
	<td><%=firmware%>  </td>
	<td><%=code%>  </td>
	<td> <%=Comment%> </td>
</tr>
<%
     i++;
     c1++;
    } %> 

</table>
<Br><br><br>
<table border="0" width="100%">
<tr>
   
<td><div="left"><font color="maroon" size="1"><u><a href="export.jsp"> Export to EXCEL</a></u></font></div></td>
<td><div align="right"><font color="maroon" size="1"><u><a href="#" onclick="javascript:window.print();"> PRINT </a></u> </div></td>
</tr>
</table>

<%
      } 
     catch(Exception e) { out.println("Exception----->"+e); }

finally
{
con1.close();
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
