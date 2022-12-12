<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>
<%!
Connection con1;
String lastunit,lastunit1,lastcomment;
%>

<%
try{
	System.out.println("shoaib in pending ajax");
	Class.forName("org.gjt.mm.mysql.Driver");
	con1 = DriverManager.getConnection("jdbc:mysql://172.16.8.17/db_CustomerComplaints","fleetview","1@flv");
	Statement stmt1=con1.createStatement(),stmt2=con1.createStatement();
	ResultSet rs1=null,rs2=null;
	//MM_dbConn_STRING="jdbc:mysql://172.16.8.17/db_CustomerComplaints";

	String sql1="",sql2="";
	String REM_UNITS="";
			
	String ORDER_NUMBER=request.getParameter("ReqNo");
	System.out.println(ORDER_NUMBER);
	sql1="select * from t_unitorder where ReqNo = '"+ORDER_NUMBER+"' ";
	System.out.println(sql1);
	rs1=stmt1.executeQuery(sql1);
	if(rs1.next())
	{
		REM_UNITS=rs1.getString("RemUnits");
	} 
	
	System.out.println("%%%%"+REM_UNITS);
	out.println(REM_UNITS+"$");
	
}catch(Exception e){
	e.printStackTrace();
}
finally
{
	con1.close();
}
%>