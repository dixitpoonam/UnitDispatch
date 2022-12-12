<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="menuheader.jsp"%>

<%!Connection con1, con2, conn1;
	String USER_NAME = "", USER_TYPE = "";
	int MAX_RNO;
	String selectval = "";%>
<%
	try {
		selectval = request.getParameter("q");
		String user = session.getAttribute("user").toString();
		if (selectval == null) {
		} else {
			System.out.println("<><><><>....first try block>>>"
					+ selectval);
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<%@page import="javax.management.Query"%><html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" charset="utf-8" />
<link rel="stylesheet" href="css/css.css" type="text/css"
	charset="utf-8" />
<script src="sorttable.js" type="text/javascript"></script>
<title>Master Page _Code Version</title>
<script type="text/javascript">
	function validate() {
		var Code_Ver_Field = document.CodeVersionInsert.CODE_VER.value;
		if (Code_Ver_Field == "") {
			alert("Please Insert The Code Version!!");
			return false;
		}
		return true;
	}
	function addcontent(ab) {
		//alert("<><><><hi..submit..");
		//alert("<><><><hi...." + ab);
		try {
			//var a=document.getElementById("untyp").value;
			//var b=document.getElementById("modltyp").value;
			//var c=document.getElementById("perphl").value;
			//var d=document.getElementById("sftvrsn").value;
			//var e=document.getElementById("omnfcrtn").value;

		//	alert("<><><>" + ab);
				window.location = "master.jsp?q="+ab;
				//document.CodeVersionView.action="master_M_Insert.jsp?q="+ab;
			//if(ab=="untyp")
			//{
//
			//	window.location = "master_M_Insert.jsp?q=" + ab;
		//	}

			//document.CodeVersionView.submit();
		} catch (e) {
			alert(e);
		}
	}
</script>
</head>
<body>
<%
	//	String inserted = request.getParameter("insert");
	//    if(inserted == null)
	//    {
	//	 inserted = "shoaib";
	// }

	//	if (inserted.equalsIgnoreCase("Y")) {
	//
%>
<script type="text/javascript">
	//   alert("Code Version Successfully Inserted...!!!");
</script>
<%
	//}
	//else if(inserted.equalsIgnoreCase("N"))
	//{
%>
<script type="text/javascript">
	//   alert("Code Version Already Present...!!!");
</script>
<%
	//}
%>

<%
	if (selectval == null) {

	} else {
		if (selectval == "untyp" || selectval.equalsIgnoreCase("untyp")) {
%>
<table border="0" width="100%" align="right">
	<tr>
		<td align="center">
		<center><font color="blue" size="2"> <B><U>Welcome
		</U></B> </font></center>
		</td>
	</tr>
	<tr>
		<td>
		<div align="center"><b><font size="3" color="black">Unit
		Type Addition form</font></b></div>
		</td>
	</tr>
</table>
<%
	}
	}
%>


<%
	if (selectval == null) {

	} else {
		if (selectval == "modltyp"
				|| selectval.equalsIgnoreCase("modltyp")) {
%>
<table border="0" width="100%" align="right">
	<tr>
		<td align="center">
		<center><font color="blue" size="2"> <B><U>Welcome
		</U></B> </font></center>
		</td>
	</tr>
	<tr>
		<td>
		<div align="center"><b><font size="3" color="black">Module
		Type Addition form</font></b></div>
		</td>
	</tr>
</table>
<%
	}
	}
%>
<%
	if (selectval == null) {
	} else {
		if (selectval == "perphl"
				|| selectval.equalsIgnoreCase("perphl")) {
%>
<table border="0" width="100%" align="right">
	<tr>
		<td align="center">
		<center><font color="blue" size="2"> <B><U>Welcome
		</U></B> </font></center>
		</td>
	</tr>
	<tr>
		<td>
		<div align="center"><b><font size="3" color="black">Peripheral
		Addition form</font></b></div>
		</td>
	</tr>
</table>
<%
	}
	}
%>
<%
	if (selectval == null) {

	} else {
		if (selectval == "sftvrsn"
				|| selectval.equalsIgnoreCase("sftvrsn")) {
%>
<table border="0" width="100%" align="right">
	<tr>
		<td align="center">
		<center><font color="blue" size="2"> <B><U>Welcome
		</U></B> </font></center>
		</td>
	</tr>
	<tr>
		<td>
		<div align="center"><b><font size="3" color="black">Software
		Version Addition form</font></b></div>
		</td>
	</tr>
</table>
<%
	}
	}
%>



<%
	if (selectval == null) {

	} else {
		if (selectval == "omnfcrtn"
				|| selectval.equalsIgnoreCase("omnfcrtn")) {
%>
<table border="0" width="100%" align="right">
	<tr>
		<td align="center">
		<center><font color="blue" size="2"> <B><U>Welcome
		</U></B> </font></center>
		</td>
	</tr>
	<tr>
		<td>
		<div align="center"><b><font size="3" color="black">Other
		Manufacturing Correction Addition form</font></b></div>
		</td>
	</tr>
</table>
<%
	}
	}
%>











<table align="center">
	<tr>
		<td><font size="2"><b>Add:&nbsp;</b></font></td>
		<td><select name="sertype" id="sertype"
			onchange="addcontent(this.value);">
			<option value="Select">select</option>
			<%
				if (selectval == null) {
			%>

			<option value="untyp">Unit Type</option>
			<option value="modltyp">Module Type</option>
			<option value="perphl">Peripheral</option>
			<option value="sftvrsn">Software Version</option>
			<option value="omnfcrtn">Other Manufacturing Corrections</option>


			<%
				}
				if (selectval == null) {

				} else {

					if (selectval == "untyp" || selectval.equalsIgnoreCase("untyp")) {
			%>

			<option value="untyp" selected>Unit Type</option>

			<%
				} else {
			%>

			<option value="untyp">Unit Type</option>
			<%
				}
				}
			%>






			<%
				if (selectval == null) {

				} else {

					if (selectval == "modltyp"
							|| selectval.equalsIgnoreCase("modltyp")) {
			%>

			<option value="modltyp" selected>Module Type</option>

			<%
				} else {
			%>

			<option value="modltyp">Module Type</option>
			<%
				}
				}
			%>


			<%
				if (selectval == null) {

				} else {

					if (selectval == "perphl"
							|| selectval.equalsIgnoreCase("perphl")) {
			%>

			<option value="perphl" selected>Peripheral</option>

			<%
				} else {
			%>

			<option value="perphl">Peripheral</option>
			<%
				}
				}
			%>





			<%
				if (selectval == null) {

				} else {

					if (selectval == "sftvrsn"
							|| selectval.equalsIgnoreCase("sftvrsn")) {
			%>

			<option value="sftvrsn" selected>Software Version</option>

			<%
				} else {
			%>

			<option value="sftvrsn">Software Version</option>
			<%
				}
				}
			%>




			<%
				if (selectval == null) {

				} else {

					if (selectval == "omnfcrtn"
							|| selectval.equalsIgnoreCase("omnfcrtn")) {
			%>

			<option value="omnfcrtn" selected>Other Manufacturing
			Corrections</option>

			<%
				} else {
			%>

			<option value="omnfcrtn">Other Manufacturing Corrections</option>
			<%
				}
				}
			%>
		
	</tr>
</table>




<%
	try {
		System.out.println(">>>>>>he he inside try ....");

		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING1,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		con2 = DriverManager.getConnection(MM_dbConn_STRING,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

		conn1 = DriverManager.getConnection(MM_dbConn_STRING1,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		Statement st, st1;
		String QUERY1, QUERY2, QUERY3;
		System.out.println(">>>>>>1-1-1-1-1 ....");

		Statement stmt1 = con1.createStatement(), stmt2 = con2
				.createStatement();
		System.out.println(">>>>>>1--><1--<>1--<>1--<>1 ....");
		st = conn1.createStatement();
		st1 = conn1.createStatement();
		System.out.println(">>>>>>1--1--1--1--1 ....");
		String CODE_VER = request.getParameter("CODE_VER");
		ResultSet rs1 = null, rs2 = null;

		System.out.println(">>>>>>11111 ....");

		String user = session.getAttribute("user").toString();

		System.out.println(">>>>>>user>>>>> ...." + user);
		java.util.Date dte = new java.util.Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss  ");
		String today = formatter.format(dte);
		String d = request.getParameter("inserted");
		String d1 = request.getParameter("inserted1");
		// int flag=0;
		System.out.println(">>>>>>d>>>>> >>>>...." + d);
		System.out.println(">>>>>>d1>>>>> >>>>...." + d1);

		String abc = request.getParameter("p");
		String abc1 = request.getParameter("j");
		//System.out.println(">>>>>>selectval>>>>> "+selectval);

		System.out.println(abc1);
		System.out.println(abc);
		System.out.println(">>>>>> 222222 ....");

		if (abc1 == null || abc1.equalsIgnoreCase(" ")
				|| abc1.contains(" ")) {
			System.out.println(">>>>>> if ....");
%>
<%
	} else {
			if (abc == null || abc.equalsIgnoreCase(" ")) {

				System.out.println(">>>>>> else ....");
%>


<script type="text/javascript">
	  alert("Please enter some value in the textbox");
      </script>

<%
	}
		}

		if (d == null) {

		} else {
			System.out.println(">>>>>>d>>>>> >>>>...." + d);
%>
<script type="text/javascript">
			alert("unit already present");
			</script>

<%
	}

		if (d1 == null) {

		} else {
			System.out.println(">>>>>>d>>>>> >>>>...." + d);
%>
<script type="text/javascript">
			alert("Added Successfully");
			</script>

<%
	}

		//	if(flag==0){
		// 	  selectval = request.getParameter("q");
		//	System.out.println(">>>>>>selectval>>>>> "+selectval); 
		// }

		selectval = request.getParameter("q");

		if (selectval == null) {
		} else {
			if (selectval == "untyp"
					|| selectval.equalsIgnoreCase("untyp")) {

				System.out.println("inside......untype..<><><>");
				System.out.println(">>>>>> 333333 ....");
				System.out.println(">>>>>>selectval>>>>> " + selectval);
%>
<form name="untyp" action="master_M_Insert.jsp" method="get">
<table width="100%">
	<tr>

	</tr>
</table>

<table align="center">
	<tr>
		<td><font size="2"><b>Unit Type :</b></font></td>
		<td><input type="text" name="CODE_VER" id="CODE_VER" align="top"></td>
		<td><input type="submit" align="top" value="Add" onclick=""></td>
		<td><input type="hidden" name="unitype" value="untyp"></td>

	</tr>
</table>

<table border="1" bgcolor="#E6E6E6" align="center" class=sortable
	style="width: 350px;">
	<tr bgcolor="#BDBDBD">
		<td><b><font size="2"> Sr No </font></b></td>
		<td><b><font size="2"> Unit Type </font></b></td>

	</tr>
	<%
		String Query1 = "select * from  db_gps.t_typeofunits   ORDER BY UnitType ASC";
					rs1 = stmt1.executeQuery(Query1);
					int i = 1;
					while (rs1.next()) {
	%>
	<tr>
		<td align='center'><font face='arial' size="2"><%=i%></font></td>
		<td align="left"><font face='arial' size="2">
		<div align="left"><%=rs1.getString("UnitType")%></div>
		</font></td>

	</tr>
	<%
		i++;
					}
					System.out.println(">>>>>> 444444 ....");
	%>
</table>
<%
	//response.sendRedirect("");
%>
</form>


<%
	//response.sendRedirect("master_M_Insert?insert=Y");
			}
			System.out.println(">>>>>> bbbbbbbb ....");
			if (selectval == "modltyp"
					|| selectval.equalsIgnoreCase("modltyp")) {
%>
<form name="untyp" action="master_M_Insert.jsp" method="get">



<table align="center">
	<tr>
		<td><font size="2"><b>Module Type :</b></font></td>
		<td><input type="text" name="CODE_VER" id="CODE_VER" align="top"></td>
		<td><input type="submit" align="top" value="Add"></td>
		<td><input type="hidden" name="unitype" value="modltyp"></td>
	</tr>
</table>


<table border="1" bgcolor="#E6E6E6" align="center" class=sortable
	style="width: 275px;">
	<tr bgcolor="#BDBDBD">

		<td><b><font size="2"> Module Type </font></b></td>

	</tr>
	<%
		String Query1 = "select * from db_CustomerComplaints.t_utmodule order by module asc ";
					rs1 = stmt1.executeQuery(Query1);
					int i = 1;
					while (rs1.next()) {
	%>
	<tr>

		<td align='center'><font face='arial' size="2">
		<div align="left"><%=rs1.getString("module")%></div>
		</font></td>

	</tr>
	<%
		i++;
					}
					System.out.println(">>>>>> 444444 ....");
	%>
</table>
</form>


<%
	}
			System.out.println(">>>>>> cccccc ....");

			if (selectval == "sftvrsn"
					|| selectval.equalsIgnoreCase("sftvrsn")) {
%>

<form name="sft" action="master_M_Insert.jsp" method="get">



<table align="center">
	<tr>
		<td><font size="2"><b>Software Version :</b></font></td>
		<td><input type="text" name="CODE_VER" id="CODE_VER" align="top"></td>
		<td><input type="submit" align="top" value="Add"></td>
		<td><input type="hidden" name="unitype" value="sftvrsn"></td>
	</tr>
</table>

<table border="1" bgcolor="#E6E6E6" align="center" class=sortable
	style="width: 350px;">
	<tr bgcolor="#BDBDBD">
		<td><b><font size="2"> Sr No </font></b></td>
		<td><b><font size="2"> Software Version </font></b></td>
		<td><b><font size="2"> Valid </font></b></td>
	</tr>
	<%
		String Query1 = "select * from db_CustomerComplaints.t_utcodever where valid='Yes' order by codever asc";
					rs1 = stmt1.executeQuery(Query1);
					int i = 1;
					while (rs1.next()) {
	%>
	<tr>
		<td align='center'><font face='arial' size="2"><%=i%></font></td>

		<td align='center'><font face='arial' size="2">
		<div align="left"><%=rs1.getString("codever")%></div>
		</font></td>
		<td align='center'><font face='arial' size="2">
		<div align="left"><%=rs1.getString("valid")%></div>
		</font></td>
		<td><input type="checkbox"></input></td>
	</tr>
	<%
		i++;
					}
					System.out.println(">>>>>> 444444 ....");
	%>
</table>
<table align="center">
	<tr>
		<td><input type="button" align="right" value="Deactivate"></td>
	</tr>
</table>
</form>
<%
	}
			System.out.println(">>>>>> ddddddd ....");
			if (selectval == "omnfcrtn"
					|| selectval.equalsIgnoreCase("omnfcrtn")) {
%>
<form name="omf" action="master_M_Insert.jsp" method="get">



<table align="center">
	<tr>
		<td><font size="2"><b>Other Correction Type :</b></font></td>
		<td><input type="text" name="CODE_VER" id="CODE_VER" align="top"></td>
		<td><input type="submit" align="top" value="Add"></td>
		<td><input type="hidden" name="unitype" value="omnfcrtn"></td>
	</tr>
</table>



<table border="1" bgcolor="#E6E6E6" align="center" class=sortable
	style="width: 350px;">
	<tr bgcolor="#BDBDBD">
		<td><b><font size="2"> Sr No </font></b></td>
		<td><b><font size="2"> Comment </font></b></td>

	</tr>
	<%
		String Query1 = "select DISTINCT Comment  from db_CustomerComplaints.hw_comment order by Comment  ";
					rs1 = stmt1.executeQuery(Query1);
					int i = 1;
					while (rs1.next()) {
	%>
	<tr>
		<td align='center'><font face='arial' size="2"><%=i%></font></td>

		<td align='center'><font face='arial' size="2">
		<div align="left"><%=rs1.getString("Comment")%></div>
		</font></td>

	</tr>
	<%
		i++;
					}
					System.out.println(">>>>>> 444444 ....");
	%>
</table>
</form>
<%
	}
			System.out.println(">>>>>> eeeeeeee ....");

			if (selectval == "perphl"
					|| selectval.equalsIgnoreCase("perphl")) {
%>

<form name="perphl" action="master_M_Insert.jsp" method="get">



<table align="center">
	<tr>
		<td><font size="2"><b>Peripherals Type :</b></font></td>
		<td><input type="text" name="CODE_VER" id="CODE_VER" align="top"></td>
		<td><input type="submit" align="top" value="Add"></td>
		<td><input type="hidden" name="unitype" value="perphl"></td>
	</tr>
</table>

<table border="1" bgcolor="#E6E6E6" align="center" class=sortable
	style="width: 350px;">
	<tr bgcolor="#BDBDBD">
		<td><b><font size="2"> Sr No </font></b></td>
		<td><b><font size="2"> Peripherals </font></b></td>

	</tr>
	<%
		String Query1 = "SELECT DISTINCT peripherals FROM db_gps.t_peripherals order by peripherals asc ";
					rs1 = stmt1.executeQuery(Query1);
					int i = 1;
					while (rs1.next()) {
	%>
	<tr>
		<td align='center'><font face='arial' size="2"><%=i%></font></td>

		<td align='center'><font face='arial' size="2">
		<div align="left"><%=rs1.getString("peripherals")%></div>
		</font></td>

	</tr>
	<%
		i++;
					}
					System.out.println(">>>>>> 444444 ....");
	%>
</table>
</form>

<%
	}
%>
<%
	//response.sendRedirect("master_M_Insert.jsp?insert=Y");    
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>