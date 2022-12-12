<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>

<%@ include file="Connections/conn.jsp" %>
<%!
Connection con1,con2;
%>
<%
// This page is called from main.jsp
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement st=con1.createStatement();
Statement stmt1=con1.createStatement();
Statement stmt2=con2.createStatement();
Statement st1=con1.createStatement();
Statement st2=con1.createStatement();
Statement st3=con1.createStatement();
 
ResultSet rs1=null,rs2=null,rs3=null;
String sql1="",sql2="",sql3="";
String mobno="", simno="", wmsndb="", unitdb="", simnodb="", mobnodb="", status="",insttype=""; 
String param=request.getParameter("param");
String unitid=request.getParameter("unitid").trim();
String wmsn=request.getParameter("wmsn").trim();
String sim=request.getParameter("sim").trim();
String mob=request.getParameter("mob").trim();
String PSNo=request.getParameter("PSNo");
String PCBNo=request.getParameter("PCBNo");
String BoxNo=request.getParameter("BoxNo");
String BatteryNo=request.getParameter("BatteryNo");
String module=request.getParameter("module");
String sysdate=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
if(param.equals("unit"))
{
   sql1="select * from t_unitmaster where UnitId='"+unitid+"' ";
           // out.print(sql1);
            rs1=stmt1.executeQuery(sql1);
            if(rs1.next())
	{
        mobnodb=rs1.getString("MobNo");
        //out.print(sysdate);
		simnodb=rs1.getString("SimNo");
		wmsndb=rs1.getString("WMSN");
		status=rs1.getString("Status");
		PSNo=rs1.getString("PSNo");
		PCBNo=rs1.getString("PCBNo");
		BoxNo=rs1.getString("BoxNo");
		BatteryNo=rs1.getString("BatteryNo");
                 //out.print(status);
                insttype=rs1.getString("InstType");
                //out.print(insttype);
                if(insttype.equals("New") && status.equals("-"))
                    {%>
                    <table>
                        <tr>
                            <td>
                                <input type="hidden" name="statchk3" id="statchk3" value="Yes"/>
                                <input type="hidden" name="statchk" id="statchk" value="No" />
                                <input type="hidden" name="statchk1" id="statchk1" value="No" />
                                <input type="hidden" name="statchk2" id="statchk2" value="No" />
                            </td>
                        </tr>
                    </table>
                    <%}
                else
                    {%>
                    <table>
                        <tr>
                            <td>
                                <input type="hidden" name="statchk3" id="statchk3" value="No"/>
                                
                            </td>
                        </tr>
                    </table>
               <%
       if(status.equals("Sent"))
		{ %>
			<table border="0" width="100%" >
				<tr>
					<td align="center"> <font color="maroon"> Unit <%=unitid%> already Present with Mob No=<%=mobnodb%>; SIM No=<%=simnodb%>; WMSN=<%=wmsndb%>;PS No=<%=PSNo%>;PCB No=<%=PCBNo%>;Box No=<%=BoxNo%>;Battery No=<%=BatteryNo%> and has Status <%=status%>. So you cannot edit it</font> </td>
				</tr><input type="hidden" name="statchk" id="statchk" value="Yes" />
			</table>
<%		}
		else
		{
                    
%>
			<table border="0" width="100%" >
				<tr>
					<td align="center"> <font color="maroon"> Unit <%=unitid%> already Present with Mob No=<%=mobnodb%>; SIM No=<%=simnodb%>; WMSN=<%=wmsndb%>;PS No=<%=PSNo%>;PCB No=<%=PCBNo%>;Box No=<%=BoxNo%>;Battery No=<%=BatteryNo%> </font> </td>
				</tr> <input type="hidden" name="statchk" id="statchk" value="No" />
			</table>
<%	
		}
               
                //sql2="select * from db_CustomerComplaints.t_unitreceived where Unitid='"+unitid+"' and Rdate>=(select max(Dispdate) from db_gps.t_unitmasterhistory where Status in ('Dispatched','Sent') and Unitid='"+unitid+"') ";
                sql2="select * from db_CustomerComplaints.t_unitreceived where Unitid='"+unitid+"' and Concat(Rdate,Rtime)>=(select concat(max(Dispdate),max(DispTime)) from db_gps.t_unitmasterhistory where Status in ('Dispatched','Sent') and Unitid='"+unitid+"' group by Dispdate order by Dispdate desc limit 1) group by Rdate order by Rdate desc limit 1";
                //out.print("sql2"+sql2);
                rs2=stmt1.executeQuery(sql2);
                //rdate=rs2.getDate("Rdate");
                if(rs2.next())
                    {%><input type="hidden" name="statchk1" id="statchk1" value="No" /><%}
                else
                {%>
                    <table border="0" width="100%" >
				<tr>
					<td align="center"> <font color="maroon"> Unit <%=unitid%> has not been received yet. So you cannot enter it again. </font> </td>
				</tr> <input type="hidden" name="statchk1" id="statchk1" value="Yes" />
                    </table>
                <%}
                
                //sql3="select * from db_CustomerComplaints.hwunittest where Unitid='"+unitid+"' and TheDate>=(select max(Dispdate) from db_gps.t_unitmasterhistory where Status in ('Dispatched','Sent') and Unitid='"+unitid+"') ";
                sql3="select * from db_CustomerComplaints.hwunittest where Unitid='"+unitid+"' and Concat(TheDate,TheTime)>=(select concat(max(Dispdate),max(DispTime)) from db_gps.t_unitmasterhistory where Status in ('Dispatched','Sent') and Unitid='"+unitid+"' group by Dispdate order by Dispdate desc limit 1)group by TheDate order by TheDate desc limit 1" ;
               //out.print(sql3);
                rs3=stmt1.executeQuery(sql3);
                //rdate=rs2.getDate("Rdate");
                if(rs3.next())
                    {%><input type="hidden" name="statchk2" id="statchk2" value="No" /><%}
                else
                    {%>
                        <table border="0" width="100%" >
                            <tr><td align="center"> <font color="maroon">Unit <%=unitid%> has not been quicktested yet. So you cannot enter it. </font></td>
                            </tr><input type="hidden" name="statchk2" id="statchk2" value="Yes"/>
                    </table>
		
                        
                        
          <%}
            
                
		}
     }
  }

