<html>
<head>
<script src="sorttable.js"></script>
</head>

<%@ include file="headeradmin.jsp"%>

<%!
Connection con1;
%>

<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con1.createStatement();
ResultSet rs1=null;
String sql1="";
String frmdte="", todte="", dets="", manuf="";
int i=0;

frmdte=request.getParameter("frmdte");
todte=request.getParameter("todte");
dets=request.getParameter("dets");
manuf=request.getParameter("manuf");

%>
<body>
<table border="0" width="30%">
	<tr>
		<td>
		<div align="left"><a href="javascript:history.go(-1)"> <img
			src="images/arrow.bmp" width="20px" height="20px" border="0">
		</img> </a></div>
		</td>
	</tr>
</table>

<%
if(dets.equals("newman"))
{ %>
<table border="0"width="100%">
       <tr>
           <td> 
           <div align="center"> 
           <font color="maroon" size="2">
            <B>
            Status of Manufactured Units (New) by <%=manuf %> between <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(frmdte)) %> and <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todte)) %>
            </B>
            </font>
            </div>
            </td>
       </tr>
     </table>
     <table class="sortable">
        <tr>
            <th>Sr. No.</th>
            <th>Unit No.</th>
            <th>Manuf. Date</th>
            <th>Sim No.</th>
            <th>Mob. No.</th>
            <th>Status</th>
            
        </tr>
     
<% 
       sql1="select * from t_unitmasterhistory where EntDate between '"+frmdte+"' and '"+todte+"' and InstType='New' and User='"+manuf+"' ";

       rs1=stmt1.executeQuery(sql1);
       while(rs1.next())
       { 
           i++;  
           String stat=rs1.getString("Status"); 

           String entdte=rs1.getString("EntDate");

             java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(entdte);
             Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
             String nwfrmtdte=formatter.format(datefrmdb);
%>
            <tr>
                  <td> <%=i %> </td>
                  <td> <%=rs1.getString("UnitID") %> </td>
                  <td> <%=nwfrmtdte %> </td>
                  <td> <%=rs1.getString("SimNo") %> </td>
                  <td> <%=rs1.getString("MobNo") %> </td>
            <%
                  if(stat.equals("Dispatched"))
                  { %>
                    <td> <%=rs1.getString("Status") %> </td>
            <%    } 
                  else
                  { %>
                     <td> <B> Available </B> </td>
            <%    }  
            %>
                     
                  
            </tr>         
   <%  }  %>
     </table>
<% } 
  
else if(dets.equals("repman"))
{ 
%>
     <table border="0" width="100%">
       <tr>
           <td> 
           <div align="center"> 
           <font color="maroon" size="2">
            <B> Status of Manufactured Units (Repaired) by <%=manuf %> between <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(frmdte)) %> and <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todte)) %> </B>
            </font>
            </div>
            </td>
       </tr>
     </table>
     <table class="sortable">
        <tr>
            <th>Sr. No.</th>
            <th>Unit No.</th>
            <th>Manuf. Date</th>
            <th>Sim No.</th>
            <th>Mob. No.</th>
            <th>Status</th>
            
        </tr>
     
<% 
       sql1="select * from t_unitmasterhistory where EntDate between '"+frmdte+"' and '"+todte+"' and InstType='Repaired' and User='"+manuf+"' ";
       rs1=stmt1.executeQuery(sql1);
       while(rs1.next())
       { 
           i++;  
           String stat=rs1.getString("Status"); 
            String entdte=rs1.getString("EntDate");

             java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(entdte);
             Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
             String nwfrmtdte=formatter.format(datefrmdb);
%>
            <tr>
                  <td> <%=i %> </td>
                  <td> <%=rs1.getString("UnitID") %> </td>
                  <td> <%=nwfrmtdte %> </td>
                  <td> <%=rs1.getString("SimNo") %> </td>
                  <td> <%=rs1.getString("MobNo") %> </td>
            <%
                  if(stat.equals("Dispatched"))
                  { %>
                    <td> <%=rs1.getString("Status") %> </td>
            <%    } 
                  else
                  { %>
                     <td> <B> Available </B> </td>
            <%    }  
            %>
                     
                  
            </tr>         
   <%  } %>
     </table>
