<%@page import="com.mysql.jdbc.Util"%><script src="sorttable.js"></script>
<%@ include file="menuheader.jsp" %>
<script language="javascript">
var shownme="Yes";
function Validate()
{
  var v1=document.statform.disname.value;
  var v2=document.statform.chalan.value;
  var validChar='0123456789';   // legal chars
  var   strlen=v2.length;       // test string length

  if(shownme=="Yes")
  {
  if(v1.length==0)
  {
     alert("Please enter Name of a Person / Courier no. ");
     return false;
  }
  		}
  if(v2.length==0)
  {
     alert("Please enter Chalan no. ");
     return false;
  }

  v2=v2.toUpperCase(); // case insensitive
  

  for(var ic=0;ic<strlen;ic++) //now scan for illegal characters
       {
           
           if(validChar.indexOf(v2.charAt(ic))<0)
               {		
                   alert("please enter a valid Unit ID!");
                   return false;
               }
       } // end scanning
       
  
return true;
}


function GetAdd(dropdown)
{
  var vv1=dropdown.selectedIndex;
  var SelValue1 = dropdown.options[vv1].value;
  //alert(SelValue1);

  var ajaxRequest;  // The variable that makes Ajax possible!

    try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	        }  
                catch (e)
                {
		        // Internet Explorer Browsers
		        try
                        {
			   ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		        } 
                        catch (e)
                        {
			   try
                           {
			       ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			   } 
                           catch (e)
                           {
			      // Something went wrong
			      alert("Your browser broke!");
			      return false;
			   }
		        }
                }

                  // Create a function that will receive data sent from the server
            	   ajaxRequest.onreadystatechange = function()
                     {
     	 	   if(ajaxRequest.readyState == 4)
                        {
                           var reslt=ajaxRequest.responseText;
                           //alert(reslt);
  
             //var len=reslt.length;
             //alert(len);
                           var reslt=ajaxRequest.responseText;
                           
                           document.statform.fulladd.value = reslt;
                           
		      } 
         	   }
               var queryString = "?loc=" +SelValue1;
 	      ajaxRequest.open("GET", "Ajaxgetadd.jsp" + queryString, true);
	     ajaxRequest.send(null); 
}




function Updateunit(unitid,index,trackfiledate)
{
//alert("Updateunit function");
	//alert(index);
	//alert("HELLO"+unitid+index+trackfiledate);
//	alert(document.getElementById("btnok"+index));
//	alert(document.getElementById("trackfile"+index));
	var v2=document.getElementById("trackfile"+index).value;
	//alert(v2);
	  //var v1=document.statform.v2.value;
	//alert(v1+"trackfiledate");
	var ajaxRequest;

	try
	{
		ajaxRequest=new XMLHttpRequest();
	}catch(e)
	{
		try{
			ajaxRequest=new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e)
		{
			try{
				ajaxRequest=new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e)
			{
				alert("your browser broke");
				return false;
			}
		}
	}


		ajaxRequest.onreadystatechange=function()
		{
			if(ajaxRequest.readyState==4)
			{
				var reslt=ajaxRequest.responseText;
				reslt= reslt.replace(/^\s+|\s+$/g,"");
				alert(reslt);
				var len=reslt.length;
				if(len==29)
				{
				document.getElementById("btnok"+index).style.display="none";
				document.getElementById("dis"+index).style.display="block";
				}
			}
		}


		ajaxRequest.open("GET","Ajaxupdateunitid.jsp?trackfiledate="+v2+"&unitid="+unitid,true);
		ajaxRequest.send(null);
	
}

function ShowDate(ind)
{
  if(ind==0)
  {
     // document.statform.calender.style.visibility='hidden';
     // document.statform.trigger.style.visibility='hidden';
      //document.statform.calender.value="";
		document.getElementById("name").style.visibility='visible';
        shwnme="Yes";
      //shwdte="No";
  }
  else
  {
      //document.statform.calender.style.visibility='visible';
      //document.statform.trigger.style.visibility='visible';
 		document.getElementById("name").style.visibility='hidden';
        shwnme="No";
      //shwdte="Yes";
  }  
}
</script>

<%!
Connection con1;
Connection con2;
Connection con3;
%>
<form name="statform" method="post" action="dispatch.jsp" onSubmit="return Validate()";>
<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con3 = DriverManager.getConnection(MM_dbConn_STRING2,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement(),stunitmastertrack=con1.createStatement(),stmt2=con2.createStatement(), stmt3=con2.createStatement(), stmt5=con1.createStatement(), stmt6=con1.createStatement(),stmt7=con1.createStatement(),stmt8=con1.createStatement(),stmt9=con1.createStatement(),stmt10=con1.createStatement(),stmt111=con1.createStatement(),stmt11=con3.createStatement(),stmtSoftVerCheck = con2.createStatement();
Statement stvalid=con2.createStatement();
ResultSet rs1=null, rs2=null, rs3=null,rs4=null, rs5=null, rs6=null,rs7=null,rs8=null,rs9=null,rs10=null,rs11=null,rs12=null;
String sql1="", sql2="", sql3="",sql4="", sql5="", sql6="",sql7="",sql8="",sql9="",sql10="",sql11="",sql12="";
String disloc="", fuladd="", cnt="", insttyp="", reqto="", dispto="";
String receivedate="",timediffrence="",gapDuration="";
int count=0;
String user=session.getAttribute("typeval").toString();
String ustyp=session.getAttribute("urole").toString();


   java.util.Date d=new java.util.Date();
   String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate(); 

   java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter=new SimpleDateFormat("yyyy-MM-dd");
 
   java.util.Date datefrmdb11=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(d));
   String nwfrmtdte=formatter.format(datefrmdb);

%>
 <input type="hidden" name="tdydte" value="<%=nwfrmtdte %>" />
<%
sql4="select count(*) from t_unitorder where Reqto='"+user+"' and Status in('Open', 'Partially Dispatched') ";
rs4=stmt2.executeQuery(sql4);
if(rs4.next())
{
  cnt=rs4.getString(1);
}

  String code=request.getParameter("code");
 // System.out.println(code);
  String untyp=request.getParameter("untyp");
  String reqno=request.getParameter("reqno");
  String loc=request.getParameter("loc");
  String noofunits=request.getParameter("noofunits");
  String Simco=request.getParameter("simco");
  String Boxtype=request.getParameter("boxtype");
  String orderdate=request.getParameter("orderdate");
  String dispatchdate=request.getParameter("dispatchdate");
  insttyp=request.getParameter("insttyp");
  reqto=request.getParameter("reqto");
  //System.out.print(reqno);
  dispto=request.getParameter("dispto");
%>

<input type="hidden" name="reqno" value="<%=reqno %>" />
<input type="hidden" name="untyp" value="<%=untyp %>" /> 
<input type="hidden" name="code" value="<%=code %>" /> 
<input type="hidden" name="loc" value="<%=loc %>" /> 
<input type="hidden" name="reqno" value="<%=reqno %>" /> 
<input type="hidden" name="noofunits" value="<%=noofunits %>" /> 
<input type="hidden" name="Simco" value="<%=Simco %>" /> 
<input type="hidden" name="Boxtype" value="<%=Boxtype %>" />
<input type="hidden" name="dispto" value="<%=dispto %>" /> 

<table border="0" width="100%">
 <tr>
     
     <td> <div align="center"> <font color="maroon" size="3"> <B> Available Units of <%=untyp %> Type (<%=insttyp %>) with <%=reqto %></B></font></div></td>
 </tr>
</table>

<table class="stats">
     <tr>
       <th> </th> 
      <th> Sr No. </th>
      <th> Entered On </th>
	<th> Data Date</th>
      <th> Unit ID </th>
      <th>Received Date</th>
	 <th>Time Diff.</th>
      <th> SIM No </th>
      <th>Sim Co.</th>
      <th>TrackFile Date</th>
      <th>ER Count</th>
      <th>TrackFileCount</th>
      <th>ManufCount</th>
      <th>Box Enclosure Type</th>
      <th> Mobile No </th>
      <th> WMSN No </th>
      <th> Module Type </th>
      <th> GPS No </th>
      <th> Unit Type </th>
      <th> Peripherals </th>
      <th>Location </th>
<%
   /*if(ustyp.equals("administrator"))
  { */ %>
     <!-- <th> User </th> -->
<% //} %>

     </tr>
