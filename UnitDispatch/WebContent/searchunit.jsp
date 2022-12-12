<script src="sorttable.js"></script>

<%@ include file="headeradmin.jsp" %>

<%!
Connection con1;
Connection con2;
%>
<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con1.createStatement();
Statement stmt2 = con2.createStatement();
ResultSet rs1=null,rs2=null,rs4=null;
String sql1="";
String sql2="",sql4="";
String cnt="";
String user=session.getValue("user").toString();
String ustyp=session.getValue("urole").toString();

String searchval=request.getParameter("s1");
sql4="select count(*) from t_unitorder where Reqto='"+user+"' and Status in('Open', 'Partially Dispatched') ";
rs4=stmt2.executeQuery(sql4);
if(rs4.next())
{
  cnt=rs4.getString(1);
}
//out.println(user);
%>
<p>
<td> <div align="left"> <a href="javascript:history.go(-1)"> <img src="images/arrow.bmp" width="20px" height="20px" border="0" > <a> </div> </td>
<table border="0" width="100%">
  <tr>

<td> <div align="center"> <font color="maroon" size="3"> <B> Search Result </B></font>  </div></td>
</tr>  </table>
<table class="sortable">
  <tr>
      <th> Sr No. </th>
      <th> Entered On </th>
      <th> Unit ID </th>
      <th> SIM No </th>
      <th> Mobile No </th>
      <th> WMSN No </th>
      <th> Module Type </th>
      <th> Software Version </th>
      <th> GPS No </th>
      <th> Unit Type </th>
      <th> Inst. Type </th>
      <th> Peripherals </th>
      
  </tr>
<%
  int c1=1, i=1;
  
  if(ustyp.equals("administrator"))
  {
	sql2="select * from t_unitmaster where (UnitID like '"+searchval+"' or MobNo like '"+searchval+"' or EntDate like '"+searchval+"' or WMSN like '"+searchval+"' or SimNo like '"+searchval+"' or Module like '"+searchval+"' or SwVer like '"+searchval+"' or GPS like '"+searchval+"' or typeunit like '"+searchval+"' or Peripherals like '"+searchval+"' or User like '"+searchval+"') ";	 	
  }
  else
  {
	sql2="select * from t_unitmaster where User='"+user+"' and (UnitID like '"+searchval+"' or MobNo like '"+searchval+"' or EntDate like '"+searchval+"' or WMSN like '"+searchval+"' or SimNo like '"+searchval+"' or Module like '"+searchval+"' or SwVer like '"+searchval+"' or GPS like '"+searchval+"' or typeunit like '"+searchval+"' or Peripherals like '"+searchval+"' or User like '"+searchval+"') ";	 	
  }  
  
//   out.print(sql2);  
   
  
    rs1=stmt1.executeQuery(sql2);
   
 while(rs1.next())
  {  
     String unid=rs1.getString("UnitID");
     String pvoice=rs1.getString("PVoice");
     String pjrmbuzz=rs1.getString("PJrmBuzz");
     String pbuzz=rs1.getString("PBuzzer");
     String ptemp1=rs1.getString("PTemp1");
     String ptemp2=rs1.getString("PTemp2");
     String pdoor1=rs1.getString("PDoor1");
     String pdoor2=rs1.getString("PDoor2");
     String phorn=rs1.getString("PHorn");
     String pscard=rs1.getString("PScard");
     String pflowsen1=rs1.getString("PFlowSen1");
     String pflowsen2=rs1.getString("PFlowSen2");
     String pplain=rs1.getString("Plain");
     String entdte=rs1.getString("EntDate");

     String utype=rs1.getString("typeunit");
      
     String peripheral="";
     if(null==pvoice || pvoice.equals("null"))
     {
        peripheral="";
     }
     else
     {
        peripheral="Voice";
     }
  
     if(null==pjrmbuzz || pjrmbuzz.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+JRM+Buzzer";
       }
       else
       {
          peripheral=peripheral+"JRM+Buzzer";
       }
        
     }

     if(null==pbuzz || pbuzz.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+Buzzer Only";
       }
       else
       {
          peripheral=peripheral+"Buzzer Only";
       }
       
     } 

     if(null==ptemp1 || ptemp1.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+1 Temp";
       }
       else
       {
          peripheral=peripheral+"1 Temp";
       }
     } 

     if(null==ptemp2 || ptemp2.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+2 Temp";
       }
       else
       {
          peripheral=peripheral+"2 Temp";
       }
      
     } 

     if(null==pdoor1 || pdoor1.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+1 Door";
       }
       else
       {
          peripheral=peripheral+"1 Door";
       }
       
     } 

     if(null==pdoor2 || pdoor2.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+2 Door";
       }
       else
       {
          peripheral=peripheral+"2 Door";
       }
       
     }

     if(null==phorn || phorn.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+Horn";
       }
       else
       {
          peripheral=peripheral+"Horn";
       }
       
     }

     if(null==pscard || pscard.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+Smart Card";
       }
       else
       {
          peripheral=peripheral+"Smart Card";
       }
       
     }

     

     if(null==pflowsen1 || pflowsen1.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+1 Flow Sensor";
       }
       else
       {
          peripheral=peripheral+"1 Flow Sensor";
       }
      
     }

     if(null==pflowsen2 || pflowsen2.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+2 Flow Sensor";
       }
       else
       {
          peripheral=peripheral+"2 Flow Sensor";
       }
       
     }

     if(null==pplain || pplain.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+Plain";
       }
       else
       {
          peripheral=peripheral+"Plain";
       }
       
     }

          
  %> 
     <td> <%=i %> </td>
<% if(entdte==null || entdte.equals("-"))
   { %>
     <td sorttable_customkey="dd-MMM-yyyy"> - </td>
<% } 
   else
   { 
     java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(entdte);
     Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
     String nwfrmtdte=formatter.format(datefrmdb);
%>
     <td sorttable_customkey="dd-MMM-yyyy"> <%=nwfrmtdte %></td>
<% } %>

     <td> <%=rs1.getString("UnitID") %> </td>
     <td> <%=rs1.getString("SIMNo") %> </td>
     <td> <%=rs1.getString("MobNo") %> </td>
     <td> <%=rs1.getString("WMSN") %> </td>
     <td> <%=rs1.getString("Module") %> </td>
     <td> <%=rs1.getString("SwVer") %> </td>
     <td> <%=rs1.getString("GPS") %> </td>

<% if(null==utype || utype.equals("null"))
   { %>
      <td> - </td>
<% }
   else
   { %>  
     <td> <%=utype %> </td>
<% } 
    %> 
      <td> <%=rs1.getString("InstType") %> </td>
 
</td>
 
  <td> <%=peripheral %> </td> 
     
</tr>
<% 
  i++;
}   
%>

</table>
<%
}
catch(Exception e) { 
out.println("Exception----->"+e);
 }

finally
{
con1.close();
}
%>

<table border="1" width="100%" >
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>



