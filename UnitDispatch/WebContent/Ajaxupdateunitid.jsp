<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Connections/conn.jsp" %>


<%
Connection con=null,con1=null;
String enterby=session.getAttribute("user").toString();
System.out.println("********************"+enterby);
String unitid=request.getParameter("unitid");
String trackfiledate=request.getParameter("trackfiledate");
System.out.println("trackfiledate-->"+trackfiledate);
java.util.Date dt=new java.util.Date();
String datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dt);
String entdte="",enttime="",QuickTestDate="",RecievedDate="",ManufactureCount="", unit="",Status="",boxtype="", simno="",simco="", mobno="", insttyp="", wmsn="", module="", gps="", typun="", swver="", voice="", jrmbuzz="", buzzer="", temp1="", temp2="", door1="", door2="", horn="", scard="", flowsen1="", flowsen2="", plain="", peripherals="", barcode="", user="";
int  rno=0, periphcode=0;
int TrackFileCount=0;
System.out.println("unitid"+unitid);
String msg="";
try
{
	Class.forName(MM_dbConn_DRIVER);
	con=DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con1=DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	Statement stmt=null,stmt1,stmt2,stQuickTest,stTrackFile,stmanufactureCount,stmt1111,stRecieved;
	stmt=con.createStatement();
	stmt1111=con.createStatement();
	stmt1=con.createStatement();
	stmt2=con.createStatement();
	stQuickTest=con1.createStatement();
	stRecieved=con1.createStatement();
	stTrackFile=con.createStatement();
	stmanufactureCount=con.createStatement();
	try{
	String sqlRecieved="Select * from t_unitreceived where UnitID='"+unitid+"' and TypeValue='2' and Status<>'Deleted' and InTransit<>'Yes' order by Rdate desc limit 1";
	ResultSet rsRecieved=stRecieved.executeQuery(sqlRecieved);
	if(rsRecieved.next()){
		RecievedDate=rsRecieved.getString("Rdate");
		System.out.println("RecievedDate--->"+RecievedDate);
	}
	}catch(Exception e){
		
	}
	try{
	String sqlQuickTest="select TheDate  from db_CustomerComplaints.hwunittest where UnitID='"+unitid+"' and TheDate>='"+RecievedDate+"'order by TheDate ASC limit 1";
	ResultSet rsQuickTest=stQuickTest.executeQuery(sqlQuickTest);
	System.out.println("sqlQuickTest--->"+sqlQuickTest);
	if(rsQuickTest.next()){
		QuickTestDate=rsQuickTest.getString("TheDate");
		System.out.println("QuickTestDate--->"+QuickTestDate);
	}
	}catch(Exception e){
		
	}
	try{
	String sqltrackfile="select count(*) as trackFileCount from db_gps.t_ftpdump where UnitID='"+unitid+"' and StoredDateTime>='"+QuickTestDate+" 00:00:00'";
	ResultSet rsTrackFile=stTrackFile.executeQuery(sqltrackfile);
	System.out.println("sqlQuickTest--->"+sqltrackfile);
	if(rsTrackFile.next()){
		TrackFileCount=rsTrackFile.getInt("trackFileCount");
		System.out.println("TrackFileCount--->"+TrackFileCount);
	}
	}catch(Exception e){
		e.printStackTrace();
	}
	try{
	String sqlmanufactureCount="select count(*) as manufactureCount from db_gps.t_unitmasterhistory  where EntDate>='"+QuickTestDate+"' and UnitID='"+unitid+"'";
	ResultSet rsManufactureCount=stmanufactureCount.executeQuery(sqlmanufactureCount);
	if(rsManufactureCount.next()){
		ManufactureCount=rsManufactureCount.getString("manufactureCount");
		System.out.println("ManufactureCount--->"+ManufactureCount);
	}}
	catch(Exception e){
		
	}
	String sql="Update t_unitmaster set testedunit='Yes',Status='Tested', Tested_by='"+enterby+"',TesetdDateTime='"+datetime+"',TrackFileCount='"+TrackFileCount+"',ManufactureCount='"+ManufactureCount+"',trackfiledate='"+trackfiledate+"' where UnitID='"+unitid+"'";
//	System.out.println(sql);
	int i=stmt1111.executeUpdate(sql);
	
	if(!(i==0))
	{
	String abc=sql.replace("'", "#");
	abc=abc.replace(",", "$");
	String str2="insert into t_sqlquery(dbname,query)values('db_gps','"+abc+"')";	
	stmt.executeUpdate(str2);
	}
	//System.out.println("i-->>"+i);
	//System.out.println("Updated Successfully.........");
	if(!(i==0))
		msg="Updated Successfully.........";
	else
		msg="The Unit was not Updated";
	
	
 String sql3="insert into t_unitmasterhistory (Rno,EntDate,EntTime,UnitID,SimNo,SimCompany,MobNo,InstType,InstTypeNew,WMSN,Module,GPS,typeunit,SwVer,PVoice,PJrmBuzz,PBuzzer,PTemp1,PTemp2,PDoor1,PDoor2,PHorn,PScard,PFlowSen1,PFlowSen2,Plain,Peripherals,PeriphCode,User,RecBy,HoldBy,EntBy,testedunit,Mobile_verified,Box_type,Tested_by,TesetdDateTime,TrackFileCount,ManufactureCount,trackfiledate,Status)  Select Rno,EntDate,EntTime,UnitID,SimNo,SimCompany,MobNo,InstType,InstTypeNew,WMSN,Module,GPS,typeunit,SwVer,PVoice,PJrmBuzz,PBuzzer,PTemp1,PTemp2,PDoor1,PDoor2,PHorn,PScard,PFlowSen1,PFlowSen2,Plain,Peripherals,PeriphCode,User,RecBy,HoldBy,EntBy,testedunit,Mobile_verified,Box_type,Tested_by,TesetdDateTime,TrackFileCount,ManufactureCount,trackfiledate,Status from t_unitmaster where unitid='"+unitid+"' order by `EntDate` desc, `EntTime` desc limit 1";
 // out.print(sql3);
   stmt1.executeUpdate(sql3); 
   
   String abc1=sql3.replace("'", "#");
	abc1=abc1.replace(",", "$");
	String str3="insert into t_sqlquery(dbname,query)values('db_gps','"+abc1+"')";	
	stmt.executeUpdate(str3);
   
	//System.out.println(msg.length());
	out.print(msg);
}catch(Exception e)
{
	System.out.println("Error in connection--->>"+e);
}



%>
