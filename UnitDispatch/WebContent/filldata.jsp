<%@ include file="headeradmin.jsp" %>

<%! Connection con1;
%>

<%
try
{
  Driver MM_driverUser = (Driver)Class.forName("org.gjt.mm.mysql.Driver").newInstance();
  con1 = DriverManager.getConnection("jdbc:mysql://172.16.8.17/db_gps","fleetview","1@flv");

  Statement stmt1=con1.createStatement();
  ResultSet rs1=null, rs2=null;
  String sql1="", sql2="";

}catch(Exception e)
 {
   out.print("Exception----->"+e); 
 }

finally
{
   con1.close();
}
%>
