<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%><%@ include file="Connections/conn.jsp"%>
<%
/*
Auther : SHOAIB F. BAGWAN
DATE 28 MAY 2012
DATE OF MODIFY :
*/
%>
<%!Connection con1, con2;%>
<%
	try {
		System.out.println("IN HEre");
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING1,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		con2 = DriverManager.getConnection(MM_dbConn_STRING,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

		Statement st = con1.createStatement(), stmt1 = con1
				.createStatement(), stmt2 = con2.createStatement(), stmt3 = con2.createStatement(), stmt4 = con2.createStatement(),stmt0 = con1.createStatement(),stmt01 = con1.createStatement(),stmt7 = con1.createStatement(),stmt8 = con2.createStatement();
		ResultSet rs01 = null ,rs0 = null,rs4 = null, rs5 = null, rs6 = null,rs7 = null,rs8=null;
		String sql01="",sql0 = "",sql1 = "", sql2 = "", sql3 = "", sql4 = "", sql5 = "", sql6 = "",sql7="",sql8 ="";
		String entdte = "", enttime = "", unit = "", Status = "", boxtype = "", simno = "", simco = "", mobno = "", insttyp = "", wmsn = "", module = "", gps = "", typun = "", swver = "", voice = "", jrmbuzz = "", buzzer = "", temp1 = "", temp2 = "", door1 = "", door2 = "", horn = "", scard = "", flowsen1 = "", flowsen2 = "", plain = "", peripherals = "", barcode = "", user = "",Perip="";
		int rno = 0, periphcode = 0,code = 0;

		int ins = 0, chkdcntr = 0, chkdcntr1 = 0, maxdispid = 0;

		String user1 = session.getAttribute("typeval").toString();
		String entby = session.getAttribute("user").toString();

		
		/* *************Getting values from previous page********************************* */
		String reqno = request.getParameter("OrderNo");
		System.out.println("Order No"+reqno);
		String untIds = request.getParameter("UserIDs");
		System.out.println("Unit Type"+untIds);
		
		sql0="select * from t_unitorder where Reqno = "+reqno+"";
		rs0 = stmt0.executeQuery(sql0);
		if(rs0.next())
		{
			 Perip = rs0.getString("Peripherals"); 
		}
		sql01="select * from t_periphcomb where Combination='"+Perip+"' ";
	     rs01=stmt01.executeQuery(sql01);
	    if(rs01.next())
	     {
	       code=rs01.getInt("id");
	     }
		
		String loc1 = request.getParameter("locations");
		System.out.println("loc"+loc1);
		
		sql7 = "select Location from t_dispatchaddress where Address ='"+loc1+"'";
		rs7 = stmt7.executeQuery(sql7);
		String loc = "";
		if(rs7.next())
		{
			 loc = rs7.getString("Location");
		}
		
		String noofunits = rs0.getString("RemUnits");
		System.out.println("no of units"+noofunits);
		String courdte = request.getParameter("calender");
		System.out.println("Calender"+courdte);
		String chalan = request.getParameter("chalan");
		System.out.println("challan"+chalan);
		String dispto = request.getParameter("dispto");
		System.out.println("dispatch to---"+dispto);
		/* ********************************************************************************* */
		java.util.Date d = new java.util.Date();
		String dte = "" + (d.getYear() + 1900) + "-"
				+ (1 + d.getMonth()) + "-" + d.getDate();
		java.util.Date datefrmdb = new SimpleDateFormat("yyyy-MM-dd").parse(dte);
		Format formatter = new SimpleDateFormat("yyyy-MM-dd");
		String nwfrmtdte = formatter.format(datefrmdb);

		java.util.Date datefrmdb1 = new SimpleDateFormat("yyyy-MM-dd").parse(dte);
		Format formatter1 = new SimpleDateFormat("ddMMyy");
		String nwfrmtdte1 = formatter1.format(datefrmdb1);
		String time = new SimpleDateFormat("HH:mm:ss")
				.format(new java.util.Date());
		// out.println(noofunits);
		int nounitsint = Integer.parseInt(noofunits);
		out.println(nounitsint);
		//out.println(cntrint);
		String mode = request.getParameter("mode");
		String disname = request.getParameter("dispname");

		//-----------------Get the order type t_unitorder------------------
		String ordertype = "", testedunits = "";
		String que = "select Ordertype from t_unitorder where Reqno='"+ reqno + "'";
		ResultSet rsget = st.executeQuery(que);
		if (rsget.next()) {
			ordertype = rsget.getString("Ordertype");
		}

		if (ordertype.equals("Internal")) {
			testedunits = "Yes";
			if (mode.equals("Hand")) {
				Status = "Sent";

			} else {
				Status = "Waiting For Dispatch";
				disname = "-";

			}
		}

		else if (ordertype.equals("External")) {
			testedunits = "No";

			if (mode.equals("Hand")) {
				Status = "Dispatched";

			} else {
				Status = "Waiting For Dispatch";
				disname = "-";

			}
		} else if (ordertype.equals("-")) {
			testedunits = "Yes";

			if (mode.equals("Hand")) {
				Status = "Dispatched";

			} else {
				Status = "Waiting For Dispatch";
				disname = "-";
			}
		}

		//-----------------------------------------------------------------
        /*---------------------------------DISPATCH REASON*/
        String Reason = request.getParameter("reason");
        int NO_UNIT_MODIFYING = untIds.length();
        int REM_UNITS = Integer.parseInt(noofunits) - NO_UNIT_MODIFYING;
        sql8 ="INSERT INTO t_ManualDispatchReason (USER_WHO_DISPATCHES,REQ_NO,UNIT_TO_DISPATCH,REASON_FOR_DISPATCH,UNITS_DISPATCHING,UNIT_PEND_WHILE_DISPATCH) VALUES('"+entby+"',"+reqno+","+NO_UNIT_MODIFYING+",'"+Reason+"','"+untIds+"',"+REM_UNITS+")";
        System.out.println("Insert Dispach Reason----"+sql8);
        stmt8.executeUpdate(sql8);
        /*-------END----------------------------------*/
		
		/* ***********creating new DispID for this Dispatch***************** */
		sql5 = "select max(DispId) from t_unitmasterhistory ";
		rs5 = stmt2.executeQuery(sql5);
		if (rs5.next()) {
			maxdispid = rs5.getInt("max(DispId)");
		}
		maxdispid = maxdispid + 1;
        System.out.println("diiiiiisp id"+maxdispid);
		/* ***************Checking how many check boxes where checked*********** */
		/*
		String[] uncntchk = new String[cntrint + 1];
		for (int k = 0; k <= cntrint; k++) {
			uncntchk[k] = request.getParameter("dis" + k);

			if (uncntchk[k] == null) {

			} else {
				chkdcntr1++;
			}
		}*/
		/* ********************************************************************************* */

		/* ***********If none then it will go back to the previous page. Else it will update the DB******************** */
		
		String[] uncntchk = untIds.split(",");
		for(int k =0; k<=uncntchk.length - 1; k++)
		{
			System.out.println("Unit id ==>"+uncntchk[k]);

			if (uncntchk[k] == null) {

			} else {
				chkdcntr1++;
			}
		}
		
		if (chkdcntr1 > nounitsint) {
			response.sendRedirect("Manual_Dispatched.jsp?unitsexceed=yes&noofunits="+ nounitsint);
			return;
		} else {

			String[] x = new String[uncntchk.length];
			String[] unid = new String[uncntchk.length];

			for (int i = 0; i <= uncntchk.length - 1; i++) {
				x[i] = uncntchk[i];

				if (x[i] == null) {

				} else {
					chkdcntr++;

					unid[i] = uncntchk[i];
					System.out.println(unid[i]);
					//out.println("<br>");

					sql4 = "select * from t_unitmaster where UnitId='" + unid[i] + "' ";
					System.out.print(sql4);  
					rs4 = stmt4.executeQuery(sql4);
					if (rs4.next()) {
						rno = rs4.getInt("Rno");
						entdte = rs4.getString("EntDate");
						enttime = rs4.getString("EntTime");
						unit = rs4.getString("UnitID");
						simno = rs4.getString("SimNo");
						simco = rs4.getString("SimCompany");
						mobno = rs4.getString("MobNo");
						insttyp = rs4.getString("InstType");
						wmsn = rs4.getString("WMSN");
						module = rs4.getString("Module");
						gps = rs4.getString("GPS");
						typun = rs4.getString("typeunit");
						swver = rs4.getString("SwVer");
						voice = rs4.getString("PVoice");
						jrmbuzz = rs4.getString("PJrmBuzz");
						buzzer = rs4.getString("Pbuzzer");
						temp1 = rs4.getString("PTemp1");
						temp2 = rs4.getString("PTemp2");
						door1 = rs4.getString("PDoor1");
						door2 = rs4.getString("PDoor2");
						horn = rs4.getString("PHorn");
						scard = rs4.getString("PScard");
						flowsen1 = rs4.getString("PFlowSen1");
						flowsen2 = rs4.getString("PFlowSen2");
						plain = rs4.getString("Plain");
						peripherals = rs4.getString("Peripherals");
						periphcode = rs4.getInt("PeriphCode");
						user = rs4.getString("User");
						boxtype = rs4.getString("Box_type");
					}

					barcode = maxdispid + reqno + nwfrmtdte1 + chalan
							+ chkdcntr;
                    System.out.println("Barcode--"+barcode);
					sql1 = "update t_unitmaster set Status='" + Status
							+ "', DisAdd='" + loc + "', DispDate='"
							+ nwfrmtdte + "',DispTime='" + time
							+ "', OrderNo='" + reqno
							+ "', ModeofDispatch='" + mode
							+ "', DisName='" + disname
							+ "', CourierDate='" + courdte
							+ "', ChalanNo='" + chalan + "', DispId='"
							+ maxdispid + "', BarCode='" + barcode
							+ "', HoldBy='" + dispto
							+ "', FaultyUnit='No', EntBy='" + entby
							+ "',testedunit='" + testedunits
							+ "'  where UnitID='" + unid[i] + "' ";
					System.out.println("\n\n" + sql1);
					ins = stmt2.executeUpdate(sql1);

					String abc = sql1.replace("'", "#");
					abc = abc.replace(",", "$");
					String str2 = "insert into t_sqlquery(dbname,query)values('db_gps','"
							+ abc + "')";
					stmt2.executeUpdate(str2);
					/* ******************** Check whether this unit id has been dispatched today. If yes then dont enter it again. This is just to avoid duplicate entry in t_unitmasterhistory because sometimes due to server problems there is duplicate entry in this table ************************* */

					sql6 = "select * from t_unitmasterhistory where UnitId='"
							+ unid[i]
							+ "' and (Status='Dispatched' or Status='Waiting For Dispatch' ) and DispDate='"
							+ nwfrmtdte + "' and user='" + user + "'";
					System.out.println("\n\n" + sql6);
					rs6 = stmt2.executeQuery(sql6);
					if (rs6.next()) {

					} else {
						sql3 = "insert into t_unitmasterhistory (Rno, EntDate, UnitID, SimNo, SimCompany, MobNo, InstType, WMSN, Module, GPS, typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, Peripherals, PeriphCode, Status, DisAdd, DispDate, OrderNo, ModeofDispatch, DisName, CourierDate, ChalanNo, DispId, BarCode, User, HoldBy,EntBy,EntTime,DispTime,testedunit,Box_type) values ('"
								+ rno
								+ "', '"
								+ entdte
								+ "', '"
								+ unit
								+ "', '"
								+ simno
								+ "', '"
								+ simco
								+ "', '"
								+ mobno
								+ "', '"
								+ insttyp
								+ "', '"
								+ wmsn
								+ "', '"
								+ module
								+ "', '"
								+ gps
								+ "', '"
								+ typun
								+ "', '"
								+ swver
								+ "', '"
								+ voice
								+ "', '"
								+ jrmbuzz
								+ "', '"
								+ buzzer
								+ "', '"
								+ temp1
								+ "', '"
								+ temp2
								+ "', '"
								+ door1
								+ "', '"
								+ door2
								+ "', '"
								+ horn
								+ "', '"
								+ scard
								+ "', '"
								+ flowsen1
								+ "', '"
								+ flowsen2
								+ "', '"
								+ plain
								+ "', '"
								+ peripherals
								+ "', '"
								+ periphcode
								+ "', '"
								+ Status
								+ "', '"
								+ loc
								+ "', '"
								+ nwfrmtdte
								+ "', '"
								+ reqno
								+ "', '"
								+ mode
								+ "','"
								+ disname
								+ "', '"
								+ courdte
								+ "', '"
								+ chalan
								+ "', '"
								+ maxdispid
								+ "', '"
								+ barcode
								+ "', '"
								+ user
								+ "', '"
								+ dispto
								+ "', '"
								+ entby
								+ "','"
								+ enttime
								+ "','"
								+ time
								+ "','"
								+ testedunits
								+ "','"
								+ boxtype
								+ "') ";
						//sql3="insert into t_unitmasterhistory (Rno, EntDate, UnitID, SimNo, MobNo, InstType, WMSN, Module, GPS, typeunit, SwVer, PVoice, PJrmBuzz, PBuzzer, PTemp1, PTemp2, PDoor1, PDoor2, PHorn, PScard, PFlowSen1, PFlowSen2, Plain, Peripherals, PeriphCode, Status, DisAdd, DispDate, OrderNo, ModeofDispatch, DisName, CourierDate, ChalanNo, DispId, BarCode, User, HoldBy, FaultyUnit, EntBy) values ('"+rno+"', '"+entdte+"', '"+unit+"', '"+simno+"', '"+mobno+"', '"+insttyp+"', '"+wmsn+"', '"+module+"', '"+gps+"', '"+typun+"', '"+swver+"', '"+voice+"', '"+jrmbuzz+"', '"+buzzer+"', '"+temp1+"', '"+temp2+"', '"+door1+"', '"+door2+"', '"+horn+"', '"+scard+"', '"+flowsen1+"', '"+flowsen2+"', '"+plain+"', '"+peripherals+"', '"+periphcode+"', 'Dispatched', '"+loc+"', '"+nwfrmtdte+"', '"+reqno+"', '"+mode+"','"+disname+"', '"+courdte+"', '"+chalan+"', '"+maxdispid+"', '"+barcode+"', '"+user+"', '"+dispto+"', 'No', '"+entby+"') "; 
						System.out.println("\n\n" + sql3);
						stmt3.executeUpdate(sql3);

						String abc1 = sql3.replace("'", "#");
						abc1 = abc1.replace(",", "$");
						String str1 = "insert into t_sqlquery(dbname,query)values('db_gps','"
								+ abc1 + "')";
						stmt3.executeUpdate(str1);
					}

					/* **************************************************************************************** */

				} //else
			} //for
		} // outer else
		/* *************************************************************************************** */

		/* ************Checking whether the dispatch was made fully or partially and accordingly update the DB*********** */
		if (ins > 0) {

			if (chkdcntr == nounitsint) {
				if (ordertype.equalsIgnoreCase("Internal"))
					sql2 = "update t_unitorder set Status='Sent', ModeofDispatch='"
							+ mode
							+ "', DisName='"
							+ disname
							+ "' where Reqno='" + reqno + "' ";
				else
					sql2 = "update t_unitorder set Status='Dispatched', RemUnits='0', ModeofDispatch='"
							+ mode
							+ "', DisName='"
							+ disname
							+ "' where Reqno='" + reqno + "'";
				System.out.println("\n\n" + sql2);
				stmt1.executeUpdate(sql2);

				String abc1 = sql2.replace("'", "#");
				abc1 = abc1.replace(",", "$");
				String str1 = "insert into t_sqlquery(dbname,query)values('db_CustomerComplaints','"
						+ abc1 + "')";
				stmt3.executeUpdate(str1);
			} else {
				int pndgunits = nounitsint - chkdcntr;
				if (ordertype.equalsIgnoreCase("Internal"))
					sql2 = "update t_unitorder set RemUnits='"
							+ pndgunits
							+ "', Status='Partially Sent', ModeofDispatch='"
							+ mode + "', DisName='" + disname
							+ "' where Reqno='" + reqno + "' ";
				else
					sql2 = "update t_unitorder set RemUnits='"
							+ pndgunits
							+ "', Status='Partially Dispatched', ModeofDispatch='"
							+ mode + "', DisName='" + disname
							+ "' where Reqno='" + reqno + "' ";
				System.out.println("\n\n" + sql2);
				stmt1.executeUpdate(sql2);

				String abc1 = sql2.replace("'", "#");
				abc1 = abc1.replace(",", "$");
				String str2 = "insert into t_sqlquery(dbname,query)values('db_CustomerComplaints','"
						+ abc1 + "')";
				stmt3.executeUpdate(str2);

			}
			response.sendRedirect("Manual_Dispatched.jsp?dispatched=yes&dispid="
					+ barcode);
			return;
		} else {
			response.sendRedirect("Manual_Dispatched.jsp?code=" + code + "&untIds="
					+ untIds + "&reqno=" + reqno + "&noofunits="
					+ nounitsint);
			return;
		}
		/* ********************************************************************************* */

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		con1.close();
		con2.close();
		response.sendRedirect("Manual_Dispatched.jsp");
	}
%>