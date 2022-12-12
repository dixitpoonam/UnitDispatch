<%@ page import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" import=" java.sql.Timestamp" %>
<%@ include file="Connections/conn.jsp"%>
<%! 
Connection conn,conn1;
Statement st,st1,st2,st3,st4,st5;
String sql,sql1,sql2,sql3,sql4,sql5,vehiclecode="",instn="",moblat="",date="",stts="",VehicleregNo="",on="",cfd="",userrole="",pdr="",mpc="",pcbn="",bxn="",mc="",btp="",imein="",tfdt="",btrn="",tby="",tdt="",rcbr="",psn="",reccust="",recdt="",rectm="",tdt1="",rcedby="",tdu="",mevr="",tfc="",eby="",ssc="",oct="",psc="",chn="",gtchd="",pcbmod="",gmc="",di="",bc="",hb="",cft="",fu="",fc="",usr="",rcb="",da="",dnm="",mod="",dt="",dc="",dd="",cd="",pdr1="",unitid="",phrn="",pephcd="",pflw1="",pflw2="",unitid1="",pscd="" ,pln="",perphl="",entdt="",sw="",pjbz="",pbzr="", ptmp1="", ptmp2="", smno="", wsn="",pvc="", edtby="",dispdt="",ettime="",smcompany="",tput="",mbno="",mdl="" ,insttyp="", gpps="", insttypnw="",coe="";
int total,updated,dealy,disconnected,notactive,transid;
%>

<html>
<head>
<title>Insert title here</title>
</head>
<body>

<% 

