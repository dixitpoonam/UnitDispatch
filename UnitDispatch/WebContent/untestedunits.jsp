<html>
<head>
<script src="sorttable.js"></script> 
 <style><!-- 
    SPAN.searchword { background-color:yellow; }
    // -->
  </style>
  <script src="searchhi.js" type="text/javascript" language="JavaScript"></script>

</head>

<body onLoad="JavaScript:loadSearchHighlight();" bgcolor="#FFE4E1">
<style><!-- 
    SPAN.searchword { background-color:yellow; }
    // -->
  </style>
  <script src="searchhi.js" type="text/javascript" language="JavaScript"></script>
  <script language="JavaScript"><!--
    function loadSearchHighlight()
    {
      SearchHighlight();
      document.searchhi.h.value = searchhi_string;
      if( location.hash.length > 1 ) location.hash = location.hash;
    }
    // -->
  </script>

</body>

<%@ include file="menuheader.jsp" %>

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

String user=session.getValue("typeval").toString();
String ustyp=session.getValue("urole").toString();
String EntBy=session.getValue("user").toString();

%>

<table border="0" width="100%">
  <tr>
           
     <td>  <form method="get" name="searchhi">
          <div align="right">
<input type="text" name="h" class="formElement" /> &nbsp;&nbsp;
           <input type="submit" value="Find!" class="formElement" /> </div>
             </form> 
     </td>
        
  </tr>
</table>
<table border="0" width="100%">
  <tr>
       <td> <div align="center"> <font color="maroon" size="3"> <B> UnTested Units </B></font> </div>
       </td>
  </tr> 
</table> 

	<table border="1" width="100%" class="sortable">
  <tr>
      <th>   Sr. No </th>
      <th>   Unit ID    </th>
      <th>   Unit Type </th>
      <th>   Manuf. Date </th>
     <th>    Inst Type </th>
     
<%
   if(ustyp.equals("administrator"))
   {  %>
     
      <th>   Manuf. By    </th>  
<% } %> 
  </tr>
<%
int i=1;
if(ustyp.equals("administrator"))
   { 
      sql1="select * from t_unitmaster where User <> 'null' and UnitID not in(select UnitId from allconnectedunits) order by EntDate desc";
      //out.print(sql1);
   }
else
{
      //sql1="select * from t_unitmaster where User='"+user+"' and UnitID not in (select UnitId from allconnectedunits) order by EntDate desc";
      sql1="select * from t_unitmaster where EntBy='"+EntBy+"' and UnitID not in (select UnitId from allconnectedunits) order by EntDate desc";
     //out.println(sql1);
}
rs1=stmt1.executeQuery(sql1);
while(rs1.next())
   {  %>
	<tr>
		<td> <%=i %> </td>
		<td> <%=rs1.getString("UnitId") %> </td>
		<td> <%=rs1.getString("typeunit") %> </td>
		<td> <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs1.getString("EntDate"))) %> </td>
		<td> <%=rs1.getString("InstType") %></td>
<%
	if(ustyp.equals("administrator"))
   	{ %> 
		
		<td> <%=rs1.getString("User") %> </td>
<%	} %>
	</tr>
<% 
 	i++;
   }
  %>
</table>


<% } catch(Exception e) { out.println("Exception----->" +e); }

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

</form>
