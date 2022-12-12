<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
String MM_dbConn_STRING, MM_dbConn_STRING1,MM_dbConn_STRING2, MM_dbConn_DRIVER, MM_dbConn_USERNAME, MM_dbConn_PASSWORD;
%>

<%


//MM_dbConn_STRING="jdbc:mysql://172.16.8.171.55/db_gps";
//MM_dbConn_STRING1="jdbc:mysql://172.16.8.171.55/db_CustomerComplaints";
//MM_dbConn_STRING2="jdbc:mysql://172.16.8.171.55/db_avlalldata";


MM_dbConn_STRING="jdbc:mysql://172.16.8.17/db_gps";
MM_dbConn_STRING1="jdbc:mysql://172.16.8.17/db_CustomerComplaints";
MM_dbConn_STRING2="jdbc:mysql://172.16.8.17/db_AVLALLDATA";




MM_dbConn_DRIVER="org.gjt.mm.mysql.Driver";

MM_dbConn_USERNAME="fleetview";

MM_dbConn_PASSWORD="1@flv";


%>
<%
Connection con1,con2;
Statement stmt1=null, stmt6=null, stmt7=null,  stmt2=null,stmt8=null,stmt9=null,stquery1=null,stquery2=null;
ResultSet rs1=null,rs2=null, rs4=null, rs5=null, rs6=null, rs9=null, rs11=null,rst8=null,rst9=null;
java.util.Date d=new java.util.Date();
String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();

java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
Format formatter=new SimpleDateFormat("yyyy-MM-dd");
String nwfrmtdte=formatter.format(datefrmdb);
try{
	 Class.forName(MM_dbConn_DRIVER);
	 con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	 con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	 stmt1=con1.createStatement();
	 stmt2=con2.createStatement();
	 stmt6=con1.createStatement();
	 stmt7=con1.createStatement();  
	 stmt8=con1.createStatement();
	 stmt9=con2.createStatement();
	 stquery1=con2.createStatement();
	 stquery2=con1.createStatement();
	
	 String addinsrt="castemp";
	 int i=1;
	 String sql="Select * from t_CastrolEast where CellNo <> '-' or Address <> '-'";
	 rs1=stmt1.executeQuery(sql);
	 while(rs1.next())
	 {
		 String name = rs1.getString("name");
		 String address = rs1.getString("address");
		 int maxreqno=0;
		 
		 String sql2="select max(Reqno) from t_unitorder ";
		 ResultSet rs15=stmt2.executeQuery(sql2);
		 while(rs15.next())
		 {
		   maxreqno=rs15.getInt("max(Reqno)");
		 }
		   maxreqno=maxreqno+1; 

		 /* ***********************************Inserting into DB*************************** */

		 String sql1="insert into t_unitorder (Reqno, Reqto, ReqDate, TypofUnit, NoofUnits, RemUnits, Peripherals, InsType, DispatchAdd, Cust, Tech, DispDate,Status,Reqby) values ('"+maxreqno+"', 'Transworld','"+nwfrmtdte+"','SMTP','1', '1', 'Plain', 'New', '"+addinsrt+i+"','Castrol', '-', '"+nwfrmtdte+"','Open','bhushantemp') "; 
		 System.out.print(sql1);
		 stmt9.executeUpdate(sql1);
		 
		 String abc1=sql1.replace("'","#");
		  	abc1=abc1.replace(",","$");
		  	stquery1.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc1+"')");
		 
		 
		 
		 String sql3="INSERT INTO `db_CustomerComplaints`.t_dispatchaddress (Tech ,Address,MobNo,Location)VALUES ('', '"+name+address+"', '-', '"+addinsrt+i+"')";
		 System.out.print(sql3);
		 stmt6.executeUpdate(sql3);
		 
		 String abc2=sql3.replace("'","#");
		  	abc2=abc2.replace(",","$");
		  	stquery2.executeUpdate("insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abc2+"')");
		 
		 
		i++;
	 }
	 
}catch(Exception ex){ 
//	
	System.out.println("ex"+ex);
}
//
%>
</body>
</html>