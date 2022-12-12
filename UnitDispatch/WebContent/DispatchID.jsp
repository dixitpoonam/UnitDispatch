<%@ include file="menuheader.jsp"%>
<html>
<head>
<title>Unit Dispatch</title>
<script type="text/javascript">
function emailcheck() {


	if(document.dispatchID.Name.value == "")
	{
		alert("Please Insert The Employee Name");
		return false;
	}
	else if(document.dispatchID.uID.value == "")
	{
		alert("Please Insert The User Id");
		return false;
	}
	else if(document.dispatchID.pass.value == "")
	{
		alert("Please Insert The Password");
		return false;
	}
	else if(document.dispatchID.uRole.value == "Select")
	{
		alert("Please Select The User Role");
		return false;
	}
	else if(document.dispatchID.uType.value == "Select")
	{
		alert("Please Select The User Type");
		return false;
	}
	else if(document.dispatchID.tValue.value == "Select")
	{
		alert("Please Select The Type Value");
		return false;
	}

	var str = document.dispatchID.email.value;
	var at="@";
	var dot=".";
	var lat=str.indexOf(at);
	var lstr=str.length;
	var ldot=str.indexOf(dot);
	if (str.indexOf(at)==-1){
	alert("Invalid E-mail ID");
	return false;
	}

	if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
	alert("Invalid E-mail ID");
	return false;
	}

	if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
	alert("Invalid E-mail ID");
	return false;
	}

	if (str.indexOf(at,(lat+1))!=-1){
	alert("Invalid E-mail ID");
	return false;
	}

	if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
	alert("Invalid E-mail ID");
	return false;
	}

	if (str.indexOf(dot,(lat+2))==-1){
	alert("Invalid E-mail ID");
	return false;
	}

	if (str.indexOf(" ")!=-1){
	alert("Invalid E-mail ID");
	return false;
	}
}
	function ValidateEmail(){
	var emailID=document.dispatchID.email.value;

	if ((emailID.value==null)||(emailID.value=="")){
	alert("Please Enter your Email Address");
	emailID.focus();
	return false;
	}
	if (emailcheck(emailID.value)==false){
	emailID.value="";
	emailID.focus();
	return false;;
	}
	return true;
	}
</script>
</head>
<body>
<%!Connection con1;
	Connection con2;%>
<form id="dispatchID" name="dispatchID" method="post"
	action="Dispatch_insert.jsp" onsubmit="return emailcheck()">
<%
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,
			MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,
			MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
	Statement stmtVendor = con2.createStatement();

	java.util.Date tdydte1 = new java.util.Date();
	Format formatter1 = new SimpleDateFormat("yyyy-MM-dd");
	String tdydte = formatter1.format(tdydte1);
%>
<center>
<div align="center"><label for="addre"> <font
	color="maroon" size="2"> <B> <u> Unit Dispatch ID
Creation Form</u> </B></font> </label></div>
<img id="top" src="images/top.png" alt="" align="top">
<table border="0" width="70%" align="center">
	<tr>
		<td>
		<div align="right"><b>Today : </b> <font color="maroon">
		</font></div>
		</td>
		<td id="dateoptions" align="left"><input type="text"
			id="calender" name="calender" size="15" class="formElement"
			value="<%=tdydte%>" readonly /> <input type="button" name="trigger"
			id="trigger" value="Dispatch Date" class="formElement"> <script
			type="text/javascript">
            		 Calendar.setup(
            		 {
             			inputField  : "calender",         // ID of the input field
               			ifFormat    : "%Y-%m-%d",     // the date format
		                button      : "trigger"       // ID of the button
             		 }
                         		);
             		</script> &nbsp;&nbsp;&nbsp;</td>

	</tr>
	<tr>
		<td>
		<div align="right"><b>Employee Name : </b></div>
		</td>
		<td><input type="text" name="Name" id="Name" class="formElement"
			value="" title="Insert First And Last Name Of The Employee" /></td>
	</tr>
	<tr>
		<td>
		<div align="right"><b>User ID : </b></div>
		</td>
		<td><input type="text" name="uID" id="uID" size="29"
			class="formElement" value=""
			title="Insert First And Last Name Of The Employee" /></td>
	</tr>
	<tr>
		<td>
		<div align="right"><b>Password : </b></div>
		</td>
		<td><input type="text" name="pass" id="pass" size="29"
			class="formElement" value=""
			title="Insert First And Last Name Of The Employee" /></td>
	</tr>
	<tr>
		<td>
		<div align="right"><b>Email ID : </b></div>
		</td>
		<td><input type="text" name="email" id="email" size="29"
			class="formElement" value=""
			title="Insert First And Last Name Of The Employee" /></td>
	</tr>
	<tr>
		<td>
		<div align="right"><b>User Role : </b></div>
		</td>
		<td><select name="uRole" id="uRole" class="formElement"
			id="uRole">
			<option value="Select">Select</option>
			<option value="administrator">Administrator</option>
			<option value="manufacturer">Manufacturer</option>
		</select></td>
	</tr>
	<tr>
		<td>
		<div align="right"><b>User Type : </b></div>
		</td>
		<td><select name="uType" id="uType" class="formElement"
			id="uType">
			<option value="Select">Select</option>
			<option value="dispatch">Unit Dispatch</option>
		</select></td>
	</tr>
	<%
		String vendorList = "Select Distinct(V_Name) from t_vendorMaster";
		ResultSet rsVendor = stmtVendor.executeQuery(vendorList);
	%>
	<tr>
		<td>
		<div align="right"><b>Type Value : </b></div>
		</td>
		<td><select name="tValue" id="tValue" class="formElement"
			id="tValue">
			<option value="Select">Select</option>
			<%
				while (rsVendor.next()) {
			%>
			<option value="<%=rsVendor.getString("V_Name")%>"><%=rsVendor.getString("V_Name")%></option>
			<%
				}
			%>

		</select></td>
	</tr>
</table>
<table border="0" width="100%" align="left">
	<tr>
		<td>
		<div align="center"><input type="submit" name="submit"
			value="Create ID" class="formElement" /></div>
		</td>
	</tr>
</table>
<img id="bottom" src="images/bottom.png" alt="" align="bottom"></center>
</form>
</body>
</html>