<%@ page contentType="application/vnd.ms-excel;charset=gb2312" %>
<% response.setContentType("application/vnd.ms-excel");
	response.addHeader("Content-Disposition","attachment;filename=\"showreq.xls\"");%>

<%@ include file="Connections/conn.jsp" %>
<%!
Connection con1;
%>

<%
try {
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

	Statement stmt1=con1.createStatement(), stmt2=con1.createStatement();
	ResultSet rs1=null, rs2=null,rs4=null;
	String sql1="", sql2="",sql4="",cnt="";
	String user=session.getValue("typeval").toString();
	int code=0;
	String ustyp=session.getValue("urole").toString();
	%>

	<table border="0" width="100%">
	  <tr>
	   
	    <td align="center"> <div align="center">
	        <table border="0" width="80%">
	          <tr> <td> <div align="center">
	                    <font color="maroon" size="3"> <B> Order/s Pending </B></font>  </div>
	               </td>
	          </tr>
	        </table>  </div>
	     </td> 
	     <td> <div align="right"> 
	         <table border="0" width="20%"> 
	          <tr> <td >  <div align="right">
	                <a href="showorderExport.jsp"> <img src="images/excel.jpg" width="20px" height="20px" border="0"/> </a>&nbsp;&nbsp;&nbsp;&nbsp;
	                <a href="#" onclick="javascript:window.print();"> <img src="images/print.jpg" width="20px" height="20px" border="0"/> </a> </div> 
	              </td>
	         </tr>
	       </table> </div>
	     </td>
	  </tr>
	</table>

	<% String dispatched=request.getParameter("dispatched");
	   if(dispatched==null)
	   {
	   }
	   else
	   { 
	      String dispid=request.getParameter("dispid");
	%> 
	       <table border="0" width="100%">
	        <tr>
	           <td> <div align="center"> <font color="maroon" size="2">  <B> Dispatched Successfully. Dispatch Id is <%=dispid %></B> </font> </div> </td>
	        </tr>
	      </table>
	<% } %>

	<% String unitsexceed=request.getParameter("unitsexceed");
	   if(unitsexceed==null)
	   {
	   }
	   else
	   { 
	    String noofunits1=request.getParameter("noofunits");
	%>
	      <table border="0" width="100%">
	       <tr>
	          <td> <div align="center"> <font color="maroon" size="2"> <B> You have excceded the requested no. of Units. Please select Units <= <%=noofunits1 %> </B> </font> </div></td>
	       </tr>
	      </table>
	<% } %>

	<%
	  if(ustyp.equals("administrator"))
	   { 
	      sql1="select * from t_unitorder where Status in('Open', 'Partially Dispatched','Partially Sent') order by Reqno desc ";
	   }
	   else
	   { 
	    sql1="select * from t_unitorder where Reqto='"+user+"' and Status in('Open', 'Partially Dispatched','Partially Sent') order by Reqno desc ";
	  //out.print(sql1);
	   }
	  rs1=stmt1.executeQuery(sql1);

	%>
	   <table class="sortable" border="1" width="100%">
	     <tr>
	        
	         <th> Sr. No. </th>
	         <th> Order No</th>
	         <th> Order Date</th>
	         <th> Unit Type</th>
	         <th> Inst. Type</th>
	         <th> No. of Units</th>
	         <th> Units Pending </th>
	         <th>Sim Company</th>
	         <th>Box Enclosure Type</th>
	         <th> Status </th>
	         <th> Peripheral Specification</th>
	         <th> Dispatch Add</th>
	         <th> Customer</th>
	    	<th> Tech</th>
	         <th> Dispatch Date</th>
	         <th> Ordered by</th>
	<%
	if(ustyp.equals("administrator"))
	   { %>
	         <th> Ordered to </th>
	<% } %>
	 <th>Order Type</th>
	         <th class="sorttable_nosort"> Check </th>
	         
	         
	     </tr>

	 <%  int j=1; 
	    while(rs1.next())
	     { 
	       String reqdte=rs1.getString("ReqDate");
	       String disdte=rs1.getString("DispDate");
	       String untyp=rs1.getString("TypofUnit");
	       String periph=rs1.getString("Peripherals");
	       String reqno=rs1.getString("Reqno");
	       String loc=rs1.getString("DispatchAdd");
	       String noofunits=rs1.getString("RemUnits");
	       String insttyp=rs1.getString("Instype");
		String reqto=rs1.getString("Reqto");
		String cust=rs1.getString("Cust");
		String tech=rs1.getString("Tech");
		String simco=rs1.getString("Sim_Co");
		String boxtype=rs1.getString("Box_type");

		String dispto="";
	      // String reqno=rs1.getString("Reqno");
	      //String status=rs1.getString("Status");

		if(tech.equals("None")) 
		{
			dispto=cust;
		}
		else
		{
			dispto=tech;
		}
	 %>
		

	<%
	     java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(reqdte);
	     Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
	     String nwfrmtdte=formatter.format(datefrmdb);
	     String nwfrmtdte1="";
	     if(!(disdte==null))
	     {
	     java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(disdte);
	     Format formatter1=new SimpleDateFormat("dd-MMM-yyyy");
	     nwfrmtdte1=formatter1.format(datefrmdb1);
	     }
	     else
	       nwfrmtdte1="-";
	     

	     sql2="select * from t_periphcomb where Combination='"+periph+"' ";
	     //out.println(sql2);
	     rs2=stmt2.executeQuery(sql2);
	    if(rs2.next())
	     {
	       code=rs2.getInt("id");
	       //out.println(code);
	     }
	      
	%>    
	      <tr>   
	         <td> <%=j %> </td>
	         <td> <%=rs1.getString("Reqno") %> </td>
	         <td sorttable_customkey="dd-MMM-yyyy"> <%=nwfrmtdte %> </td>
	         <td> <%=rs1.getString("TypofUnit") %> </td>
	         <td> <%=rs1.getString("Instype") %> </td>
	         <td> <%=rs1.getString("NoofUnits") %> </td>
	         <td> <%=rs1.getString("RemUnits") %></td>
	           <td> <%=rs1.getString("Sim_Co") %> </td>
	            <td> <%=rs1.getString("Box_type") %> </td>
	         <td> <%=rs1.getString("Status") %> </td>
	         <td> <%=rs1.getString("Peripherals") %> </td>
	         <td> <%=rs1.getString("DispatchAdd") %> </td>
	         <td> <%=rs1.getString("Cust") %> </td>
		<td> <%=rs1.getString("Tech") %> </td>
	         <td sorttable_customkey="dd-MMM-yyyy"> <%=nwfrmtdte1 %> </td>
	         <td> <%=rs1.getString("Reqby") %> </td>
	<%
	if(ustyp.equals("administrator"))
	   { %>
	         <td> <%=rs1.getString("Reqto") %> </td>
	<% } %>
		<td> <%=rs1.getString("Ordertype") %> </td>
	         <td> <a href="status.jsp?code=<%=code %>&untyp=<%=untyp %>&orderdate=<%=nwfrmtdte %>&dispatchdate=<%=nwfrmtdte1  %>&reqno=<%=reqno %>&loc=<%=loc %>&noofunits=<%=noofunits %>&simco=<%=simco %>&boxtype=<%=boxtype %>&insttyp=<%=insttyp %>&reqto=<%=reqto %>&dispto=<%=dispto %>"> Availability </a> </td> 
	         
	  </tr>
	<%  j++;
	    } %>

	   </table>
	<br>
	   
	<%
} catch(Exception e) { out.println("Exception----->" +e); }

finally
{
con1.close();

}
%>
