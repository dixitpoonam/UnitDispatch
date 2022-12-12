<%@ include file="headeradmin.jsp" %>
<%!
Connection con1, con2;
%>
<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement stmt1=con2.createStatement(), stmt2=con2.createStatement(), stmt3=con1.createStatement(), stmt4=con1.createStatement(), stmt5=con2.createStatement(), stmt6=con2.createStatement(),stmt7=con2.createStatement(),stmt8=con1.createStatement();
ResultSet rs1=null, rs3=null, rs4=null, rs5=null, rs7=null;
String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql7="", sql8="", sql9="";
String cntr="", flag="true", mode="", disname="", chalan="";
String entdte="", unit="", simno="", mobno="", insttyp="",comm="",wmsn="",boxtype="", module="", gps="", typun="", swver="", voice="", jrmbuzz="", buzzer="", temp1="", temp2="", door1="", door2="", horn="", scard="", flowsen1="", flowsen2="", plain="", peripherals="", user="";
String time=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
int cntrint=0, chkdcntr1=0, chkdcntr=0, rno=0, periphcode=0, maxreqno=0, maxdispid=0;
String dispadd="", newadd="", newfuladd="",dispuser="",vendorName="",VID="";
user=session.getValue("typeval").toString();
System.out.println("User Name--"+user);
String entby=session.getValue("user").toString();
System.out.println("Enter By--"+entby);
cntr=request.getParameter("cntr");
System.out.println("Counter--"+cntr);
cntrint=Integer.parseInt(cntr);
comm=request.getParameter("comm");
System.out.println("comm--"+comm);
mode=request.getParameter("mode");
System.out.println("Mode--"+mode);
disname=request.getParameter("disname");
System.out.println("Disp Name--"+disname);
chalan=request.getParameter("chalan");
System.out.println("Chalan --"+chalan);
dispadd=request.getParameter("fuladd");
System.out.println("Disp Add -- "+dispadd);
vendorName=request.getParameter("VenderList");
System.out.println("Vendor Name -- "+vendorName);

String dispuserName = "SELECT UName FROM t_admin WHERE Name LIKE '"+request.getParameter("dispuser")+"' AND Active = 'Yes' AND UserType = 'dispatch'";
ResultSet rsUName = stmt8.executeQuery(dispuserName);
if(rsUName.next())
{
	dispuser=rsUName.getString("UName");
}
else
{
	dispuser=request.getParameter("dispuser");
}

System.out.println("Dispatch Name----------------------------> -- "+dispuser);


String mainVendorID = "select V_ID from db_CustomerComplaints.t_vendorMaster where V_Name like '"+vendorName+"'";
//System.out.println("Main Vendor--"+mainVendor);
ResultSet rsVendor = stmt7.executeQuery(mainVendorID);
if(rsVendor.next())
{
 VID = rsVendor.getString("V_ID");
System.out.println("Vendor ID----"+VID);
// System.out.println("Vendor Role----"+vendoreRole);
}

if(dispadd.equals("Other"))
{
	int maxid=0;
	newadd=request.getParameter("newadd");
	newfuladd=request.getParameter("newfuladd");
	dispadd=newadd;

	sql7="select max(id) as maxid from t_admin ";
	rs7=stmt3.executeQuery(sql7);
	if(rs7.next())
	{
		maxid=rs7.getInt("maxid");
	}
	sql8="insert into t_admin (id, Name, Uname, pass, URole) values ('"+maxid+"', '"+newadd+"', '"+newadd+"', '"+newadd+"', 'manufacturer')";
	stmt3.executeUpdate(sql8);

	String abc1=sql8.replace("'", "#");
	abc1=abc1.replace(",", "$");
	String str1="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc1+"')";	
	stmt3.executeUpdate(str1);

	sql9="insert into t_dispatchaddress (Address, Location) values ('"+newfuladd+"', '"+newadd+"')";
	stmt3.executeUpdate(sql9);
	
	String abc=sql9.replace("'", "#");
	abc=abc.replace(",", "$");
	String str2="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc+"')";	
	stmt3.executeUpdate(str2);
}
		java.util.Date d=new java.util.Date();
   		String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();
        java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   		Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   		String nwfrmtdte=formatter.format(datefrmdb);
   		
   	//	String time=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
		//out.print(nwfrmtdte);

/* ********Checking how many check-boxes were checked. Taking count of that*********** */

 String[] uncntchk = new String[cntrint];
for(int k=0; k<cntrint; k++) 
{
   uncntchk[k] = request.getParameter("dis"+k );
   if(uncntchk[k]==null)
   {
     System.out.println("UnitID---->"+uncntchk[k]);
   }
   else
   {
	System.out.println("UnitID---->"+uncntchk[k]);
	chkdcntr1++;
	flag="false";
   }
}
/* ************************************************************************** */
/* *******************generating Order no automatically****************************** */
sql3="select max(Reqno) as maxreqno from t_unitorder";
rs3=stmt3.executeQuery(sql3);
if(rs3.next())
{
	maxreqno=rs3.getInt("maxreqno");	
}
maxreqno++;
/* ************************************************************************** */
/* *********Generating DispId for this particular Courier****** */
		sql5="select max(DispId) from t_unitmasterhistory ";
  		rs5=stmt5.executeQuery(sql5);
  		if(rs5.next())
  		{
  			  maxdispid=rs5.getInt("max(DispId)");
  		}
		maxdispid= maxdispid+1; 
