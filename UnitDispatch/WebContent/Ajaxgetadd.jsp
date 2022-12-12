<%@ include file="Connections/conn.jsp" %>
<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>
<%!
Connection con1;
%>
<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con1.createStatement();
ResultSet rs1=null;
String sql1="";
String fuladd="";
String getName=request.getParameter("VendName");
sql1="select * from  db_CustomerComplaints.t_vendorMaster where V_Name ='"+getName+"'";
rs1=stmt1.executeQuery(sql1);
while(rs1.next())
{
  fuladd=rs1.getString("V_Address");
}
out.println(fuladd);
} catch(Exception e) {out.println(e);}
finally
{
con1.close();
}
%>