<script language="javascript">

function validate()
{
  var v1=document.mainpageform.manufac.value;
  if(v1=="Select")
  {
     alert("Please select the Manufacturer");
     return false;
  }
  return true;
}
</script>

<html>
<head>

<%@ include file="menuheader.jsp" %>

<form name="mainpageform" action="" onsubmit="return validate();">


<%!
Connection con1, con2;
String frmdte1="", todte1="", manufacturer="", manufac="";
%>

<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con1.createStatement(), stmt2 = con2.createStatement();
ResultSet rs1=null, rs4=null, rs5=null;
String sql1="", sql4="", sql5="";
String cnt="";
int newmanunits=0, repmanunits=0, dispnewunits=0, disprepunits=0;

String user=session.getValue("user").toString();
String ustyp=session.getValue("urole").toString();
//out.println(ustyp);

%>

<table border="0" width="100%">
  <tr>
      
      <td align="center"> <font color="maroon"> Select Manufacturer name and Dates to check the count </font> </td> 
   </tr>
</table>

<%     

         java.util.Date d = new java.util.Date();
	Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	String frmdte=formatter1.format(d);
       
        String todte=frmdte;
 
        frmdte1=request.getParameter("calender");
        todte1=request.getParameter("calender1");
	 
               
       sql5="select * from t_admin where URole='manufacturer' order by Uname asc";
       rs5=stmt1.executeQuery(sql5);
         
%>


   <table border="0" width="100%">
      <tr>  
            <td> <div align="right">
                 <select name="manufac" class="formElement"> 
                    <option value="Select"> Select</option>
           <%
                 while(rs5.next())
                 { %>
                      <option value="<%=rs5.getString("UName") %>"><%=rs5.getString("UName") %> </option>
           <%    }
       
           %>
                 </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <input type="text" id="calender" name="calender" size="13" class="formElement" value="<%=frmdte %>" readonly/>
  
<!--<input type="image" src="images/FromDate.bmp" id="trigger"> --> 
                 <input type="button" name="trigger" id="trigger" value="From Date" class="formElement">
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger"       // ID of the button
             }
                           );
             </script> &nbsp;&nbsp;&nbsp;&nbsp;
                 <input type="text" id="calender1" name="calender1" size="13" class="formElement" value="<%=todte %>" readonly/>
  
<!--<input type="image" src="images/FromDate.bmp" id="trigger1"> --> 
             <input type="button" name="trigger1" id="trigger1" value="To Date" class="formElement">
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender1",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger1"       // ID of the button
             }
                           );
             </script> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" name="submit" value="Submit" class="formElement" />
        </div> </td>
      </tr>
    </table>
<br>

<%
     
      if(request.getQueryString()==null)
      {
      }
      else
      {
                 
      manufacturer=request.getParameter("manufac"); 

/* ********Calculating the count of newly manufactured units by specific Manufacturer ******** */ 

     sql1="select count(*) as cntr from t_unitmasterhistory where EntDate between '"+frmdte1+"' and '"+todte1+"' and InstType='New' and User='"+manufacturer+"' ";
     rs1=stmt2.executeQuery(sql1);
     while(rs1.next())
     {
        newmanunits=rs1.getInt("cntr");
     }
/* ********************************************************************************* */

/* ********Calculating the count of Repaired units by specific Manufacturer ******** */ 

     sql1="select count(*) as cntr from t_unitmasterhistory where EntDate between '"+frmdte1+"' and '"+todte1+"' and InstType='Repaired' and User='"+manufacturer+"' ";
    //out.print(sql1);
     rs1=stmt2.executeQuery(sql1);
     while(rs1.next())
     {
        repmanunits=rs1.getInt("cntr");
     }  
/* ********************************************************************************* */

/* ********Calculating the count of Dispatched units (new) by specific Manufacturer ******** */ 

     sql1="select count(*)  as cntr from t_unitmasterhistory where DispDate between '"+frmdte1+"' and '"+todte1+"' and InstType='New' and User='"+manufacturer+"' ";
     rs1=stmt2.executeQuery(sql1);
     while(rs1.next())
     {
        dispnewunits=rs1.getInt("cntr");
     } 
/* ********************************************************************************* */

/* ********Calculating the count of Dispatched units (repaired) by specific Manufacturer****** */ 

     sql1="select count(*)  as cntr from t_unitmasterhistory where DispDate between '"+frmdte1+"' and '"+todte1+"' and InstType='Repaired' and User='"+manufacturer+"' ";
     rs1=stmt2.executeQuery(sql1);
     while(rs1.next())
     {
        disprepunits=rs1.getInt("cntr");
     } 

/* ********************************************************************************* */   
%>
    <table border="0" width="100%">
      <tr>
           <td> <div align="center"> <font color="maroon" size="2"> <B> Status of Manufactured / Dispatched Unit/s by <%=manufacturer %> (From <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(frmdte1)) %> To <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(todte1)) %>) </B> </font> </div> </td>
      </tr>
      
   </table>

  <table border="1" width="100%">
     <tr>
         <th colspan="2"> Manufactured</th> <th colspan="2"> Dispatched </th>
     </tr>
     <tr>
           <td width="25%"> <div align="center"> <font color="maroon"> <B> New </B> </font> </div></td> <td> <div align="center"><font color="maroon"> <B>Repaired </B> </font> </div> </td>
           <td width="25%"><div align="center"> <font color="maroon"> <B>New </B> </font> </div></td> <td><div align="center"><font color="maroon"> <B>Repaired </B> </font> </div></td>
     </tr>

     <tr>
          <td width="25%"> <div align="center"> <a href="manufdispdets.jsp?frmdte=<%=frmdte1 %>&todte=<%=todte1 %>&dets=newman&manuf=<%=manufacturer %>">  <%=newmanunits %>  </a> </div> </td>
          <td> <div align="center">  <a href="manufdispdets.jsp?frmdte=<%=frmdte1 %>&todte=<%=todte1 %>&dets=repman&manuf=<%=manufacturer %>"> <%=repmanunits %> </a> </div> </td>
          <td width="25%"> <div align="center"> <a href="manufdispdets.jsp?frmdte=<%=frmdte1 %>&todte=<%=todte1 %>&dets=newdisp&manuf=<%=manufacturer %>"> <%=dispnewunits %> </a> </div> </td>
          <td> <div align="center"> <a href="manufdispdets.jsp?frmdte=<%=frmdte1 %>&todte=<%=todte1 %>&dets=repdisp&manuf=<%=manufacturer %>"> <%=disprepunits %> </a> </div> </td>
     </tr>
  </table>



<% 
 con1.close();
 con2.close();
  } //close of else
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

</form>


   