<%
if(ustyp.equals("administrator"))
{ 
	///System.out.println("simco--"+Simco);
	//System.out.println("Boxtype--"+Boxtype);
	if((Simco.equals("-") || Simco.equalsIgnoreCase("Any") )&&( Boxtype.equals("-") || Boxtype.equalsIgnoreCase("Any")))
	 sql1="select * from t_unitmaster a, allconnectedunits b where a.UnitID=b.UnitID and a.typeunit='"+untyp+"' and a.PeriphCode='"+code+"' and a.InstType='"+insttyp+"' and a.Status not in( 'Dispatched', 'Waiting For Dispatch','Sent') and concat(a.EntDate, a.EntTime)<= concat(b.TheDate,b.TheTime)  and a.User='"+reqto+"' order by concat(EntDate,EntTime) desc";
	else if((!Simco.equals("-") && !Simco.equalsIgnoreCase("Any")) && (Boxtype.equals("-") || Boxtype.equalsIgnoreCase("Any")))
     sql1="select * from t_unitmaster a, allconnectedunits b where a.UnitID=b.UnitID and a.typeunit='"+untyp+"' and a.PeriphCode='"+code+"' and a.SimCompany='"+Simco+"' and a.InstType='"+insttyp+"' and a.Status not in( 'Dispatched', 'Waiting For Dispatch','Sent') and concat(a.EntDate, a.EntTime)<= concat(b.TheDate,b.TheTime)  and a.User='"+reqto+"' order by concat(EntDate,EntTime) desc";
	else if((!Boxtype.equals("-") && ! Boxtype.equalsIgnoreCase("Any")) && (Simco.equals("-") || Simco.equalsIgnoreCase("Any")))
		sql1="select * from t_unitmaster a, allconnectedunits b where a.UnitID=b.UnitID and a.typeunit='"+untyp+"' and a.PeriphCode='"+code+"' and a.Box_type='"+Boxtype+"' and a.InstType='"+insttyp+"' and a.Status not in( 'Dispatched', 'Waiting For Dispatch','Sent') and concat(a.EntDate, a.EntTime)<= concat(b.TheDate,b.TheTime)  and a.User='"+reqto+"' order by concat(EntDate,EntTime) desc";
	else if((!Simco.equals("-") && !Simco.equalsIgnoreCase("Any")) && (!Boxtype.equals("-") && !Boxtype.equalsIgnoreCase("Any")))	
		sql1="select * from t_unitmaster a, allconnectedunits b where a.UnitID=b.UnitID and a.typeunit='"+untyp+"' and a.PeriphCode='"+code+"' and a.Box_type='"+Boxtype+"' and a.SimCompany='"+Simco+"' and a.InstType='"+insttyp+"' and a.Status not in( 'Dispatched', 'Waiting For Dispatch','Sent') and concat(a.EntDate, a.EntTime)<= concat(b.TheDate,b.TheTime)  and a.User='"+reqto+"' order by concat(EntDate,EntTime) desc";
	
	 
   rs1=stmt1.executeQuery(sql1);
  // System.out.println("sql1"+sql1);
   while(rs1.next())
   {
    String ftpduminfo="UnMatch", entryftpdump="",Batteryinfo="",statusBattery="UnMatch",AVL_SOFT_VER = "UnMatch";;
	String wmsndump="", simdump="",unittypedump="", simdump1="",codeverdump="",FWfromFtp="",teststatus="",imeino="",configured="";
	String olddatadate="",maildate="",simco="";
	String chk="", locchk="";
	String maildata="",swrver="";
	String trackfiledate="0000-00-00 00:00:00";
	boolean flag=false,softwareversion=false;
	  String enttime="";
       count++; 

       String unitid=rs1.getString("UnitID");
       //System.out.println(unitid);
     //  swrver=rs1.getString("SwVer");
       String enton=rs1.getString("EntDate");
       String TrackFileCount=rs1.getString("TrackFileCount");
       String ManufactureCount=rs1.getString("ManufactureCount"); 
	String location=rs1.getString("Location");
	String wmsn=rs1.getString("WMSN").trim();
	String simno=rs1.getString("SIMNo").trim();
	 //System.out.println(simno);
	String mobno=rs1.getString("MobNo").trim();
	String unittype=rs1.getString("typeunit").trim();
	try{enttime=rs1.getString("EntTime");}catch(Exception e){enttime="00:00:00";e.printStackTrace();};
	String datadate=rs1.getString("TheDate");
	maildate=datadate;
	String status=rs1.getString("Status");
	String testedunit=rs1.getString("testedunit");
	String swver=rs1.getString("SwVer").trim();	
	simco=rs1.getString("SimCompany");
	
	String loc1 ="";
	//System.out.println("location--->"+location);	
	loc1 =location.substring(0,location.indexOf(" "));
	 //System.out.println("loc1--->"+loc1);	
	double loc33=0.00;
	 DecimalFormat df2 = new DecimalFormat( "####.00" );
	 int loc2 =0;
	 
		
	 try{
	 loc33 =Double.parseDouble(loc1);
	  //loc33= df2.format(loc33);
	 // System.out.println("loc33--->"+loc33);
	 // loc2=loc2.
	// System.out.println("loc2--->"+loc2);
	 }catch(NumberFormatException n)
	 {
		//n.printStackTrace(); 
	 } 
		 
	 
	 
	
	String valid="select valid from db_CustomerComplaints.t_utcodever where codever='"+swver+"'";
	ResultSet rsvalid=stvalid.executeQuery(valid);
	if(rsvalid.next()){
		softwareversion = true;
	}
	
	if (simco.equalsIgnoreCase("idea"))
 	{
		simno=rs1.getString("SIMNo").trim();
		simno=simno.substring(0,7);
		flag=true;
 	}
else
	{
		simno=rs1.getString("SIMNo").trim();
	}
	
	
	sql12 = "Select * from db_CustomerComplaints.NoFTPCheckSoftVer where SoftVer = '"+swver+"'";
	rs12 = stmtSoftVerCheck.executeQuery(sql12);
	if(rs12.next())
	{
		AVL_SOFT_VER = "Match";
	}
	
	//if(swver.contains("M12_avl1pt1") || swver.contains("SIMARM")||swver.contains("AVL_LITE")||swver.contains("FM2200")||swver.contains("TWP3_TS")||swver.contains("TW_P1_TS_RTC") || swver.contains("TWP4_TS") || swver.contains("M12_avl1pt2") || swver.contains("M12_avl1pt2") || swver.contains("LITE2_1pt4C") || swver.contains("TWP5_TS_RTC"))
    if(softwareversion)
	//if(AVL_SOFT_VER == "Match")	
	{
		chk="";
	}
	else if("Tested".equalsIgnoreCase(status)){
		chk="";
	}
	else{	
	
	sql5="select * from t_ftplastdump where UnitId='"+unitid+"' and StoredDateTime >='"+enton+" "+enttime+"' ";
	//System.out.print(sql5);
	rs5=stmt5.executeQuery(sql5);
	if(rs5.next())
	{
		wmsndump=rs5.getString("WMSN");
		trackfiledate=rs5.getString("Filedatetime");
	//	System.out.println("trackfiledate from ftplastdump"+trackfiledate);
		simdump=rs5.getString("SimNo");
		//System.out.println("simno from ftplastdump"+simdump);
		unittypedump=rs5.getString("UnitType");
		codeverdump=rs5.getString("CodeVersion");
		
		
		
		FWfromFtp=rs5.getString("FW");
		imeino= rs5.getString("IMEI_No");
		if(flag)
		{
			try {
				if(simdump.endsWith("F")){
					int ind=simdump.length()-8;
					simdump1=simdump.substring(ind,simdump.length()-1); 
				}else{
				int ind=simdump.length()-7;
				simdump1=simdump.substring(ind,simdump.length()); 
				}
				} catch (Exception e)	
			    {
				simdump1="NA";
				e.printStackTrace();
			    }	
		}
		else
		{
			try {
				if(simdump1.endsWith("F")){
					int ind=simdump.length()-9;
					simdump1=simdump.substring(ind,simdump.length()-1); 
				}else{
				int ind=simdump.length()-8;
				simdump1=simdump.substring(ind,simdump.length()); 
				}
				} catch (Exception e)	
			    {
				simdump1="NA";	
				e.printStackTrace();
			    }	
		}
		//System.out.println(simdump1);
		if(imeino!=null && imeino.trim().length()==15 && !(imeino.trim().equalsIgnoreCase("-")))
		{
			boolean matchfound2=false;
			boolean matchFound1=false;
		   matchFound1=imeino.startsWith("0123456");
		   matchfound2=imeino.contains("000000000000000");
				if(matchfound2==true||matchFound1==true)
				{
					chk="Incorrect IMEI No.";		
				}
				
		}
		else
		{
			chk="Incorrect IMEI No.";	
		}
		    
		    if(!(wmsn.equals(wmsndump)))
			{
				chk=chk+",WMSN";
			}
					
			if(!(simno.equals(simdump1)))
			{
				chk=chk+",SIM";
				
			}

			if(!(unittype.equals(unittypedump)))
			{
				chk=chk+",TYPE";
			}
			if(!(swver.equalsIgnoreCase(codeverdump)))
			{
				chk=chk+",SoftwareVersion";
			}
		//	System.out.println(FWfromFtp);
			String firmware="",firmware1="";
			String valid1="select firmware from db_CustomerComplaints.t_utfirmware where valid='Yes' ";
					ResultSet rsvalid1=stvalid.executeQuery(valid1);
			//		System.out.println("valid1---->"+valid1);
					while(rsvalid1.next()){
						firmware=rsvalid1.getString("firmware");
						firmware1=firmware1+","+firmware;
				//		System.out.println(firmware1);
					}
					 String delimiter = ",";
					 String[] temp;
					 temp = firmware1.split(delimiter);
					 /* print substrings */
					 for(int i =0; i < temp.length ; i++)
				//	 System.out.println(temp[i]);
				//	 System.out.println("first string-->"+temp[1]);
				//	 System.out.println("first string-->"+temp[2]);
			if(FWfromFtp.contains(temp[1])||FWfromFtp.contains(temp[2])){
			}else{
				chk=chk+",Invalid Firmware";
			}
		//	System.out.println(chk);
	}
	else
	{
		/*wmsndump=wmsn;
		codeverdump=swver;
		simdump1=simno;
		unittypedump=unittype;*/
	
		entryftpdump="No Entry in FTP Dump, Contact Transworld";
		ftpduminfo="UnMatch";
	}
	}
	
	//check if the unit is configured at the time of dispatch
	sql5="select VehicleRegNumber from t_vehicledetails where unitid="+unitid;
	rs5=stmt5.executeQuery(sql5);
	if(rs5.next())
	{
		String vehcode=rs5.getString("VehicleRegNumber");
		configured="The Unit is Configured in "+vehcode;
	}
	

	if(location.equals("At Transworld2(MH)") || location.equals("At Transworld Pune (MH)")|| location.equals("At Transworld3(MH)") || location.equals("At Transworld4(MH)") || location.equals("In Transworld2(MH)") || location.equals("In Transworld Pune (MH)")|| location.equals("In Transworld3(MH)") || location.equals("In Transworld4(MH)") || (location.equals("At APR Vendor Location")))
		
	{
	
		//System.out.println("IF LOOP");
		locchk="";
	}
	else if (loc33<1.1) {
	   if(loc33<1.1  && (location.contains("Transworld2(MH)") || location.contains(" Transworld Pune (MH)")|| location.contains(" Transworld3(MH)") || location.contains(" Transworld4(MH)") || location.contains(" Transworld2(MH)") || location.contains(" Transworld Pune (MH)")|| location.contains(" Transworld3(MH)") || location.contains(" Transworld4(MH)") || (location.contains(" APR Vendor Location"))))
	   {
		  // System.out.println("ELSE IF-IF LOOP");
		   locchk=""; 
		   
	   }else{
		   //System.out.println("ELSE IF-ELSE LOOP");
		   locchk="Loc doesnt Match";
	   }
		
		
	}else
	{
		locchk="Loc doesnt Match";
	}

	
	if(!(chk.equals("")))
	{
		chk=chk+" Not Matching";
	}

	
	sql6="select (TO_DAYS('"+nwfrmtdte+"')-TO_DAYS('"+datadate+"'))";
	rs6=stmt6.executeQuery(sql6);
	if(rs6.next())
	{
		int days=rs6.getInt(1);

		if(days>3)
		{
			olddatadate="Old Data Date";
			
		}
	}
	
	
	
	maildate=maildate.replaceAll("-","_");
/*********** change the condition for unit is available to despatch if server has received 3 mails after manufacturing entry.******************/
/************* Unit should be available if we have 10 stamps after manufacturing entry time***************************/
String today="",oldtiming="",msg="";
java.util.Date defoultdate = new java.util.Date();
Format forma = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

//System.out.println("trackfiledate--->"+trackfiledate);

java.util.Date date=new java.util.Date() ;
try{
date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(trackfiledate);
}catch(Exception e){e.printStackTrace();}
//java.util.Date date = new java.util.Date(trackfiledate);
//System.out.println("date --->"+date);
long miliseconds=date.getTime();
miliseconds=miliseconds +21600000;
//miliseconds=miliseconds +21600000*7000;
defoultdate.setTime(miliseconds);
oldtiming=forma.format(defoultdate);
today = forma.format(date);
//System.out.println("oldtiming--->"+oldtiming);	
int ERCount=0,NGCount=0,DOCount=0,DSCount=0,BLCount=0,POCount=0,PFCount=0,BLCount2=0;
try{
	//if(swver.contains("M12_avl1pt1") || swver.contains("SIMARM")||swver.contains("AVL_LITE")||swver.contains("FM2200")||swver.contains("TWP3_TS")||swver.contains("TW_P1_TS_RTC") || swver.contains("TWP4_TS") || swver.contains("M12_avl1pt2") || swver.contains("LITE2_1pt4C") || swver.contains("TWP5_TS_RTC"))
	if(softwareversion)
	//if(AVL_SOFT_VER == "Match")	
	{
		//sql10="select count(*) from t_ip"+maildate+" where UnitId='"+unitid+"'";
	
	sql10="select count(*) from t_veh0 where UnitId='"+unitid+"' and TheFieldDataDateTime>='"+enton+" "+enttime+"'";
	}else if(("Tested".equalsIgnoreCase(status))){
		
		String unitmastertrackfile="";//sql10="select count(*) from t_ip"+maildate+" where UnitId='"+unitid+"'";
		String unitmastertrack="select trackfiledate from db_gps.t_unitmaster where UnitID='"+unitid+"'";
		ResultSet rsunitmastertrack=stunitmastertrack.executeQuery(unitmastertrack);
		if(rsunitmastertrack.next()){
			unitmastertrackfile=rsunitmastertrack.getString("trackfiledate");
		}
		sql10="select count(*) from t_veh0 where UnitId='"+unitid+"' and concat(TheFieldDataDate,' ',TheFieldDataTime)>='"+unitmastertrackfile+"' ";
	}
	else
	{
		//sql10="select count(*) from t_mails"+maildate+" where UnitId='"+unitid+"'";
		
		/*try{
			String sql111="select count(*) as BLCount from db_gps.t_veh0 where UnitId='"+unitid+"' and Thefielddatadatetime between '"+today+"' and and '"+oldtiming+"' and TheFiledTextFileName='BL' ";
			ResultSet rs111=stmt111.executeQuery(sql111);
			if(rs111.next()){
				BLCount=rs111.getInt("BLCount");
			//	System.out.println("ERCount---->"+ERCount);
			}
			}catch(Exception e){
				e.printStackTrace();
			}*/
		
		try{
			String sql111="select count(*) as ERCount from db_gps.t_veh0 where UnitId='"+unitid+"' and concat(TheFieldDataDate,' ',TheFieldDataTime) between '"+today+"' and '"+oldtiming+"' and TheFiledTextFileName='ER' ";
			ResultSet rs111=stmt111.executeQuery(sql111);
			if(rs111.next()){
				ERCount=rs111.getInt("ERCount");
			//	System.out.println("ERCount---->"+ERCount);
			}
			}catch(Exception e){
				e.printStackTrace();
			}
			try{String sql111="select count(*) as NGCount from db_gps.t_veh0 where UnitId='"+unitid+"' and concat(TheFieldDataDate,' ',TheFieldDataTime) between '"+today+"' and '"+oldtiming+"' and TheFiledTextFileName='NG' ";
			ResultSet rs111=stmt111.executeQuery(sql111);
			if(rs111.next()){
				NGCount=rs111.getInt("NGCount");
			//	System.out.println("ERCount---->"+ERCount);
			}	}catch(Exception e){
			e.printStackTrace();
			}
			
			try{String sql111="select count(*) as DOCount from db_gps.t_veh0 where UnitId='"+unitid+"' and concat(TheFieldDataDate,' ',TheFieldDataTime) between '"+today+"' and '"+oldtiming+"' and TheFiledTextFileName='DO' ";
			ResultSet rs111=stmt111.executeQuery(sql111);
			if(rs111.next()){
				DOCount=rs111.getInt("DOCount");
			//	System.out.println("ERCount---->"+ERCount);
			}	}catch(Exception e){
			e.printStackTrace();
			}
			
			try{String sql111="select count(*) as DSCount from db_gps.t_veh0 where UnitId='"+unitid+"' and concat(TheFieldDataDate,' ',TheFieldDataTime) between '"+today+"' and '"+oldtiming+"' and TheFiledTextFileName='DS' ";
			ResultSet rs111=stmt111.executeQuery(sql111);
			if(rs111.next()){
				DSCount=rs111.getInt("DSCount");
			//	System.out.println("ERCount---->"+ERCount);
			}	}catch(Exception e){
			e.printStackTrace();
			}
		sql10="select count(*) from t_veh0 where UnitId='"+unitid+"' and concat(TheFieldDataDate,' ',TheFieldDataTime) between '"+today+"' and '"+oldtiming+"' and TheFiledTextFileName not in('ER')  ";
	}
	
//System.out.println(sql10);//out.print(sql10);
	rs10=stmt10.executeQuery(sql10);
	
	if(rs10.next())
	{
		//System.out.println("rs10.getInt(1)----->"+rs10.getInt(1));
		if(rs10.getInt(1)>=10 && ERCount<=6 && NGCount==0 && DOCount==0 && DSCount==0)
		{
			maildata="";
		}
		else
		{
			int counter=rs10.getInt(1);
			counter=10-counter;
			maildata="Unstable unit "+counter+" stamps left, Please Wait And Check  GPS Mouse";
			if(ERCount>=6){
				maildata=maildata+"ER stamps are "+ERCount;
			}
			if(NGCount>0){
				maildata=maildata+"NG stamps are "+NGCount;
			}
			if(DOCount>0){
				maildata=maildata+"DO stamps are "+DOCount;
			}
			if(DSCount>0){
				maildata=maildata+"DS stamps are "+DSCount;
			}
			
			
		}
	}
	else
	{
		maildata="Unstable unit ";
	}
	}catch(Exception ex)
	{
		maildata="Unstable unit ";
		ex.printStackTrace();
	}
	
	if(status.equals("Received")||status=="Received")
    {
       sql9="select * from db_CustomerComplaints.hwunittest where Unitid='"+unitid+"' and Concat(TheDate,TheTime)>=(select concat(max(RDate),max(RTime)) from db_CustomerComplaints.t_unitreceived where Unitid='"+unitid+"' group by Rdate order by Rdate desc limit 1)group by TheDate order by TheDate desc limit 1" ;  
       rs9=stmt9.executeQuery(sql9);
        if(rs9.next())
            {
               teststatus="";
            }
        else if(testedunit.equalsIgnoreCase("Yes"))
        {
        	  teststatus="";
        }
        else
            {
               teststatus="Unit has not been quick tested yet";
            }
        String sql99="select * from db_CustomerComplaints.t_unitreceived where UnitID='"+unitid+"' order by Rdate Desc limit 1";
        ResultSet rs99=stmt9.executeQuery(sql99);
      //  System.out.println(sql99);
        if(rs99.next()){
        	receivedate=rs99.getString("Rdate")+" "+rs99.getString("Rtime");
        //	System.out.println(receivedate);
        	long mili=datefrmdb11.getTime();
        //	System.out.println("mili-->"+mili+""+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(receivedate));
        	long mili1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(receivedate).getTime();
        //	System.out.println("mili1-->"+mili1);
        	//mili=mili-mili1;
        	long diff=mili-mili1;
        //	System.out.println(diff);
            long secdiff=diff/1000;
            long   mindiff=secdiff/60;
            long   hrdiff=secdiff/60/60;
                mindiff=(secdiff/60)-(hrdiff*60);
                
            gapDuration=hrdiff+":"+mindiff;
        //	System.out.println("gapDuration--->"+gapDuration);
        	//datefrmdb.setTime(mili);
        	//System.out.println("datetime----------->"+datefrmdb);
        	//timediffrence=
        }else{
        	receivedate="";
        	gapDuration="";
        }
    }
	//if(swver.contains("M12_avl1pt1") || swver.contains("SIMARM")||swver.contains("AVL_LITE")||"Tested".equalsIgnoreCase(status)||swver.contains("FM2200")||swver.contains("TWP3_TS")||swver.contains("TW_P1_TS_RTC") || swver.contains("TWP4_TS") || swver.contains("M12_avl1pt2") || swver.contains("LITE2_1pt4C") || swver.contains("TWP5_TS_RTC"))
	if(softwareversion)
    //if(AVL_SOFT_VER == "Match")
	{
		if(locchk.equals("") && olddatadate.equals("")&& maildata.equals("") && teststatus.equals("") && configured.equals("") && chk.equalsIgnoreCase("")){
			ftpduminfo="Matches";
		}
	}
	else{
			if(wmsn.equals(wmsndump) && simno.equals(simdump1) && unittype.equals(unittypedump) && locchk.equals("") && olddatadate.equals("")&& maildata.equals("") && teststatus.equals("") && configured.equals("") && chk.equalsIgnoreCase(""))
		{
			ftpduminfo="Matches";
		}
	}

       java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(enton);
       Format formatter1=new SimpleDateFormat("dd-MMM-yyyy");
       String nwfrmtdte1=formatter1.format(datefrmdb1);

 %>
 <tr>
     <input type="hidden" name="unid<%=count %>" value="<%=unitid %>" /> 
   <%
    //******************************************BL Stamps shoaib START**************************
       //System.out.println("Module Type---!!!!!*******************"+rs1.getString("Module"));
        if(rs1.getString("Module").contains("Q 2") &&  rs1.getString("Peripherals").contains("Battery"))
           {
        				String sql111="select * from db_gps.t_veh0 where UnitId='"+unitid+"' and Thefielddatadatetime > '"+enton+" "+enttime+"' and TheFiledTextFileName='BL' Order  By Thefielddatadatetime ASC limit 1 ";
        				String sql112="",sql113="",sql114="";
        				//System.out.println("SQL 1"+sql111);
        				ResultSet rs111=stmt111.executeQuery(sql111);
        				ResultSet rs112;
        				if(rs111.next()){
        					sql112 = "select * from db_gps.t_veh0 where UnitId='"+unitid+"' and Thefielddatadatetime > '"+rs111.getString("Thefielddatadatetime")+"' and TheFiledTextFileName='PO' Order By Thefielddatadatetime ASC limit 1";
        					//System.out.println("SQL 2"+sql112);
        					rs112 = stmt111.executeQuery(sql112);
        					if(rs112.next())
        					{
        						sql113 = "select * from db_gps.t_veh0 where UnitId='"+unitid+"' and Thefielddatadatetime > '"+rs112.getString("Thefielddatadatetime")+"' and TheFiledTextFileName='PF' Order By Thefielddatadatetime ASC limit 1";
        						//System.out.println("SQL 3"+sql113);
        						ResultSet rs113 = stmt111.executeQuery(sql113);
        						if(rs113.next())
        						{
        							sql114 = "select * from db_gps.t_veh0 where UnitId='"+unitid+"' and Thefielddatadatetime > '"+rs113.getString("Thefielddatadatetime")+"' and TheFiledTextFileName='BL' Order By Thefielddatadatetime ASC limit 1";
        							//System.out.println("SQL 4"+sql114);
        							ResultSet rs114 = stmt111.executeQuery(sql114);
        							if(rs114.next())
        							{
        								statusBattery = "Match";	
        							}
        							else
        							{
        								Batteryinfo = "Battery Not Getting Charged As Required";
        							}
        						}
        						else
        						{
        							Batteryinfo = "Charging Test Failed 2, Please Check GPS And Reset Mains";
        						}
        					}
        					else
        					{
        						Batteryinfo = "Charging Test Failed, Please Check GPS And Reset Mains"; 
        					}
        				//	System.out.println("ERCount---->"+ERCount);
        				}
        				else
        				{
        					Batteryinfo = "Battery Drain Test Failed , Please Check GPS And Put On The Mains for 5 Min And Remove Again";
        				}
           }
    //******************************************BL Stamps shoaib END**************************
    %>
     <td>  
<% 	  
if(rs1.getString("Module").contains("Q 2") &&  rs1.getString("Peripherals").contains("Battery"))
{
    if(ftpduminfo.equals("UnMatch") || statusBattery.equals("UnMatch"))
	   { %>
		<Font color="red"> <%=chk%>   </Font> <br/> 
		<font color="maroon"> <%=locchk%> </font> <br/> 
		<font color="green"> <%=olddatadate%></font> <br/> 
		<font color="#761664"> <%=teststatus%> </font> <br/> 
		<font color="blue"> <%=entryftpdump%> </font> <br/>
		<Font color="#B92DB1"> <%=maildata%>   </Font><br/>
		<Font color="#F7630E"> <%=configured%></Font> <br/>
		<Font color="292F60"> <%=Batteryinfo%></Font> <br/>
<%	   }
	  else
	 { 
		 int ii=0;
	   if(testedunit.equalsIgnoreCase("Yes"))
		{
		%>		 	
		    <input type="button" name="btnok<%=count %>" id="btnok<%=count %>" value="OK" onclick="Updateunit(<%=unitid %>,<%=count %>,<%=ii%>);" style="display: none"></input>
			<input type="checkbox" name="dis<%=count %>" id="dis<%=count %>" value="dis<%=count %>" style="display: block" />
			<input type="hidden" name="trackfile<%=count%>" id="trackfile<%=count%>" value="<%=trackfiledate%>" />
		<%}
		else
		{%>
		<input type="button" name="btnok<%=count%>" id="btnok<%=count %>" value="OK" onclick="Updateunit(<%=unitid %>,<%=count %>,<%=ii%>);" style="display: block"></input>
		<input type="checkbox" name="dis<%=count %>" id="dis<%=count %>" value="dis<%=count %>" style="display: none" />
		<input type="hidden" name="trackfile<%=count%>" id="trackfile<%=count%>" value="<%=trackfiledate%>" /> 
		<%} %>	
<%
	 } 
}
else
{
	if(ftpduminfo.equals("UnMatch"))
	   { %>
		<Font color="red"> <%=chk%>   </Font> <br/> 
		<font color="maroon"> <%=locchk%> </font> <br/> 
		<font color="green"> <%=olddatadate%></font> <br/> 
		<font color="#761664"> <%=teststatus%> </font> <br/> 
		<font color="blue"> <%=entryftpdump%> </font> <br/>
		<Font color="#B92DB1"> <%=maildata%>   </Font><br/>
		<Font color="#F7630E"> <%=configured%></Font> <br/>
		<Font color="292F60"> <%=Batteryinfo%></Font> <br/>
<%	   }
	  else
	 { 
		 int ii=0;
	   if(testedunit.equalsIgnoreCase("Yes"))
		{
		%>		 	
		    <input type="button" name="btnok<%=count %>" id="btnok<%=count %>" value="OK" onclick="Updateunit(<%=unitid %>,<%=count %>,<%=ii%>);" style="display: none"></input>
			<input type="checkbox" name="dis<%=count %>" id="dis<%=count %>" value="dis<%=count %>" style="display: block" />
			<input type="hidden" name="trackfile<%=count%>" id="trackfile<%=count%>" value="<%=trackfiledate%>" />
		<%}
		else
		{%>
		<input type="button" name="btnok<%=count%>" id="btnok<%=count %>" value="OK" onclick="Updateunit(<%=unitid %>,<%=count %>,<%=ii%>);" style="display: block"></input>
		<input type="checkbox" name="dis<%=count %>" id="dis<%=count %>" value="dis<%=count %>" style="display: none" />
		<input type="hidden" name="trackfile<%=count%>" id="trackfile<%=count%>" value="<%=trackfiledate%>" /> 
		<%} %>	
<%
	 } 
}
	 %>
     </td>
      <td> <%=count %> </td> 
      <td> <%=nwfrmtdte1+" "+enttime %> </td> 
	<td> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs1.getString("TheDate")+" "+rs1.getString("TheTime"))) %> </td>
      <td> <%=rs1.getString("UnitID") %> </td> 
      <td> <%=receivedate%> </td>
	<td> <%=gapDuration%> </td>
      <td> <%=rs1.getString("SIMNo") %> </td> 
      <td> <%=rs1.getString("SimCompany") %> </td> 
       <td> <%=trackfiledate%> </td> 
       <td> <%=ERCount%> </td> 
        <td> <%=rs1.getString("TrackFileCount") %> </td> 
          <td> <%=rs1.getString("ManufactureCount") %> </td> 
        <td> <%=rs1.getString("Box_type") %> </td> 
      <td> <%=rs1.getString("MobNo") %> </td> 
      <td> <%=rs1.getString("WMSN") %> </td>
    <td> <%=rs1.getString("Module") %> </td>
      <td> <%=rs1.getString("GPS") %> </td>
      <td> <%=rs1.getString("typeunit") %> </td>
      <td> <%=rs1.getString("Peripherals") %> </td>
	<td> <%=rs1.getString("Location") %> </td>
  <!--    <td> <%=rs1.getString("User") %> </td> -->
    </tr>
