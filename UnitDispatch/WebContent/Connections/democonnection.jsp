<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" errorPage="" %>
<%
try{
Class.forName("org.gjt.mm.mysql.Driver");
Connection conn= DriverManager.getConnection("jdbc:mysql://192.168.1.102/db_gps","unit","1@utp");
}catch(Exception e)
{
	out.print("Exception "+e);
}
%>
