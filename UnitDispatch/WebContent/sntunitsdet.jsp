<%@ include file="menuheader.jsp" %>

<script language="javascript">

function CheckUncheckAll()
{
	var cntr=parseInt(document.showsntunitsbymanuf.cntr.value);

	for (i = 1; i < cntr; i++)
	{ 
		if(document.showsntunitsbymanuf.main.checked==true)
		{
			document.getElementById("dis"+i).checked = true;
		}
		else
		{
			document.getElementById("dis"+i).checked = false;
		}
	} 
}
</script>
<%!
Connection con1;
%>
<form name="showsntunitsbymanuf" method="post" action="sntunitsrecei.jsp" onSubmit="return Validate()";>
<% 
   String nounitselected=request.getParameter("nounitselected");
   if(nounitselected==null)
   {
   }
   else
   { %>
        <table border="0" width="100%">
          <tr>
              <td> <div align="center"> <font color="maroon"><B> No Unit was selected. Please select Unit/s to dispatch it </B></font> </div></td>
          </tr>
        </table>
<% } %> 


<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement();
ResultSet rs1=null;

String sql1="";
String msg="";
String reqno=request.getParameter("reqno");
String sentby=request.getParameter("sentby");
String testedunit=request.getParameter("testedunits");
String  unitspending=request.getParameter("unitspend");
String status=request.getParameter("status");
if(testedunit.equalsIgnoreCase("Yes"))
 msg="Ok";

sql1="select * from t_unitmaster where OrderNo='"+reqno+"' and Status='Sent' order by UnitId asc";
System.out.print(sql1);
rs1=stmt1.executeQuery(sql1);
%>

<input type="hidden" name="reqno" value="<%=reqno %>" />
<center>
   <table border="0" width="50%">
	<tr>
		<td> <div align="center"> <font color="maroon" size="2"> <B><%=msg %> Units sent by <%=sentby%> </B></div> </div> </td>
		<td align="right"> <a href="exportsentunits.jsp?reqno=<%=reqno%>&sentby=<%=sentby%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/></a></u> &nbsp;&nbsp;&nbsp;
    <a href="#" onclick="javascript:window.print();"><img src="images/print.jpg" width="20px" height="20px" border="0"/> 
 </td> 
	</tr>
   </table>
<center>
	<table border="1" width="50%">
	   <tr>
		<th>  <input type="checkbox" name="main" value="main" onClick="CheckUncheckAll();" > </input> </th>
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
<input type="hidden" name="unid<%=i %>" value="<%=unid %>" />
	     <tr>
		
		<td> <div align="center"> <input type="checkbox" id="dis<%=i %>" name="dis<%=i %>" value="dis<%=i %>"> </input> </div> </td>
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
<input type="hidden" name="pendingunits" value="<%=unitspending %>" />
<input type="hidden" name="status" value="<%=status %>" />
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
</td></tr>
</table>
</form>