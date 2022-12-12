<!-- 
  Module Name : User Validation
  Creator : Azhar G B
  Date of Creation : 20/07/08
  Modifier : shoaib bagwan	
  Date of Modification : 30-06-12
  Reason of Modification :
  Description : This page won't be visible. On this page it is being checked that whether user who logs is valid or not -->
<%@ include file="/Connections/conn.jsp" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<body>
<%! Connection con1;
  String empname="";
%>
<%  
String s1=request.getParameter("uname");
String s2=request.getParameter("adpass");
Statement stmt1=null;
ResultSet rs1=null;
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
stmt1=con1.createStatement();
String sql1="select * from t_admin where UName='"+s1+"' and pass='"+s2+"' and Active='Yes' ";
out.println(sql1);
rs1=stmt1.executeQuery(sql1);
if(rs1.next())
{
  empname=rs1.getString("Name");
  String manuf=rs1.getString("URole");
  String userType = rs1.getString("UserType");
  String typeval=rs1.getString("TypeValue");
  session.setAttribute("urole",manuf);
  session.setAttribute("userType",userType);
  session.setAttribute("user",s1);
  session.setAttribute("typeval",typeval);
  System.out.println("User Type--"+userType);
  System.out.println("typeval--"+typeval);
  if(manuf.equals("manufacturer"))
  {
     response.sendRedirect("main.jsp?&empname="+empname);
     return;
  }
  //else if(manuf.equals("administrator"))
  else if(manuf.equals("administrator"))
  {
     response.sendRedirect("main.jsp?&empname="+empname);
     return;
  }
  else if(manuf.equals("sales"))
  {
     response.sendRedirect("viewdispatch.jsp?&empname="+empname);
     return;
  }
  else
  {
    response.sendRedirect("Login.jsp?chkvalidity=No");
    return;
  }
}
else
{
   response.sendRedirect("Login.jsp?chkvalidity=No");
}
} catch(Exception e) {}
finally
{
	try {
		if(rs1!=null)
			rs1.close();
		if(stmt1!=null)
			stmt1.close();
		if(con1!=null)
			con1.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
%>
</body>
</html>