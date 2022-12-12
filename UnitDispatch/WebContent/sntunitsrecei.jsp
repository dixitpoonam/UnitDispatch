<%@ include file="headeradmin.jsp" %>

<%!
Connection con1, con2;
%>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con2.createStatement(), stmt2=con2.createStatement(), stmt3=con2.createStatement(), stmt4=con1.createStatement(), stmt5=con1.createStatement();
ResultSet rs2=null;
String sql1="", sql2="", sql3="", sql4="",sql5="";

String cntr="", flag="true", reqno="";

String entdte="", unit="", simno="", mobno="", insttyp="", wmsn="", module="", gps="", typun="", swver="", voice="", jrmbuzz="", buzzer="", temp1="", temp2="", door1="", door2="", horn="", scard="", flowsen1="", flowsen2="", plain="", peripherals="", user="", user1="";

String[] uncntchk;

int cntrint=0, chkdcntr1=0, chkdcntr=0, rno=0, periphcode=0;
int cntrint1=0, remunits=0;

user=session.getValue("typeval").toString();
String entby=session.getValue("user").toString();

String status=request.getParameter("status");
reqno=request.getParameter("reqno");
cntr=request.getParameter("cntr");
System.out.println("status"+status);

String penunit=request.getParameter("pendingunits");
cntrint=Integer.parseInt(cntr);
int pendunits=Integer.parseInt(penunit);
cntrint1=cntrint-1;
//out.print(cntrint1);
String time=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());

		java.util.Date d=new java.util.Date();
   		String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();


                java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   		Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   		String nwfrmtdte=formatter.format(datefrmdb);
		//out.print(nwfrmtdte);

/* ********Checking how many check-boxes were checked. Taking count of that*********** */

   uncntchk = new String[cntrint];
  for(int k=0; k<cntrint; k++) 
{
   uncntchk[k] = request.getParameter("dis"+k );

   if(uncntchk[k]==null)
   {
     
   }
   else
   {
     chkdcntr1++;
	flag="false";
   }
}

//remunits=cntrint1-chkdcntr1;
/* ************************************************************************** */


/* *********if no check box was selected, then page will be re-directed to previous form, else it will be upated in DB************ */
if(flag.equals("true"))
 {
   response.sendRedirect("sntunitsdet.jsp?nounitselected=true&reqno="+reqno);
   return;
 }
