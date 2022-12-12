<%@ page contentType="application/vnd.ms-excel;charset=gb2312" %>
<% response.setContentType("application/vnd.ms-excel");
	response.addHeader("Content-Disposition","attachment;filename=\"unitdata.xls\"");%>

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

Statement stmt1=con1.createStatement();
Statement stmt2=con2.createStatement();
Statement stmt5=con1.createStatement();
Statement stmt6=con1.createStatement();

ResultSet rs1=null,rs4=null, rs5=null, rs6=null;
String sql1="",sql4="", sql5="", sql6="";
String cnt="";
String user=session.getValue("typeval").toString();
String ustyp=session.getValue("urole").toString();


   java.util.Date d=new java.util.Date();
   String tdydte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate(); 

   java.util.Date newfrmdate=new SimpleDateFormat("yyyy-MM-dd").parse(tdydte);
   Format formatter10=new SimpleDateFormat("yyyy-MM-dd");
   tdydte=formatter10.format(newfrmdate);
   

%>
<table width="100%">
<tr>  
   <td align="center">
        <font color="maroon" size="3"> <B> Data of Tested Units </B></font> </td>
</tr> </table>

<table border="1" width="100%" class="sortable">
  <tr>
      <th>   Sr. No </th>
      <th>   Unit ID    </th>
	<th>   SIM No    </th>
	<th>   MOb. No    </th>
	<th>   WMSN    </th>
	<th>PS No</th>
	  <th>PCB No</th>
	  <th>Box No</th>
	  <th>Battery No</th>
      <th>   Unit Type </th>
      <th>   Manuf. Date </th>
      <th>   Date(Latest Data) </th>
      <th>   Time(Latest Data)   </th>
      <th>   Location    </th>
        <th> Inst Type</th>
<!-- There are some extra features for admin. And extra viewable columns -->

<%
   if(ustyp.equals("administrator"))
   {  %>
      <th>   Status       </th>
      <th>   Manuf. By    </th>  
<% } %> 

     <th>   Avail. Status    </th>		
  </tr>
<%
int i=1;
if(ustyp.equals("administrator"))
   { 
      sql1="select * from t_unitmaster a, allconnectedunits b where a.UnitID=b.UnitID and a.User <> 'null' and a.EntDate <= b.TheDate order by b.TheDate desc";
      //out.print(sql1);
   }
