<%@ include file="Connections/conn.jsp" %>

<%!
Connection con1, con2;
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);


Statement st=con1.createStatement(),stmt1=con1.createStatement(), stmt2=con2.createStatement(), stmt3=con2.createStatement(), stmt4=con2.createStatement();
ResultSet rs4=null, rs5=null, rs6=null;
String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="";
String entdte="",enttime="", unit="",Status="",boxtype="", simno="",simco="", mobno="", insttyp="", wmsn="", module="", gps="", typun="", swver="", voice="", jrmbuzz="", buzzer="", temp1="", temp2="", door1="", door2="", horn="", scard="", flowsen1="", flowsen2="", plain="", peripherals="", barcode="", user="";
int  rno=0, periphcode=0;

int ins=0, chkdcntr=0, chkdcntr1=0, maxdispid=0;

String user1=session.getAttribute("typeval").toString();
String entby=session.getAttribute("user").toString();

/* *************Getting values from previous page********************************* */
 
  String cntr=request.getParameter("cntr");
  //out.println(cntr);
  String reqno=request.getParameter("reqno");
  String untyp=request.getParameter("untyp");
  String code=request.getParameter("code");
  String loc=request.getParameter("disloc");
  String noofunits=request.getParameter("noofunits");
  String courdte=request.getParameter("calender");
  String chalan=request.getParameter("chalan");
  String dispto=request.getParameter("dispto"); 

/* ********************************************************************************* */
   java.util.Date d=new java.util.Date();
   String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();


   java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   String nwfrmtdte=formatter.format(datefrmdb);
   
   java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter1=new SimpleDateFormat("ddMMyy");
   String nwfrmtdte1=formatter1.format(datefrmdb1);
   String time=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
 // out.println(noofunits);
 
  int nounitsint=Integer.parseInt(noofunits);
   out.println(nounitsint);
  int cntrint=Integer.parseInt(cntr);
  //out.println(cntrint);

  String mode=request.getParameter("mode");
  String disname=request.getParameter("dispname");
 
//-----------------Get the order type t_unitorder------------------
String ordertype="",testedunits="";
String que="select Ordertype from t_unitorder where Reqno='"+reqno+"'";
ResultSet rsget=st.executeQuery(que);
if(rsget.next())
{
	ordertype=rsget.getString("Ordertype");
}

	if(ordertype.equals("Internal"))
	{	testedunits="Yes";
	 if(mode.equals("Hand"))
	  {
	     Status="Sent";
	    
	   }
	else
	   {
	     Status="Waiting For Dispatch";
	     disname="-";
	     
	    }	
	}
	
	else if(ordertype.equals("External"))
	{
		testedunits="No";
		 
		  if(mode.equals("Hand"))
		  {
		     Status="Dispatched";
		    
		   }
		else
		   {
		     Status="Waiting For Dispatch";
		     disname="-";
		     
		    }	
	}
	else if(ordertype.equals("-"))
	{
		testedunits="Yes";
		 
		  if(mode.equals("Hand"))
		  {
		     Status="Dispatched";
		    
		   }
		else
		   {
		     Status="Waiting For Dispatch";
		     disname="-";
		     
		    }
	}


//-----------------------------------------------------------------
  

/* ***********creating new DispID for this Dispatch***************** */
  sql5="select max(DispId) from t_unitmasterhistory ";
  rs5=stmt2.executeQuery(sql5);
  if(rs5.next())
  {
    maxdispid=rs5.getInt("max(DispId)");
    
  }
    maxdispid= maxdispid+1;
/* ********************************************************************************* */   

/* ***************Checking how many check boxes where checked*********** */
  String[] uncntchk = new String[cntrint+1];
  for(int k=0; k<=cntrint; k++) 
{
   uncntchk[k] = request.getParameter("dis"+k );

   if(uncntchk[k]==null)
   {
     
   }
   else
   {
     chkdcntr1++;
   }
}
/* ********************************************************************************* */
 