else
 {
	String[] x = new String[cntrint];
        String[] unid = new String[cntrint];

	for(int i=0; i<cntrint; i++) 
        {
                x[i] = request.getParameter("dis"+i );

    		 if(x[i]==null)
                {
      
                }
                else
                {
			chkdcntr++;
			unid[i]=request.getParameter("unid"+i);

	/* ********Getting information abt the Unit which was selected*************** */

			sql2="select * from t_unitmaster where UnitId='"+unid[i]+"' "; 
          		//out.print(sql2);  
          		rs2=stmt2.executeQuery(sql2);
			if(rs2.next())
          		{
				rno=rs2.getInt("Rno");
             			//entdte=rs2.getString("EntDate"); 
              			unit=rs2.getString("UnitID");
              			simno=rs2.getString("SimNo");
             			mobno=rs2.getString("MobNo"); 
              			insttyp=rs2.getString("InstType");
              			wmsn=rs2.getString("WMSN");
              			module=rs2.getString("Module");
              			gps=rs2.getString("GPS");
              			typun=rs2.getString("typeunit"); 
              			swver=rs2.getString("SwVer"); 
              			voice=rs2.getString("PVoice"); 
              			jrmbuzz=rs2.getString("PJrmBuzz");
              			buzzer=rs2.getString("Pbuzzer");
              			temp1=rs2.getString("PTemp1");
              			temp2=rs2.getString("PTemp2");
              			door1=rs2.getString("PDoor1");
              			door2=rs2.getString("PDoor2");
              			horn=rs2.getString("PHorn");
              			scard=rs2.getString("PScard");
              			flowsen1=rs2.getString("PFlowSen1");
              			flowsen2=rs2.getString("PFlowSen2");
              			plain=rs2.getString("Plain");
              			peripherals=rs2.getString("Peripherals");
              			periphcode=rs2.getInt("PeriphCode");
				user1=rs2.getString("User");
              			
	        	} //if	
	/* ************************************************************************** */
	

     	/* **************Updating entries which are received******** */	
			
				sql1="update t_unitmaster set Status='Received',EntDate='"+nwfrmtdte+"',EntTime='"+time+"', User='"+user+"', RecBy='"+user+"', HoldBy='"+user+"', EntBy='"+entby+"' where Unitid='"+unid[i]+"' ";//added entdate and time
				
				stmt1.executeUpdate(sql1);
				
				String abc=sql1.replace("'", "#");
				abc=abc.replace(",", "$");
				String str3="insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abc+"')";	
				stmt1.executeUpdate(str3);


				sql3="insert into t_unitmasterhistory (Rno, EntDate, UnitID, SimNo, MobNo, InstType, WMSN, Module, GPS, typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, Peripherals, PeriphCode, Status, DisAdd, DispDate, OrderNo, ModeofDispatch, DisName, CourierDate, ChalanNo, DispId, BarCode, User, RecBy, HoldBy, EntBy,EntTime) values ('"+rno+"', '"+nwfrmtdte+"', '"+unit+"', '"+simno+"', '"+mobno+"', '"+insttyp+"', '"+wmsn+"', '"+module+"', '"+gps+"', '"+typun+"', '"+swver+"', '"+voice+"', '"+jrmbuzz+"', '"+buzzer+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+peripherals+"', '"+periphcode+"', 'Received', '-', '"+nwfrmtdte+"', '"+reqno+"', '-','-', '-', '-', '0', '-', '"+user+"', '"+user+"', '"+user+"', '"+entby+"','"+time+"') ";
				
				stmt3.executeUpdate(sql3);
                  
				String abc1=sql3.replace("'", "#");
				abc1=abc1.replace(",", "$");
				String str4="insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abc1+"')";	
				stmt4.executeUpdate(str4);

				
				
                sql5="insert into t_unitreceived (Rdate, Rtime, ReceiveFrom, Name , Courier, CourierDCNo, Utype, UnitID, Transporter, Location, Faulty, TechName, Comment ,EntBy ,Status, DC_NO ,InTransit,TypeValue)values ('"+nwfrmtdte+"','"+time+"','vendor','"+user+"','-', '-','"+insttyp+"','"+unit+"','"+entby+"','-', '-','-','-','"+entby+"','True', '0', 'No','"+user+"') "; 
                //out.print("vinish="+sql5);
                stmt5.executeUpdate(sql5);
                
                
                String abc2=sql5.replace("'", "#");
				abc2=abc2.replace(",", "$");
				String str5="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc2+"')";	
				stmt4.executeUpdate(str5);
         /* ************************************************************************** */

	
         /* ************Checking whether all units were received or not*********** */

			if(status.equalsIgnoreCase("Sent") && chkdcntr1==cntrint1)  
			{
				sql4="update t_unitorder set RemUnits='0', Status='Received' where Reqno='"+reqno+"' ";
				stmt4.executeUpdate(sql4);
				
				String abc3=sql4.replace("'", "#");
				abc3=abc3.replace(",", "$");
				String str6="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc3+"')";	
				stmt4.executeUpdate(str6);
			}
			else if(status.equalsIgnoreCase("Sent") && chkdcntr1!=cntrint1)  
			{
				sql4="update t_unitorder set RemUnits='"+pendunits+"', Status='Sent' where Reqno='"+reqno+"' ";
				stmt4.executeUpdate(sql4);
				
				String abc3=sql4.replace("'", "#");
				abc3=abc3.replace(",", "$");
				String str6="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc3+"')";	
				stmt4.executeUpdate(str6);
			}
			else if(status.equalsIgnoreCase("Partially Sent")||status.equalsIgnoreCase("Partially Received"))  
			{
				sql4="update t_unitorder set RemUnits='"+pendunits+"', Status='Partially Sent' where Reqno='"+reqno+"' ";
				stmt4.executeUpdate(sql4);
				String abc3=sql4.replace("'", "#");
				abc3=abc3.replace(",", "$");
				String str6="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc3+"')";	
				stmt4.executeUpdate(str6);
			}	        
	/* ************************************************************************** */
				

	        }
				out.print(unid[i]);
	}

}


con1.close();
con2.close();

response.sendRedirect("sntunitsbymanuf.jsp?received=yes&reqno="+reqno);
return;

} catch(Exception e) { out.println("Exception----->" +e); }

finally
{
}

%>
