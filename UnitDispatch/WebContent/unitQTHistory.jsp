<%@page import="org.omg.CORBA.Request"%>
<%@ include file="menuheader.jsp"%>
<%@ page import="java.io.*, java.util.* , java.text.*"%>
<html>
<%!
	Connection con1,con2;
	String sub="";
%>
<head>
<script language="javascript">
function validate()
{ 
	var v1=document.testviewhistory.s1.value ;
	if(v1=="")
	{
		alert("Please enter UnitID to search.");
		return false;
	}
	if(isNaN(v1))
	{
		alert("Please enter proper Unit ID");
		return false;
	}
	return true;
}
</script>
<body>
<form name="testviewhistory" method="get" action="" onSubmit="return validate();">
	<table border="0" width="100%" align="right" >
<%
	try
	{
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
		Statement stmt1 = con1.createStatement();
		Statement stmt2 = con2.createStatement();
		ResultSet rs1=null,rs2=null,rs3=null;
		String sql1="",sql2="",Comment1="",sql3="",instdate="",warranty="";
		String searchval=request.getParameter("s1");
		String usr=session.getValue("user").toString();
%>
<tr>
<td><div align="center">
	<font size="2" color="maroon">Enter Unit ID For Search
	<input type="text" name="s1" class="formElement"></input>
	<input type="submit" name="submit" value="submit" class="formElement">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		Date : <%
		Format fmt = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
		String curdate = fmt.format(new java.util.Date());
		out.print(curdate); %>
</div></td>
</tr>
	
<tr><td>
<div align="center">
		<font color="maroon" size="2"> <B> Search Result in Unit History  Report for </font><font size="2"color="blue"><%=searchval %> from <%=usr%></B></font>
</div></td>
</tr>

<tr>
<td><div align="left">
<p>
<table  border="0"  width="100%" align="center">
<tr bgcolor="Lightgreen" width="100%">
	<td class="hed"><b> Sr. </td>
	<td class="hed"><b> The Date </td>
	<td class="hed"><b> Ref.No </td>
	<td class="hed"><b> Cust </td>
	<td class="hed"><b> Custmer DB </td>
    <td class="hed"><b> Unit ID </td>
    <td class="hed"><b> Unit Type </td>
	<td class="hed"><b> Is Unit in Warranty  </td>
    <td class="hed"><b> WMSN </td>
	<td class="hed"><b> Mobile No db </td>
	<td class="hed"><b> Mobile Not same </td>
    <td class="hed"><b> SIM No db </td>
	<td class="hed"><b> Sim Not Same </td>
    <td class="hed"><b> RLED </td>
    <td class="hed"><b> GLED </td>
    <td class="hed"><b> Power supply </b></td>
	<td class="hed"><b> PCB modification required  </b></td>
	<td class="hed"><b> PCB modifications </b></td>
	<td class="hed"><b> Firmware </td>
	<td class="hed"><b> Code </td>
	<td class="hed"><b> Comment </td>
	<td class="hed"><b> Action Suggested </td>
	<td class="hed"><b> Tested By </td>
</tr>
<%	
	if(searchval==null)
		{
			
		}
		else
		{
			int c1=1, i=1,j=1;
			boolean flag=false;
			sql2="select * from hwunittest where UnitID='"+searchval+"' " ;
			//out.print("hi"+sql2);
			rs1=stmt1.executeQuery(sql2);
			while(rs1.next())
			{
				flag=true;
				String refno=rs1.getString("RefNo");
				String TheDate=rs1.getString("TheDate");
				String Cust=rs1.getString("Cust");
				String Custdb=rs1.getString("Custdb");
				String UnitID =rs1.getString("UnitID");
				String UnitType =rs1.getString("UnitType");
				String WMSN =rs1.getString("WMSN");
				String MobileNo=rs1.getString("MobileDB");
				String MobileNo1=rs1.getString("MobileNo1");
				String SIMNo=rs1.getString("SIMDB");
				String SIMNo1 =rs1.getString("SIMNo1");
				String RLED=rs1.getString("RLED");
				String GLED =rs1.getString("GLEDBlink");
				String Comment =rs1.getString("SWComment");
				String firmware =rs1.getString("Firmware");
				String code =rs1.getString("SWswver");
				String tester =rs1.getString("User");
				String phydmg=rs1.getString("Physicaldamage");
				String pwrsupply=rs1.getString("PowerSupply");
	          	String pcbmodreq=rs1.getString("PCBModReq");
	          	String pcbmod=rs1.getString("PCBMod");
                  if(!(phydmg==null||phydmg.equalsIgnoreCase("null")||phydmg.trim().length()<=0))
                  {
                       Comment =rs1.getString("SWComment")+","+phydmg;
                  }
                 String actionSuggested=rs1.getString("ActionSuggested");
	%>
	<tr>
		<td> <%=j %> </td>
	<% 
		if(TheDate==null || TheDate.equals("-"))
		{
	%>
		<td> - </td>
	<%
	 	} 
		else
		{ 
			java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(TheDate);
			Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
			String nwfrmtdte=formatter.format(datefrmdb);
	%>
		<td> <%=nwfrmtdte %></td>
	<%
		}
	%>
		<td> <%=refno %> </td>
		<td> <%=Cust%> </td>
		<td> <%=Custdb%> </td>
		<td> <%=UnitID%>  </td>
		<td> <%=UnitType%>  </td>
		<% sql2="select * from t_unitreplacement where NewUnitID='"+UnitID+"' order by InstDate desc limit 1";
			rs2=stmt2.executeQuery(sql2);
			if(rs2.next())
			{
				instdate=rs2.getString("InstDate");
			}
				sql3="select (TO_DAYS('"+TheDate+"')-TO_DAYS('"+instdate+"'))";	
				rs3=stmt2.executeQuery(sql3);
				if(rs3.next())
				{
					int ww=rs3.getInt(1);
					if(ww <365 && ww>=0)
					{
					
						warranty="Yes  "+ww + " days remaining";
						//out.println(warranty);
					}
					else
					{
						warranty="No";
						//out.print(warranty);
					}
				}
			else
			{
				out.print("-");
			}
                        %>
		<td><%=warranty%></td>
		<td> <%=WMSN%>  </td>
		<%
		if(MobileNo.equals("null"))
		{
			MobileNo="-";
			
			
		}
		
		if(MobileNo1.equals("null"))
		{
			
			MobileNo1="-";
			
		}
	
		if(SIMNo.equals("null"))
		{
			
			SIMNo="-";
		}
		if(SIMNo1.equals("null"))
		{
			SIMNo1="-";
			
		}
	%>	
		<td><%=MobileNo%></td>
		<td><%=MobileNo1%></td>
		<td><%=SIMNo%></td>
		<td><%=SIMNo1%></td>
		<td><%=RLED%></td>
		<td><%=GLED%></td>
		<td><%=pwrsupply%>	</td>
		<td><%=pcbmodreq%>  </td>
		<td><%=pcbmod%>  	</td>
		<td><%=firmware%></td>
		<td><%=code%></td>
		<td><%=Comment%></td>
		<td><%=actionSuggested%></td>
		<td><%=tester%></td>
	</tr>
<%
     		i++;
		j++;
     		c1++;
	}//while rs2 
		if(flag==true){}
		else
		{
			out.print("This unit is not present in Quick Test database");
		}
	}//else
}
catch(Exception e)
{
              out.println("Exception----->"+e);
              System.out.print(e);
}

finally
{
con1.close();
}
%>
</table>
</div>
</td>
</tr>
</table>
</form>
</body>
</head>
</html>