try
{
	
	System.out.println(">>>>inside unit id");
	Class.forName(MM_dbConn_DRIVER);
	conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	System.out.println("1");

	st=conn.createStatement();
	st1=conn.createStatement();
	st2=conn.createStatement();
	st3=conn.createStatement();
	
	System.out.println("2");
	//String vehreg=request.getParameter("VehicleRegNumber");
	//System.out.println(vehreg);

	//String userrole=session.getAttribute("userrole").toString();
	//String user=session.getAttribute("DisplayName").toString();
	
	//System.out.println(userrole);
	//String transporter=request.getParameter("transporter");
	
	String x=request.getParameter("unitid");
	String y=request.getParameter("sim");
	String z=request.getParameter("mob");
	System.out.println("<><><><><>123566"+z);
	
	String msg="";
	String a2="Entry for MobNo. and SimNo. is made null";
	String a1="Unit Id is Present in vehicledetails";
	String a3="Manufactured date is less than the dispatched date";
	String a4="Entry for MobNo is already made null";
	
	java.util.Date dte = new java.util.Date();
	System.out.println("3");
	//Format formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss  ");
	//String today=formatter.format(dte);
	//System.out.println(today);
		
%>

<%
              try{
 			  
            	  
            	  
            	  sql3="select  a.UnitId, b.UnitId, b.SimNo, b.MobNo, b.EntDate,b.DispDate "+
            		  "FROM ( "+

            				  "SELECT UnitId, SimNo, MobNo, EntDate,DispDate "+
            				  "FROM db_gps.t_unitmaster "+
            				  " WHERE UnitId ='"+x+"' "+
            				
 	             				  
            				  ") b "+
            				  " LEFT JOIN db_gps.t_vehicledetails a ON b.UnitId = a.UnitID ";
            	  System.out.println(sql3);
            	  ResultSet rst=st2.executeQuery(sql3);
            	  System.out.println("><><><>$$$$");
  				String entdate ="",dispdate ="";
  				if(rst.next());
  				{
  					 System.out.println("><><>@@@22");
  					
  				
  					
  					 unitid=rst.getString("a.UnitId");
  					unitid1=rst.getString("b.UnitId");
  					entdt=rst.getString("b.EntDate");
  					dispdt=rst.getString("b.DispDate");
  					
  					smno=rst.getString("SimNo");
  					moblat=rst.getString("MobNo");
  					System.out.println(moblat);
  	  				 System.out.println(dispdt);
  				
  	  				
  	  				 
  				
  				}  
  				
  				sql ="select EntDate, max(DispDate) as disp from db_gps.t_unitmasterhistory where UnitId ='"+x+"'  ";	 
				  
  				ResultSet rst11=st.executeQuery(sql);
  				System.out.println(sql);
  				if(rst11.next()){
  					entdate= rst11.getString("EntDate");
  	  	  			dispdate= rst11.getString("disp");
  				
  				}
  				System.out.println("><><<>unitid>>>>>>  "+unitid);
  				System.out.println("><><<>entdate  "+entdate);
  				 System.out.println("<><><><>dispdate  "+dispdate);
  				
  				 
  				 if(unitid==null || unitid.equalsIgnoreCase(null)   )
  				{
  				
  					
  				
  			
  			  
  					
  				
  					
  					
  					%>
  				
				<% 		
  					
				System.out.println("<><><>inside else ");
                  //   if(moblat==null || moblat=="-" || moblat.contains("null") || moblat.contains("-")){
  					
                    //	 System.out.println("inside if of else");     
                   	 
                    //	 msg=a4;  					
  					
  					
  			               //   	}
				
				
				
				    try{%>
				    	
				    
				    	
				  <%  	
				 
				  if((entdate==null || entdate.equalsIgnoreCase("-") || entdate.equalsIgnoreCase(null) || (dispdate == null || dispdate.equalsIgnoreCase("-") || dispdate.equalsIgnoreCase(null) ))) 
				  {
					  System.out.println("inside if of entdate ..."); 
					  sql2="update db_gps.t_unitmaster set SimNo = '-' , MobNo = '-'  where UnitId ='"+x+"'";
 		 			   System.out.println(sql2);
 						st2.executeUpdate(sql2);
 						
 						
 						sql4="select * from db_gps.t_unitmaster where unitId='"+x+"'  ";
 						
 						System.out.println("<><><><>in progress222222");
 						ResultSet rst1=st2.executeQuery(sql4);
 						System.out.println(sql4);
 						while(rst1.next())
 						{
 						
 							entdt=rst1.getString("Entdate");
 						ettime=rst1.getString("EntTime");
 						unitid=rst1.getString("UnitId");
 						smno=rst1.getString("SimNo");
 						smcompany=rst1.getString("SimCompany");
 						mbno=rst1.getString("MobNo");
 						insttyp=rst1.getString("InstType");
 						insttypnw=rst1.getString("InstTypeNew");
 						coe=rst1.getString("CommentOfEdit");
 						edtby=rst1.getString("EditedBy");
 						wsn=rst1.getString("WMSN");
 						mdl=rst1.getString("Module");
 						gpps=rst1.getString("GPS");
 						tput=rst1.getString("typeunit");
 						sw=rst1.getString("SwVer");
 						pvc=rst1.getString("PVoice");
 						pjbz=rst1.getString("PJrmBuzz");
 						pbzr=rst1.getString("PBuzzer");
 						ptmp1=rst1.getString("pTemp1");
 						ptmp2=rst1.getString("pTemp2");
 						pdr=rst1.getString("PDoor1");
 						pdr1=rst1.getString("PDoor2");
 						phrn=rst1.getString("PHorn");
 						pscd=rst1.getString("PScard");
 						pflw1=rst1.getString("PFlowSen1");
 						pflw2=rst1.getString("PFlowSen2");
 						pln=rst1.getString("Plain");
 						perphl=rst1.getString("Peripherals");
 						pephcd=rst1.getString("PeriphCode");
 						stts=rst1.getString("Status");
 						cfd=rst1.getString("CommentForDispatch");
 						System.out.println("31");
 						
 						da=rst1.getString("DisAdd");
 						dd=rst1.getString("DispDate");
 						dt=rst1.getString("DispTime");
 						on=rst1.getString("OrderNo");
 						mod=rst1.getString("ModeofDispatch");
 						dnm=rst1.getString("DisName");
 						cd=rst1.getString("CourierDate");
 						chn=rst1.getString("ChalanNo");
 						di=rst1.getString("DispId");
 						bc=rst1.getString("BarCode");
 						usr=rst1.getString("User");
 						rcb=rst1.getString("RecBy");
 						hb=rst1.getString("HoldBy");
 						cft=rst1.getString("CommentForTransf");
 						fu=rst1.getString("FaultyUnit");
 						fc=rst1.getString("FirmwareChanged");
 						mpc=rst1.getString("ModulePCBChanged");
 						pcbmod=rst1.getString("PCBmodification");
 						psc=rst1.getString("PowerSupplyChanged");
 						gmc=rst1.getString("GPSMouseChanged");
 						gtchd=rst1.getString("GSMAntennaChanged");
 						ssc=rst1.getString("SoftwareSimCorrections");
 						oct=rst1.getString("OtherCorrections");
 						System.out.println("54");
 						
 						mc=rst1.getString("ManufactureCount");
 						tfc=rst1.getString("TrackFileCount");
 						
 						eby=rst1.getString("EntBy");
 						tdt=rst1.getString("TransDate");
 						tdu=rst1.getString("testedunit");
 						mevr=rst1.getString("Mobile_verified");
 						btp=rst1.getString("Box_type");
 						tby=rst1.getString("Tested_by");
 						tdt=rst1.getString("TesetdDateTime");
 						rcedby=rst1.getString("RecByTech");
 						rectm=rst1.getString("RecDateTime");
 						reccust=rst1.getString("RecByCust");
 						recdt=rst1.getString("RecByCustDate");
 						rcbr=rst1.getString("RecConfirmByRep");
 						tfdt=rst1.getString("trackfiledate");
 						psn=rst1.getString("PSNo");
 						pcbn=rst1.getString("PCBNo");
 						bxn=rst1.getString("BoxNo");
 						btrn=rst1.getString("BatteryNo");
 						imein=rst1.getString("IMEINo");
 						System.out.println("74");
 						
 						
 							
 						}
 						
 						System.out.println("<><><><>in progress2");
 						System.out.println(entdt);
 						System.out.println(ettime);
 						
 						sql1="Insert into  db_gps.t_unitmasterhistory ( Entdate, EntTime, UnitId, SimNo, SimCompany, MobNo, InstType , InstTypeNew , CommentOfEdit, EditedBy , WMSN , Module , GPS , typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn , PScard , PFlowSen1,  PFlowSen2 ,"+
 								" Plain, Peripherals , PeriphCode , Status, CommentForDispatch , DisAdd, DispDate, DispTime, OrderNo, ModeofDispatch, DisName, CourierDate , ChalanNo, DispId, BarCode ,"+
 								" User ,RecBy, HoldBy , CommentForTransf, FaultyUnit , FirmwareChanged , ModulePCBChanged , PCBmodification , PowerSupplyChanged , GPSMouseChanged , GSMAntennaChanged ,"+
 								" SoftwareSimCorrections, OtherCorrections, ManufactureCount, TrackFileCount , EntBy , testedunit, Mobile_verified, Box_type, Tested_by, "+
 								" RecByTech,  RecByCust ,  RecConfirmByRep ,  PSNo ,PCBNo , BoxNo , BatteryNo , IMEINo )"+
 								" values ('"+entdt+"', '"+ettime+"', '"+unitid+"', '"+smno+"', '"+smcompany+"', '"+mbno+"', '"+insttyp+"', '"+insttypnw+"', '"+coe+"', '"+edtby+"', '"+wsn+"', '"+mdl+"', '"+gpps+"' ,"+
 										" '"+tput+"', '"+sw+"', '"+pvc+"',  '"+pjbz+"' , '"+pbzr+"', '"+ptmp1+"', '"+ptmp2+"', '"+pdr+"', '"+pdr1+"', '"+phrn+"', '"+pscd+"', '"+pflw1+"', '"+pflw2+"', '"+pln+"', '"+perphl+"', '"+pephcd+"' ,"+
 										"  '"+stts+"', '"+cfd+"' , '"+da+"', '"+dd+"', '"+dt+"', '"+on+"', '"+mod+"', '"+dnm+"', '"+cd+"', '"+chn+"', '"+di+"', '"+bc+"', '"+usr+"', '"+rcb+"', '"+hb+"', '"+cft+"', '"+fu+"', '"+fc+"', '"+mpc+"','"+pcbmod+"','"+psc+"' ,"+
 										"  '"+gmc+"', '"+gtchd+"', '"+ssc+"', '"+oct+"', '"+mc+"' , '"+tfc+"',  '"+eby+"', '"+tdu+"',  '"+mevr+"', '"+btp+"' ,  '"+tby+"' , '"+rcedby+"' , '"+reccust+"', '"+rcbr+"' ,"+
 										"  '"+psn+"',  '"+pcbn+"',  '"+bxn+"',  '"+btrn+"', '"+imein+"') ";
 	      			   System.out.println(sql1);
 	     				st2.executeUpdate(sql1);
 	     				System.out.println("<><><><>in progress4");
 					
 				  	     					     				
 	    				  					
 	     		 	     				
 	     					msg=a2;  
					  
					  
					  
				  }else{
				  
					  System.out.println("<><><><>else of date loop>>>>>> ");
					  
				  java.util.Date dt11 = new SimpleDateFormat("yyyy-MM-dd").parse(entdate);
  					
				  java.util.Date dt12= new SimpleDateFormat("yyyy-MM-dd").parse(dispdate);
  					if(dt11.before(dt12) || dt11.equals(dt12) ){
  						
  						System.out.println("<><><><>in progress1");
  						
  						
  						
  						
  						

	     					
  						
  						sql2="update db_gps.t_unitmaster set SimNo = '-' , MobNo = '-'  where UnitId ='"+x+"'";
  		 			   System.out.println(sql2);
  						st2.executeUpdate(sql2);
  						
  						
  						sql4="select * from db_gps.t_unitmaster where unitId='"+x+"'  ";
  						
  						System.out.println("<><><><>in progress222222");
  						ResultSet rst1=st2.executeQuery(sql4);
  						System.out.println(sql4);
  						while(rst1.next())
  						{
  						
  							entdt=rst1.getString("Entdate");
  						ettime=rst1.getString("EntTime");
  						unitid=rst1.getString("UnitId");
  						smno=rst1.getString("SimNo");
  						smcompany=rst1.getString("SimCompany");
  						mbno=rst1.getString("MobNo");
  						insttyp=rst1.getString("InstType");
  						insttypnw=rst1.getString("InstTypeNew");
  						coe=rst1.getString("CommentOfEdit");
  						edtby=rst1.getString("EditedBy");
  						wsn=rst1.getString("WMSN");
  						mdl=rst1.getString("Module");
  						gpps=rst1.getString("GPS");
  						tput=rst1.getString("typeunit");
  						sw=rst1.getString("SwVer");
  						pvc=rst1.getString("PVoice");
  						pjbz=rst1.getString("PJrmBuzz");
  						pbzr=rst1.getString("PBuzzer");
  						ptmp1=rst1.getString("pTemp1");
  						ptmp2=rst1.getString("pTemp2");
  						pdr=rst1.getString("PDoor1");
  						pdr1=rst1.getString("PDoor2");
  						phrn=rst1.getString("PHorn");
  						pscd=rst1.getString("PScard");
  						pflw1=rst1.getString("PFlowSen1");
  						pflw2=rst1.getString("PFlowSen2");
  						pln=rst1.getString("Plain");
  						perphl=rst1.getString("Peripherals");
  						pephcd=rst1.getString("PeriphCode");
  						stts=rst1.getString("Status");
  						cfd=rst1.getString("CommentForDispatch");
  						System.out.println("31");
  						
  						da=rst1.getString("DisAdd");
  						dd=rst1.getString("DispDate");
  						dt=rst1.getString("DispTime");
  						on=rst1.getString("OrderNo");
  						mod=rst1.getString("ModeofDispatch");
  						dnm=rst1.getString("DisName");
  						cd=rst1.getString("CourierDate");
  						chn=rst1.getString("ChalanNo");
  						di=rst1.getString("DispId");
  						bc=rst1.getString("BarCode");
  						usr=rst1.getString("User");
  						rcb=rst1.getString("RecBy");
  						hb=rst1.getString("HoldBy");
  						cft=rst1.getString("CommentForTransf");
  						fu=rst1.getString("FaultyUnit");
  						fc=rst1.getString("FirmwareChanged");
  						mpc=rst1.getString("ModulePCBChanged");
  						pcbmod=rst1.getString("PCBmodification");
  						psc=rst1.getString("PowerSupplyChanged");
  						gmc=rst1.getString("GPSMouseChanged");
  						gtchd=rst1.getString("GSMAntennaChanged");
  						ssc=rst1.getString("SoftwareSimCorrections");
  						oct=rst1.getString("OtherCorrections");
  						System.out.println("54");
  						
  						mc=rst1.getString("ManufactureCount");
  						tfc=rst1.getString("TrackFileCount");
  						
  						eby=rst1.getString("EntBy");
  						tdt=rst1.getString("TransDate");
  						tdu=rst1.getString("testedunit");
  						mevr=rst1.getString("Mobile_verified");
  						btp=rst1.getString("Box_type");
  						tby=rst1.getString("Tested_by");
  						tdt=rst1.getString("TesetdDateTime");
  						rcedby=rst1.getString("RecByTech");
  						rectm=rst1.getString("RecDateTime");
  						reccust=rst1.getString("RecByCust");
  						recdt=rst1.getString("RecByCustDate");
  						rcbr=rst1.getString("RecConfirmByRep");
  						tfdt=rst1.getString("trackfiledate");
  						psn=rst1.getString("PSNo");
  						pcbn=rst1.getString("PCBNo");
  						bxn=rst1.getString("BoxNo");
  						btrn=rst1.getString("BatteryNo");
  						imein=rst1.getString("IMEINo");
  						System.out.println("74");
  						
  						
  							
  						}
  						
  						System.out.println("<><><><>in progress2");
  						System.out.println(entdt);
  						System.out.println(ettime);
  						
  						sql1="Insert into  db_gps.t_unitmasterhistory ( Entdate, EntTime, UnitId, SimNo, SimCompany, MobNo, InstType , InstTypeNew , CommentOfEdit, EditedBy , WMSN , Module , GPS , typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn , PScard , PFlowSen1,  PFlowSen2 ,"+
  								" Plain, Peripherals , PeriphCode , Status, CommentForDispatch , DisAdd, DispDate, DispTime, OrderNo, ModeofDispatch, DisName, CourierDate , ChalanNo, DispId, BarCode ,"+
  								" User ,RecBy, HoldBy , CommentForTransf, FaultyUnit , FirmwareChanged , ModulePCBChanged , PCBmodification , PowerSupplyChanged , GPSMouseChanged , GSMAntennaChanged ,"+
  								" SoftwareSimCorrections, OtherCorrections, ManufactureCount, TrackFileCount , EntBy , testedunit, Mobile_verified, Box_type, Tested_by, "+
  								" RecByTech,  RecByCust ,  RecConfirmByRep ,  PSNo ,PCBNo , BoxNo , BatteryNo , IMEINo )"+
  								" values ('"+entdt+"', '"+ettime+"', '"+unitid+"', '"+smno+"', '"+smcompany+"', '"+mbno+"', '"+insttyp+"', '"+insttypnw+"', '"+coe+"', '"+edtby+"', '"+wsn+"', '"+mdl+"', '"+gpps+"' ,"+
  										" '"+tput+"', '"+sw+"', '"+pvc+"',  '"+pjbz+"' , '"+pbzr+"', '"+ptmp1+"', '"+ptmp2+"', '"+pdr+"', '"+pdr1+"', '"+phrn+"', '"+pscd+"', '"+pflw1+"', '"+pflw2+"', '"+pln+"', '"+perphl+"', '"+pephcd+"' ,"+
  										"  '"+stts+"', '"+cfd+"' , '"+da+"', '"+dd+"', '"+dt+"', '"+on+"', '"+mod+"', '"+dnm+"', '"+cd+"', '"+chn+"', '"+di+"', '"+bc+"', '"+usr+"', '"+rcb+"', '"+hb+"', '"+cft+"', '"+fu+"', '"+fc+"', '"+mpc+"','"+pcbmod+"','"+psc+"' ,"+
  										"  '"+gmc+"', '"+gtchd+"', '"+ssc+"', '"+oct+"', '"+mc+"' , '"+tfc+"',  '"+eby+"', '"+tdu+"',  '"+mevr+"', '"+btp+"' ,  '"+tby+"' , '"+rcedby+"' , '"+reccust+"', '"+rcbr+"' ,"+
  										"  '"+psn+"',  '"+pcbn+"',  '"+bxn+"',  '"+btrn+"', '"+imein+"') ";
  	      			   System.out.println(sql1);
  	     				st2.executeUpdate(sql1);
  	     				System.out.println("<><><><>in progress4");
  					
  				  	     					     				
  	    				  					
  	     		 	     				
  	     					msg=a2;
  	     				 	     				  						 						
  	     				}    
  					
				  
  						

  					else{
  						msg=a3;
  					
  					
  					%>
  			
  					 						 						
  					<% 
  					
  					}
  					
				  }
  					}
  					catch(Exception e)
  					{
  						 System.out.println(">>>>>E:"+e);
  					     e.printStackTrace();   
  					}
  					
  				
  					
  				}else {
  					
  					msg = a1; 
  				}
  			
  				 
              }
              
          catch(Exception e)
          {
        	  System.out.println(">>>>>E:"+e);
          }






response.sendRedirect("main.jsp?msg="+msg+"");   

}
catch(Exception e)
{
	//
	System.out.print("Exception --->"+e);
}
finally
{
	conn.close();
	conn1.close();
}

%>

</body>
</html>