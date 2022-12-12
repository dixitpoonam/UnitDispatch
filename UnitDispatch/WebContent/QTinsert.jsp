<!-- 
  Module Name : Log in Page
  Creator : Shoaib F Bagwan
  Date of Creation : 1/08/12
  Modifier :
  Date of Modification :7/08/12
  Reason of Modification :
  Description : -->
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.File"%>
<%@ include file="Connections/conn.jsp"%>
<html>
<head>


<%!Connection con1, con2;%>

<%
	try {
		con1 = DriverManager.getConnection(MM_dbConn_STRING1,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		con2 = DriverManager.getConnection(MM_dbConn_STRING,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		Statement stmt1 = con1.createStatement(), stmt2 = con2
				.createStatement(), st = con1.createStatement();
		Statement stmtinsert = con2.createStatement(), stmtinsert1 = con2
				.createStatement(), stmtinsert2 = con2
				.createStatement();
		Statement stmtinsert3 = con2.createStatement(), stmtinsert4 = con2
				.createStatement(), stmtinsert5 = con2
				.createStatement();
		ResultSet rs4 = null, rs5 = null, rs6 = null, rst2 = null, rs3 = null, rs1 = null, rs7 = null, rs8 = null, rs9 = null;
		String sql1 = "", sql2 = "", sql3 = "", sql4 = "", sql5 = "", sql6 = "", sql7 = "", sql8 = "", sql9 = "";
		String unid = "", cust = "", untyp = "", avlpcbver = "", powsuppcbver = "", wmsn = "", module = "", firmware = "", mobno = "", mobno1 = "", mobpres = "Yes", simm = "", simno = "", simno1 = "", simpres = "Yes", rled = "", gled = "", gledblink = "", rledconn = "", gledok = "", gpsantled = "", powsuppin = "", fuseblownok = "", wavecom = "", othcomm = "", debitnote = "", othdebit = "", usr = "", hdphone = "", buzzcon = "", onlyincm = "", led = "", notbuzz = "", peri = "", kpbroke = "";
		String atwopen1 = "", swvercor = "", swver = "", memcorr = "", gpsdata = "", firmwarever = "", firmwareno = "", mailidcrtd = "", mailid = "";
		String siminsrt = "", swverinsrt = "", custdb = "", firminsrt = "", debinsrt = "", cominsrt = "", comm = "", deb = "", correction = "", corr = "", corrinsrt = "", phy = "", phyinsrt = "";
		String flag = "false", imeino = "-";
		String rno = "", insttype = "", insttypenew = "", commofedt = "", edtby = "", gps = "", swver1 = "", pvoice = "", pjbuzz = "", pbuzz = "", ptemp1 = "", ptemp2 = "", pdoor1 = "", pdoor2 = "", phorn = "", pscard = "", PFlowSen1 = "", PFlowSen2 = "", Plain = "", Peripherals = "", PeriphCode = "", EntBy = "", EntTime = "";
		String mobile1 = "", mobile2 = "", sm = "", sm2 = "", insmobile = "", inssm = "", status = "", manuby = "", actionSuggested = "", pwrsupply = "", pcbmodreq = "", pcbmod = "", filename = "";
		File savedFile;
		String itemNames = "";
		int maxref = 0, refhw = 0;

		java.util.Date d = new java.util.Date();
		String dte = "" + (d.getYear() + 1900) + "-"
				+ (1 + d.getMonth()) + "-" + d.getDate();

		java.util.Date datefrmdb = new SimpleDateFormat("yyyy-MM-dd")
				.parse(dte);
		Format formatter = new SimpleDateFormat("yyyy-MM-dd");
		String nwfrmtdte = formatter.format(datefrmdb);

		EntBy = request.getParameter("EntBy");
		String typevalue = request.getParameter("typevalue");

		EntTime = new SimpleDateFormat("HH:mm:ss")
				.format(new java.util.Date());

		unid = request.getParameter("unitid");
		cust = request.getParameter("cust");
		if (session.getAttribute("cust") != null) {
			custdb = session.getAttribute("cust").toString();
		}
		untyp = request.getParameter("utype");
		avlpcbver = request.getParameter("avlpcb");
		powsuppcbver = request.getParameter("powerpcb");
		wmsn = request.getParameter("wmsn");
		module = request.getParameter("wave");
		imeino = request.getParameter("imeino");
		if (null == imeino || "".equalsIgnoreCase(imeino))
			imeino = "-";
		firmware = request.getParameter("firmware");
		manuby = request.getParameter("manufactby");
		actionSuggested = request.getParameter("actionSuggested");
		mobno = request.getParameter("mobno");
		mobno1 = request.getParameter("mobno1");
		othcomm = request.getParameter("othcomment");
		othdebit = request.getParameter("othdeb");
		simm = request.getParameter("simm");
		simno = request.getParameter("simno");
		simno1 = request.getParameter("simno1");
		pwrsupply = request.getParameter("pwrsupply");
		pcbmodreq = request.getParameter("pcbmodreq");
		pcbmod = request.getParameter("pcbmod");
		rled = request.getParameter("led1");
		gledblink = request.getParameter("led3");
		String psno = request.getParameter("psno");
		String pcbno = request.getParameter("pcbno");
		String batteryled = request.getParameter("batled");
		if ("".equalsIgnoreCase(batteryled) || null == batteryled) {
			batteryled = "-";
		}
		String boxno = request.getParameter("boxno");
		String batteryno = request.getParameter("batteryno");
		String paramsetting = request.getParameter("paramsetting");
		if ("".equalsIgnoreCase(paramsetting) || null == paramsetting) {
			paramsetting = "-";
		}
		System.out.println(psno);
		System.out.println(pcbno);
		System.out.println(boxno);
		System.out.println(batteryno);
		System.out.println(request.getParameterValues("debnote"));
		gpsantled = request.getParameter("gpsantled");

		powsuppin = request.getParameter("cn7inpvol");
		fuseblownok = request.getParameter("fusebx");
		wavecom = request.getParameter("modtest");
		String[] comment = request.getParameterValues("Comment");

		for (int i = 0; i < comment.length; i++) {

			if (i == 0) {
				comm = comment[i];
				cominsrt = comm;
			} else {
				comm = comm + ", " + comment[i];
				cominsrt = comm;

			}
			//out.print(comment[i]+",");     
		}
		String[] debit = request.getParameterValues("debnote");
		for (int i = 0; i < debit.length; i++) {
			if (i == 0) {
				deb = debit[i];
				debinsrt = deb;
			} else {
				deb = deb + ", " + debit[i];
				debinsrt = deb;
			}

			//out.print(debit[i]+",");     
		}

		String[] correct = request.getParameterValues("correct");
		String extracomment = request.getParameter("comment");
		//out.print("hiiiiii"+correct.length);
		for (int i = 0; i < correct.length; i++) {
			if (i == 0) {
				corr = correct[i];

				corrinsrt = corr;
			} else {
				corr = corr + ", " + correct[i];
				corrinsrt = corr;

			}
			System.out.print(correct[i] + ",");
			if (corrinsrt.contains("other")) {
				corrinsrt = corrinsrt.replace("other", extracomment);
			}
			System.out.print(corrinsrt);
		}
		String insrt = request.getParameter("insrt");
		String[] physical = request.getParameterValues("physical");

		if (insrt.equals("Yes")) {
			if (physical.length > 0) {
				for (int i = 0; i < physical.length; i++) {
					if (i == 0) {
						phy = physical[i];
						phyinsrt = phy;
					} else {
						phy = phy + ", " + physical[i];
						phyinsrt = phy;

					}
					out.print(physical[i] + ",");

				}
			}
		} else {
			phyinsrt = "";
		}

		usr = request.getParameter("EntBy");
		String name = "";
		sql5 = "select * from t_admin where Uname='" + usr + "' ";
		rs5 = stmt1.executeQuery(sql5);
		if (rs5.next()) {
			name = rs5.getString("Name");
		}
		//out.println(mobno);
		//out.println(simno);
		//out.println(mobno1);
		//out.println(simno1);

		atwopen1 = request.getParameter("atwopen1");

		swvercor = request.getParameter("swvercor");
		//out.println("hello"+swvercor);
		swver = request.getParameter("swver");
		memcorr = request.getParameter("falshcorr");

		gpsdata = request.getParameter("gpsdata");

		firmwareno = request.getParameter("firmvertext");
		mailidcrtd = request.getParameter("mailcrt");

		simno = request.getParameter("simno");
		hdphone = request.getParameter("HDphone");
		buzzcon = request.getParameter("Buzzconn");
		onlyincm = request.getParameter("Onlyincm");
		led = request.getParameter("Led");
		notbuzz = request.getParameter("NotBuzz");
		peri = request.getParameter("peri");
		kpbroke = request.getParameter("kpbroke");

		if (null == swvercor || "null".equalsIgnoreCase(swvercor)) {
			swverinsrt = "incorrect";
		} else if (swvercor.equals("Correct")) {
			swverinsrt = swver;
		} else {
			swverinsrt = swvercor;
		}

		//out.println(simm);
		if (simm.equals("NO")) {
			simpres = "No";
			mobpres = "No";
		}

		sql4 = "select max(RefNo) from hwunittest ";
		rs4 = stmt1.executeQuery(sql4);
		if (rs4.next()) {
			maxref = rs4.getInt("max(RefNo)");
		}
		maxref = maxref + 1;
		//out.println("Max ref=" +maxref);

		//---parameters for hwunittest------

		//---parameters for unitmaster------

		sql2 = "select * from t_unitmaster where unitid='" + unid
				+ "'order by EntDate desc";
		rst2 = stmt2.executeQuery(sql2);
		if (rst2.next()) {

			flag = "true";
			rno = rst2.getString("Rno");
			insttype = rst2.getString("InstType");
			insttypenew = rst2.getString("InstTypeNew");
			commofedt = rst2.getString("CommentOfEdit");
			edtby = rst2.getString("EditedBy");
			gps = rst2.getString("GPS");
			swver1 = rst2.getString("SwVer");
			pvoice = rst2.getString("PVoice");
			pjbuzz = rst2.getString("PJrmBuzz");
			pbuzz = rst2.getString("PBuzzer");
			ptemp1 = rst2.getString("PTemp1");
			ptemp2 = rst2.getString("PTemp2");
			pdoor1 = rst2.getString("PDoor1");
			pdoor2 = rst2.getString("PDoor2");
			phorn = rst2.getString("PHorn");
			pscard = rst2.getString("PScard");
			PFlowSen1 = rst2.getString("PFlowSen1");
			PFlowSen2 = rst2.getString("PFlowSen2");
			Plain = rst2.getString("Plain");
			Peripherals = rst2.getString("Peripherals");
			PeriphCode = rst2.getString("PeriphCode");
			status = rst2.getString("Status");
		}
		/*
		 mobile1=request.getParameter("mobno");
		 mobile2=request.getParameter("mobno1");
		 out.print("mobile2"+mobile2);
		 out.print("mobile1"+mobile1);
		 sm=request.getParameter("simno");
		 sm2=request.getParameter("simno1");
		 out.print("sim1"+sm);
		 out.print("sim2"+sm2);
		 if(mobile2.length()<10)
		 {
		
		 insmobile=mobile1;
		 }  
		 else               
		 {
		 insmobile=mobile2;
		 } 
		
		 if(sm2.length()<8)
		 {
		 inssm=sm;
		 }  
		 else               
		 {
		 inssm=sm2;
		 } 

		 */
		//checking if a unit has been configured once
		sql2 = "select * from t_unitreplacement where NewUnitID='"
				+ unid + "' or OldUnitID='" + unid + "'";
		//out.print(sql2);
		rs9 = stmt2.executeQuery(sql2);
		if (rs9.next()) {
			insttype = "Repaired";

		}

		sql1 = "insert into hwunittest (ManufactBy,RefNo, TheDate,TheTime, Cust, Custdb, UnitID, UnitType, AVLPcbVer, PowPcbVer, WMSN, Module, Firmware,  MobPres, MobileDB, MobileNo1, SIMPres, SIMDB, SIMNo1, RLED, GLEDBlink, PowerSuppPin,GPSAntLED,  FuseBlownOk, Wavecom, SWATWOPEN1 , SWswver, SWCANParam, SWGpsData, SWFirmVer, SWComment, SWDebitNote,User,Peritype,Hpbrok,Buzconon,Kpbrok,Incomonly,leddglowin,Cutbdbuzzin,CorrectionDone,Physicaldamage,TypeValue,PowerSupply,PCBModReq,PCBMod,batteryled,paramertersetting,IMEINo,ActionSuggested) values ('"
				+ manuby
				+ "','"
				+ maxref
				+ "', '"
				+ nwfrmtdte
				+ "','"
				+ EntTime
				+ "', '"
				+ cust
				+ "','"
				+ custdb
				+ "', '"
				+ unid
				+ "', '"
				+ untyp
				+ "', '"
				+ avlpcbver
				+ "', '"
				+ powsuppcbver
				+ "', '"
				+ wmsn
				+ "', '"
				+ module
				+ "', '"
				+ firmware
				+ "',  '"
				+ mobpres
				+ "', '"
				+ mobno
				+ "', '"
				+ mobno1
				+ "', '"
				+ simpres
				+ "', '"
				+ simno
				+ "', '"
				+ simno1
				+ "', '"
				+ rled
				+ "','"
				+ gledblink
				+ "','"
				+ powsuppin
				+ "','"
				+ gpsantled
				+ "','"
				+ fuseblownok
				+ "','"
				+ wavecom
				+ "', '"
				+ atwopen1
				+ "', '"
				+ swverinsrt
				+ "','"
				+ memcorr
				+ "', '"
				+ gpsdata
				+ "', '"
				+ firmwareno
				+ "', '"
				+ cominsrt
				+ "', '"
				+ debinsrt
				+ "', '"
				+ name
				+ "','"
				+ peri
				+ "', '"
				+ hdphone
				+ "', '"
				+ buzzcon
				+ "','"
				+ kpbroke
				+ "','"
				+ onlyincm
				+ "','"
				+ led
				+ "','"
				+ notbuzz
				+ "','"
				+ corrinsrt
				+ "','"
				+ phyinsrt
				+ "','"
				+ typevalue
				+ "','"
				+ pwrsupply
				+ "','"
				+ pcbmodreq
				+ "','"
				+ pcbmod
				+ "','"
				+ batteryled
				+ "','"
				+ paramsetting
				+ "','"
				+ imeino
				+ "','"
				+ actionSuggested + "')";
		System.out.print(sql1);
		stmt1.executeUpdate(sql1);

		String abcd5 = sql1.replace("'", "#");
		abcd5 = abcd5.replace(",", "$");
		stmtinsert
				.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"
						+ abcd5 + "')");

		String str = "Update t_techspecialrep set Closed='Yes' where UnitId='"
				+ unid
				+ "' and EntDateTime< concat('"
				+ nwfrmtdte
				+ "',' ','" + EntTime + "')";
		System.out.println(str);
		st.executeUpdate(str);

		String abcd = str.replace("'", "#");
		abcd = abcd.replace(",", "$");
		stmtinsert
				.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_CustomerComplaints','"
						+ abcd + "')");
		//

		if (flag.equals("true")) {//unit found 
									//insert into unitmasterhistory
			sql3 = "insert into t_unitmasterhistory "
					+ "(Rno, EntDate ,InstType, InstTypeNew, CommentOfEdit, EditedBy, GPS, "
					+ "SwVer, PVoice, PJrmBuzz,PBuzzer, PTemp1,PTemp2, PDoor1, PDoor2, PHorn, "
					+ "PScard, PFlowSen1, PFlowSen2, Plain, Peripherals, PeriphCode, EntBy, "
					+ "EntTime, Status, DisAdd, OrderNo, ModeofDispatch, DisName, CourierDate,"
					+ "ChalanNo, DispId, BarCode, User, RecBy, HoldBy,RecByTech,RecByCust,UnitID,"
					+ "SimNo,MobNo,WMSN,Module,typeunit,FaultyUnit,PSNo,PCBNo,BoxNo,BatteryNo) "
					+ "values ('"
					+ rno
					+ "','"
					+ nwfrmtdte
					+ "','"
					+ insttype
					+ "','"
					+ insttypenew
					+ "','"
					+ commofedt
					+ "',"
					+ "'"
					+ edtby
					+ "','"
					+ gps
					+ "','"
					+ swver1
					+ "','"
					+ pvoice
					+ "','"
					+ pjbuzz
					+ "','"
					+ pbuzz
					+ "',"
					+ "'"
					+ ptemp1
					+ "','"
					+ ptemp2
					+ "','"
					+ pdoor1
					+ "','"
					+ pdoor2
					+ "','"
					+ phorn
					+ "','"
					+ pscard
					+ "',"
					+ "'"
					+ PFlowSen1
					+ "','"
					+ PFlowSen2
					+ "','"
					+ Plain
					+ "','"
					+ Peripherals
					+ "','"
					+ PeriphCode
					+ "',"
					+ "'"
					+ EntBy
					+ "','"
					+ EntTime
					+ "','Received','-','0','-','-','-','-','0','-','"
					+ typevalue
					+ "',"
					+ "'-','"
					+ typevalue
					+ "','-','-','"
					+ unid
					+ "','-','-','-', '"
					+ module
					+ "', '"
					+ untyp
					+ "',"
					+ "'-','"
					+ psno
					+ "','"
					+ pcbno
					+ "','"
					+ boxno
					+ "','"
					+ batteryno
					+ "')";
			//out.print(sql3);
			stmt2.executeUpdate(sql3);

			String abcd1 = sql3.replace("'", "#");
			abcd1 = abcd1.replace(",", "$");
			stmtinsert1
					.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"
							+ abcd1 + "')");

			//update  unitmaster
			sql8 = "update t_unitmaster set  EntDate='" + nwfrmtdte
					+ "' ,InstType='" + insttype
					+ "', InstTypeNew='-',EntTime='" + EntTime
					+ "',Status='Received',User='" + typevalue
					+ "',HoldBy='" + typevalue + "',UnitID='" + unid
					+ "',SimNo='-',MobNo='-',WMSN='-',EntBy='" + EntBy
					+ "' where unitid='" + unid + "'";
			//out.print(sql8);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
			stmt2.executeUpdate(sql8);

			String abcd2 = sql8.replace("'", "#");
			abcd2 = abcd2.replace(",", "$");
			stmtinsert2
					.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"
							+ abcd2 + "')");
		} else {//units not found in master 
				//insert into unitmaster
			sql8 = "insert into t_unitmaster (EntDate,InstType,EntBy,EntTime,Status,User,HoldBy,UnitID) values ('"
					+ nwfrmtdte
					+ "' ,'Repaired','"
					+ EntBy
					+ "','"
					+ EntTime
					+ "','Received','"
					+ typevalue
					+ "','"
					+ typevalue + "','" + unid + "')";

			//out.print(sql8);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
			stmt2.executeUpdate(sql8);

			String abcd3 = sql8.replace("'", "#");
			abcd3 = abcd3.replace(",", "$");
			stmtinsert3
					.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"
							+ abcd3 + "')");
			//getting rno frm t_unitmaster
			sql8 = "select Rno from t_unitmaster where unitid='" + unid
					+ "'";
			rs8 = stmt2.executeQuery(sql8);
			if (rs8.next()) {
				rno = rs8.getString("Rno");
			}

			//insert into unitmasterhistory
			sql3 = "insert into t_unitmasterhistory (Rno,EntDate,InstType,EntBy,EntTime,Status,User,HoldBy,UnitID) values ('"
					+ rno
					+ "','"
					+ nwfrmtdte
					+ "' ,'Repaired','"
					+ EntBy
					+ "','"
					+ EntTime
					+ "','Received','"
					+ typevalue
					+ "','"
					+ typevalue
					+ "','"
					+ unid
					+ "')";

			//out.print(sql3);
			stmt2.executeUpdate(sql3);

			String abcd4 = sql3.replace("'", "#");
			abcd4 = abcd4.replace(",", "$");
			stmtinsert
					.executeUpdate("Insert into t_sqlquery (dbname,query) values ('db_gps','"
							+ abcd4 + "')");
		}

		response.sendRedirect("testedunits.jsp?inserted=yes&refno="
				+ maxref);
		return;
	} catch (Exception e) {
		out.println("Exception----->" + e);
		e.printStackTrace();
	}

	finally {
		con1.close();

	}
%>