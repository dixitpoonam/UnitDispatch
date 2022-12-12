<%@ include file="headeradmin.jsp" %>
<%!
Connection con1, con2;
%>
<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement(), stmt2=con2.createStatement(), stmt3=con2.createStatement();
ResultSet rs2=null, rs3=null, rs5=null, rs7=null, rs9=null, rs11=null;
String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql7="", sql8="", sql9="", sql10="", sql11="", sql12="", sql13="";
String battery1800="",battery950="";
String battery1050="",powersupply="";
String unitid="", wmsnno="", moduleno="", simno="", mobno="",verifymobNo="",boxtype="", gpsno="", typeunit="", swver="", voice="", jrmbuz="", buz="", temp1="", temp2="", door1="", door2="", horn="", scard="",battery="", flowsen1="", flowsen2="", plain="", peripheral="",smartkey="";
String uniddb="", simdb="", mobdb="", wmsndb="", uniddb1="", simdb1="", mobdb1="", wmsndb1="", uniddb2="", simdb2="", mobdb2="", wmsndb2="", uniddb3="", simdb3="", mobdb3="", wmsndb3="", newrepradio="", commentchange="";
String insttype="",corr=null,corrinsrt=null;
int refno=0, maxid=0;

String user=session.getAttribute("user").toString();
String ustyp=session.getAttribute("urole").toString();
String typevalue=session.getAttribute("typeval").toString();

String oldunid=request.getParameter("oldunid");
String time=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
java.util.Date d=new java.util.Date();
String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();


   java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   String nwfrmtdte=formatter.format(datefrmdb);

/* *************Getting values from previous page***********8************* */

unitid=request.getParameter("unitid");
wmsnno=request.getParameter("wmsn");
moduleno=request.getParameter("module");
simno=request.getParameter("sim");
mobno=request.getParameter("mob").trim();
verifymobNo=request.getParameter("chkmob");
if(verifymobNo==null)
	verifymobNo="-";
gpsno=request.getParameter("gps");
typeunit=request.getParameter("typ");
swver=request.getParameter("swver");
voice=request.getParameter("voice");
jrmbuz=request.getParameter("jrm");
buz=request.getParameter("buz");
temp1=request.getParameter("temp1");
temp2=request.getParameter("temp2");
door1=request.getParameter("door1");
door2=request.getParameter("door2");
horn=request.getParameter("horn");
scard=request.getParameter("scard");
flowsen1=request.getParameter("flow1");
flowsen2=request.getParameter("flow2");
plain=request.getParameter("plain");
battery=request.getParameter("battery");
battery950=request.getParameter("battery950");
battery1800=request.getParameter("battery1800");
battery1050=request.getParameter("battery1050");
smartkey = request.getParameter("smartkey");
//System.out.println("smart key"+ smartkey);
newrepradio=request.getParameter("newrep");
commentchange=request.getParameter("commentchange");
boxtype=request.getParameter("box");
powersupply=request.getParameter("powersupply");
out.print("newrepradio="+newrepradio);

String FirmwareChanged=request.getParameter("FirmwareChanged");
String ModuleChanged=request.getParameter("ModuleChanged");
String pcbmod=request.getParameter("pcbmod");
String Power=request.getParameter("Power");
String mousecorrection=request.getParameter("mousecorrection");
String antennacorrection=request.getParameter("antennacorrection");
String Softwaresim=request.getParameter("Softwaresim");
String company=request.getParameter("comp");
String[] correct=request.getParameterValues("correct");
String PSNo=request.getParameter("psno");
String PCBNo=request.getParameter("pcbno");
String BoxNo=request.getParameter("boxno");
String BatteryNo=request.getParameter("batteryno");
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

/* *************Checking which peripherals were selected****************** */
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
     
     if(null==smartkey || smartkey.equals("null"))
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+Smart key";
       }
       else
       {
          peripheral=peripheral+"Smart key";
       }
       
     }

