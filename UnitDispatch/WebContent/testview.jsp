<%@ include file="headeradmin.jsp" %>
<%!
Connection con1;
String user="",emptype="";
Statement stmt1 = null;
ResultSet rs1=null;
%>
<form name="testedunitsform" action="hwsearchunit.jsp" onSubmit="return Validate();">
<%
 user=session.getValue("user").toString();
 emptype=session.getValue("role").toString();
%>

<table border="0" width="100%" align="right" >
<tr> <td background="images/orangebarsmall.jpeg" bgcolor="orange" width="110" align="center">
 <a href="main1.jsp">HOME</a>
</td>
<td background="images/orangebarsmall.jpeg" bgcolor="orange" width="110" align="Center"><a href="testview.jsp"> View Tested Units</div></a></td>
<td background="images/orangebarsmall.jpeg" bgcolor="orange" width="110" align="center"><font color="blue" size="2"> <B><U>Welcome <%=user %> </U></B> </font></center></td>

<td background="images/orangebarsmall.jpeg" width="110" bgcolor="orange" align="center">
<a href="http://www.mobile-eye.in/contact.html">CONTACT US</a>
</td>
<td background="images/orangebarsmall.jpeg" width="110" bgcolor="orange" align="center">
<a href="logoutadmin.jsp"> Log Out</a>
</td>
</tr>
</table><br>
<br>

<table border="0" width="100%">  
 <tr><td><div align="left" > <font color="Blue" size="1"> Note- Enter date in format(yyyy-mm-dd)</font>&nbsp;&nbsp;&nbsp;<font color="maroon" size="1">  Search 
 <input type="text" name="s1" class="formElement">
 <input type="submit" name="submit" value="Submit" class="formElement">
</div> </td><td><div align="left"><font size="3" color="maroon"><b>Tested Unit Details</font></div></td>
<td><div class="bodyText" align="right">
<a href="#" onclick="javascript:window.open('print_detail_testedunit.jsp?');" title="Print Report"><img src="images/print.jpg" width="15px" height="15px"></a>&nbsp; &nbsp; <a href="export_Testedunit.jsp?" title="Export to Excel"><img src="images/excel.jpg" width="15px" height="15px"></a>&nbsp;&nbsp;&nbsp;

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

 stmt1 = con1.createStatement();
String sql1="",simdisp,mobdisp;

//out.println(user);
%>
<p>
<table  class="hed" border="1">
  <tr bgcolor="Lightgreen">
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
     <!-- <td class="hed"><b> Edit </td> -->
  </tr>
  <tr> 
<%
  int c1=1, i=1,j=1;
  sql1="select * from hwunittest where User='"+user+"' order by Thedate desc ";
	
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
 <!--<td> <a href="EditTestpage.jsp?uid=<%=UnitID %>"> Edit </a> </td> -->
</tr>
<%
     i++;
     c1++;
	j++;
    } %> 
    
</table><Br><br><br>
<input type="hidden" name="cntr" value="<%=j %>" />
<%
      } 
     catch(Exception e) { out.println("Exception----->"+e); }

finally
{
	try {
		if(rs1!=null)
			rs1.close();
		if(stmt1!=null)
			stmt1.close();
		if(con1!=null)
			con1.close();
	} catch (SQLException e) {

		e.printStackTrace();
	}



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




