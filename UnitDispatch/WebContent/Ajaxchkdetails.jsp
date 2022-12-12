<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>

<%@ include file="Connections/conn.jsp" %>
 
<%!
Connection con1,con2;
%>

<%
Statement stmt1=null,stmt2=null,st=null,st1=null,st2=null,st3=null,stmt3=null;
ResultSet rs1=null,rs2=null,rs3=null,rs4=null;
// This page is called from main.jsp
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=con1.createStatement();
st1=con1.createStatement();
st2=con1.createStatement();
st3=con1.createStatement();
stmt1=con1.createStatement();
stmt2=con2.createStatement();
stmt3=con1.createStatement();
rs1=null;
rs2=null;
rs3=null;
rs4=null;
String sql1="",sql2="",sql3="",sql4="",sql5="";
String mobno="", simno="", wmsndb="", unitdb="", simnodb="", mobnodb="", status="",insttype="",mobno1=""; 
String param=request.getParameter("param");
String unitid=request.getParameter("unitid");
String wmsn=request.getParameter("wmsn");
String sim=request.getParameter("sim");
String mob=request.getParameter("mob");
String PSNo=request.getParameter("PSNo");
String PCBNo=request.getParameter("PCBNo");
String BoxNo=request.getParameter("BoxNo");
String BatteryNo=request.getParameter("BatteryNo");
String module=request.getParameter("module");
System.out.println("MODULE>>>"+module);
String sysdate=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());

//System.out.println("unitid==>>"+unitid);
//System.out.println("param==>>"+param);