/* ************************************************************************** */

/* *******Checking for new peripheral combination and accordingly insert into table************ */

sql11="select * from t_periphcomb where Combination='"+peripheral+"' ";
rs11=stmt3.executeQuery(sql11);
  if(rs11.next())
  {
     maxid=rs11.getInt("id");
  } 
  else
  {
    
    sql11="select max(id) from t_periphcomb ";
    rs11=stmt3.executeQuery(sql11);
    if(rs11.next())
    {
      maxid=rs11.getInt("max(id)");
      maxid=maxid+1;
    }
 
    sql12="insert into t_periphcomb (id, Combination) values ('"+maxid+"', '"+peripheral+"') ";
    stmt2.executeUpdate(sql12);
    
    String abc2=sql12.replace("'", "#");
	abc2=abc2.replace(",", "$");
	String str5="insert into t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc2+"')";	
	stmt1.executeUpdate(str5);
  } 
/* *********************************************************************************** */

sql2="select Rno, InstType from t_unitmaster where UnitID='"+oldunid+"' ";
out.println(sql2);
rs2=stmt1.executeQuery(sql2);
if(rs2.next())
{
  refno=rs2.getInt("Rno");
   insttype=rs2.getString("InstType");
}

/* ******Assigning value to InstType.If New?repaired button is not selected, then take value from DB************* */
  if(null==newrepradio || newrepradio.equals("null"))
  {
	newrepradio=insttype;
  }
  else
  {
  }
/* *********************************************************************************** */


/* ***********Checking for duplicate Mob No, SIM No, WMSN No, UniID***************************** */

sql3="select * from t_unitmaster where UnitID='"+unitid+"' and Rno<>'"+refno+"' ";
//out.println(sql3);
rs3=stmt1.executeQuery(sql3);
if(rs3.next())
{
  //out.println("Duplicate");
  uniddb=rs3.getString("UnitID");
  simdb=rs3.getString("SIMNo");
  mobdb=rs3.getString("MobNo");
  wmsndb=rs3.getString("WMSN");
 

 sql4="insert into t_dupunitman (UnitID, SimNo, MobNo, InstType, WMSN, Module, GPS, typeunit, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, User) values ('"+unitid+"', '"+simno+"', '"+mobno+"', '"+newrepradio+"', '"+wmsnno+"', '"+moduleno+"', '"+gpsno+"', '"+typeunit+"', '"+voice+"', '"+jrmbuz+"', '"+buz+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+user+"') ";
stmt1.executeUpdate(sql4);

String abc2=sql4.replace("'", "#");
abc2=abc2.replace(",", "$");
String str5="insert into t_sqlquery(dbname,query)values('db_gps','"+abc2+"')";	
stmt1.executeUpdate(str5);

  response.sendRedirect("editpage.jsp?un="+uniddb+"&sim="+simdb+"&mob="+mobdb+"&wms="+wmsndb);
  return; 
}
else
{
}
out.print("INSTTYPE="+newrepradio);

sql7="select * from t_unitmaster where WMSN='"+wmsnno+"' and Rno<>'"+refno+"' ";
//out.println(sql7);
rs7=stmt1.executeQuery(sql7);
if(rs7.next())
{
  //out.println("Duplicate");
  uniddb2=rs7.getString("UnitID");
  simdb2=rs7.getString("SIMNo");
  mobdb2=rs7.getString("MobNo");
  wmsndb2=rs7.getString("WMSN");

 sql8="insert into t_dupunitman (UnitID, SimNo, MobNo, InstType, WMSN, Module, GPS, typeunit, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, User) values ('"+unitid+"', '"+simno+"', '"+mobno+"', '"+newrepradio+"', '"+wmsnno+"', '"+moduleno+"', '"+gpsno+"', '"+typeunit+"', '"+voice+"', '"+jrmbuz+"', '"+buz+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+user+"') ";
stmt1.executeUpdate(sql8);

String abc2=sql8.replace("'", "#");
abc2=abc2.replace(",", "$");
String str5="insert into t_sqlquery(dbname,query)values('db_gps','"+abc2+"')";	
stmt1.executeUpdate(str5);


  response.sendRedirect("editpage.jsp?un="+uniddb2+"&sim="+simdb2+"&mob="+mobdb2+"&wms="+wmsndb2);
  return; 
  
}
else
{
}

