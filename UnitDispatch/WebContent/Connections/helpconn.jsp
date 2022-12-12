<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" import="moreservlets.listeners.*" errorPage="" %>

<%!
Connection getDattabase;
Statement getStatement;
 %>
<%
try{
Class.forName("org.gjt.mm.mysql.Driver");
 getDattabase= DriverManager.getConnection("jdbc:mysql://172.16.8.17/db_gps","fleetview","1@flv");
 getStatement=getDattabase.createStatement();
}catch(Exception e)
{
	out.print("Exception "+e);
}
%>