<%  }
  
}
else
{
	
	//System.out.println("simco--"+Simco);
	//System.out.println("Boxtype--"+Boxtype);
	if((Simco.equals("-") || Simco.equalsIgnoreCase("Any")) && (Boxtype.equals("-") || Boxtype.equalsIgnoreCase("Any")))
		sql1="select * from t_unitmaster a, allconnectedunits b where a.User='"+user+"' and a.UnitID=b.UnitID and a.typeunit='"+untyp+"' and a.PeriphCode='"+code+"' and a.InstType='"+insttyp+"' and a.Status not in( 'Dispatched', 'Waiting For Dispatch','Sent') and concat(a.EntDate, a.EntTime)<= concat(b.TheDate,b.TheTime) order by concat(a.EntDate,a.EntTime) Desc";
	    else if((!Simco.equals("-") && !Simco.equalsIgnoreCase("Any")) && (Boxtype.equals("-") || Boxtype.equalsIgnoreCase("Any")))
			sql1="select * from t_unitmaster a, allconnectedunits b where a.User='"+user+"' and a.SimCompany='"+Simco+"' and a.UnitID=b.UnitID and a.typeunit='"+untyp+"' and a.PeriphCode='"+code+"' and a.InstType='"+insttyp+"' and a.Status not in( 'Dispatched', 'Waiting For Dispatch','Sent') and concat(a.EntDate, a.EntTime)<= concat(b.TheDate,b.TheTime) order by concat(a.EntDate,a.EntTime) Desc";
		else if((!Boxtype.equals("-") && ! Boxtype.equalsIgnoreCase("Any")) && (Simco.equals("-") || Simco.equalsIgnoreCase("Any")))
			sql1="select * from t_unitmaster a, allconnectedunits b where a.User='"+user+"' and a.Box_type='"+Boxtype+"' and a.UnitID=b.UnitID  and a.typeunit='"+untyp+"' and a.PeriphCode='"+code+"' and a.InstType='"+insttyp+"' and a.Status not in( 'Dispatched', 'Waiting For Dispatch','Sent') and concat(a.EntDate, a.EntTime)<= concat(b.TheDate,b.TheTime) order by concat(a.EntDate,a.EntTime) Desc";
		else if((!Simco.equals("-") && !Simco.equalsIgnoreCase("Any")) && (!Boxtype.equals("-") && !Boxtype.equalsIgnoreCase("Any")))	
			 sql1="select * from t_unitmaster a, allconnectedunits b where a.User='"+user+"' and a.SimCompany='"+Simco+"' and a.Box_type='"+Boxtype+"' and a.UnitID=b.UnitID   and a.typeunit='"+untyp+"' and a.PeriphCode='"+code+"' and a.InstType='"+insttyp+"' and a.Status not in( 'Dispatched', 'Waiting For Dispatch','Sent') and concat(a.EntDate, a.EntTime)<= concat(b.TheDate,b.TheTime)order by concat(a.EntDate,a.EntTime) Desc ";
		
	
	System.out.println("sql=-----"+sql1);
	/*if(Simco.equals("-"))
	sql1="select * from t_unitmaster a, allconnectedunits b where a.User='"+user+"' and a.UnitID=b.UnitID and a.typeunit='"+untyp+"' and a.PeriphCode='"+code+"' and a.InstType='"+insttyp+"' and a.Status not in( 'Dispatched', 'Waiting For Dispatch','Sent') and concat(a.EntDate, a.EntTime)<= concat(b.TheDate,b.TheTime) order by EntDate desc ";
	else
     sql1="select * from t_unitmaster a, allconnectedunits b where a.User='"+user+"' and a.SimCompany='"+Simco+"' and a.UnitID=b.UnitID and a.typeunit='"+untyp+"' and a.PeriphCode='"+code+"' and a.InstType='"+insttyp+"' and a.Status not in( 'Dispatched', 'Waiting For Dispatch','Sent') and concat(a.EntDate, a.EntTime)<= concat(b.TheDate,b.TheTime) order by EntDate desc ";
  */ 
//  System.out.println(sql1);
   rs1=stmt1.executeQuery(sql1);
   while(rs1.next())
   {
	String ftpduminfo="UnMatch", entryftpdump="",Batteryinfo="",statusBattery="UnMatch",AVL_SOFT_VER = "UnMatch";;
	String wmsndump="", simdump="", unittypedump="", simdump1="",codeverdump="",FWfromFtp="",teststatus="",imeino="",configured=""; 	
	String olddatadate="",maildata="",maildate="",simno="",trackfiledate="0000-00-00 00:00:00";
	String chk="", locchk="";
	boolean flag=false,softwareversion=false;
	   String enttime=""; 
       count++; 

       String unitid=rs1.getString("UnitID");
       //System.out.println("%%%%%%%%%"+unitid);
       //unitid="655";
       String enton=rs1.getString("EntDate");
       String TrackFileCount=rs1.getString("TrackFileCount");
       String ManufactureCount=rs1.getString("ManufactureCount");
      
	String location=rs1.getString("Location");
	String wmsn=rs1.getString("WMSN").trim();
	String simco=rs1.getString("SimCompany").trim();
	if (simco.equalsIgnoreCase("idea"))
	 	{
			simno=rs1.getString("SIMNo").trim();
			try{simno=simno.substring(0,7);}
			catch(Exception e){simno="-";e.printStackTrace();}
			flag=true;
	 	}
	else
		{
			simno=rs1.getString("SIMNo").trim();
		}
	//System.out.println(simno);
	String mobno=rs1.getString("MobNo").trim();
	String unittype=rs1.getString("typeunit").trim();
	String status=rs1.getString("Status");
	 String testedunit=rs1.getString("testedunit");
	String swver=rs1.getString("SwVer").trim();
	//System.out.println("Software Version-->"+swver);
	//swver=swver.toUpperCase();
	
	String valid="select valid from db_CustomerComplaints.t_utcodever where codever='"+swver+"'";
	ResultSet rsvalid=stvalid.executeQuery(valid);
	if(rsvalid.next()){
		softwareversion = true;
	}
	
	String datadate=rs1.getString("TheDate");
	 maildate=datadate;
	try{enttime=rs1.getString("EntTime");}catch(Exception e){enttime="00:00:00";e.printStackTrace();}	
	sql12 = "Select * from db_CustomerComplaints.NoFTPCheckSoftVer where SoftVer = '"+swver+"'";
	//System.out.println("AVL_SOFT_VER--->"+AVL_SOFT_VER);
	//System.out.println("Software Version--"+sql12);
	rs12 = stmtSoftVerCheck.executeQuery(sql12);
	if(rs12.next())
	{
		AVL_SOFT_VER = "Matches";
		//System.out.println("AVL_SOFT_VER"+AVL_SOFT_VER);
	}
	
//	if(swver.contains("M12_avl1pt1") || swver.contains("SIMARM")||swver.contains("AVL_LITE")||swver.contains("FM2200")||swver.contains("TWP3_TS")||swver.contains("TW_P1_TS_RTC") || swver.contains("TWP4_TS") || swver.contains("M12_avl1pt2") || swver.contains("LITE2_1pt4C") || swver.contains("TWP5_TS_RTC"))
	if(softwareversion)
	//if(AVL_SOFT_VER == "Matches")	
	{
		chk="";
	}
	else if("Tested".equalsIgnoreCase(status)){
		chk="";
	}
	else{
		
	sql5="select * from t_ftplastdump where UnitId='"+unitid+"' and StoredDateTime >='"+enton+" "+enttime+"' ";
//	System.out.println(sql5);
	rs5=stmt5.executeQuery(sql5);
	if(rs5.next())
	{
		wmsndump=rs5.getString("WMSN");
		simdump=rs5.getString("SimNo");
		trackfiledate=rs5.getString("Filedatetime");
		//System.out.println("sim from ftplastdump"+simdump);
		unittypedump=rs5.getString("UnitType");
		codeverdump=rs5.getString("CodeVersion");
		codeverdump=codeverdump.toUpperCase();
		FWfromFtp=rs5.getString("FW");
		imeino= rs5.getString("IMEI_No");
		if(flag)
		{
			try {
				if(simdump.endsWith("F")){
					int ind=simdump.length()-8;
					simdump1=simdump.substring(ind,simdump.length()-1); 
				}else{
				int ind=simdump.length()-7;
				simdump1=simdump.substring(ind,simdump.length()); 
				}
				} catch (Exception e)	
			    {
				simdump1="NA";
				e.printStackTrace();
			    }	
		}
		else
		{
			try {
			//	System.out.println("SSSSSSSSSSSSSSSSSSSSSSS"+simdump);
				if(simdump.endsWith("F")){
			//		System.out.println("Sim No ends with FFFFFFF");
					int ind=simdump.length()-9;
			//		System.out.println("***"+ind+"***");
					simdump1=simdump.substring(ind,simdump.length()-1); 
				}else{
				int ind=simdump.length()-8;
				simdump1=simdump.substring(ind,simdump.length()); 
				}
				} catch (Exception e)	
			    {
				simdump1="NA";	
				e.printStackTrace();
			    }	
		}
		//System.out.println("simdump1 from ftplastdump"+simdump1);
		if(imeino!=null && imeino.trim().length()==15 && !(imeino.trim().equalsIgnoreCase("-")))
		{
			boolean matchfound2=false;
			boolean matchFound1=false;
		   matchFound1=imeino.startsWith("0123456");
		   matchfound2=imeino.contains("000000000000000");
				if(matchfound2==true||matchFound1==true)
				{
					chk="Incorrect IMEI No.";		
				}
				
		}
		else
		{
			chk="Incorrect IMEI No.";	
		}
		
		    if(!(wmsn.equals(wmsndump)))
			{
				chk=chk+",WMSN";
			}
					
			if(!(simno.equals(simdump1)))
			{
				chk=chk+",SIM";
				
			}

			if(!(unittype.equals(unittypedump)))
			{
				chk=chk+",TYPE";
			}
			if(!(swver.endsWith(codeverdump)))
			{
				

				chk=chk+",SoftwareVersion";
			}
			//System.out.println(FWfromFtp);
			String firmware="",firmware1="";
			String valid1="select firmware from db_CustomerComplaints.t_utfirmware where valid='Yes' ";
					ResultSet rsvalid1=stvalid.executeQuery(valid1);
					//System.out.println("valid1---->"+valid1);
					while(rsvalid1.next()){
						firmware=rsvalid1.getString("firmware");
						firmware1=firmware1+","+firmware;
					//	System.out.println(firmware1);
					}
					 String delimiter = ",";
					 String[] temp;
					 temp = firmware1.split(delimiter);
					 /* print substrings */
					 for(int i =0; i < temp.length ; i++)
					// System.out.println(temp[i]);
					// System.out.println("first string-->"+temp[1]);
					// System.out.println("first string-->"+temp[2]);
			if(FWfromFtp.contains(temp[1])||FWfromFtp.contains(temp[2])){
			}else{
				chk=chk+",Invalid Firmware";
			}
		//	System.out.println(chk);
	//		String valid1="select valid from db_CustomerComplaints.t_utfirmware where firmware like '%"+FWfromFtp+"%' ";
	//		ResultSet rsvalid1=stvalid.executeQuery(valid);
	//		System.out.println("valid1---->"+valid1);
	//		if(rsvalid1.next()){
	//			if(rsvalid1.getString("valid").equalsIgnoreCase("NO")||"NO".equalsIgnoreCase("'"+rsvalid1.getString("valid")+"'")){
	//				chk=chk+",Invalid Firmware";
	//			}
	//		}}
	}
	else
	{
		/*wmsndump=wmsn;
		codeverdump=swver;
		simdump1=simno;
		unittypedump=unittype;*/
	
		entryftpdump="No Entry in FTP Dump, Contact Transworld";
		ftpduminfo="UnMatch";
	}
	}
	//check if the unit is configured at the time of dispatch
	sql5="select VehicleRegNumber from t_vehicledetails where unitid="+unitid;
	rs5=stmt5.executeQuery(sql5);
	if(rs5.next())
	{
		String vehcode=rs5.getString("VehicleRegNumber");
		configured="The Unit is Configured in "+vehcode;
	}
	
	//checking ftplastdump info with units latest info
	
	
//checking location
//System.out.println("User like ----->>>>"+user);
if(user.equals("1"))	
{
	if((location.equals("At Transworld2(MH)")) || (location.equals("In Transworld2(MH)")) )
	{
		locchk="";
	}
	else {
		locchk="Loc doesnt Match";
	}
	
}
else if(user.equals("2"))
{
	if((location.equals("At Transworld Pune (MH)")) || (location.equals("In Transworld Pune (MH)")) )
	{
		locchk="";
	}
	else  {
		locchk="Loc doesnt Match";
	}
	
}
else if (user.equalsIgnoreCase("5"))	
{
	if((location.equals("At Transworld3(MH)")) || (location.equals("In Transworld3(MH)")))
	{
		locchk="";
	}
	else {
		locchk="Loc doesnt Match";
	}
}
else if (user.equalsIgnoreCase("3"))	
{
	if((location.equals("At Transworld4(MH)")) || (location.equals("At APR Vendor Location")) || (location.equals("In APR Vendor Location")) || (location.equals("In Transworld4(MH)")) )
	{
		
	}
	else{
		locchk="Loc doesnt Match";
	}
	
}
	
	if(!(chk.equals("")))
	{
		chk=chk+" Not Matching";
	}

	//checking data date should not b less than 7 day aft receiveng
	sql6="select (TO_DAYS('"+nwfrmtdte+"')-TO_DAYS('"+datadate+"'))";
	rs6=stmt6.executeQuery(sql6);
	if(rs6.next())
	{
		int days=rs6.getInt(1);

		if(days>3)
		{
			olddatadate="Old Data Date";
			
		}
	}

	//checking if unit has been tested aft being received
	if(status.equals("Received")||status=="Received")
    { 
       sql9="select * from db_CustomerComplaints.hwunittest where Unitid='"+unitid+"' and Concat(TheDate,TheTime)>=(select concat(max(RDate),max(RTime)) from db_CustomerComplaints.t_unitreceived where Unitid='"+unitid+"' group by Rdate order by Rdate desc limit 1)group by TheDate order by TheDate desc limit 1" ;
       
       //out.print(sql9);
       rs9=stmt9.executeQuery(sql9);
        if(rs9.next())
            {
               teststatus="";
            }
        else if(testedunit.equalsIgnoreCase("Yes"))
        {
        	  teststatus="";
        }
        else
            {
               teststatus="Unit has not been quick tested yet";
            }
        
        String sql99="select * from db_CustomerComplaints.t_unitreceived where UnitID='"+unitid+"' order by Rdate Desc limit 1";
        ResultSet rs99=stmt9.executeQuery(sql99);
   //     System.out.println(sql99);
        if(rs99.next()){
        	receivedate=rs99.getString("Rdate")+" "+rs99.getString("Rtime");
      //  	System.out.println(receivedate);
        	long mili=datefrmdb11.getTime();
      //  	System.out.println("mili-->"+mili+""+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(receivedate));
        	long mili1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(receivedate).getTime();
       // 	System.out.println("mili1-->"+mili1);
        	//mili=mili-mili1;
        	long diff=mili-mili1;
        //	System.out.println(diff);
            long secdiff=diff/1000;
            long   mindiff=secdiff/60;
            long   hrdiff=secdiff/60/60;
                mindiff=(secdiff/60)-(hrdiff*60);
                
            gapDuration=hrdiff+":"+mindiff;
     //   	System.out.println("gapDuration--->"+gapDuration);
        	//datefrmdb.setTime(mili);
        	//System.out.println("datetime----------->"+datefrmdb);
        	//timediffrence=
        }else{
        	receivedate="";
        	gapDuration="";
        }
    }
	
	
	//replacing all - with _ taking maildate from allconnectedunits thedate for latest data
	maildate=maildate.replaceAll("-","_");
	
	//checking if mail has been sent 3 times
	
	/*********** change the condition for unit is available to despatch if server has received 3 mails after manufacturing entry.******************/
/************* Unit should be available if we have 10 stamps after manufacturing entry time***************************/
	
String today="",oldtiming="";
	java.util.Date defoultdate = new java.util.Date();
	Format forma = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	//System.out.println("trackfiledate--->"+trackfiledate);
	
	java.util.Date date=new java.util.Date() ;
	try{
	date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(trackfiledate);
	}catch(Exception e){e.printStackTrace();}
//	java.util.Date date = new java.util.Date(trackfiledate);
//	System.out.println("date --->"+date);
	long miliseconds=date.getTime();
	miliseconds=miliseconds +21600000;
	//miliseconds=miliseconds +21600000*7000;
	defoultdate.setTime(miliseconds);
	oldtiming=forma.format(defoultdate);
	today = forma.format(date);
//	System.out.println("oldtiming--->"+oldtiming);	
	int ERCount=0,NGCount=0,DOCount=0,DSCount=0,BLCount=0,POCount=0,PFCount=0,BLCount2=0;
try{
	
	
	
	//if(swver.contains("M12_avl1pt1") || swver.contains("SIMARM")||swver.contains("AVL_LITE")||swver.contains("FM2200")||swver.contains("TWP3_TS")||swver.contains("TW_P1_TS_RTC") || swver.contains("TWP4_TS") || swver.contains("M12_avl1pt2") || swver.contains("LITE2_1pt4C") || swver.contains("TWP5_TS_RTC"))
	if(softwareversion)
		//if(AVL_SOFT_VER == "Matches")
		{
			//sql10="select count(*) from t_ip"+maildate+" where UnitId='"+unitid+"'";
		
		sql10="select count(*) from t_veh0 where UnitId='"+unitid+"' and TheFieldDataDateTime>='"+enton+" "+enttime+"' ";
		}else if(("Tested".equalsIgnoreCase(status))){
			
			String unitmastertrackfile="";//sql10="select count(*) from t_ip"+maildate+" where UnitId='"+unitid+"'";
			String unitmastertrack="select trackfiledate from db_gps.t_unitmaster where UnitID='"+unitid+"'";
			ResultSet rsunitmastertrack=stunitmastertrack.executeQuery(unitmastertrack);
			if(rsunitmastertrack.next()){
				unitmastertrackfile=rsunitmastertrack.getString("trackfiledate");
			}
			sql10="select count(*) from t_veh0 where UnitId='"+unitid+"' and concat(TheFieldDataDate,' ',TheFieldDataTime)>='"+unitmastertrackfile+"' ";
		}
		else
		{
			
			//sql10="select count(*) from t_mails"+maildate+" where UnitId='"+unitid+"'";
		     /*	 try{
				String sql111="select count(*) as BLCount from db_gps.t_veh0 where UnitId='"+unitid+"' and Thefielddatadatetime between '"+today+"' and '"+oldtiming+"' and TheFiledTextFileName='BL' ";
				ResultSet rs111=stmt111.executeQuery(sql111);
				if(rs111.next()){
					BLCount=rs111.getInt("BLCount");
				//	System.out.println("ERCount---->"+ERCount);
				}
				}catch(Exception e){
					e.printStackTrace();
				} */
			try{String sql111="select count(*) as ERCount from db_gps.t_veh0 where UnitId='"+unitid+"' and concat(TheFieldDataDate,' ',TheFieldDataTime) between '"+today+"' and '"+oldtiming+"' and TheFiledTextFileName='ER' ";
			ResultSet rs111=stmt111.executeQuery(sql111);
			if(rs111.next()){
				ERCount=rs111.getInt("ERCount");
			//	System.out.println("ERCount---->"+ERCount);
			}	}catch(Exception e){
			e.printStackTrace();
			}
			try{String sql111="select count(*) as NGCount from db_gps.t_veh0 where UnitId='"+unitid+"' and concat(TheFieldDataDate,' ',TheFieldDataTime) between '"+today+"' and '"+oldtiming+"' and TheFiledTextFileName='NG' ";
			ResultSet rs111=stmt111.executeQuery(sql111);
			if(rs111.next()){
				NGCount=rs111.getInt("NGCount");
			//	System.out.println("ERCount---->"+ERCount);
			}	}catch(Exception e){
			e.printStackTrace();
			}
			
			try{String sql111="select count(*) as DOCount from db_gps.t_veh0 where UnitId='"+unitid+"' and concat(TheFieldDataDate,' ',TheFieldDataTime) between '"+today+"' and '"+oldtiming+"' and TheFiledTextFileName='DO' ";
			ResultSet rs111=stmt111.executeQuery(sql111);
			if(rs111.next()){
				DOCount=rs111.getInt("DOCount");
			//	System.out.println("ERCount---->"+ERCount);
			}	}catch(Exception e){
			e.printStackTrace();
			}
			
			try{String sql111="select count(*) as DSCount from db_gps.t_veh0 where UnitId='"+unitid+"' and concat(TheFieldDataDate,' ',TheFieldDataTime) between '"+today+"' and '"+oldtiming+"' and TheFiledTextFileName='DS' ";
			ResultSet rs111=stmt111.executeQuery(sql111);
			if(rs111.next()){
				DSCount=rs111.getInt("DSCount");
			//	System.out.println("ERCount---->"+ERCount);
			}	}catch(Exception e){
			e.printStackTrace();
			}
			sql10="select count(*) from t_veh0 where UnitId='"+unitid+"' and concat(TheFieldDataDate,' ',TheFieldDataTime) between '"+today+"' and '"+oldtiming+"' and TheFiledTextFileName not in ('ER','NG','DO','DS') ";
		}

//	System.out.println(sql10);//out.print(sql10);
	rs10=stmt10.executeQuery(sql10);
	
	if(rs10.next())
	{
	//	System.out.println("rs10.getInt(1)----->"+rs10.getInt(1));
		if(rs10.getInt(1)>=10 && ERCount<=6 && NGCount==0 && DOCount==0 && DSCount==0)
		{
			maildata="";
		}
		else
		{
			int counter=rs10.getInt(1);
			counter=10-counter;
			maildata="Unstable unit "+counter+" stamps left, Please Wait And Check GPS Mouse";
			if(ERCount>=6){
				maildata=maildata+"ER stamps are "+ERCount;
			}
			if(NGCount>0){
				maildata=maildata+"NG stamps are "+NGCount;
			}
			if(DOCount>0){
				maildata=maildata+"DO stamps are "+DOCount;
			}
			if(DSCount>0){
				maildata=maildata+"DS stamps are "+DSCount;
			}
		}
	}
	else
	{
		maildata="Unstable unit";
	}
	}catch(Exception ex)
	{
		maildata="Unstable unit";
		ex.printStackTrace();
	}
	
	//if(swver.contains("M12_avl1pt1") || swver.contains("SIMARM")||swver.contains("AVL_LITE")||"Tested".equalsIgnoreCase(status)||swver.contains("FM2200")||swver.contains("TWP3_TS")||swver.contains("TW_P1_TS_RTC") || swver.contains("TWP4_TS") || swver.contains("M12_avl1pt2") || swver.contains("LITE2_1pt4C") || swver.contains("TWP5_TS_RTC"))
	if(softwareversion)
    //if(AVL_SOFT_VER == "Matches")
	{
		if(locchk.equals("") && olddatadate.equals("")&& maildata.equals("") && teststatus.equals("") && configured.equals("") && chk.equalsIgnoreCase("")){
			ftpduminfo="Matches";
		}
	}
	else{
		if(wmsn.equals(wmsndump) && simno.equals(simdump1) && unittype.equals(unittypedump) && locchk.equals("") && olddatadate.equals("") && teststatus.equals("") && maildata.equals("") && configured.equalsIgnoreCase("") && chk.equalsIgnoreCase(""))
		{
			ftpduminfo="Matches";
		}
	}
		
	java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(enton);
    Format formatter1=new SimpleDateFormat("dd-MMM-yyyy");
    String nwfrmtdte1=formatter1.format(datefrmdb1);
 %>
<tr>
      <input type="hidden" name="unid<%=count %>" value="<%=unitid %>" > </input>
  <%
    //******************************************BL Stamps shoaib START**************************
       //System.out.println("Module Type---!!!!!*******************"+rs1.getString("Module"));
        if(rs1.getString("Module").contains("Q 2") &&  rs1.getString("Peripherals").contains("Battery"))
           {
        	System.out.println("Module Type---!!!!!********inner***********"+rs1.getString("Module"));
        				String sql111="select * from db_gps.t_veh0 where UnitId='"+unitid+"' and Thefielddatadatetime > '"+enton+" "+enttime+"' and TheFiledTextFileName='BL' Order  By Thefielddatadatetime ASC limit 1 ";
        			//	System.out.println("SQL 1 "+sql111);
                        String sql112="",sql113="",sql114="";
        				ResultSet rs111=stmt111.executeQuery(sql111);
        				ResultSet rs112;
        				if(rs111.next()){
        					sql112 = "select * from db_gps.t_veh0 where UnitId='"+unitid+"' and Thefielddatadatetime > '"+rs111.getString("Thefielddatadatetime")+"' and TheFiledTextFileName='PO' Order By Thefielddatadatetime ASC limit 1";
        				//	System.out.println("SQL 2 "+sql112);
        					rs112 = stmt111.executeQuery(sql112);
        					if(rs112.next())
        					{
        						sql113 = "select * from db_gps.t_veh0 where UnitId='"+unitid+"' and Thefielddatadatetime > '"+rs112.getString("Thefielddatadatetime")+"' and TheFiledTextFileName='PF' Order By Thefielddatadatetime ASC limit 1";
        					//	System.out.println("SQL 3 "+sql113);
        						ResultSet rs113 = stmt111.executeQuery(sql113);
        						if(rs113.next())
        						{
        							sql114 = "select * from db_gps.t_veh0 where UnitId='"+unitid+"' and Thefielddatadatetime > '"+rs113.getString("Thefielddatadatetime")+"' and TheFiledTextFileName='BL' Order By Thefielddatadatetime ASC limit 1";
        						//	System.out.println("SQL 4 "+sql114);
        							ResultSet rs114 = stmt111.executeQuery(sql114);
        							if(rs114.next())
        							{
        								statusBattery = "Match";
        							}
        							else
        							{
        								Batteryinfo = "Battery Not Getting Charged As Required";
        							}
        						}
        						else
        						{
        							Batteryinfo = "Charging Test Failed 2 , Please Check GPS And Reset Mains";
        						}
        					}
        					else
        					{
        						Batteryinfo = "Charging Test Failed, Please Check GPS And Reset Mains"; 
        					}
        				//	System.out.println("ERCount---->"+ERCount);
        				}
        				else
        				{
        					Batteryinfo = "Battery Drain Test Failed , Please Check GPS And Put On The Mains for 5 Min And Remove Again";
        				}
           }
    //******************************************BL Stamps shoaib END**************************
      %>
      <td> 
<%  
//System.out.println("FTPDumpInfo----@"+ftpduminfo+"@--StatusBattery-----!"+statusBattery+"--#AVL_SOFT_CHECK----&"+AVL_SOFT_VER);
if(rs1.getString("Module").contains("Q 2") &&  rs1.getString("Peripherals").contains("Battery"))
{
  if(ftpduminfo.equals("UnMatch") || statusBattery.equals("UnMatch"))
	  {
	  %>
		<Font color="red"> <%=chk%>   </font> <br/> 
		<font color="maroon"> <%=locchk%> </font> <br/>
		<font color="green"> <%=olddatadate%> </font>  <br/> 
		<font color="#761664"> <%=teststatus%> </font> <br/>
		<font color="blue"> <%=entryftpdump%> </font> <br/>
		<Font color="#B92DB1"> <%=maildata%></Font> <br/> 
		<Font color="#F7630E"> <%=configured%></Font> <br/>
		<Font color="292F60"> <%=Batteryinfo%></Font> <br/>
		   <%
	   }
	else
		{ 
		int ii=0;
		if(testedunit.equalsIgnoreCase("Yes"))
		{
		%>		 	
		<input type="button" name="btnok<%=count %>" id="btnok<%=count %>" value="OK" onclick="Updateunit(<%=unitid %>,<%=count %>,<%=ii%>);" style="display: none"></input>
		<input type="checkbox" name="dis<%=count %>" id="dis<%=count %>" value="dis<%=count %>" style="display: block"/>
		<input type="hidden" name="trackfile<%=count%>" id="trackfile<%=count%>" value="<%=trackfiledate%>" />
		<%}
		else
		{%>
		<input type="button" name="btnok<%=count %>" id="btnok<%=count %>" value="OK" onclick="Updateunit(<%=unitid %>,<%=count %>,<%=ii%>);" style="display: block"></input>
	    <input type="hidden" name="trackfile<%=count%>" id="trackfile<%=count%>" value="<%=trackfiledate%>" />
	    <input type="checkbox" name="dis<%=count %>" id="dis<%=count %>" value="dis<%=count %>" style="display: none"/>
		<%} %>
		 
<%
	  } 
}
else
{
	 if(ftpduminfo.equals("UnMatch"))
	  {
	  %>
		<Font color="red"> <%=chk%>   </font> <br/> 
		<font color="maroon"> <%=locchk%> </font> <br/>
		<font color="green"> <%=olddatadate%> </font>  <br/> 
		<font color="#761664"> <%=teststatus%> </font> <br/>
		<font color="blue"> <%=entryftpdump%> </font> <br/>
		<Font color="#B92DB1"> <%=maildata%></Font> <br/> 
		<Font color="#F7630E"> <%=configured%></Font> <br/>
		<Font color="292F60"> <%=Batteryinfo%></Font> <br/>
		   <%
	   }
	else
		{ 
		int ii=0;
		if(testedunit.equalsIgnoreCase("Yes"))
		{
		%>		 	
		<input type="button" name="btnok<%=count %>" id="btnok<%=count %>" value="OK" onclick="Updateunit(<%=unitid %>,<%=count %>,<%=ii%>);" style="display: none"></input>
		<input type="checkbox" name="dis<%=count %>" id="dis<%=count %>" value="dis<%=count %>" style="display: block"/>
		<input type="hidden" name="trackfile<%=count%>" id="trackfile<%=count%>" value="<%=trackfiledate%>" />
		<%}
		else
		{%>
		<input type="button" name="btnok<%=count %>" id="btnok<%=count %>" value="OK" onclick="Updateunit(<%=unitid %>,<%=count %>,<%=ii%>);" style="display: block"></input>
	    <input type="hidden" name="trackfile<%=count%>" id="trackfile<%=count%>" value="<%=trackfiledate%>" />
		<input type="checkbox" name="dis<%=count %>" id="dis<%=count %>" value="dis<%=count %>" style="display: none"/>
		<%} %>
<%
}
}
%>
     </td>
      <td> <%=count %> </td> 
      <td> <%=nwfrmtdte1+" "+enttime %> </td> 
	  <td> <%=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs1.getString("TheDate")+" "+rs1.getString("TheTime"))) %> </td>
      <td> <%=rs1.getString("UnitID") %> </td> 
      <td> <%=receivedate%> </td>
	<td> <%=gapDuration%> </td>
      <td> <%=rs1.getString("SIMNo") %> </td> 
        <td> <%=rs1.getString("SimCompany") %> </td> 
         <td> <%=trackfiledate %> </td> 
          <td> <%=ERCount%> </td> 
        <td> <%=rs1.getString("TrackFileCount") %> </td> 
          <td> <%=rs1.getString("ManufactureCount") %> </td> 
           <td> <%=rs1.getString("Box_type") %> </td> 
      <td> <%=rs1.getString("MobNo") %> </td> 
      <td> <%=rs1.getString("WMSN") %> </td>
      <td><%=rs1.getString("Module") %></td>
      <td> <%=rs1.getString("GPS") %> </td>
      <td> <%=rs1.getString("typeunit") %> </td>
      <td> <%=rs1.getString("Peripherals") %> </td>
	  <td> <%=rs1.getString("Location") %> </td>
	
    </tr>