if(param.equals("unit"))
{
	String UnitSerialization = "UPDATE t_unitserialization SET STATUS = 'LOCK' WHERE UNITID = '"+unitid.trim()+"'";
	stmt3.executeUpdate(UnitSerialization);
	//System.out.println("UnitSerialization==>>"+UnitSerialization);
	//System.out.println("unit id val==>>"+!(unitid.contains("")));
	//System.out.println("unit id val==>>"+(unitid.contains("")));
	
    if(unitid!=null)
    {
	sql1="select * from t_unitmaster where UnitId='"+unitid.trim()+"' ";
           // out.print(sql1);
            rs1=stmt1.executeQuery(sql1);
            //System.out.println("sql1==>>"+sql1);
            if(rs1.next())
	{
               
            	   //System.out.println("IF OF UNIT MASTER==>>");	
            	mobnodb=rs1.getString("MobNo");
                //out.print(sysdate);
		simnodb=rs1.getString("SimNo");
		wmsndb=rs1.getString("WMSN");
		status=rs1.getString("Status");
                // out.print(status);
                insttype=rs1.getString("InstType");
                PSNo=rs1.getString("PSNo");
                PCBNo=rs1.getString("PCBNo");
                BoxNo=rs1.getString("BoxNo");
                BatteryNo=rs1.getString("BatteryNo");
               // out.print(insttype);
                %>
                    <table border="0" width="100%" >
                        <tr>
                        <td align="center"> 
                            <font color="maroon" size="2" > You cannot edit the Unit <%=unitid%> that is already Present with Mob No=<%=mobnodb%>; SIM No=<%=simnodb%>; WMSN=<%=wmsndb%>;PS No=<%=PSNo%>;PCB NO=<%=PCBNo%>;BatteryNo=<%=BatteryNo%>;BatteryNo=<%=BatteryNo%> over here.<b> Please go to the edit tab !!</b></font>
                        </td><input type="hidden" name="statchk" id="statchk" value="Yes" />
                        <input type="hidden" name="statchk" id="statchk" value="Yes" />
                                            
                        </tr> 
                   </table>
              <%	
         }
         %>
         <table border="0" width="100%" >
			<tr>
				<td align="center"></td><input type="hidden" name="unitid" value="<%=unitid %>" />
			</tr> 
		</table> 
         
         <%   
            
            
            
    }
}
else if(param.equals("wmsn"))
{
	sql1="select * from t_unitmaster where WMSN='"+wmsn+"' and UnitId <> '"+unitid+"' ";
	//out.print(sql1);
	//System.out.println("sql111=ajx=>>"+sql1);
	
	
	
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
				<td align="center"> <font color="maroon"> WMSN <%=wmsn%> already Present with Unit Id=<%=unitdb%>;Mob No=<%=mobnodb%>; SIM No=<%=simnodb%>;PS No=<%=PSNo%>;PCB NO=<%=PCBNo%>;BatteryNo=<%=BatteryNo%>;BatteryNo=<%=BatteryNo%> </font> </td>
				
			</tr> <input type="hidden" name="wmsnchk" value="Yes" />
		</table>
<%	
		//out.print("#"+"wmsn");
	}
}
else if(param.equals("PSNo")){

	sql1="select * from t_unitmaster where PSNo='"+PSNo+"' and UnitId <> '"+unitid+"'";
	//out.print(sql1);
	//System.out.println("sql222==>>"+sql1);
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
				<td align="center"> <font color="maroon"> PS No <%=PSNo%> already Present with Unit Id=<%=unitdb%>;Mob No=<%=mobnodb%>; SIM No=<%=simnodb%>;WMSN=<%=wmsn%>;PCB NO=<%=PCBNo%>;BoxNo=<%=BoxNo%>;BatteryNo=<%=BatteryNo%> </font> </td>
				
			</tr> <input type="hidden" name="psnochk" value="Yes" />
		</table>
<%	
		}//out.print("#"+"wmsn");
		
	}

}else if(param.equals("PCBNo")){

	sql1="select * from t_unitmaster where PCBNo='"+PCBNo+"' and UnitId <> '"+unitid+"' ";
	//out.print(sql1);
	
	//System.out.println("sql333==>>"+sql1);
	
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
				<td align="center"> <font color="maroon">PCB No<%=PCBNo%> already Present with Unit Id=<%=unitdb%>;Mob No=<%=mobnodb%>; SIM No=<%=simnodb%>;PS No=<%=PSNo%>;WMSN=<%=wmsn%>;BoxNo=<%=BoxNo%>;BatteryNo=<%=BatteryNo%> </font> </td>
					
			</tr> <input type="hidden" name="psbnochk" value="Yes" />
		</table>
<%	
		}//out.print("#"+"wmsn");
	}
}else if(param.equals("BoxNo")){
	sql1="select * from t_unitmaster where BoxNo='"+BoxNo+"' and UnitId <> '"+unitid+"' ";
	//out.print(sql1);
	rs1=stmt1.executeQuery(sql1);
	//System.out.println("sql444==>>"+sql1);
	if(rs1.next())
	{
		mobnodb=rs1.getString("MobNo");
		simnodb=rs1.getString("SimNo");
		unitdb=rs1.getString("UnitId");
		PSNo=rs1.getString("PSNo");
		PCBNo=rs1.getString("PCBNo");
		BoxNo=rs1.getString("BoxNo");
		BatteryNo=rs1.getString("BatteryNo");
		if(("GH1202".equalsIgnoreCase(module) || "FM2200".equalsIgnoreCase(module)) && "0".equalsIgnoreCase(BoxNo))
		{
			
		}
		else{
%>

		<table border="0" width="100%" >
			<tr>
				<td align="center"> <font color="maroon"> BoxNo <%=BoxNo%> already Present with Unit Id=<%=unitdb%>;Mob No=<%=mobnodb%>; SIM No=<%=simnodb%>;PS No=<%=PSNo%>;PCB NO=<%=PCBNo%>;WMSN=<%=wmsn%>;BatteryNo=<%=BatteryNo%> </font> </td>
					
			</tr> <input type="hidden" name="boxnochk" value="Yes" />
		</table>
<%	
		}//out.print("#"+"wmsn");
		
	}

}else if(param.equals("BatteryNo")){

	sql1="select * from t_unitmaster where BatteryNo='"+BatteryNo+"' and UnitId <> '"+unitid+"' ";
	//out.print(sql1);
	rs1=stmt1.executeQuery(sql1);
	//System.out.println("sql555==>>"+sql1);
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
				<td align="center"> <font color="maroon"> BatteryNo <%=BatteryNo%> already Present with Unit Id=<%=unitdb%>;Mob No=<%=mobnodb%>; SIM No=<%=simnodb%>;PS No=<%=PSNo%>;PCB NO=<%=PCBNo%>;BoxNo=<%=BoxNo%>;WMSN=<%=wmsn%> </font> </td>
				
			</tr> <input type="hidden" name="batterynochk" value="Yes" />
		</table>
<%	
		}	//out.print("#"+"wmsn");
		
	}

}