/* ***********If none then it will go back to the previous page. Else it will update the DB******************** */ 
 if(chkdcntr1 > nounitsint)
 {
   response.sendRedirect("showreq.jsp?unitsexceed=yes&noofunits="+nounitsint);
   return;
 }
 else
 {
     
     String[] x = new String[cntrint+1];
     String[] unid = new String[cntrint+1];

     for(int i=0; i<=cntrint; i++) 
     {
          x[i] = request.getParameter("dis"+i );

          if(x[i]==null)
         {
    
         }
         else
         {
            chkdcntr++;
            
            unid[i]=request.getParameter("unid"+i);
           out.println(unid[i]);
           //out.println("<br>");

          sql4="select * from t_unitmaster where UnitId='"+unid[i]+"' "; 
          //out.print(sql4);  
          rs4=stmt4.executeQuery(sql4);
          if(rs4.next())
          {
              rno=rs4.getInt("Rno");
              entdte=rs4.getString("EntDate"); 
              enttime=rs4.getString("EntTime");
              unit=rs4.getString("UnitID");
              simno=rs4.getString("SimNo");
              simco=rs4.getString("SimCompany");
              mobno=rs4.getString("MobNo"); 
              insttyp=rs4.getString("InstType");
              wmsn=rs4.getString("WMSN");
              module=rs4.getString("Module");
              gps=rs4.getString("GPS");
              typun=rs4.getString("typeunit"); 
              swver=rs4.getString("SwVer"); 
              voice=rs4.getString("PVoice"); 
              jrmbuzz=rs4.getString("PJrmBuzz");
              buzzer=rs4.getString("Pbuzzer");
              temp1=rs4.getString("PTemp1");
              temp2=rs4.getString("PTemp2");
              door1=rs4.getString("PDoor1");
              door2=rs4.getString("PDoor2");
              horn=rs4.getString("PHorn");
              scard=rs4.getString("PScard");
              flowsen1=rs4.getString("PFlowSen1");
              flowsen2=rs4.getString("PFlowSen2");
              plain=rs4.getString("Plain");
              peripherals=rs4.getString("Peripherals");
              periphcode=rs4.getInt("PeriphCode");
              user=rs4.getString("User");
              boxtype=rs4.getString("Box_type");
          }
   
          barcode=maxdispid+reqno+nwfrmtdte1+chalan+chkdcntr;

          sql1="update t_unitmaster set Status='"+Status+"', DisAdd='"+loc+"', DispDate='"+nwfrmtdte+"',DispTime='"+time+"', OrderNo='"+reqno+"', ModeofDispatch='"+mode+"', DisName='"+disname+"', CourierDate='"+courdte+"', ChalanNo='"+chalan+"', DispId='"+maxdispid+"', BarCode='"+barcode+"', HoldBy='"+dispto+"', FaultyUnit='No', EntBy='"+entby+"',testedunit='"+testedunits+"'  where UnitID='"+unid[i]+"' ";
          out.println("\n\n"+sql1);
          ins=stmt2.executeUpdate(sql1);
     
      	String abc=sql1.replace("'", "#");
    	abc=abc.replace(",", "$");
    	String str2="insert into t_sqlquery(dbname,query)values('db_gps','"+abc+"')";	
    	stmt2.executeUpdate(str2);
/* ******************** Check whether this unit id has been dispatched today. If yes then dont enter it again. This is just to avoid duplicate entry in t_unitmasterhistory because sometimes due to server problems there is duplicate entry in this table ************************* */

	sql6="select * from t_unitmasterhistory where UnitId='"+unid[i]+"' and (Status='Dispatched' or Status='Waiting For Dispatch' ) and DispDate='"+nwfrmtdte+"' and user='"+user+"'";
	rs6=stmt2.executeQuery(sql6);
	if(rs6.next())
	{
		
	}
	else
	{
		sql3="insert into t_unitmasterhistory (Rno, EntDate, UnitID, SimNo, SimCompany, MobNo, InstType, WMSN, Module, GPS, typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, Peripherals, PeriphCode, Status, DisAdd, DispDate, OrderNo, ModeofDispatch, DisName, CourierDate, ChalanNo, DispId, BarCode, User, HoldBy,EntBy,EntTime,DispTime,testedunit,Box_type) values ('"+rno+"', '"+entdte+"', '"+unit+"', '"+simno+"', '"+simco+"', '"+ mobno+"', '"+insttyp+"', '"+wmsn+"', '"+module+"', '"+gps+"', '"+typun+"', '"+swver+"', '"+voice+"', '"+jrmbuzz+"', '"+buzzer+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+peripherals+"', '"+periphcode+"', '"+Status+"', '"+loc+"', '"+nwfrmtdte+"', '"+reqno+"', '"+mode+"','"+disname+"', '"+courdte+"', '"+chalan+"', '"+maxdispid+"', '"+barcode+"', '"+user+"', '"+dispto+"', '"+entby+"','"+enttime+"','"+time+"','"+testedunits+"','"+boxtype+"') ";
		//sql3="insert into t_unitmasterhistory (Rno, EntDate, UnitID, SimNo, MobNo, InstType, WMSN, Module, GPS, typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, Peripherals, PeriphCode, Status, DisAdd, DispDate, OrderNo, ModeofDispatch, DisName, CourierDate, ChalanNo, DispId, BarCode, User, HoldBy, FaultyUnit, EntBy) values ('"+rno+"', '"+entdte+"', '"+unit+"', '"+simno+"', '"+mobno+"', '"+insttyp+"', '"+wmsn+"', '"+module+"', '"+gps+"', '"+typun+"', '"+swver+"', '"+voice+"', '"+jrmbuzz+"', '"+buzzer+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+peripherals+"', '"+periphcode+"', 'Dispatched', '"+loc+"', '"+nwfrmtdte+"', '"+reqno+"', '"+mode+"','"+disname+"', '"+courdte+"', '"+chalan+"', '"+maxdispid+"', '"+barcode+"', '"+user+"', '"+dispto+"', 'No', '"+entby+"') "; 
		 out.println("\n\n"+sql3);
	         stmt3.executeUpdate(sql3);
	         
	         String abc1=sql3.replace("'", "#");
	     	abc1=abc1.replace(",", "$");
	     	String str1="insert into t_sqlquery(dbname,query)values('db_gps','"+abc1+"')";	
	     	stmt3.executeUpdate(str1);
	}		

/* **************************************************************************************** */
    
     } //else
  } //for
} // outer else
/* *************************************************************************************** */