else if(param.equals("wmsn"))
{
	sql1="select * from t_unitmaster where WMSN='"+wmsn+"' and UnitId <> '"+unitid+"' ";
	//out.print(sql1);
	rs1=stmt1.executeQuery(sql1);
	if(rs1.next())
	{
		mobnodb=rs1.getString("MobNo");
		simnodb=rs1.getString("SimNo");
		unitdb=rs1.getString("UnitId");
		PSNo=rs1.getString("PSNo");
		PCBNo=rs1.getString("PCBNo");
		BoxNo=rs1.getString("BoxNo");
		BatteryNo=rs1.getString("BatteryNo");
%>

		<table border="0" width="100%" >
			<tr>
				<td align="center"> <font color="maroon"> WMSN <%=wmsn%> already Present with Unit Id=<%=unitdb%>;Mob No=<%=mobnodb%>; SIM No=<%=simnodb%>;PS No=<%=PSNo%>;PCB No=<%=PCBNo%>;Box No=<%=BoxNo%>;Battery No=<%=BatteryNo%> </font> </td>
			</tr> <input type="hidden" name="wmsnchk" value="Yes" />
		</table>
<%	
		//out.print("#"+"wmsn");
		
	}
}
else if(param.equals("PSNo"))
{
	sql1="select * from t_unitmaster where PSNo='"+PSNo+"' and UnitId <> '"+unitid+"' ";
	System.out.print(sql1);
	rs1=stmt1.executeQuery(sql1);
	if(rs1.next())
	{
		mobnodb=rs1.getString("MobNo");
		simnodb=rs1.getString("SimNo");
		unitdb=rs1.getString("UnitId");
		PSNo=rs1.getString("PSNo");
		PCBNo=rs1.getString("PCBNo");
		BoxNo=rs1.getString("BoxNo");
		BatteryNo=rs1.getString("BatteryNo");
		if(("GH1202".equalsIgnoreCase(module) || "FM2200".equalsIgnoreCase(module)) && "0".equalsIgnoreCase(PSNo))
		{
			
		}
		else{
%>

		<table border="0" width="100%" >
			<tr>
				<td align="center"> <font color="maroon"> PSNo <%=PSNo%> already Present with Unit Id=<%=unitdb%>;Mob No=<%=mobnodb%>; SIM No=<%=simnodb%>;WMSN=<%=wmsn%>;PCB No=<%=PCBNo%>;Box No=<%=BoxNo%>;Battery No=<%=BatteryNo%> </font> </td>
			</tr> <input type="hidden" name="psnochk" value="Yes" />
		</table>
<%	
		}//out.print("#"+"wmsn");
		
	}
}
else if(param.equals("PCBNo"))
{
	sql1="select * from t_unitmaster where PCBNo='"+PCBNo+"' and UnitId <> '"+unitid+"' ";
	//out.print(sql1);
	rs1=stmt1.executeQuery(sql1);
	if(rs1.next())
	{
		mobnodb=rs1.getString("MobNo");
		simnodb=rs1.getString("SimNo");
		unitdb=rs1.getString("UnitId");
		PSNo=rs1.getString("PSNo");
		PCBNo=rs1.getString("PCBNo");
		BoxNo=rs1.getString("BoxNo");
		BatteryNo=rs1.getString("BatteryNo");
		if(("GH1202".equalsIgnoreCase(module) || "FM2200".equalsIgnoreCase(module)) && "0".equalsIgnoreCase(PCBNo))
		{
			
		}
		else{
%>

		<table border="0" width="100%" >
			<tr>
				<td align="center"> <font color="maroon">PCBNo<%=PCBNo%> already Present with Unit Id=<%=unitdb%>;Mob No=<%=mobnodb%>; SIM No=<%=simnodb%>;PS No=<%=PSNo%>;WMSN=<%=wmsn%>;Box No=<%=BoxNo%>;Battery No=<%=BatteryNo%> </font> </td>
			</tr> <input type="hidden" name="pcbnochk" value="Yes" />
		</table>
<%	
		}//out.print("#"+"wmsn");
		
	}
}
else if(param.equals("BoxNo"))
{
	sql1="select * from t_unitmaster where BoxNo='"+BoxNo+"' and UnitId <> '"+unitid+"' ";
	//out.print(sql1);
	rs1=stmt1.executeQuery(sql1);
	if(rs1.next())
	{
		mobnodb=rs1.getString("MobNo");
		simnodb=rs1.getString("SimNo");
		unitdb=rs1.getString("UnitId");
		PSNo=rs1.getString("PSNo");
		PCBNo=rs1.getString("PCBNo");
		BoxNo=rs1.getString("BoxNo");
		BatteryNo=rs1.getString("BatteryNo");
%>

		<table border="0" width="100%" >
			<tr>
				<td align="center"> <font color="maroon">BoxNo <%=BoxNo%> already Present with Unit Id=<%=unitdb%>;Mob No=<%=mobnodb%>; SIM No=<%=simnodb%>;PS No=<%=PSNo%>;PCB No=<%=PCBNo%>;WMSN=<%=wmsn%>;Battery No=<%=BatteryNo%> </font> </td>
			</tr> <input type="hidden" name="boxnochk" value="Yes" />
		</table>
<%	
		//out.print("#"+"wmsn");
		
	}
}
else if(param.equals("BatteryNo"))
{
	sql1="select * from t_unitmaster where BatteryNo='"+BatteryNo+"' and UnitId <> '"+unitid+"' ";
	//out.print(sql1);
	rs1=stmt1.executeQuery(sql1);
	if(rs1.next())
	{
		mobnodb=rs1.getString("MobNo");
		simnodb=rs1.getString("SimNo");
		unitdb=rs1.getString("UnitId");
		PSNo=rs1.getString("PSNo");
		PCBNo=rs1.getString("PCBNo");
		BoxNo=rs1.getString("BoxNo");
		BatteryNo=rs1.getString("BatteryNo");
		if(("GH1202".equalsIgnoreCase(module) || "FM2200".equalsIgnoreCase(module)) && "0".equalsIgnoreCase(BatteryNo))
		{
			
		}
		else{
%>

		<table border="0" width="100%" >
			<tr>
				<td align="center"> <font color="maroon"> Battery No <%=BatteryNo%> already Present with Unit Id=<%=unitdb%>;Mob No=<%=mobnodb%>; SIM No=<%=simnodb%>;PS No=<%=PSNo%>;PCB No=<%=PCBNo%>;Box No=<%=BoxNo%>;WMSN =<%=wmsn%> </font> </td>
			</tr> <input type="hidden" name="batterynochk" value="Yes" />
		</table>
<%	
		}//out.print("#"+"wmsn");
		
	}
}
else if(param.equals("sim"))
{
	sql1="select * from t_unitmaster where SIMNo='"+sim+"' and UnitId <> '"+unitid+"' ";
	//out.print(sql1);
	rs1=stmt1.executeQuery(sql1);
	if(rs1.next())
	{
		mobnodb=rs1.getString("MobNo");
		wmsndb=rs1.getString("wmsn");
		unitdb=rs1.getString("UnitId");
		PSNo=rs1.getString("PSNo");
		PCBNo=rs1.getString("PCBNo");
		BoxNo=rs1.getString("BoxNo");
		BatteryNo=rs1.getString("BatteryNo");
%>

		<table border="0" width="100%" >
			<tr>
				<td align="center"> <font color="maroon"> SIM <%=sim%> already Present with Unit Id=<%=unitdb%>;Mob No=<%=mobnodb%>; WMSN=<%=wmsndb%>;PS No=<%=PSNo%>;PCB No=<%=PCBNo%>;Box No=<%=BoxNo%>;Battery No=<%=BatteryNo%> </font> </td>
			</tr> <input type="hidden" name="simchk" value="Yes" />
		</table>
<%	
				
	}
	
	else
	{
				//sim="89912721622"+sim;
		//String str="select Mobno from t_simmaster where Simno Like '%"+sim+"%'";
		String str="select * from t_simmaster where Simno Like '%"+sim+"%'";
		ResultSet rst=st.executeQuery(str);
		if(rst.next())
		{
			//mobnodb=rst.getString("Mobno");
		
			//out.println(mobnodb);
			%>
			<!--  <table border="0" width="100%" >
			<tr>
				<td align="center"></td>
			</tr> <input type="hidden" name="simchk" value="<%=mobnodb %>" />
		</table> 
			 -->
			<%
			
		}
		else
		{
		%>

	   <table border="0" width="100%" >
			<tr>
				<td align="center"> <font color="maroon"> SIM <%=sim%> not Present in Sim Master</font> </td>
			</tr> <input type="hidden" name="simchk" value="Yes" />
		</table> 
<%
		}
  }
}

