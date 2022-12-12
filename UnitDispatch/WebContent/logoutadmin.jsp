<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>

<%@ include file="Connections/dbConn.jsp" %>
<%

session.invalidate();
response.sendRedirect("Login.jsp");

%>