sql9="select * from t_unitmaster where SimNo='"+simno+"' and Rno<>'"+refno+"' ";
//out.println(sql9);
rs9=stmt1.executeQuery(sql9);
if(rs9.next())
{
  //out.println("Duplicate");
  uniddb3=rs9.getString("UnitID");
  simdb3=rs9.getString("SIMNo");
  mobdb3=rs9.getString("MobNo");
  wmsndb3=rs9.getString("WMSN");

 sql10="insert into t_dupunitman (UnitID, SimNo, MobNo, InstType, WMSN, Module, GPS, typeunit, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, User) values ('"+unitid+"', '"+simno+"', '"+mobno+"', '"+newrepradio+"', '"+wmsnno+"', '"+moduleno+"', '"+gpsno+"', '"+typeunit+"', '"+voice+"', '"+jrmbuz+"', '"+buz+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+user+"') ";
stmt1.executeUpdate(sql10);



String abc2=sql10.replace("'", "#");
abc2=abc2.replace(",", "$");
String str5="insert into t_sqlquery(dbname,query)values('db_gps','"+abc2+"')";	
stmt1.executeUpdate(str5);

  response.sendRedirect("editpage.jsp?un="+uniddb3+"&sim="+simdb3+"&mob="+mobdb3+"&wms="+wmsndb3);
  return; 
  
}
else
{
}

sql5="select * from t_unitmaster where MobNo='"+mobno+"' and Rno<>'"+refno+"' ";
//out.println(sql5);
rs5=stmt1.executeQuery(sql5);
if(rs5.next())
{
  //out.println("Duplicate");
  uniddb1=rs5.getString("UnitID");
  simdb1=rs5.getString("SIMNo");
  mobdb1=rs5.getString("MobNo");
  wmsndb1=rs5.getString("WMSN");

 sql6="insert into t_dupunitman (UnitID, SimNo, MobNo, InstType, WMSN, Module, GPS, typeunit, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, User) values ('"+unitid+"', '"+simno+"', '"+mobno+"', '"+newrepradio+"', '"+wmsnno+"', '"+moduleno+"', '"+gpsno+"', '"+typeunit+"', '"+voice+"', '"+jrmbuz+"', '"+buz+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+user+"') ";
stmt1.executeUpdate(sql6);


String abc2=sql6.replace("'", "#");
abc2=abc2.replace(",", "$");
String str5="insert into t_sqlquery(dbname,query)values('db_gps','"+abc2+"')";	
stmt1.executeUpdate(str5);

  response.sendRedirect("editpage.jsp?un="+uniddb1+"&sim="+simdb1+"&mob="+mobdb1+"&wms="+wmsndb1);
  return; 
  
}
else
{
}
/* ***************************************************************************************** */

  sql1="update t_unitmaster set EntDate='"+nwfrmtdte+"',EntTime='"+time+"', "+
  			"UnitID='"+unitid+"', SimNo='"+simno+"', MobNo='"+mobno+"', InstTypeNew='"+newrepradio+"',"+
  			" CommentOfEdit='"+commentchange+"', EditedBy='"+user+"',   InstType='"+newrepradio+"', "+
  			"WMSN='"+wmsnno+"', Module='"+moduleno+"', GPS='"+gpsno+"', typeunit='"+typeunit+"', "+
  			"SwVer='"+swver+"', PVoice='"+voice+"', PJrmBuzz='"+jrmbuz+"', PBuzzer='"+buz+"', PTemp1='"+temp1+"',"+
  			" PTemp2='"+temp2+"', PDoor1='"+door1+"', PDoor2='"+door2+"', PHorn='"+horn+"', "+
  			"PScard='"+scard+"', PFlowSen1='"+flowsen1+"', PFlowSen2='"+flowsen2+"', Plain='"+plain+"',"+
  			" Peripherals='"+peripheral+"', PeriphCode='"+maxid+"' ,FirmwareChanged='"+FirmwareChanged+"',"+
  			"ModulePCBChanged='"+ModuleChanged+"',PCBmodification='"+pcbmod+"',PowerSupplyChanged='"+Power+"',"+
  			"GPSMouseChanged='"+mousecorrection+"',GSMAntennaChanged='"+antennacorrection+"',"+
  			"SoftwareSimCorrections='"+Softwaresim+"',SimCompany='"+company+"',OtherCorrections='"+corrinsrt+"',"+
  			"EntBy='"+user+"',Box_type='"+boxtype+"',Mobile_verified='"+verifymobNo+"',PSNo='"+PSNo+"',PCBNo='"+PCBNo+"',"+
  			"BoxNo='"+BoxNo+"',BatteryNo='"+BatteryNo+"',Power_Supply='"+powersupply+"' where UnitID='"+oldunid+"' ";
