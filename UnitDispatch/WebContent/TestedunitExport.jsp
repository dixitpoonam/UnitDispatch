<%@ page contentType="application/vnd.ms-excel;charset=gb2312" %>
<% response.setContentType("application/vnd.ms-excel");
	response.addHeader("Content-Disposition","attachment;filename=\"TestedunitExport.xls\"");%>

<%@ include file="Connections/conn.jsp" %>


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
Statement stmt3 = con1.createStatement();
Statement stmt4 = con1.createStatement(), stmt5 = con1.createStatement(), stmt6 = con2.createStatement();
ResultSet rs1=null,rs2=null, rs3=null, rs4=null, rs5=null, rs6=null;
String sql1="",sql2="", sql3="", sql4="", sql5="", sql6="";
String cnt="", instdate="";
String user=session.getValue("user").toString();
//out.println(user);

String ustyp=session.getValue("urole").toString();

%>


</center>

<table border="1" width="100%">
<tr> <td>
<table border="0" width="100%">
  <tr>
      
   <td> <div align="center"> <font color="maroon" size="3"> <B> Manufactured Units</B></font> </div> </td>
      
  </tr>
</table>


<table border="1" class="sortable" >
  
  <tr>
	<th> </th>
      <th> Sr. No. </th>
      <th> Entered On </th>
      <th> Unit ID </th>
      <th> Unit in Warranty </th>
      <th> SIM No </th>
      <th> Mobile No </th>
      <th> WMSN No </th>
      <th> Module Type </th>
      <th> Software Version </th>
      <th> GPS No </th>
      <th> Unit Type </th>
      <th> Inst. Type </th>
      <th> Peripherals </th>
      <th> Tested/Untested </th>
      <th> Status </th>	
<!-- There are some extra features for admin. And extra viewable columns -->
<%
    if(ustyp.equals("administrator"))
    { %>
        <th> Manuf. By </th>
<%  }    
%>
      
  </tr>
<%
  int c1=1, i=1;

                        java.util.Date d = new java.util.Date();
			Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
			String tdydte=formatter1.format(d);
			//out.print(tdydte);

if(ustyp.equals("administrator"))
   {
       sql1="select * from t_unitmaster where User <> 'null' order by EntDate desc ";
	
   }
   else
   { 
     sql1="select * from t_unitmaster where User='"+user+"' order by EntDate desc ";
	
   }
    
    rs1=stmt1.executeQuery(sql1);
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
     String swver=rs1.getString("SwVer");
     String manufby=rs1.getString("User");
     String insttyp=rs1.getString("InstType");

     String utype=rs1.getString("typeunit");
      
     String peripheral="";

/* ************Checking of what peripherals this Unit is made and dispalying the same********* */
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
/* *************************************************************************************** */
          
  %> 
      <input type="hidden" name="unid<%=i %>" value="<%=unid %>" > </input>
  <tr>
     <td> <input type="checkbox" name="dis<%=i %>" value="dis<%=i %>"> </input> </td>
     <td> <%=i %> </td>
<% if(entdte==null || entdte.equals("-"))
   { %>
     <td> - </td>
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
<%
		String flag="true", unitwarranty="";
		sql3="select InstDate from t_unitreplacement where NewUnitID = '"+unid+"' order by InstDate asc limit 1";
		//out.print(sql3);
		rs3=stmt3.executeQuery(sql3);
		if(rs3.next())
		{
			flag="true";
			instdate=rs3.getString("InstDate");
		}	
		else
		{
			flag="false";
			instdate="NA";
		}
		//out.print("inst dte="+instdate);

		if(flag.equals("true"))
		{
			sql4="select (TO_DAYS('"+tdydte+"')-TO_DAYS('"+instdate+"'))";
                	//out.print(sql4);
			rs4=stmt4.executeQuery(sql4);
			if(rs4.next())
			{
				int ww=rs4.getInt(1);
                                int dysrem=365-ww;
				if(ww <365)
				{ 
					unitwarranty="Yes";
%>
					<td>Yes (<%=dysrem %> days rem)</td>
			   <%   }
				else
				{
					unitwarranty="No";
 %>
					<td><font color="red" size="2">No</font> </td>
			  <%	}
			}
			//else
			//{ %>
			  <!--  <td> NA </td> -->
		<%	//}
		}
		else
		{ 
			unitwarranty="NA";
%>
			<td> NA </td>
	<%	}
			
	%>	
     
     <td> <%=rs1.getString("SIMNo") %> </td>
     <td> <%=rs1.getString("MobNo") %> </td>
     <td> <%=rs1.getString("WMSN") %> </td>
     <td> <%=rs1.getString("Module") %> </td>
     <td> <%=swver %> </td>
     <td> <%=rs1.getString("GPS") %> </td>

<% if(null==utype || utype.equals("null"))
   { %>
      <td> - </td>
<% }
   else
   { %>  
     <td> <%=utype %> </td>
<% } %>
       <td> <%=rs1.getString("InstType") %> </td>
<%     
     int len1=peripheral.length();
        //out.println(len1);
   
   if(len1==0)
   { %>
       <td> - </td>
  <% } 
   else if(len1<=5)
   { %>
      <td> <%=peripheral %> </td>
<% } 

   else
   { 
     
    %>
     
    <td> <%=len1 %> </td>
  <% 
   c1++;
    } 
    
   String testuntest ="";
   sql5="select * from allconnectedunits where UnitId='"+unid+"' and TheDate >= '"+entdte+"' ";
   rs5=stmt5.executeQuery(sql5);
   if(rs5.next())
   {
       testuntest="Tested"; 
   }
   else
   {
       testuntest="UnTested";    
   } 	
%>

	<td> <%=testuntest %> </td>
     <td> <%=rs1.getString("Status") %> </td>
<%
if(ustyp.equals("administrator"))
   {
%>      <td> <%=manufby %></td>
<% } %>   

    
</tr>
<% 
  i++;
}   
%>

<tr>
   <td colspan="19">

<input type="hidden" name="cntr" value="<%=i %>" />

 <%
} catch(Exception e) { out.println("Exception----->"+e); }

finally
{
con1.close();
con2.close();
}
%>     
