<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%!Connection con1, con2;
	String USER_NAME = "", USER_TYPE = "";%>

<%@page import="javax.management.Query"%><html>
<%@ include file="headeradmin.jsp"%>
<head>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>
<title>Master Page _Code Version</title>
<script type="text/javascript">
function validate()
{
	var Code_Ver_Field= document.CodeVersionInsert.CODE_VER.value;
	if(Code_Ver_Field == "")
	{
		alert("Please Insert The Code Version!!");
		return false;
	}
	return true;
}
</script>
</head>
<body>
<%
	String inserted = request.getParameter("insert");
     if(inserted == null)
     {
    	 inserted = "shoaib";
     }
     
	if (inserted.equalsIgnoreCase("Y")) {
%>
<script type="text/javascript">
   alert("Code Version Successfully Inserted...!!!");
</script>
<%
	}
	else if(inserted.equalsIgnoreCase("N"))
	{
		%>
		<script type="text/javascript">
		   alert("Code Version Already Present...!!!");
		</script>
		<%
	}
%>
<table border="0" width="100%" align="right">
	<tr>
		<td align="center">
		<center><font color="blue" size="2"> <B><U>Welcome
		<%=USER_NAME%> </U></B> </font></center>
		</td>
	</tr>
</table>
<%
	try {
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING1,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		con2 = DriverManager.getConnection(MM_dbConn_STRING,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		Statement stmt1 = con1.createStatement(), stmt2 = con2
				.createStatement();
		ResultSet rs1 = null, rs2 = null;
%>
<table width="100%">
	<tr>
		<td>
		<div align="center"><b><font size="3" color="black">Code
		Version Addition Form</font></b></div>
		</td>
	</tr>
</table>
<form name="CodeVersionInsert" id="CodeVersionInsert"
	action="CodeVer_M_Insert.jsp" onsubmit="return validate()">
<table align="center">
	<tr>
		<td><font size="2"><b>Code Version :</b></font></td>
		<td><input type="text" name="CODE_VER" id="CODE_VER" align="top"></td>
		<td><input type="submit" align="top" value="Add"></td>
	</tr>
</table>
</form>

<form action="" name="CodeVersionView" id="CodeVesrionView">
<table border="1" bgcolor="#E6E6E6" align="center" class=sortable
	style="width: 350px;">
	<tr bgcolor="#BDBDBD">
		<td><b><font size="2"> Sr No </font></b></td>
		<td><b><font size="2"> Code Version </font></b></td>
		<td><b><font size="2"> Valid </font></b></td>
	</tr>
	<%
		String Query1 = "select * FROM db_CustomerComplaints.t_utcodever order by Rno";
			rs1 = stmt1.executeQuery(Query1);
			while (rs1.next()) {
	%>

	<tr>
		<td align='center'><font face='arial'><%=rs1.getString("Rno")%></font></td>
		<td align='center'><font face='arial'><%=rs1.getString("codever")%></font></td>
		<td align='center'><font face='arial'><%=rs1.getString("valid")%></font></td>
	</tr>
	<%
		}
	%>
</table>
</form>
<%
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>