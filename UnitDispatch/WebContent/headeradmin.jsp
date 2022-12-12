<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Unit Dispatch </title>
<link href="menu_assets/styles.css" rel="stylesheet" type="text/css">
<!-- <link href="css/css.css" rel="StyleSheet" type="text/css"> -->
<script src="elabel.js" type="text/javascript"></script>
<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
</head>
<body bgcolor="white">
<tr ><td valign="top"><table border="0" width="100%" bgcolor="#E0E0E0"><tr><td valign="top" rowspan="2" width="12%">
<a href="images/logo.jpg"><img src="images/mobileEye.jpg" width="80px" height="80px" border="0"/></a></td>
<td valign="top" align="right" rowspan="2" width="10%"><%@ include file="imgrotate.html" %></td>
</tr>
</table>
<%!
String MM_dbConn_STRING, MM_dbConn_STRING1,MM_dbConn_STRING2, MM_dbConn_DRIVER, MM_dbConn_USERNAME, MM_dbConn_PASSWORD;
%>
<%
//MM_dbConn_STRING="jdbc:mysql://203.199.134.128/db_gps";
//MM_dbConn_STRING1="jdbc:mysql://203.199.134.128/db_CustomerComplaints";
MM_dbConn_STRING="jdbc:mysql://172.16.8.17/db_gps";
MM_dbConn_STRING1="jdbc:mysql://172.16.8.17/db_CustomerComplaints";
MM_dbConn_STRING2="jdbc:mysql://172.16.8.17/db_avlalldata";
//MM_dbConn_STRING="jdbc:mysql://172.16.8.17/db_gps";
//MM_dbConn_STRING1="jdbc:mysql://172.16.8.17/db_CustomerComplaints";
//MM_dbConn_STRING2="jdbc:mysql://172.16.8.17/db_avlalldata";
//MM_dbConn_STRING="jdbc:mysql://203.199.134.128/db_gps";
//MM_dbConn_STRING1="jdbc:mysql://203.199.134.128/db_CustomerComplaints";
//MM_dbConn_STRING2="jdbc:mysql://203.199.134.128/db_avlalldata";
MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";
MM_dbConn_USERNAME="fleetview";
MM_dbConn_PASSWORD="1@flv";
//MM_dbConn_PASSWORD="";
%>
<% if(null==(String) session.getAttribute("user")) 
	{
             // JOptionPane.showMessageDialog(null,"SESSION EXPIRED??? Please Login!!!");
		response.sendRedirect("Login.jsp");
		return;
	} %>
</td> 
</tr>
</table>
</html>
<!-- header end here-->