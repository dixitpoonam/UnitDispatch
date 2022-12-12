<%@ include file="headeradmin.jsp" %>

<%!
Connection con1;
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement(), stmt2=con1.createStatement();
String sql1="", sql2="", sql3="", sql4="", sql5="";
ResultSet rs2=null;

int maxid=0, noofunitsint=0, disunitsint=0, remunitsint=0, newremunitsint=0;

 String manuf="", cust="",simco="",ordertype="",boxtype="", typunit="", voice="", jrmbuz="", buz="", temp1="", temp2="", door1="", door2="", horn="", scard="", flowsen1="", flowsen2="", plain="", add="", disdte="", peripheral="", noofunits="", remunits="", disunits="", othadd="", othdetadd="", techn="", addinsrt="", manufinsrt="", insttype="",withBattery="";

String submit=request.getParameter("submit");
String reqno=request.getParameter("reqnotext");
String status=session.getValue("stat").toString();
//out.print(status);

if(submit.equals("Cancel"))
{
  sql1="update t_unitorder set Status='Cancelled' where Reqno='"+reqno+"' ";
  stmt1.executeUpdate(sql1);

  response.sendRedirect("checkorders.jsp?cancelled=yes");
  return;
}
else
{
  if(status.equals("Partially Dispatched"))
  {
     //out.print("in if");

     noofunits=request.getParameter("noofunits");
     remunits=request.getParameter("remunits");
     disunits=request.getParameter("noofdis");
     disdte=request.getParameter("calender");

     noofunitsint=Integer.parseInt(noofunits); 
     disunitsint=Integer.parseInt(disunits);
     remunitsint=Integer.parseInt(remunits); 
     remunitsint=noofunitsint-disunitsint;

     newremunitsint=(noofunitsint-disunitsint)-remunitsint;
     remunitsint=remunitsint+newremunitsint;

     if(noofunitsint==disunitsint)
     { 
         sql5="update t_unitorder set Status='Dispatched', NoofUnits='"+noofunits+"', RemUnits='0' where Reqno='"+reqno+"' ";
         stmt1.executeUpdate(sql5);
         
         
         String abc2=sql5.replace("'", "#");
     	abc2=abc2.replace(",", "$");
     	String str5="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc2+"')";	
     	stmt1.executeUpdate(str5);
     }  
     else
     {
         sql5="update t_unitorder set NoofUnits='"+noofunits+"', RemUnits='"+remunitsint+"', DispDate='"+disdte+"' where Reqno='"+reqno+"' ";  
         stmt1.executeUpdate(sql5);
         
         String abc2=sql5.replace("'", "#");
      	abc2=abc2.replace(",", "$");
      	String str5="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc2+"')";	
      	stmt1.executeUpdate(str5);
     }
  }
  else
  {
  manuf=request.getParameter("manuf");
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
  add=request.getParameter("seladd");
  disdte=request.getParameter("calender");
  noofunits=request.getParameter("noofunits");
  remunits=request.getParameter("remunits");
  disunits=request.getParameter("noofdis");
  othadd=request.getParameter("othadd");
  othdetadd=request.getParameter("othdetadd");
  insttype=request.getParameter("insttype");
  simco=request.getParameter("simco");
  ordertype=request.getParameter("ordertype");
  boxtype=request.getParameter("boxtype");
  withBattery = request.getParameter("withBattery");

  out.println(manuf);
out.println(cust);
out.println(typunit);
out.println(voice);
out.println(jrmbuz);
out.println(buz);
out.println(temp1);
out.println(temp2);
out.println(door1);
out.println(door2);
out.println(horn);
out.println(scard);
out.println(flowsen1);
out.println(flowsen2);
out.println(plain);
out.println(add);
out.println(disdte);
out.println(peripheral); 
out.print(noofunits);
out.print(remunits);
out.print(disunits);
out.println(othadd);
out.println(othdetadd);
out.print(withBattery);

 if(manuf.equals("Other"))
  {
     String othmanuf=request.getParameter("othman");
     manufinsrt=othmanuf;
 
     sql2="select max(id) from t_admin";
     rs2=stmt1.executeQuery(sql2);
     if(rs2.next())
     {
       maxid=rs2.getInt("max(id)");
     }
       maxid=maxid+1;
       out.print(maxid);
     sql3="insert into t_admin (id, Name, UName,  pass, URole) values ('"+maxid+"', '"+manufinsrt+"', '"+manufinsrt+"', '"+manufinsrt+"', 'manufacturer') ";
     stmt2.executeUpdate(sql3);
     
     
     
     String abc2=sql3.replace("'", "#");
  	abc2=abc2.replace(",", "$");
  	String str5="insert into .db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc2+"')";	
  	stmt2.executeUpdate(str5);
  }
  else
  {
     manufinsrt=manuf;  
  }

  addinsrt=add;
  if(add.equals("Other"))
  {
    addinsrt=othadd;
    
    sql4="insert into t_dispatchaddress (Address, Location) values ('"+othdetadd+"', '"+othadd+"') ";
    stmt1.executeUpdate(sql4);
  }

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
     
     if(null == withBattery || withBattery.equals("null"))
     {
       peripheral = peripheral+"";
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

   noofunitsint=Integer.parseInt(noofunits); 
   disunitsint=Integer.parseInt(disunits);
   remunitsint=Integer.parseInt(remunits); 
   remunitsint=noofunitsint-disunitsint;

newremunitsint=(noofunitsint-disunitsint)-remunitsint;
remunitsint=remunitsint+newremunitsint;

out.println(noofunitsint);
out.println(disunitsint);
    
    if(noofunitsint==disunitsint)
    { 
       sql5="update t_unitorder set Status='Dispatched', NoofUnits='"+noofunits+"', RemUnits='0' where Reqno='"+reqno+"' ";
       stmt1.executeUpdate(sql5);
       
       
       String abc2=sql5.replace("'", "#");
    	abc2=abc2.replace(",", "$");
    	String str5="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc2+"')";	
    	stmt1.executeUpdate(str5); 
       
    } 
    else
    {
       sql5="update t_unitorder set Reqto='"+manufinsrt+"', TypofUnit='"+typunit+"', NoofUnits='"+noofunits+"', RemUnits='"+remunitsint+"',  Peripherals='"+peripheral+"', InsType='"+insttype+"', DispatchAdd='"+addinsrt+"', Cust='"+cust+"', DispDate='"+disdte+"', Sim_Co='"+simco+"', Ordertype='"+ordertype+"', Box_type='"+boxtype+"' where Reqno='"+reqno+"' ";  
       stmt1.executeUpdate(sql5);  
       System.out.println("sql ----"+sql5);
       String abc2=sql5.replace("'", "#");
   	abc2=abc2.replace(",", "$");
   	String str5="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc2+"')";	
   	stmt1.executeUpdate(str5); 
      
    }
 } //close of else which compares status

    response.sendRedirect("checkorders.jsp?updated=yes");
    return;

} //close of main else
} catch(Exception e) { out.println("Exception----->" +e); }

finally
{
con1.close();
}
%>
