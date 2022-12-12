<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>

<%@ include file="Connections/conn.jsp" %>

<%!
Connection con1,con2;
%>

<%
Statement stmt1=null,stmt2=null,st=null;
ResultSet rs1=null,rs2=null,rs3=null;
// This page is called from main.jsp
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
st=con1.createStatement();
 stmt1=con1.createStatement();
 stmt2=con2.createStatement();
 rs1=null;
 rs2=null;
 rs3=null;
String sql1="",sql2="",sql3="";
String mobno="", simno="", wmsndb="", unitdb="", simnodb="", mobnodb="", status="",insttype=""; 
String param=request.getParameter("param");
String unitid=request.getParameter("unitid");
String sysdate=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
if(param.equals("unit"))
{
	
	
        sql1="select * from t_PMFmaster where UnitID='"+unitid+"' ";
           // out.print(sql1);
            rs1=stmt2.executeQuery(sql1);
            if(rs1.next())
	{
               
               // out.print(insttype);
                %>
                    <table border="0" width="100%" >
                        <tr>
                        <td align="center"> 
                            <font color="maroon" size="2" > The Unit <%=unitid%> is already Present !!</b></font>
                        </td><input type="hidden" name="statchk" id="statchk" value="Yes" />
                        </tr> 
                   </table>
              <%	
		
         }
}

} catch(Exception e) {out.println(e);}

finally
{
	try {
		if(rs1!=null)
			rs1.close();
		if(rs2!=null)
			rs2.close();
		if(rs3!=null)
			rs3.close();
		if(stmt1!=null)
			stmt1.close();
		if(stmt2!=null)
			stmt2.close();
		if(con1!=null)
			con1.close();
		if(con2!=null)
			con2.close();
	} catch (SQLException e) {

		e.printStackTrace();
	}
}

%>

