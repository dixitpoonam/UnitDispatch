<%@page import="com.sun.xml.internal.bind.v2.TODO"%>
<%@ include file="headeradmin.jsp" %>
<%!
Connection con1, con2;
String[] peripherals_checked; 
%>
<%
Statement stmt1=null, stmt6=null, stmt7=null,  stmt2=null,stmt8=null,stmt9=null;
ResultSet rs2=null, rs4=null, rs5=null, rs6=null, rs9=null, rs11=null,rst8=null,rst9=null;
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
 stmt1=con1.createStatement();
 stmt2=con2.createStatement();
 stmt6=con1.createStatement();
 stmt7=con1.createStatement();  
 stmt8=con1.createStatement();
 stmt9=con2.createStatement();
String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql7="", sql8="", sql9="", sql10="", sql11="",sqll8,sqll9;
int maxid=0;

String unitid="", wmsnno="", moduleno="", simno="", mobno="", verifymobNo="",gpsno="", typeunit="", swver="", voice="", jrmbuz="", buz="", smartKey="", temp1="", temp2="",FM2200="";

String horn="",imeino="", scard="", box="",flowsen1="", flowsen2="", plain="", peripheral="", faultyunit="", unitphase="",door1="", door2="",corr="",corrinsrt="",battery="",powersupply="";
String battery1800="",battery950="";
String battery1050="";
int intmaxref=0, newref=0, refno=0, ref=0;

String uniddb="", simdb="", mobdb="", wmsndb="";
String user=session.getAttribute("typeval").toString();
String entby=session.getAttribute("user").toString();
System.out.println("Logged In User ID ---"+entby);

java.util.Date d=new java.util.Date();
String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();
String time=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());

   java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   String nwfrmtdte=formatter.format(datefrmdb);

/* ********************* get all the fileds from the form ******************* */
unitid=request.getParameter("unitid");
System.out.println("Unit IDDDD---->>>>"+unitid);
wmsnno=request.getParameter("wmsn");
moduleno=request.getParameter("module");
imeino=request.getParameter("imeino");
if(null==imeino || "".equalsIgnoreCase(imeino))
	imeino="-";
powersupply=request.getParameter("powersupply");
simno=request.getParameter("sim");
mobno=request.getParameter("mob");
verifymobNo=request.getParameter("chkmob");
if(verifymobNo==null)
	verifymobNo="-";
System.out.println("verifymobNo-->"+verifymobNo);
gpsno=request.getParameter("gps");
typeunit=request.getParameter("typ");
swver=request.getParameter("swver");


voice=request.getParameter("voice");
jrmbuz=request.getParameter("jrm");
buz=request.getParameter("buz");
smartKey=request.getParameter("smartKey");
temp1=request.getParameter("temp1");
temp2=request.getParameter("temp2");
door1=request.getParameter("door1");
door2=request.getParameter("door2");
horn=request.getParameter("horn");
scard=request.getParameter("scard");
flowsen1=request.getParameter("flow1");
flowsen2=request.getParameter("flow2");
plain=request.getParameter("plain");
FM2200=request.getParameter("FM2200");
battery=request.getParameter("battery");
battery950=request.getParameter("battery950");
battery1800=request.getParameter("battery1800");
battery1050=request.getParameter("battery1050"); 


peripherals_checked = request.getParameterValues("CheckBoxValue");




System.out.println(">>>>>>>>peripherals_checked>>>>>>"+peripherals_checked);

System.out.println(">>>>>>>>horn>>>>>>"+horn);
/*
if (peripherals_checked != null) 
{
   for (int i = 0; i < peripherals_checked.length; i++) 
   {
	   System.out.println(peripherals_checked.length);
	   if(i == (peripherals_checked.length-(peripherals_checked.length)))
	   {
		   peripheral = peripherals_checked[i];
		   System.out.println(peripherals_checked[i]);
		   System.out.println(peripheral);
	   }
	   else 
       {
	     System.out.println(peripherals_checked[i]);
	     peripheral = peripheral+"+"+peripherals_checked[i];
	     System.out.println(peripheral);
	   }
   }
}
*/
System.out.println(">>>>>>>>PERIPHERAl>>>>>>"+peripheral);

