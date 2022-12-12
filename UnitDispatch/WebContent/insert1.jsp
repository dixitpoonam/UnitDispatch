<%@ include file="headeradmin.jsp" %>

<%!
Connection con1;
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement(), stmt2=con1.createStatement(), stmt3=con1.createStatement(),stmt4=con1.createStatement();
ResultSet rs2=null, rs4=null,rs5=null;
String sql1="", sql2="", sql3="", sql4="", sql5="",sql6="";

 String manuf="", simco="",ordertype="",boxtype="",cust="",manuf1="",typunit="", voice="", jrmbuz="", buz="", temp1="", temp2="", door1="", door2="", horn="", scard="", flowsen1="", flowsen2="", plain="", add="", disdte="", peripheral="", noofunits="", othadd="", othdetadd="", techn="", addinsrt="", manufinsrt="", insttype="";
int maxreqno=0, maxid=0;

String admname=session.getValue("user").toString();

   java.util.Date d=new java.util.Date();
   String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();

   java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   String nwfrmtdte=formatter.format(datefrmdb);

/* ********************Getting values from previous page******************** */
manuf1=request.getParameter("manuf");
System.out.println("Manufacturer---"+manuf1);
sql6 = "select V_ID from db_CustomerComplaints.t_vendorMaster where V_Name like '"+manuf1+"'";
rs5 = stmt4.executeQuery(sql6);
if(rs5.next())
{
	manuf = rs5.getString("V_ID");
	System.out.println("manuf id--"+manuf);
}


cust=request.getParameter("cust");
typunit=request.getParameter("typ");
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
String smartKey=request.getParameter("smartKey");
String battery=request.getParameter("battery");
String battery950=request.getParameter("battery950");
String battery1050=request.getParameter("battery1050");
String battery1800=request.getParameter("battery1800");
add=request.getParameter("seladd");
disdte=request.getParameter("calender");
noofunits=request.getParameter("noofunits");
othadd=request.getParameter("othadd");
othdetadd=request.getParameter("othdetadd");
insttype=request.getParameter("insttype");
techn=request.getParameter("tech");
simco=request.getParameter("simco");
ordertype=request.getParameter("ordertype");
boxtype=request.getParameter("boxtype");
/* ************************************************************************************ */

/* ****************If Manufacturer is not in the list, then insert it into DB********** */
  if(manuf.equals("Other"))
  {
     String othmanuf=request.getParameter("othman");
     manufinsrt=othmanuf;
 
     sql4="select max(id) from t_admin";
     rs4=stmt2.executeQuery(sql4);
     if(rs4.next())
     {
       maxid=rs4.getInt("max(id)");
     }
       maxid=maxid+1;
       out.print(maxid);
     sql5="insert into t_admin (id, Name, UName,  pass, URole) values ('"+maxid+"', '"+manufinsrt+"', '"+manufinsrt+"', '"+manufinsrt+"', 'manufacturer') ";
     stmt3.executeUpdate(sql5);
     
     String abc1=sql5.replace("'", "#");
 	abc1=abc1.replace(",", "$");
 	String str1="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc1+"')";	
 	stmt3.executeUpdate(str1);
  }
  else
  {
     manufinsrt=manuf;  
  }
/* ********************************************************************************* */

/* ************If Address is not in the list, then insert it into DB********* */

  addinsrt=add;
  if(add.equals("Other"))
  {
    addinsrt=othadd;
    
    sql3="insert into t_dispatchaddress(Address, Location) values ('"+othdetadd+"', '"+othadd+"') ";
    stmt1.executeUpdate(sql3);
    
    String abc1=sql3.replace("'", "#");
 	abc1=abc1.replace(",", "$");
 	String str1="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc1+"')";	
 	stmt1.executeUpdate(str1);
  }
    
 /* **********************Checking for peripherals which were selected****************** */ 
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
/* ********************************************************************************* */

sql2="select max(Reqno) from t_unitorder ";
rs2=stmt1.executeQuery(sql2);
while(rs2.next())
{
  maxreqno=rs2.getInt("max(Reqno)");
}
  maxreqno=maxreqno+1; 

/* ***********************************Inserting into DB*************************** */
sql1="insert into t_unitorder (Reqno, Reqto, ReqDate, TypofUnit, NoofUnits, RemUnits, Peripherals, InsType, DispatchAdd, Cust, Tech, DispDate, Reqby ,Sim_Co ,Ordertype,Box_type) values('"+maxreqno+"', '"+manufinsrt+"','"+nwfrmtdte+"','"+typunit+"','"+noofunits+"', '"+noofunits+"', '"+peripheral+"', '"+insttype+"', '"+addinsrt+"','"+cust+"', '"+techn+"', '"+disdte+"','"+admname+"','"+simco+"','"+ordertype+"','"+boxtype+"') "; 
stmt1.executeUpdate(sql1);

String abc1=sql1.replace("'", "#");
	abc1=abc1.replace(",", "$");
	String str1="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc1+"')";	
	stmt1.executeUpdate(str1);
/* ********************************************************************************* */

response.sendRedirect("mainpage.jsp?inserted=yes&ordrrno="+maxreqno);
return; 

} catch(Exception e) { out.println("Exception----->" +e); }

finally
{
con1.close();

} 
%>
