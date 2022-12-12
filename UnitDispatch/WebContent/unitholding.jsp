<script language="javascript">

<script src="sorttable.js"></script>
</script>

<html>
<head>

<%@ include file="menuheader.jsp" %>

<form name="unitholding" method="get" action="" >

<%!
Connection con1, con2;
%>

<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con1.createStatement(), stmt2 = con2.createStatement(), stmt3 = con2.createStatement();
ResultSet rs1=null, rs2=null, rs3=null, rs4=null, rs5=null, rs6=null;
String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="";
int totmanufcnt=0, tottechcnt=0, totcustcnt=0;
%>

	<table border="1" width="100%">
		<tr>
			<td align="center"> <font color="blue" size="2"> <B> Unit Holding Details </B> </font> </td>
		</tr>
	</table>

	<table border="1" width="100%">
		<tr>
			<td align="center" colspan="3"> <font color="maroon" size="2"> <B> With Manufacturer / WareHouse </B> </font> </td>
		</tr>
	
		<tr>
			<th align="center"> Sr.No</td>
			<th align="center"> Name</td>
			<th align="center"> Count</td>
		</tr>

<%
	int i=1;
	sql1="select distinct(Name)as Name from t_admin where URole = 'manufacturer' order by Name asc ";
	rs1=stmt1.executeQuery(sql1);
	while(rs1.next())
	{
		String manufname=rs1.getString("Name");
		int manufcount=0;
%>
		<tr>
			<td align="center"> <%=i%> </td>
			<td align="center"> <%=rs1.getString("Name")%> </td>
<%
	sql2="select * from t_unitmaster where HoldBy='"+manufname+"' ";
	//out.print(sql2);
	rs2=stmt2.executeQuery(sql2);
	while(rs2.next())
	{
		manufcount++;
		totmanufcnt++;
	}
%>
			<td align="center"> <%=manufcount%> </td>			
		</tr>	
<%		i++;
	}	
%>
	<tr>
		<th colspan="3" align="center"> Total = <%=totmanufcnt%> </th>
	</tr>
	</table>
<br>

	<table border="1" width="100%">
		<tr>
			<td align="center" colspan="3"> <font color="maroon" size="2"> <B> With Technician </B> </font> </td>
		</tr>
	
		<tr>
			<th align="center"> Sr.No</td>
			<th align="center"> Name</td>
			<th align="center"> Count</td>
		</tr>

<%
	int j=1;
	sql3="select distinct(TechName) as techname from t_techlist order by TechName asc ";
	rs3=stmt1.executeQuery(sql3);
	while(rs3.next())
	{
		String techname=rs3.getString("techname");
		int techcount=0;
%>
		<tr>
			<td align="center"> <%=j%> </td>
			<td align="center"> <%=rs3.getString("techname")%> </td>
<%
	sql4="select * from t_unitmaster where HoldBy='"+techcount+"' ";
	//out.print(sql4);
	rs4=stmt2.executeQuery(sql4);
	while(rs4.next())
	{
		techcount++;
		tottechcnt++;
	}
%>
			<td align="center"> <%=techcount%> </td>			
		</tr>	
<%		j++;
	}	
%>
		<tr>
			<th colspan="3" align="center"> Total = <%=tottechcnt%> </th>
		</tr>
	</table>
<br>

	<table border="1" width="100%">
		<tr>
			<td align="center" colspan="3"> <font color="maroon" size="2"> <B> With Customer</B> </font> </td>
		</tr>
	
		<tr>
			<th align="center"> Sr.No</td>
			<th align="center"> Name</td>
			<th align="center"> Count</td>
		</tr>

<%
	int k=1;
	sql5="select distinct(TypeValue) as cust from t_security order by TypeValue asc ";
	rs5=stmt2.executeQuery(sql5);
	while(rs5.next())
	{
		String custname=rs5.getString("cust");
		int custcount=0;
%>
		<tr>
			<td align="center"> <%=k%> </td>
			<td align="center"> <%=rs5.getString("cust")%> </td>
<%
	sql6="select * from t_unitmaster where HoldBy='"+custname+"' ";
	//out.print(sql6);
	rs6=stmt3.executeQuery(sql6);
	while(rs6.next())
	{
		custcount++;
		 totcustcnt++;
	}
%>
			<td align="center"> <%=custcount%> </td>			
		</tr>	
<%		k++;
	}	
%>
		<tr>
			<th colspan="3" align="center"> Total = <%=totcustcnt%> </th>
		</tr>
	</table>
	<br>

	<table border="1" width="100%">
		<tr>
			<td align="center"> <font color="blue" size="2"><B>Total no. of Units=<%=totmanufcnt+tottechcnt+totcustcnt %> </B> </font></td>
		</tr>
	</table>
<% 
 con1.close();
 con2.close();
  
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



