<%@ include file="headeradmin.jsp" %>

<%!
Connection con1;
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement();

String sql1="";
String user="", pass="";
int i=0;

user=session.getValue("user").toString();
String urole=session.getValue("urole").toString();
pass=request.getParameter("newpass");
out.print(pass);

sql1="update t_admin set pass='"+pass+"' where UName='"+user+"'  and URole='"+urole+"' ";
stmt1.executeUpdate(sql1);


String abc=sql1.replace("'", "#");
abc=abc.replace(",", "$");
String str2="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc+"')";	
stmt1.executeUpdate(str2);


response.sendRedirect("main.jsp?changed=yes");
return;

 } catch(Exception e) { out.println("Exception----->" +e); }

finally
{
con1.close();
}
%>