box=request.getParameter("box");
String FirmwareChanged=request.getParameter("FirmwareChanged");
String ModuleChanged=request.getParameter("ModuleChanged");
String pcbmod=request.getParameter("pcbmod");
String Power=request.getParameter("Power");
String mousecorrection=request.getParameter("mousecorrection");
String antennacorrection=request.getParameter("antennacorrection");
String Softwaresim=request.getParameter("Softwaresim");
String company=request.getParameter("comp");
String psno=request.getParameter("psno");
String pcbno=request.getParameter("pcbno");
String boxno=request.getParameter("boxno");
String batteryno=request.getParameter("batteryno");
String[] correct=request.getParameterValues("correct");
//out.print("hiiiiii"+correct.length);
for(int i=0; i<correct.length; i++)
 {
	if(i==0)
	{
		corr=correct[i];
		corrinsrt=corr;
	}
	else
	{
		corr=corr+", "+correct[i];
		corrinsrt=corr;
	}
    //out.print(correct[i]+",");     
 }
/* ************************************************************************** */
/* **************checking which peripherals were selected and generating one peripheral string *************** */

if(null==voice || voice.equals("null"))
     {
        peripheral="";
     }
     else
     {
        peripheral="Voice";
     }
  
     if(null==jrmbuz || jrmbuz.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+JRM+Buzzer";
       }
       else
       {
          peripheral=peripheral+"JRM+Buzzer";
       }
        
     }

     if(null==buz || buz.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+Buzzer Only";
       }
       else
       {
          peripheral=peripheral+"Buzzer Only";
       }
       
     } 
    
     if(null==smartKey || smartKey.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+Smart Key";
       }
       else
       {
          peripheral=peripheral+"Smart Key";
       }
       
     }
     
     if(null== FM2200 ||  FM2200.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+FM2200";
       }
       else
       {
          peripheral=peripheral+"FM2200";
       }
       
     }
     
     if(null==temp1 || temp1.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+1 Temp";
       }
       else
       {
          peripheral=peripheral+"1 Temp";
       }
     } 

     if(null==temp2 || temp2.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+2 Temp";
       }
       else
       {
          peripheral=peripheral+"2 Temp";
       }
      
     } 

     if(null==door1 || door1.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+1 Door";
       }
       else
       {
          peripheral=peripheral+"1 Door";
       }
       
     } 

     if(null==door2 || door2.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+2 Door";
       }
       else
       {
          peripheral=peripheral+"2 Door";
       }
       
     }
     
     if(null==horn || horn.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+Horn";
       }
       else
       {
          peripheral=peripheral+"Horn";
       }
       
     }

     if(null==scard || scard.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+Smart Card";
       }
       else
       {
          peripheral=peripheral+"Smart Card";
       }
       
     }
     
     

     if(null==flowsen1 || flowsen1.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+1 Flow Sensor";
       }
       else
       {
          peripheral=peripheral+"1 Flow Sensor";
       }
      
     }

     if(null==flowsen2 || flowsen2.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+2 Flow Sensor";
       }
       else
       {
          peripheral=peripheral+"2 Flow Sensor";
       }
       
     }

     if(null==plain || plain.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+Plain";
       }
       else
       {
          peripheral=peripheral+"Plain";
       }
       
     }
     
     if(null==battery || battery.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+With Battery";
       }
       else
       {
          peripheral=peripheral+"With Battery";
       }
       
     }
     if(null==battery950 || battery950.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+With 950mAh Battery";
       }
       else
       {
          peripheral=peripheral+"With 950mAh Battery";
       }
       
     }
     
     if(null==battery1800 || battery1800.equals("null"))
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+With 1800mAh Battery";
       }
       else
       {
          peripheral=peripheral+"With 1800mAh Battery";
       }
       
     }
     
     if(null==battery1050 || battery1050.equals("null"))
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+With 1050mAh Battery";
       }
       else
       {
          peripheral=peripheral+"With 1050mAh Battery";
       }
       
     }
   
     
     System.out.println(">>>>>>>>PERIPHERAl>>>>FINAL>>"+peripheral);
     
     
     
     
 /*************************************************************************** */


