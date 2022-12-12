<%@ page contentType="application/vnd.ms-excel;charset=gb2312" %>
<% response.setContentType("application/vnd.ms-excel");
	response.addHeader("Content-Disposition","attachment;filename=\"qtdetailsExport.xls\"");%>

<%@ include file="Connections/conn.jsp" %>


<%!
Connection con3;
String ref="";

%>
<%
try
{
	Class.forName(MM_dbConn_DRIVER);
	con3= DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	
	Statement stmt1 = con3.createStatement();
	ResultSet rs1=null;
	String sql1="";
	ref=request.getParameter("refno");
	
	
	
	
%>

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
			<form action="" method="get" onsubmit="return validate();">
			<table border="0"  width="50%" align="center">
			
			<tr bgcolor="#87CEFA">
			<td align="left">
			  <table ><tr style="border: none;">
			  <td >
			 
			  </td>
			  <td>
				<input type="button" name="From Date" value="From Date" id="trigger" class="formElement"/>
				<script type="text/javascript">
  				Calendar.setup(
    			{
      			inputField  : "data",         // ID of the input field
      			ifFormat    : "%Y-%m-%d",     // the date format
      			button      : "trigger"       // ID of the button
    			}
  				);	
				</script>
			  </td>
			  </tr></table>
			</td>
			<td align="right">
			<table><tr><td>
			
			</td>
			<td>
			 	<input type="button" name="To Date" value="To Date" id="trigger1" class="formElement"/>
				<script type="text/javascript">
  				Calendar.setup(
    			{
      			inputField  : "data1",         // ID of the input field
      			ifFormat    : "%Y-%m-%d",    // the date format
      			button      : "trigger1"       // ID of the button
    			}
  				);
				</script>
			</td>
			</tr></table>
			  	
			  	
  			 </td >
			<td>
			<table ><tr>
			<td><b>Vendor:</b></td>
			<td>
			<%
			sql1="Select distinct(TypeValue) from t_admin where urole='manufacturer'";
			rs1=stmt1.executeQuery(sql1);
			
			%>
			<select name="vendor" id="vendor" class="formElement">
			<option value="all">All</option>
			<%while(rs1.next())
			{%>
			<option value="<%=rs1.getString("TypeValue") %>"><%=rs1.getString("TypeValue") %></option>
			
			<%} %>
			</select>  
			
			</td>
			</tr></table>
			
			</td>
			<td>
			<table><tr><td>
			<b>Status&nbsp;Type:</b></td>
			<td>
				<select Name="Statustype" id="Statustype" class="formElement">
					<option value="New">New</option>
					<option value="Repaired">Repaired</option>
					<option value="Both">Both</option>
				</select>
			</td>
			</tr></table>
			</td>
			<td>
				<input type="submit" name="submit" id="submit" value="submit" class="formElement">
			</td>
		</tr>
		
		</table>
		</form>
		
		</td></tr>
	<%

						sql1="select *from hwunittest where RefNo='"+ref+"'";
			
			rs1=stmt1.executeQuery(sql1);
			if(rs1.next())
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
} 
catch(Exception e) { out.println("Exception----->"+e); }

finally
{
con3.close();
}
%>
<table border="1" width="100%" >
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
				