//out.println(sql1);																																																																																																																																																																																										
int i=stmt1.executeUpdate(sql1);
//out.print("Count is=" +i);
 String abc2=sql1.replace("'", "#");
	abc2=abc2.replace(",", "$");
	String str5="insert into t_sqlquery(dbname,query)values('db_gps','"+abc2+"')";	
	stmt1.executeUpdate(str5);

  sql13="insert into t_unitmasterhistory "+
  			"(Rno,EntDate, UnitID, SimNo, MobNo, InstType, InstTypeNew, CommentOfEdit, EditedBy,"+
  			"WMSN, Module, GPS, typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1,"+
  			" PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, Peripherals, PeriphCode,"+
  			" User,EntTime,FirmwareChanged,ModulePCBChanged,PCBmodification,PowerSupplyChanged,"+
  			"GPSMouseChanged,GSMAntennaChanged,SoftwareSimCorrections,SimCompany,OtherCorrections,"+
  			"EntBy,Mobile_verified,Box_type,PSNo,PCBNo,BoxNo,BatteryNo,Power_Supply)"+
  			" values ('"+refno+"','"+nwfrmtdte+"', '"+unitid+"', '"+simno+"', '"+mobno+"', '"+newrepradio+"', "+
  			"'"+newrepradio+"', '"+commentchange+"', '"+user+"', '"+wmsnno+"', '"+moduleno+"', '"+gpsno+"', '"+typeunit+"', "+
  			"'"+swver+"', '"+voice+"', '"+jrmbuz+"', '"+buz+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"',"+
  			" '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+peripheral+"', '"+maxid+"', '"+typevalue+"','"+time+"',"+
  			"'"+FirmwareChanged+"','"+ModuleChanged+"','"+pcbmod+"','"+Power+"','"+mousecorrection+"','"+antennacorrection+"',"+
  			"'"+Softwaresim+"','"+company+"','"+corrinsrt+"','"+user+"','"+verifymobNo+"','"+boxtype+"'"+
  			",'"+PSNo+"','"+PCBNo+"','"+BoxNo+"','"+BatteryNo+"','"+powersupply+"')";
  //out.print(sql13);
  stmt1.executeUpdate(sql13);
  
  String abc3=sql13.replace("'", "#");
	abc3=abc3.replace(",", "$");
	String str6="insert into t_sqlquery(dbname,query)values('db_gps','"+abc3+"')";	
	stmt1.executeUpdate(str6);
  
  
con1.close();
con2.close();

response.sendRedirect("testedunits.jsp?inserted=yes");
return;
} catch(Exception e) { out.println("Exception----->" +e); }

finally
{


}
%>