else
{
   sql1="select * from t_unitmaster a, allconnectedunits b where a.UnitID=b.unitID and a.User='"+user+"' and a.Status <> 'Dispatched' and a.EntDate <= b.TheDate order by b.TheDate desc";
//out.println(sql1);
}
rs1=stmt1.executeQuery(sql1);
while(rs1.next())
{  
    String dte=rs1.getString("b.TheDate");
    String mandate=rs1.getString("EntDate");

	String unitid=rs1.getString("UnitID");
        String location=rs1.getString("Location");
	String wmsn=rs1.getString("WMSN").trim();
	String simno=rs1.getString("SIMNo").trim();
	String mobno=rs1.getString("MobNo").trim();
	String unittype=rs1.getString("typeunit").trim();
	String swver=rs1.getString("SwVer").trim();	

	String ftpduminfo="UnMatch", entryftpdump="";
 	String wmsndump="", simdump="", unittypedump="", simdump1="",codeverdump=""; 	
	String olddatadate="";
	String chk="", locchk="";


	sql5="select * from t_ftplastdump where UnitId='"+unitid+"' ";
	rs5=stmt5.executeQuery(sql5);
	if(rs5.next())
	{
		wmsndump=rs5.getString("WMSN");
		simdump=rs5.getString("SimNo");
		unittypedump=rs5.getString("UnitType");
	
		try {
			int ind=simdump.length()-8;
			simdump1=simdump.substring(ind,simdump.length()); 
		    } catch (Exception e)	
		    {
			simdump1="NA";	
		    }	
	}	
	else
	{
		wmsndump=wmsn;
		
		simdump1=simno;
		unittypedump=unittype;
		codeverdump=swver;
		entryftpdump="No Entry in FTP Dump";
	}
	String psno=rs1.getString("PSNo");
	String pcbno=rs1.getString("PCBNo");
	String boxno=rs1.getString("BoxNo");
	String batteryno=rs1.getString("BatteryNo");
	if(!(wmsn.equals(wmsndump)))
	{
		chk="WMSN";
	}
			
	if(!(simno.equals(simdump1)))
	{
		chk=chk+",SIM";
		
	}

	if(!(unittype.equals(unittypedump)))
	{
		chk=chk+",TYPE";
	}

	
	if(!(chk.equals("")))
	{
		chk=chk+" Not Matching";
	}
	
	if(!(swver.equalsIgnoreCase(codeverdump)))
	{
		chk=chk+",SoftwareVersion";
	}

if(ustyp.equals("administrator"))
   { 
	if(location.equals("In Transworld2(MH)") || location.equals("In Transworld Pune (MH)"))
	{
		locchk="";
	}
	else
	{
		locchk="Loc doesnt Match";
	}
  }
  else
  {
        if(user.equals("Anish"))	
	{
		if(!(location.equals("In Transworld2(MH)")))
		{
			locchk="Loc doesnt Match";
		}
	}
	else if(user.equals("Transworld"))
	{
		if(!(location.equals("In Transworld Pune (MH)")))
		{
			locchk="Loc doesnt Match";
		}
	}
  }

  sql6="select (TO_DAYS('"+tdydte+"')-TO_DAYS('"+dte+"'))";
	rs6=stmt6.executeQuery(sql6);
	if(rs6.next())
	{
		int days=rs6.getInt(1);

		if(days>3)
		{
			olddatadate="Old Data Date";
			
		}
	}

	
	
	if(!(entryftpdump.equals("")))
	{
		
	}
	else
	{
		entryftpdump="";

		if(wmsn.equals(wmsndump) && simno.equals(simdump1) && unittype.equals(unittypedump) && locchk.equals("") && olddatadate.equals(""))
		{
			ftpduminfo="Matches";
		}
	}

			

   java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
   String nwfrmtdte=formatter.format(datefrmdb);

   java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(mandate);
   Format formatter1=new SimpleDateFormat("dd-MMM-yyyy");
   String nwfrmtdte1=formatter1.format(datefrmdb1);

%>
         <td align="center"> <%=i %> </td>          
         <td align="center"> <%=rs1.getString("UnitID") %> </td>
	 <td align="center"> <%=rs1.getString("SIMNo") %> </td>	
	 <td align="center"> <%=rs1.getString("MObNo") %> </td>
	 <td align="center"> <%=rs1.getString("WMSN") %> </td>
	 <td align="center"> <%=rs1.getString("PSNo") %> </td>
	 <td align="center"> <%=rs1.getString("PCBNo") %> </td>
	 <td align="center"> <%=rs1.getString("BoxNo") %> </td>
	 <td align="center"> <%=rs1.getString("BatteryNo") %> </td>
         <td align="center"> <%=rs1.getString("typeunit") %> </td>
         <td align="center" sorttable_customkey="dd-MMM-yyyy"> <%=nwfrmtdte1 %> </td>
         <td align="center" sorttable_customkey="dd-MMM-yyyy"> <%=nwfrmtdte %> </td>
         <td align="center"> <%=rs1.getString("TheTime") %> </td>
         <td align="center"> <%=rs1.getString("Location") %> </td>
         <td align="center"> <%=rs1.getString("InstType") %> </td>
<% 
if(ustyp.equals("administrator"))
   { 
       String stat=rs1.getString("Status");
       if(stat.equals("Dispatched"))
       {
       }   
       else
       {
          stat="Not Disp"; 
       }
%>
       <td align="center"> <%=stat %> </td>
       <td align="center"> <%=rs1.getString("User") %> </td>
	
<% } %>
      <td> <Font color="red"> <%=chk%>   </font> <br> <font color="blue"> <%=entryftpdump%> </font> <br> <font color="maroon"> <%=locchk%> </font> <br> <font color="green"> <%=olddatadate%> </td>
</tr>
<%
  i++;
} %>
</table>

<% } catch(Exception e) { out.println("Exception----->" +e); }

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