/* ************Checking whether the dispatch was made fully or partially and accordingly update the DB*********** */
if(ins > 0)
{
    
    if(chkdcntr==nounitsint)
    { 
    	if(ordertype.equalsIgnoreCase("Internal"))     
       sql2="update t_unitorder set Status='Sent', ModeofDispatch='"+mode+"', DisName='"+disname+"' where Reqno='"+reqno+"' ";
    	else
    		sql2="update t_unitorder set Status='Dispatched', RemUnits='0', ModeofDispatch='"+mode+"', DisName='"+disname+"' where Reqno='"+reqno+"'";
       out.println("\n\n"+sql2);
       stmt1.executeUpdate(sql2);
       
       String abc1=sql2.replace("'", "#");
    	abc1=abc1.replace(",", "$");
    	String str1="insert into t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc1+"')";	
    	stmt3.executeUpdate(str1);
    }
    else
    {
        int pndgunits=nounitsint-chkdcntr;
        if(ordertype.equalsIgnoreCase("Internal"))  
        	sql2="update t_unitorder set RemUnits='"+pndgunits+"', Status='Partially Sent', ModeofDispatch='"+mode+"', DisName='"+disname+"' where Reqno='"+reqno+"' ";	
       else
       sql2="update t_unitorder set RemUnits='"+pndgunits+"', Status='Partially Dispatched', ModeofDispatch='"+mode+"', DisName='"+disname+"' where Reqno='"+reqno+"' ";
        out.println("\n\n"+sql2);
       stmt1.executeUpdate(sql2);
    
      String abc1=sql2.replace("'", "#");
   	abc1=abc1.replace(",", "$");
   	String str2="insert into t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc1+"')";	
   	stmt3.executeUpdate(str2);
       
    }
    response.sendRedirect("showreq.jsp?dispatched=yes&dispid="+barcode);
    return;
} 
else
{
  response.sendRedirect("status.jsp?code="+code+"&untyp="+untyp+"&reqno="+reqno+"&noofunits="+nounitsint);
  return;
} 
/* ********************************************************************************* */
 
}catch(Exception e)
{ 
	//out.println(e.printStackTrace());
	//e.printStackTrace();
	}
finally
{
con1.close();
con2.close();
}

%>


