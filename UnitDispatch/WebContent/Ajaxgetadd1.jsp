
<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>
<%@ include file="Connections/conn.jsp" %>


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

String getadd=request.getParameter("loc");

sql1="select * from t_dispatchaddress where Location='"+getadd+"' ";
rs1=stmt1.executeQuery(sql1);

while(rs1.next())
{
  fuladd=rs1.getString("Address");
  out.println(fuladd);
}


} catch(Exception e) {out.println(e);}

finally
{
con1.close();
}

%>