<%
}
else if(dets.equals("newdisp"))
{
   %>
     <table border="0" width="100%">
       <tr>
           <td>
            <div align="center"> 
            <font color="maroon" size="2"> 
            <B> Status of Dispatched Units (New) by <%=manuf %> between <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(frmdte)) %> and <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todte)) %> </B>
            </font>
            </div>
            </td>
       </tr>
     </table>
     <table class="sortable">
        <tr>
            <th>Sr. No.</th>
            <th>Unit No.</th>
            <th>Manuf. Date</th>
            <th>Sim No.</th>
            <th>Mob. No.</th>
            <th>Disp.Date</th>
            <th>Disp. Add</th>
            <th>Mode of Disp</th>            
        </tr>

<%
    sql1="select * from t_unitmasterhistory where DispDate between '"+frmdte+"' and '"+todte+"' and InstType='New' and User='"+manuf+"' order by DispDate desc";

    rs1=stmt1.executeQuery(sql1);
    while(rs1.next())
    { 
       i++;
       String entdte=rs1.getString("EntDate");
       String disdte=rs1.getString("DispDate");

             java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(entdte);
             Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
             String nwfrmtdte=formatter.format(datefrmdb);

             java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(disdte);
             Format formatter1=new SimpleDateFormat("dd-MMM-yyyy");
             String nwfrmtdte1=formatter1.format(datefrmdb1);
%>
          <td> <%=i %> </td>
          <td> <%=rs1.getString("UnitID") %> </td>
          <td> <%=nwfrmtdte %> </td>
          <td> <%=rs1.getString("SimNo") %> </td>
          <td> <%=rs1.getString("MobNo") %> </td>
          <td> <%=nwfrmtdte1 %> </td>
          <td> <%=rs1.getString("DisAdd") %> </td>
          <td> <%=rs1.getString("ModeofDispatch") %> </td>
    </tr>
<%  } %>
   </table>
<%
}
else
{
%>
     <table border="0" width="100%">
       <tr>
           <td> <div align="center"> <font color="maroon" size="2"> <B> Status of Dispatched Units (Repaired) by <%=manuf %> between <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(frmdte)) %> and <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todte)) %> </B></font></div></td>
       </tr>
     </table>
     <table class="sortable">
        <tr>
            <th>Sr. No.</th>
            <th>Unit No.</th>
            <th>Manuf. Date</th>
            <th>Sim No.</th>
            <th>Mob. No.</th>
            <th>Disp.Date</th>
            <th>Disp. Add</th>
            <th>Mode of Disp</th>            
        </tr>

<%
    sql1="select * from t_unitmasterhistory where DispDate between '"+frmdte+"' and '"+todte+"' and InstType='Repaired' and User='"+manuf+"' order by DispDate desc";
    rs1=stmt1.executeQuery(sql1);
    while(rs1.next())
    { 
       i++;
		String entdte=rs1.getString("EntDate");	
	       String disdte=rs1.getString("DispDate");	

	     java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(entdte);
             Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
             String nwfrmtdte=formatter.format(datefrmdb);

             java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(disdte);
             Format formatter1=new SimpleDateFormat("dd-MMM-yyyy");
             String nwfrmtdte1=formatter1.format(datefrmdb1);	
%>
	<tr>
          <td> <%=i %> </td>
          <td> <%=rs1.getString("UnitID") %> </td>
          <td> <%=nwfrmtdte %> </td>
          <td> <%=rs1.getString("SimNo") %> </td>
          <td> <%=rs1.getString("MobNo") %> </td>
          <td> <%=nwfrmtdte1 %> </td>
          <td> <%=rs1.getString("DisAdd") %> </td>
          <td> <%=rs1.getString("ModeofDispatch") %> </td>
    </tr>
<%  } %>
   </table>
   
<%
}
 
 con1.close();
} catch(Exception e) { out.println("Exception----->"+e); }

finally
{

}
%>
     
<br>
<br>
<table border="0" width="100%" >
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>
</body>
</html>

   
