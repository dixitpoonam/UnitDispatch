<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>
<%!
Connection con1;
String lastunit,lastunit1,lastcomment;
%>

<%
try{
	System.out.println("shoaib in ajax");
	Class.forName("org.gjt.mm.mysql.Driver");
	con1 = DriverManager.getConnection("jdbc:mysql://172.16.8.17/db_CustomerComplaints","fleetview","1@flv");
	Statement stmt1=con1.createStatement(),stmt2=con1.createStatement();
	ResultSet rs1=null,rs2=null;
	//MM_dbConn_STRING="jdbc:mysql://172.16.8.17/db_CustomerComplaints";

	String sql1="",sql2="";
	String loc="",fuladd="";
			
	String tech=request.getParameter("tech");
	System.out.println(tech);
	sql1="select * from t_techlist where TechName='"+tech+"' ";
	System.out.println(sql1);
	rs1=stmt1.executeQuery(sql1);
	if(rs1.next())
	{
		loc=rs1.getString("Location");
	} 
	
	 sql2="select * from t_dispatchaddress where Location='"+loc+"' ";
	   //out.println(sql3);
	   rs2=stmt2.executeQuery(sql2);
	   if(rs2.next())
	   {
	      fuladd=rs2.getString("Address");
	   }
	System.out.println("shoaib%%%%   "+fuladd);
	out.println(fuladd+"$");
	
}catch(Exception e){
	e.printStackTrace();
}
finally
{
	con1.close();
}
%>