else if(param.equals("sim"))
{
	////System.out.println("sim="+sim);
	sql1="select * from t_unitmaster where SIMNo='"+sim+"' and UnitId <> '"+unitid+"' ";
	//System.out.print(sql1);
	rs1=stmt1.executeQuery(sql1);
	//System.out.println("sql666==>>"+sql1);
	if(rs1.next())
	{
		mobnodb=rs1.getString("MobNo");
		wmsndb=rs1.getString("wmsn");
		unitdb=rs1.getString("UnitId");
		PSNo=rs1.getString("PSNo");
		PCBNo=rs1.getString("PCBNo");
		BoxNo=rs1.getString("BoxNo");
		BatteryNo=rs1.getString("BatteryNo");
	
		//System.out.println("unitdb==>>"+unitdb);
		
%>

		<table border="0" width="100%" >
			<tr>
				<td align="center"> <font color="maroon"> SIM <%=sim%> already Present with Unit Id=<%=unitdb%>;Mob No=<%=mobnodb%>; WMSN=<%=wmsndb%> ;PS No=<%=PSNo%>;PCB NO=<%=PCBNo%>;BatteryNo=<%=BatteryNo%>;BatteryNo=<%=BatteryNo%></font> </td>
			<td><a href="unitidchk.jsp?unitid=<%= unitdb%>&sim=<%=sim %>"><b> check the unit Id entry </b></a> </td>
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
		//System.out.println("sql77==>>"+str);
		if(rst.next())
		{
			//mobnodb=rst.getString("Mobno");
		
			//out.println(mobnodb);
			%>
		<!-- <table border="0" width="100%" >
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
	//System.out.println("sql888==>>"+sql1);
	
	
	if(rs1.next())
	{
		simnodb=rs1.getString("SIMNo");
		wmsndb=rs1.getString("wmsn");
		mobno1=rs1.getString("MobNo");
		unitdb=rs1.getString("UnitId");
		PSNo=rs1.getString("PSNo");
		PCBNo=rs1.getString("PCBNo");
		BoxNo=rs1.getString("BoxNo");
		BatteryNo=rs1.getString("BatteryNo");
		//System.out.println("<><><><><>123566"+mobno1);
   

%>

		<table border="0" width="100%" >
			<tr>
				<td align="center"> <font color="maroon"> Mobile No <%=mob%> already Present with Unit Id=<%=unitdb%>;SIM No=<%=simnodb%>; WMSN=<%=wmsndb%> ;PS No=<%=PSNo%>;PCB NO=<%=PCBNo%>;BatteryNo=<%=BatteryNo%>;BatteryNo=<%=BatteryNo%></font> </td>
			  		<td><a href="unitidchk.jsp?unitid=<%= unitdb%>&sim=<%=simnodb %>"><b> check the unit Id entry </b> </a> </td>
			</tr> <input type="hidden" name="mobchk" value="Yes" />
		</table>
<%	
}
}
	
	else
	{
		String str="",str2="",str3="";
		//sim="89912721622"+sim;
		//System.out.println(sim);
		String serviceprovider="",mobdb="";
		//---------------- Get thr service provider of sim --------------- 
		String str1="Select Service_provider from t_simmaster where Simno Like '%"+sim+"%'";
		//System.out.println(str1);
		ResultSet rst1=st1.executeQuery(str1);
		//System.out.println("str13333==>>"+str1);
		
		if(rst1.next())
		{
			serviceprovider=rst1.getString("Service_provider");
		}
		//System.out.println("serviceprovider"+serviceprovider);
		
		//---------------- if it is airtel get the mob no from AirtetMobno col--------------
		
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
			// System.out.println(str3);
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
		//System.out.println(str);
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
		<%
	}
	
	}
}

} catch(Exception e) {out.println(e);}

finally
{
	try {
		if(rs1!=null)
			rs1.close();
		if(rs2!=null)
			rs2.close();
		if(rs3!=null)
			rs3.close();
		if(stmt1!=null)
			stmt1.close();
		if(stmt2!=null)
			stmt2.close();
		if(con1!=null)
			con1.close();
		if(con2!=null)
			con2.close();
	} catch (SQLException e) {

		e.printStackTrace();
	}
}

%>

