<%@ page language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" import="moreservlets.listeners.*" errorPage="" %>
<%!String MM_dbConn_DRIVER;
String MM_dbConn_USERNAME;
String MM_dbConn_PASSWORD="";
String MM_dbConn_STRING;
String MM_dbConn_STRING1;

%>

<%

//Class.forName("org.gjt.mm.mysql.Driver");
//getDattabase= DriverManager.getConnection("jdbc:mysql://203.199.134.128/db_CustomerComplaints","unit","1@utp");

//MM_dbConn_STRING="jdbc:mysql://203.199.134.128/db_gps";
//MM_dbConn_STRING1="jdbc:mysql://203.199.134.128/db_CustomerComplaints";

MM_dbConn_STRING="jdbc:mysql://172.16.8.17/db_gps";
MM_dbConn_STRING1="jdbc:mysql://172.16.8.17/db_CustomerComplaints";

//MM_dbConn_STRING="jdbc:mysql://192.168.1.55/db_gps";
//MM_dbConn_STRING1="jdbc:mysql://192.168.1.55/db_CustomerComplaints";

MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";

MM_dbConn_USERNAME="fleetview";

MM_dbConn_PASSWORD="1@flv";
//MM_dbConn_PASSWORD="";

%>