<%  }
  }
 %>
</table>   
<input type="hidden" name="cntr" value="<%=count %>" />
 
<!------------------------- Getting details of particular order------------------- -->
<% sql2="select * from t_unitorder where Reqno='"+reqno+"' "; 
   rs2=stmt2.executeQuery(sql2);
   if(rs2.next())
   {
     disloc=rs2.getString("DispatchAdd");
    
   }
   sql3="select * from t_dispatchaddress where Location='"+disloc+"' ";
   //out.println(sql3);
   rs3=stmt3.executeQuery(sql3);
   if(rs3.next())
   {
      fuladd=rs3.getString("Address");
   }
   
%> 
  <input type="hidden" name="disloc" value="<%=disloc %>" />
 <br>
<center>
<table border="1" width="70%">
     <tr>
      <td  width="50%"> <div align="left">
        
        <table border="0" width="100%">
          <tr>
           <td colspan="2"> <div align="center" > <label for="addre"> <font color="maroon" size="2"> <B> <u> Dispatch Information </u> </B></font> </label> </div> </td> </tr>
          <tr>
            <td> <div align="left"><b>Order No: </b>  
            
              <font color="maroon"> <%=reqno %>  </font> </div> </td>
 
             <td> <div align="center"> <b> Order Date: </b> 
               <font color="maroon"> <%=orderdate %>  </font> </div> </td>
          </tr>

	           
          <tr>
              <td> <div align="left"> <b>Order Quantity: </b> 
              
               <font color="maroon"> <%=noofunits %> </font> </div></td>

              <td> <div align="center"> <b> Dispatch Date: </b> 
                <font color="maroon"> <%=dispatchdate %>  </font> </div></td> 
          </tr>
     
	  <tr>
		<td> <div align="left"> <b>Dispatch To: </b> 
			<font color="maroon"> <%=dispto %> </font> </div></td>

		</td> 
              <td colspan=""> <div align="center"> <b> Dispatch Address </b>
              
                <textarea name="fuladd" class="formElement" readonly> <%=fuladd%> </textArea> </div> </td>
          </tr> 
                       
       </table>
      </div> </td>
      <td> 
        <table border="0" width="100%">
          <tr>
            <td>                
                 <B> Mode of Dispatch:   </B> 
            </td>
            <td>  <input type="radio" name="mode" value="Hand" class="formElement"  onClick="ShowDate(0)"; CHECKED>By Hand  
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
                 <input type="radio" name="mode" value="Courier" class="formElement" onClick="ShowDate(1)";>By Courier 
             </td>
            </tr>
            <tr>
		<td> <div align="left"><b>Chalan No:</b>  </div>
                </td>
                <td> <input type="text" name="chalan" class="formElement" />                   
                </td>
         </tr>   
           <tr id="name" style="visibility:visible">
		<td><div align="left" >
                <b>Name:</b> </div> 
                </td>
                <td> 
                     <input type="text"  name="dispname" size="14" class="formElement" value=""/>                  
                </td> 
         </tr>   
       </table>
        
     </td> 
  </tr>
  </table>

 <!-- ----------------------------------------------------------------------------------- -->   
      <table border="0" width="100%">
         <tr> 
           <td> <div align="center"> <input type="submit" name="submit" value="Dispatch" class="formElement" /> </div> </td>
         </tr>
      </table>   
</center>

<% } catch(Exception e) { out.println("Exception----->" +e); e.printStackTrace();}

finally
{
	//
con1.close();
con2.close();
}
%>



<br>
<table border="1" width="100%" >
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>

</form>