/* **************Giving each new peripheral combination a code & storing in database********** */
sql5="select * from t_periphcomb where Combination='"+peripheral+"' ";
rs5=stmt2.executeQuery(sql5);
System.out.println("sql5>>UNIT MANUFACTURE ENTRY perph code >"+sql5);

  if(rs5.next())
  {
     maxid=rs5.getInt("id");
  } 
  else
  {
    
    sql6="select max(id) from t_periphcomb ";
    rs6=stmt2.executeQuery(sql6);
    System.out.println("sql6>>UNIT MANUFACTURE ENTRY perph code >"+sql6);
    
    if(rs6.next())
    {
      maxid=rs6.getInt("max(id)");
      maxid=maxid+1;
    }
 
   
    
    sql7="insert into t_periphcomb (id, Combination) values ('"+maxid+"', '"+peripheral+"') ";
    System.out.println("sql7>>UNIT MANUFACTURE ENTRY perph code >"+sql7);
    
    stmt2.executeUpdate(sql7);
    
    String abc1=sql7.replace("'", "#");
	abc1=abc1.replace(",", "$");
	String str1="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc1+"')";	
	stmt2.executeUpdate(str1);
  } 
  
  System.out.println(">>>>>>>>maxid>>>>FINAL>>"+maxid);
  
  
/* ******************************************************************************** */

/* *********Checking whether SIM No, MOB No, WMSN no are already present. If the Unit id is already present it wont check there. ************* */

