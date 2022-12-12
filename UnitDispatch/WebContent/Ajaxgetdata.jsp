
<%@ page import="java.util.*" language="java" %>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>

<%@ include file="Connections/conn.jsp" %>

<%!
Connection con1;
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement();
ResultSet rs1=null,rs2=null;
String sql1="",sql2="";
String getunid=request.getParameter("unid");
int refno=0;

sql2="select RefNo from hwunittest where UnitID='"+getunid+"' ";
//out.println(sql2);
rs2=stmt1.executeQuery(sql2);
if(rs2.next())
{
  refno=rs2.getInt("RefNo");
} 

sql1="select * from hwunittest where RefNo='"+refno+"' ";
rs1=stmt1.executeQuery(sql1);

while(rs1.next())
{
  String rled=rs1.getString("RLED");
  int red=0; 
  if(rled.equals("ON"))
  {
    red=0;
  }
  else
  {
    red=1;
  }

  String gled=rs1.getString("GLED");
  int green=0; 
  if(gled.equals("ON"))
  {
    green=0;
  }
  else
  {
    green=1;
  } 

  String gledbli=rs1.getString("GLEDBlink");
  int greenb=0; 
  if(gledbli.equals("BLINKING"))
  {
    greenb=0;
  }
  else
  {
    greenb=1;
  } 

  String rledcon=rs1.getString("RLEDConn");
  int redcon=0; 
  if(rledcon.equals("OK"))
  {
    redcon=0;
  }
  else
  {
    redcon=1;
  } 

   String gledok=rs1.getString("GLEDOk");
  int greenok=0; 
  if(gledok.equals("OK"))
  {
    greenok=0;
  }
  else
  {
    greenok=1;
  } 

  String othconn=rs1.getString("OthConn");
  int otcon=0; 
  if(othconn.equals("Correct"))
  {
    otcon=0;
  }
  else
  {
    otcon=1;
  } 

  String gpsant=rs1.getString("GPSAnt");
  int gps=0; 
  if(gpsant.equals("YES"))
  {
    gps=0;
  }
  else
  {
    gps=1;
  } 
 
  String gpsantled=rs1.getString("GPSAntLED");
  int gpsled=0; 
  if(gpsantled.equals("ON"))
  {
    gpsled=0;
  }
  else
  {
    gpsled=1;
  }   

  String powerok=rs1.getString("PowerOk");
  int powok=0; 
  if(powerok.equals("OK"))
  {
    powok=0;
  }
  else if(powerok.equals("Not OK"))
  {
    powok=1;
  }   
  else
  {
    powok=2;
  } 

  String powersupp=rs1.getString("PowerSuppFail");
  int pows=0; 
  if(powersupp.equals("True"))
  {
    pows=0;
  }
  else if(powersupp.equals("False"))
  {
    pows=1;
  }   
  else
  {
     pows=2;
  }
  

  String fuseblown=rs1.getString("FuseBlownOk");
  int fuse=0; 
  if(fuseblown.equals("OK"))
  {
    fuse=1;
  }
  else if(fuseblown.equals("Blown"))
  {
    fuse=0;
  }   
  else
  {
    fuse=2;
  }

  String wavecom=rs1.getString("Wavecom");
  int wave=0; 
  if(wavecom.equals("Short"))
  {
    wave=0;
  }
  else if(wavecom.equals("OK"))
  {
    wave=2;
  }   
  else if(wavecom.equals("Open"))
  {
    wave=1;
  }
  else
  {
    wave=3;
  }

  String SIMpres=rs1.getString("SIMDB");
  int simp=0;
  if(SIMpres.equals("Yes"))
  {
     simp=0;
  }
  else
  {
    simp=1;
  }
 
  out.println(rs1.getString("Cust")+"#");    
  out.println(rs1.getString("UnitType")+"#");
  out.println(rs1.getString("AVLPcbver")+"#");
  out.println(rs1.getString("PowPcbVer")+"#");
  out.println(rs1.getString("WMSN")+"#");
  out.println(rs1.getString("Module")+"#");
  out.println(rs1.getString("Firmware")+"#");
  out.println(rs1.getString("AppCodeVer")+"#");
  out.println(rs1.getString("MobileDB")+"#");
  out.println(rs1.getString("MobileNo1")+"#");
  out.println(rs1.getString("SIMDB")+"#");
  out.println(rs1.getString("SIMNo1")+"#");
  out.println(red+"#");
  out.println(green+"#");
  out.println(greenb+"#");
  out.println(redcon+"#");
  out.println(greenok+"#");
  out.println(otcon+"#");
  out.println(gps+"#");
  out.println(gpsled+"#");
  out.println(rs1.getString("ConnDet")+"#");
  out.println(rs1.getString("VolCN7Pin1")+"#");
  out.println(rs1.getString("VolCN7Pin2")+"#");
  out.println(rs1.getString("VolCN7Pin3")+"#");
  out.println(powok+"#");
  out.println(rs1.getString("PowerSuppPin")+"#");
  out.println(pows+"#");
  out.println(rs1.getString("Pin9")+"#");
  out.println(rs1.getString("Pin40")+"#");
  out.println(wave+"#");
  out.println(fuse+"#");
  out.print(simp);
}



} catch(Exception e) {out.println(e);}

finally
{
con1.close();
}

%>