else if(param.equals("mob"))
{
	sql1="select * from t_unitmaster where MobNo='"+mob+"' and UnitId <> '"+unitid+"' ";
	//out.print(sql1);
	rs1=stmt1.executeQuery(sql1);
	if(rs1.next())
	{
		simnodb=rs1.getString("SIMNo");
		wmsndb=rs1.getString("wmsn");
		unitdb=rs1.getString("UnitId");
		PSNo=rs1.getString("PSNo");
		PCBNo=rs1.getString("PCBNo");
		BoxNo=rs1.getString("BoxNo");
		BatteryNo=rs1.getString("BatteryNo");
%>

		<table border="0" width="100%" >
			<tr>
				<td align="center"> <font color="maroon"> Mobile No <%=mob%> already Present with Unit Id=<%=unitdb%>;SIM No=<%=simnodb%>; WMSN=<%=wmsndb%>;PS No=<%=PSNo%>;PCB No=<%=PCBNo%>;Box No=<%=BoxNo%>;Battery No=<%=BatteryNo%> </font> </td>
			</tr> <input type="hidden" name="mobchk" value="Yes" />
		</table>
<%	
				
	}
	else
	{
		String str="",str2="",str3="";
		//sim="89912721622"+sim;
		//System.out.println(sim);
		String serviceprovider="",mobdb="";
		//---------------- Get thr service provider of sim --------------- 
		String str1="Select Service_provider from t_simmaster where Simno Like '%"+sim+"%'";
	//	System.out.println(str1);
		ResultSet rst1=st1.executeQuery(str1);
		if(rst1.next())
		{
			serviceprovider=rst1.getString("Service_provider");
		}
	//	System.out.println("serviceprovider"+serviceprovider);
		
		//---------------- if it is airtel get the nob no from AirtetMobno col--------------
		
		if(serviceprovider!=null && serviceprovider.equalsIgnoreCase("Airtel"))
		{
		 str2="select MobNo from t_simmaster where Simno Like '%"+sim+"%'";
		//	System.out.println(str2);
		 ResultSet rst2=st2.executeQuery(str2);
		 if(rst2.next())
		 {
			 mobdb=rst2.getString("MobNo");
		 }
		 if((mobdb!=null) && (!mobdb.equals("-")))
		 {
			 if(mobdb.equals(mob))
			 {
				 %>
				 <table border="0" width="100%" >
				<tr>
				<td align="center"></td>
				</tr> <input type="hidden" name="mobchk" value="got" />
				</table>  
			<% }
			 else
			 {  %>
				<table border="0" width="100%" >
			<tr>
				<td align="center"></td><input type="hidden" name="mobvalue" value="<%=mobdb %>" />
			</tr> <input type="hidden" name="mobchk" value="notgot" />
		</table> 
				 
			<% }
		 }               // if mobdb is - or null then get the mobile ni from MobNo column
		 else
		 {
			 str3="select MobNo from t_simmaster where Simno Like '%"+sim+"%'";
		//	 System.out.println(str3);
			 ResultSet rst3=st3.executeQuery(str3);
			if(rst3.next())
			{
				 mobdb=rst3.getString("MobNo");				 
			}
			if(mobdb.equals(mob))
			{
				%>
				 <table border="0" width="100%" >
				<tr>
				<td align="center"></td>
				</tr> <input type="hidden" name="mobchk" value="got" />
				</table>  
			<% 
			}
			else
			{
				%>
				<table border="0" width="100%" >
			<tr>
				<td align="center"></td>
			</tr> <input type="hidden" name="mobvalue" value="<%=mobdb %>" />
			<input type="hidden" name="mobchk" value="notgot" />
		</table> 
				 
			<% 
			}
		 }
				 
		}
		else
		{
		 str="select MobNo from t_simmaster where Simno Like '%"+sim+"%'";
	//	System.out.println(str);
		ResultSet rst=st.executeQuery(str);
		if(rst.next())
		{
		mobdb=rst.getString("Mobno");
		}
		if(mobdb.equals(mob))
		{
			//out.println(mobnodb);
			%>
		 <table border="0" width="100%" >
			<tr>
				<td align="center"></td>
			</tr> <input type="hidden" name="mobchk" value="got" />
		</table> 
			 
	<%} 
		else
		{
			%>
			<table border="0" width="100%" >
			<tr>
				<td align="center"></td><input type="hidden" name="mobvalue" value="<%=mobdb %>" />
			</tr> <input type="hidden" name="mobchk" value="notgot" />
		</table> 
		<%}
	}
	
	}
	
	
	
}

} catch(Exception e) {out.println(e);}

finally
{
con1.close();
}

%>


