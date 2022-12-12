    <%@ include file="headeradmin.jsp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reason For Manual Dispatch</title>
</head>

<script type="text/javascript">
function validate()
{
	if(document.reasonLate.reason.value == "")
	{
		alert("Please Insert The Reason For Manual Dispatch!!!");
		return false;
	}
	return true;
}
</script>
<body>
<form method="post" action="Manual_Dispatched_insert.jsp" name="reasonLate" onsubmit="return validate()">
		<table bgcolor="#86EEFE" border="0" height="200" width="500" align="center" >
			<tr>
				<td><font  color="#990000">Please enter reason for MANUAL DISPATCH</font></td>
			</tr>
		<tr><td>
		<table>
		<tr>
		<td>
		<input type="hidden" name="OrderNo" value="<%=request.getParameter("OrderNo")%>" id="OrderNo">
		<input type="hidden" name="UserIDs" value="<%=request.getParameter("UserIDs")%>" id="UserIDs">
		<input type="hidden" name="locations" value="<%=request.getParameter("locations")%>" id="locations">
		<input type="hidden" name="calender" value="<%=request.getParameter("calender")%>" id="calender">
		<input type="hidden" name="chalan" value="<%=request.getParameter("chalan")%>" id="chalan">
		<input type="hidden" name="dispto" value="<%=request.getParameter("dispto")%>" id="dispto">
		<input type="hidden" name="mode" value="<%=request.getParameter("mode")%>" id="mode">
		<input type="hidden" name="dispname" value="<%=request.getParameter("dispname")%>" id="dispname">
		</td>
		</tr>
		</table>
		<table bgcolor="white" border="0" height="100" width="450" align="center">
			<tr>
				<td>
					<b>Reason</b>
				</td>
				<td>
					<input type="text" name="reason" id="reason">
					<input type="hidden" name="type" id="type" value="">
					<input type="hidden" name="ip" id="ip" value="">
				</td>
			</tr>
			<tr><td align="center"><input type="submit" value="Submit" /></td></tr>
		</table>
		</td></tr>
		<tr>
		<td>
		 <marquee><font size="4">PLEASE TRY TO AVOID MANUAL UNIT DISPATCH!!!!</font></marquee>
		</td>
		</tr>
		</table>
		</form>
</body>
<br>
<table border="1" width="100%">
	<tr>
		<td bgcolor="white" class="copyright" width="100%">
		<center>Copyright &copy; 2008 by Transworld Compressor
		Technologies Ltd. All Rights Reserved.</center>
		</td>
	</tr>
</table>
</html>