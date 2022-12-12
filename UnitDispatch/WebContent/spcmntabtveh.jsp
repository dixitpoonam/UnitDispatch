<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage=""%>
<%!
String MM_dbConn_STRING, MM_dbConn_STRING1,MM_dbConn_STRING2, MM_dbConn_DRIVER, MM_dbConn_USERNAME, MM_dbConn_PASSWORD;
%>
<head>
<link href="css/css.css" rel="StyleSheet" type="text/css">
<script language="javascript">
function validate()
{
	//alert("in valiate function");
	var cntr=document.spcommentclose.cntr.value;
	//alert(cntr);
	var Srno="";
	var flag="false";
   	for(var j=0;j<cntr;j++)
    	{	
    		if(document.getElementById("del"+j).checked==true)
    		{
    			var RId=document.getElementById("id"+j).value;
    			
    			//alert(RId)
    			Srno=Srno+RId+",";
				flag="true";
    		}		
    	}
	//	alert(flag);
		if(flag=="true"){
	//		alert(Srno);
			var vehno=document.getElementById("vehno").value;
			var unitid=document.getElementById("unitid").value;
			window.open('ClosingSpComment.jsp?RId='+Srno+'&vehno='+vehno+'&unitid='+unitid,'mywindow','width=800, height=250, toolbar=false, location=false, status=no, menubar=no, resizable=no, scrollbars=no,left=50, top=50 ');
			}
        if(flag=="false"){
			alert("Please select atleast one checkbox");
			return false;
        }//write function to check no of check boxes get value
	//return false;
}

</script>
</head>
<body>
<%! 
Connection con1;
%>
<form name="spcommentclose" method="post" onsubmit="return validate();">
<%
try
{
	MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";
	MM_dbConn_USERNAME="fleetview";
	MM_dbConn_PASSWORD="1@flv";
	MM_dbConn_STRING1="jdbc:mysql://172.16.8.17/db_CustomerComplaints";
	
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt1=con1.createStatement(),stmt2=con1.createStatement();
	ResultSet rs1=null,rs2=null;
	String sql1="",sql2="";
	int i=1,j=0,k=0;
	String unitid=request.getParameter("unitid");
%> <br></br>
<table border="1" width="500px" bgcolor="#E6E6E6" align="black"
	class="sortable">
		<tr bgcolor="#BDBDBD">
						<td width="1px;">
						<div align="center" style="size: 2px"><b> Sr.No </b></div>
						</td>
						<td>
						<div align="center"><b> Ent Date Time </b></div>
						</td>
						<td>
						<div align="center"><b> Comment   </b></div>
						</td>
						<td>
						<div align="center"><b> Extra Comment   </b></div>
						</td>
						<td>
						<div align="center"><b> Action to be Taken by </b></div>
						</td>
						<td>
						<div align="center"><b> Red Light Status </b></div>
						</td>
						<td>
						<div align="center"><b> Green Light Status  </b></div>
						</td>
						<td>
						<div align="center"><b> GPS Blue Light Status  </b></div>
						</td>
						<td>
						<div align="center"><b> Ringing   </b></div>
						</td>
					</tr>
	<%
		Boolean flag=false,flag1=false,flag2=false;
	    //sql1="select * from t_techspecialrep where UnitId = '"+unitid+"' and Closed='No' order by EntDateTime desc ";
	 	sql1="select * from t_techspecialrep where UnitId = '"+unitid+"' and cmmt_type='Unit' order by EntDateTime desc ";
		String bgcolor="";
		rs1=stmt1.executeQuery(sql1);
		while(rs1.next())
		{ 
			%>
			<tr bgcolor="#EFEFEF">
			<td width="1px;">
			<div align="right"><%=i%></div>
			</td>
			<td>
			<div align="right"><%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss")
				.format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.parse(rs1.getString("EntDateTime")))%>
			</div>
			</td>
			<td>
			<div align="left"><%=rs1.getString("SpComment")%>
			</div>
			</td>
			<td>
			<div align="left"><%=rs1.getString("ClosingExtra_comment")%>
			</div>
			</td>
			<td>
			<div align="left"><%=rs1.getString("ActionToBeTakenBy")%>
			</div>
			</td>
			<td>
			<div align="left"><%=rs1.getString("RedLight")%>
			</div>
			</td>
			<td>
			<div align="left"><%=rs1.getString("GreenLight")%>
			</div>
			</td>
			<td>
			<div align="left"><%=rs1.getString("GPSLight")%>
			</div>
			</td>
			<td>
			<div align="left"><%=rs1.getString("Ringing")%>
			</div>
			</td>
		</tr>
		<%
			i++;
		}
%>
</table>

<input type="hidden" name="unitid" id="unitid" value="<%=unitid%>" /> <%	
}catch(Exception e)
{
	out.print("Exception -->"+e);

}
finally
{
	con1.close();

}
%>
</form>
</body>
</html>
