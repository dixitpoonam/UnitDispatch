<script src="sorttable.js"></script>
			<script language="javascript">
 			function validate()
  			{
  				if(document.getElementById("data").value=="")
  				{
  			  		alert("Please select the from date");
  					return false;
  				}
  				if(document.getElementById("data1").value=="")
  				{
			  		alert("Please select the to date");
  					return false;
  				}
  				
  				
  				return datevalidate();
  		  }
 			function datevalidate()
 			{
 				var date1=document.getElementById("data").value;
 				var date2=document.getElementById("data1").value;
 				var dm1,dd1,dy1,dm2,dd2,dy2;
 				dy1=date1.substring(0,4);
 				dy2=date2.substring(0,4);
 				dm1=date1.substring(5,7);
 				dm2=date2.substring(5,7);
 				dd1=date1.substring(8,10);
 				dd2=date2.substring(8,10);
 				var date=new Date();
 				var month=date.getMonth()+1;
 				var day=date.getDate();
 				var year=date.getFullYear();
 				if(dy1>year || dy2>year)
 				{
 					alert("selected date should not be greater than todays date");
 					
 					return false;
 				}
 				else if(year==dy1 && year==dy2)
 				{
 						if(dm1>month || dm2>month)
 					{
 						alert("selected date should not be greater than todays date");
 								
 						return false;
 					}
 				}
 				if(dm1==month)
 				{
 					if(dd1>day || dd2>day)
 					{
 						alert("selected date should not be greater than todays date");
 								
 						return false;
 					}
 				}
 				if(dy1>dy2)
 				{
 					alert("From date year  should not be greater than to date year");
 					
 					return false;
 				}
 				else if(year==dy1 && year==dy2) if(dm1>dm2)
 				{
 					alert("From date month  should not be greater than to date month 5");
 					
 					return false;
 				}
 				if(dm1==dm2) 
 				{
 					if(dd1 > dd2)
 					{
 						alert("From date should not be greater than to date");
 								
 						return false;
 					}
 				}
 				return true;
 			}


  	</script>
  	
<%@ include file="menuheader.jsp" %>

<%!
Connection con1, con2;
%>


<%
String admin=session.getValue("user").toString();
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement();
ResultSet rs1=null, rs4=null;
String sql1="", sql4="",data="",data1="";






String cnt="";
String user=session.getValue("user").toString();
String ustyp=session.getValue("urole").toString();



java.util.Date d = new java.util.Date();


int lastmon=d.getMonth();
int lastyear=d.getYear();

System.out.println("lastmonth--->>"+lastmon);
System.out.println("lastyear--->>"+lastyear);



Format formater = new SimpleDateFormat("yyyy-MM-dd");
String tdydte=formater.format(d);
//out.print(tdydte);

java.util.Date tdydte1 = new java.util.Date();

if(lastmon==0)
{
	tdydte1.setMonth(11);
	tdydte1.setYear(lastyear-1);
}
else
tdydte1.setMonth(lastmon-1);

/*long ms=d.getTime();
ms=ms-1000 * 60 * 60 * 24* 7;
tdydte1.setTime(ms);*/

String onemonbfre = formater.format(tdydte1);

data=request.getParameter("data");
data1=request.getParameter("data1");

if(data!=null)
{
onemonbfre=data;
tdydte=data1;
}


%>
     
<% String cancelled=request.getParameter("cancelled");
   if(cancelled==null)
   {
   }
   else
   {
 %>
      <table border="0" width="100%">
         <tr>
              <td> <div align="center"> <font color="maroon" size="1"> Successfuly Cancelled</font>
              </td>
         </tr>
      </table>  
<% } %>

