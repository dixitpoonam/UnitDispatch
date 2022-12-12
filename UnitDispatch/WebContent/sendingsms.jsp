<%@ include file="Connections/conn.jsp" %>

<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>

<%
try {

String v1=request.getParameter("outLogin");
String v2=request.getParameter("outPWD");
String v3=request.getParameter("outMSG");
String v4=request.getParameter("outNumber");
String v5=request.getParameter("sign");

String queryString = "?outLogin="+v1+"&outPWD="+v2+"&outMSG="+v3+"&outNumber="+v4+"&sign="+v5;

	response.sendRedirect("http://india.timessms.com/receiverCommon.asp"+queryString);

//out.print("hi");

} catch(Exception e) {out.println(e);}

finally
{

}

%>