/* ****************************Checking whether Mob No or Sim ow WMSN is already present, without checking infront of unitId entered. ************************************* */
/*
sql9="select * from t_unitmaster where UnitId <> '"+unitid+"' and (SIMNo='"+simno+"' or MobNo='"+mobno+"' or WMSN='"+wmsnno+"') ";
// out.print(sql9);
rs9=stmt1.executeQuery(sql9);
if(rs9.next())
{
  uniddb=rs9.getString("UnitID");
  simdb=rs9.getString("SIMNo");
  mobdb=rs9.getString("MobNo");
  wmsndb=rs9.getString("WMSN");

  sql3="insert into t_dupunitman (UnitID, SimNo, MobNo, InstType, WMSN, GPS, Module, typeunit, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, User) values ('"+unitid+"', '"+simno+"', '"+mobno+"', 'New', '"+wmsnno+"', '"+gpsno+"', '"+moduleno+"', '"+typeunit+"', '"+voice+"', '"+jrmbuz+"', '"+buz+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+user+"') ";
   stmt5.executeUpdate(sql3);  

  response.sendRedirect("main.jsp?un="+uniddb+"&sim="+simdb+"&mob="+mobdb+"&wms="+wmsndb);
  return; 
} 
*/
    unitphase="New";
    sql11="select * from t_unitreceived where UnitId='"+unitid+"' ";
	rs11=stmt2.executeQuery(sql11);
	sqll9="select * from hwunittest where unitid='"+unitid+"'";
	 rst9=stmt9.executeQuery(sqll9);
	 sqll8="select * from t_unitreplacement where NewUnitID='"+unitid+"'";
	 rst8=stmt8.executeQuery(sqll8);
	if(rs11.next()||rst9.next()||rst8.next())
	{
		unitphase="Repaired";
	}
																																																																																																																																																																																																							
	System.out.println("unitid-&&&&---?"+unitid);
	String sqlch = "select * from db_gps.t_unitmaster where unitid='"+unitid+"'";
			ResultSet r = stmt8.executeQuery(sqlch);
			if(r.next()){
				response.sendRedirect("main.jsp?un="+uniddb+"&sim="+simno+"&mob="+mobno+"&wms="+wmsnno);
				  return;
			}
   
	sql1="insert into t_unitmaster (EntDate, UnitID, SimNo, MobNo, InstType, WMSN, Module, GPS, typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, Peripherals, PeriphCode, User, HoldBy, EntBy,EntTime,FirmwareChanged,ModulePCBChanged,PCBmodification,PowerSupplyChanged,GPSMouseChanged,GSMAntennaChanged,SoftwareSimCorrections,SimCompany,OtherCorrections,Mobile_verified,Box_type,PSNo,PCBNo,BoxNo,BatteryNo,IMEINo,power_supply) values ('"+nwfrmtdte+"', '"+unitid+"', '"+simno+"', '"+mobno+"', '"+unitphase+"', '"+wmsnno+"', '"+moduleno+"', '"+gpsno+"', '"+typeunit+"', '"+swver+"', '"+voice+"', '"+jrmbuz+"', '"+buz+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+peripheral+"', '"+maxid+"', '"+user+"', '"+user+"', '"+entby+"','"+time+"','"+FirmwareChanged+"','"+ModuleChanged+"','"+pcbmod+"','"+Power+"','"+mousecorrection+"','"+antennacorrection+"','"+Softwaresim+"','"+company+"','"+corrinsrt+"','"+verifymobNo+"','"+box+"','"+psno+"','"+pcbno+"','"+boxno+"','"+batteryno+"','"+imeino+"','"+powersupply+"')";
     stmt6.executeUpdate(sql1); 
	System.out.println(sql1);
    String abc1=sql1.replace("'", "#");
  	abc1=abc1.replace(",", "$");
  	String str1="insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abc1+"')";	
  	stmt6.executeUpdate(str1);
      System.out.println("Unitid -->"+unitid);
     sql4="select Rno from t_unitmaster where UnitId='"+unitid+"' ";	
     rs4=stmt1.executeQuery(sql4);	
     if(rs4.next())	
     {
		newref=rs4.getInt("Rno");	
     }

     sql10="insert into t_unitmasterhistory (Rno, EntDate, UnitID, SimNo, MobNo, InstType, WMSN, Module, GPS, typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, Peripherals, PeriphCode, User, HoldBy, EntBy,EntTime,FirmwareChanged,ModulePCBChanged,PCBmodification,PowerSupplyChanged,GPSMouseChanged,GSMAntennaChanged,SoftwareSimCorrections,SimCompany,OtherCorrections,Mobile_verified,Box_type,PSNo,PCBNo,BoxNo,BatteryNo,IMEINo,power_supply) values ('"+newref+"', '"+nwfrmtdte+"', '"+unitid+"', '"+simno+"', '"+mobno+"', '"+unitphase+"', '"+wmsnno+"', '"+moduleno+"', '"+gpsno+"', '"+typeunit+"', '"+swver+"', '"+voice+"', '"+jrmbuz+"', '"+buz+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+peripheral+"', '"+maxid+"', '"+user+"', '"+user+"', '"+entby+"','"+time+"','"+FirmwareChanged+"','"+ModuleChanged+"','"+pcbmod+"','"+Power+"','"+mousecorrection+"','"+antennacorrection+"','"+Softwaresim+"','"+company+"','"+corrinsrt+"','"+verifymobNo+"','"+box+"','"+psno+"','"+pcbno+"','"+boxno+"','"+batteryno+"','"+imeino+"','"+powersupply+"')";
     stmt7.executeUpdate(sql10);

     String abc2=sql10.replace("'", "#");
   	abc2=abc2.replace(",", "$");
   	String str2="insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abc2+"')";	
   	stmt7.executeUpdate(str2);
   	
   	//:TODO - Code For Conferm Manufacturing Of the unit ID in t_serialization
   	String UnitSerialization = "UPDATE t_unitserialization SET STATUS = 'MANUFACTURED' WHERE UNITID = '"+unitid+"'";
   	stmt7.executeUpdate(UnitSerialization);
   	
   	
/* *************************************************************************************** */    
   response.sendRedirect("main.jsp?inserted=yes");
    return; 
  // outer else 
} catch(Exception e) { out.println("Exception----->" +e); }
finally
{
	try {
		if(rs6!=null)
			rs6.close();
		if(rs2!=null)
			rs2.close();
		if(rs9!=null)
			rs9.close();
		if(rs4!=null)
			rs4.close();
		if(rs5!=null)
			rs5.close();
		if(rs11!=null)
			rs11.close();
		if(rst8!=null)
			rst8.close();
		if(rst9!=null)
			rst9.close();
		if(stmt1!=null)
			stmt1.close();
		if(stmt6!=null)
			stmt6.close();
		if(stmt7!=null)
			stmt7.close();
		if(stmt8!=null)
			stmt8.close();
		if(stmt9!=null)
			stmt9.close();
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