/* ************************************************************************** */
/* *********if no check box was selected, then page will be re-directed to previous form, else it will be upated in DB************ */

if(flag.equals("true"))
 {
   response.sendRedirect("testedunits.jsp?nounitselected=true");
   return;
 }
else
 {
	String[] x = new String[cntrint];
        String[] unid = new String[cntrint];

    sql4="insert into t_unitorder (Reqno, Reqto, ReqDate, NoofUnits, RemUnits, DispatchAdd, Status,ModeofDispatch, DisName, ReqBy ,Cust) values ('"+maxreqno+"', '"+VID+"', '"+nwfrmtdte+"', '"+chkdcntr1+"', '"+chkdcntr1+"', '"+dispadd+"', 'Sent', '"+mode+"', '"+dispuser+"', '"+entby+"','"+disname+"')";
    System.out.print(sql4);
	stmt4.executeUpdate(sql4);	
	String abc=sql4.replace("'", "#");
	abc=abc.replace(",", "$");
	String str3="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc+"')";	
	stmt4.executeUpdate(str3);

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
		sql1="select * from t_unitmaster where UnitId='"+unid[i]+"' "; 
          	//out.print(sql1);  
        rs1=stmt1.executeQuery(sql1);
		if(rs1.next())
          	{
			        rno=rs1.getInt("Rno");
             		entdte=rs1.getString("EntDate"); 
               		unit=rs1.getString("UnitID");
              		simno=rs1.getString("SimNo");
             		mobno=rs1.getString("MobNo"); 
              		insttyp=rs1.getString("InstType");
              		wmsn=rs1.getString("WMSN");
              		module=rs1.getString("Module");
              		gps=rs1.getString("GPS");
              		typun=rs1.getString("typeunit"); 
              		swver=rs1.getString("SwVer"); 
              		voice=rs1.getString("PVoice"); 
              		jrmbuzz=rs1.getString("PJrmBuzz");
              		buzzer=rs1.getString("Pbuzzer");
              		temp1=rs1.getString("PTemp1");
              		temp2=rs1.getString("PTemp2");
              		door1=rs1.getString("PDoor1");
              		door2=rs1.getString("PDoor2");
              		horn=rs1.getString("PHorn");
              		scard=rs1.getString("PScard");
              		flowsen1=rs1.getString("PFlowSen1");
              		flowsen2=rs1.getString("PFlowSen2");
              		plain=rs1.getString("Plain");
              		peripherals=rs1.getString("Peripherals");
              		periphcode=rs1.getInt("PeriphCode");
              		boxtype=rs1.getString("Box_type");
	        } //if	
/* ************************************************************************** */
/* ****************************Making entries in DB*************************** */
		sql2="update t_unitmaster set Status='Sent', DispDate='"+nwfrmtdte+"', OrderNo='"+maxreqno+"', ModeofDispatch='"+mode+"', DisName='"+disname+"', ChalanNo='"+chalan+"', DispId='"+maxdispid+"', EntBy='"+entby+"',DispTime='"+time+"',CommentForDispatch='"+comm+"'  where UnitID='"+unid[i]+"' ";
              //  out.println(sql2);
                stmt2.executeUpdate(sql2); 			
                String abc2=sql2.replace("'", "#");
            	abc2=abc2.replace(",", "$");
            	String str4="insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abc2+"')";	
            	stmt2.executeUpdate(str4);
 		sql6="insert into t_unitmasterhistory (Rno, EntDate, UnitID, SimNo, MobNo, InstType, WMSN, Module, GPS, typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, Peripherals, PeriphCode, Status, DisAdd, DispDate, OrderNo, ModeofDispatch, DisName, CourierDate, ChalanNo, DispId, BarCode, User, EntBy,DispTime,CommentForDispatch,EntTime,Box_type) values ('"+rno+"', '"+entdte+"', '"+unit+"', '"+simno+"', '"+mobno+"', '"+insttyp+"', '"+wmsn+"', '"+module+"', '"+gps+"', '"+typun+"', '"+swver+"', '"+voice+"', '"+jrmbuzz+"', '"+buzzer+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+peripherals+"', '"+periphcode+"', 'Sent', '2', '"+nwfrmtdte+"', '"+maxreqno+"', '"+mode+"','"+disname+"', '-', '"+chalan+"', '"+maxdispid+"', '-', '"+dispuser+"', '"+entby+"','"+time+"','"+comm+"','"+time+"','"+boxtype+"') ";
		stmt6.executeUpdate(sql6);
		  String abc3=sql6.replace("'", "#");
      	abc3=abc3.replace(",", "$");
      	String str5="insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abc3+"')";	
      	stmt6.executeUpdate(str5);
/* ************************************************************************************ */
          } //else
      // out.print(unid[i]);
    }	// for
	con1.close();
	con2.close();
	response.sendRedirect("testedunits.jsp?sent=yes");
	return;
 } //else
}catch (IllegalStateException e )
{
	response.sendRedirect("testedunits.jsp?sent=yes");
	return;
}
catch(Exception e) { out.println("Exception----->" +e);
e.printStackTrace();
}
finally
{
}
%>