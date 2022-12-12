<%@ include file="Connections/conn.jsp" %>

<html>
<head>
<title>Receipt </title>

<link href="css/css.css" rel="StyleSheet" type="text/css">
<script src="elabel.js" type="text/javascript"></script>


<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
</head>
<%!
Connection con1, con2;
%>

<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con1.createStatement(), stmt2 = con2.createStatement();
ResultSet rs1=null, rs2=null, rs3=null;
String sql1="", sql2="", sql3="";

String unitid="", ordrqty="", ordrdte="", dispdte="", dispadd="", mode="", modename="", chalanno="", getdispid="", ordby="", dispby="", cust="", ordrno="";
int dispqty=0, dispid=0;
String matreq="";
getdispid=request.getParameter("dispid");
String status=request.getParameter("status");
//out.print(status);

/* ************Getting details from DB by Disp Id which has been clicked on**************** */
sql3="select * from t_unitmasterhistory where DispId='"+getdispid+"' ";
rs3=stmt1.executeQuery(sql3);
while(rs3.next())
{ 
 ordrno=rs3.getString("OrderNo");
  
   dispqty++;
   
   unitid=unitid+rs3.getString("UnitId")+",";
   dispdte=rs3.getString("DispDate");  
   dispadd=rs3.getString("DisAdd"); 
   mode=rs3.getString("ModeofDispatch");  
   modename=rs3.getString("DisName");  
   chalanno=rs3.getString("ChalanNo");  
   dispid=rs3.getInt("DispId");  
   dispby=rs3.getString("User");  
} 

  
sql2="select * from t_unitorder where Reqno='"+ordrno+"' ";
//out.print(sql2);
rs2=stmt2.executeQuery(sql2);
while(rs2.next())
{
   ordrqty=rs2.getString("NoofUnits");
   ordrdte=rs2.getString("Reqdate");
   ordby=rs2.getString("Reqby");
   cust=rs2.getString("Cust");
}

if(cust==null || cust.equals("null"))
{
	cust="-";
}

if(ordby==null || ordby.equals("null"))
{
	ordby="-";
}
  
%>
 <center>
  <table border="1" width="50%">
      <tr> <td> <B> Order No.</B> </td>
           <td> <%=ordrno %> </td>
      </tr>
      <tr> <td> <B> Order Qty.</B> </td>
           <td> <%=ordrqty %> </td>
      </tr>
      <tr> <td> <B> Order Date</B> </td>

<%
	if(ordrdte==null || ordrdte.equals("null"))	
	{ %>
		<td> - </td>
<%	}	
	else
	{
                   java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(ordrdte);
 		   Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
		   String nwfrmtdte=formatter.format(datefrmdb);
 %>
	           <td> <%=nwfrmtdte %> </td>
<%	} %>
      </tr>
      <tr> <td> <B> Dispatched Qty.</B> </td>
           <td> <%=dispqty %> </td>
      </tr>
      <tr> <td> <B> Dispatched Date</B> </td>

<% 
	if(dispdte==null || dispdte.equals("null"))
	{ %>
		<td> - </td>
<%	} 	
	else
	{ 
                   java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(dispdte);
		   Format formatter1=new SimpleDateFormat("dd-MMM-yyyy");
		   String nwfrmtdte1=formatter1.format(datefrmdb1); 
%>
	           <td> <%=nwfrmtdte1 %> </td>
<%      } %>
      </tr>
      <tr> <td> <B> Units Dispatched</B> </td>
           <td> <%=unitid %> </td>
      </tr>
      <tr> <td> <B> Dispatch Add.</B> </td>
           <td> <%=dispadd %> </td>
      </tr>
       <tr> <td> <B> Cust.</B> </td>
            <td> <%=cust %> </td>
      </tr>
      
       <tr> <td> <B> Mode of Dispatch</B> </td>
           <td> <%=mode %> </td>
      </tr>
       <tr> <td> <B> Dispatch Name</B> </td>
           <td> <%=modename %> </td>
      </tr>
       <tr> <td> <B> Chalan No.</B> </td>
           <td> <%=chalanno %> </td>
      </tr>
      <tr> <td> <B> Dispatch Id</B> </td>
           <td> <%=dispid %> </td>
      </tr>
      <tr> <td> <B> Ordered by</B> </td>
           <td> <%=ordby %> </td>
      </tr>
       <tr> <td> <B> Dispatched by</B> </td>
           <td> <%=dispby %> </td>
      </tr>
      <tr>
            <td> <B> Signature </B> </td>
            <td> </td>
      </tr>
       <% if(status.equals("Sent "))
    	  {
    	   sql3="select * from t_unitmasterhistory where DispId='"+getdispid+"' ";
    	  ResultSet rs5=stmt1.executeQuery(sql3);
    	  
    	  while(rs5.next())
    	  {
    		String unid=rs5.getString("UnitId");
    	    String sql4="select * from hwunittest where UnitID='"+unid+"' order by TheDate desc limit 1";
    	    ResultSet rs6=stmt2.executeQuery(sql4);
    	  }
    	  }
    	  %>
    	<!--   <table>
    	  
    	  <tr>
          <th ><b>Materials Required </b> </th>
          <th>Unit id </th>
          </tr>
          <tr>
          <td><%=unitid %> </td>
          <td>  <%=matreq %> </td>
          </tr>
          </table> -->
          <%
      
    	%>
      
  </table>
   
   <table border=0 width="30%">
      <tr>
           <td>  <a href="#" onclick="javascript:window.print();"> Print</a> </td> 
           <td> <div align="center"> <a href="" onclick="self.close()"> Close </a> </div> </td> 
      </tr>
   </table>
        
 </centre>
<%

} catch(Exception e) { out.println("Exception----->"+e); }

finally
{
con1.close();
con2.close();

}
%>