<% String updated=request.getParameter("updated");
   if(updated==null)
   {
   }
   else
   {
 %>
      <table border="0" width="100%">
         <tr>
              <td> <div align="center"> <font color="maroon" size="1"> Successfuly Updated</font>
              </td>
         </tr>
      </table>  
<% } %>
  	<form action="" method="get" onsubmit="return validate();">
  		
			<table border="0"  width="50%" align="center">
			
			<tr>
			<td>
			  <table align="right"><tr>
			  <td ><b>Select Date:</b>&nbsp; &nbsp;
			  <input type="text" id="data" name="data" class="formElement" value="<%=onemonbfre %>" size="10" readonly/>
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
			<td>
			<table><tr><td>
			<input type="text" id="data1" name="data1" class="formElement"  value="<%=tdydte %>" size="10" readonly />
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
			</td>
			<td>
				<input type="submit" name="submit" id="submit" value="submit" class="formElement">
			</td>
		</tr>
		
		</table>
		</form>
      <table border="0" width="100%">
         <tr>
              <td> <div align="center"> <font color="maroon" size="3"> <B> Order/s made </B> </font> </div> </td>
         </tr>
      </table>  
<%
    sql1="select * from t_unitorder where ReqDate Between '"+onemonbfre+"' and '"+tdydte+"' order by Reqno desc ";
    rs1=stmt1.executeQuery(sql1);
%> 
      <table class="sortable" border="1" width="100%">
        <tr>
            <th> Request Id</th>
            <th> Request made to</th>
            <th> Requested Date</th>
            <th> No. of Units</th>
             <th> Units Pending </th>
            <th> Type of Unit</th>
            <th> Peripherals</th>
               
            <th>Sim Co</th>
             <th>Box Type</th>
            <th>Order Type</th>
       
            <th> Dispatch Address</th>
            <th> Dispatch to (Cust))</th>
	    <th> Technician</th>
            <th> Dispatch Date</th>
            <th> Status</th>
            <th class="sorttable_nosort"> Edit </th>
        </tr> 

<%      while(rs1.next())
        { 
              String reqdte=rs1.getString("ReqDate");
              String dispdte=rs1.getString("DispDate");
              String reqno=rs1.getString("Reqno");
              String status=rs1.getString("Status"); 
	      String cust=rs1.getString("Cust");
	      String typeunit=rs1.getString("TypofUnit");
	      String periph=rs1.getString("Peripherals");  		
              

              java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(reqdte);
              Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
              String nwfrmtdte=formatter.format(datefrmdb); 

		String nwfrmtdte1="";
		if(dispdte==null || dispdte.equals(""))
		{
			nwfrmtdte1="-";
		}
		else
		{
			
	              java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(dispdte);
        	      Format formatter1=new SimpleDateFormat("dd-MMM-yyyy");
        	      nwfrmtdte1=formatter1.format(datefrmdb1);
		}
		
	String remqty="";
		  if(status.equals("Dispatched") || status.equals("Received"))
          {
             remqty="0";
          } 
          else
          {
             remqty=rs1.getString("RemUnits");
          } 
%>
             <tr>
                  <td> <%=rs1.getString("Reqno") %> </td>
                  <td> <%=rs1.getString("Reqto") %> </td>
                  <td sorttable_customkey="dd-MMM-yyyy"> <%=nwfrmtdte %> </td>
                  <td> <%=rs1.getString("NoofUnits") %> </td>
                  <td><%=remqty %></td>
<%
		if(typeunit==null || typeunit.equals("null"))
		{
			typeunit="-";
		}
%>
                  <td> <%=typeunit %> </td>
<%
		if(periph==null || periph.equals("null"))
		{
			periph="NA";
		}
%>
                  <td> <%=periph %> </td>
                    
                       <td> <%=rs1.getString("Sim_Co") %> </td>
                         <td> <%=rs1.getString("Box_type") %> </td>
                       <td> <%=rs1.getString("Ordertype") %> </td>
                    
           
                  <td> <%=rs1.getString("DispatchAdd") %> </td>
<%
		if(cust==null || cust.equals("null"))	
		{
			cust="NA";
		}
%>
                  <td> <%=cust %> </td>
		  <td> <%=rs1.getString("Tech") %> </td>
                  <td sorttable_customkey="dd-MMM-yyyy"> <%=nwfrmtdte1 %> </td>
                  <td> <%=rs1.getString("Status") %> </td>
                  <td> <a href="editrequest.jsp?reqno=<%=reqno %>&stat=<%=status %>"> Edit </a> </td>
             </tr>
<%      } %>        

      </table>
 
<%
 } catch(Exception e) { out.println("Exception----->" +e); }

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

