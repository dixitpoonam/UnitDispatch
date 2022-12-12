<%@ page import="java.util.*" language="java"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="java.sql.*" import="java.util.*" import=" java.text.*"
	import="javax.swing.*" errorPage=""%>
<%@ include file="Connections/conn.jsp"%>
<%!Connection con1, con2;%>
<%
	try {
		Class.forName(MM_dbConn_DRIVER);
		con1 = DriverManager.getConnection(MM_dbConn_STRING,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		con2 = DriverManager.getConnection(MM_dbConn_STRING1,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);

		Statement st = con1.createStatement();
		Statement stmt1 = con1.createStatement(), stmt2 = con2
				.createStatement(), stmt3 = con1.createStatement(), stmt4 = con1
				.createStatement(), stmt5 = con2.createStatement();
		ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null, rs5 = null, rs6 = null, rs7 = null, rs8 = null, rs9 = null, rs10 = null, rs11 = null;
		String configured = "", sql1 = "", sql2 = "", str = "", sql3 = "", sql4 = "", sql5 = "", sql6 = "", sql7 = "", vehcode = "", lastdatadate = "", instdate = "", utype = "", manufactby = "", Insttype = "", status = "", dispdate1 = "", orderno1 = "";
		String PSNo = "", PCBNo = "", BoxNo = "", BatteryNo = "";
		String getunid = request.getParameter("unid");
		int refno = 0;
		Format fmt = new SimpleDateFormat("yyyy-MM-dd");
		String curdate = fmt.format(new java.util.Date());
		String typevalue = session.getAttribute("typeval").toString();
		System.out.print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&" + typevalue);
		String mobno = "undefined", simno = "undefined", cust = "", wmsn = "";

		//System.out.println("outside if");
		sql1 = "select * from t_unitmaster where UnitID='" + getunid
				+ "' ";
		rs1 = stmt1.executeQuery(sql1);
		while (rs1.next()) {
			wmsn = rs1.getString("WMSN");
			mobno = rs1.getString("MobNo");
			simno = rs1.getString("SimNo");
			utype = rs1.getString("typeunit");
			status = rs1.getString("Status");
			Insttype = rs1.getString("Insttype");
			orderno1 = rs1.getString("Orderno");
			PSNo = rs1.getString("PSNo");
			PCBNo = rs1.getString("PCBNo");
			BoxNo = rs1.getString("BoxNo");
			BatteryNo = rs1.getString("BatteryNo");
		}

		sql4 = "select * from t_unitmasterhistory where UnitId='"
				+ getunid
				+ "' and Status='Dispatched' order by DispDate desc limit 1";
		rs10 = stmt4.executeQuery(sql4);
		if (rs10.next()) {
			dispdate1 = rs10.getString("DispDate");
		}
		sql2 = "select * from t_unitreplacement where NewUnitId='"
				+ getunid + "' and InstDate between '" + dispdate1
				+ "' and '" + curdate
				+ "' order by InstDate desc, EntDate desc limit 1 ";
		rs2 = stmt1.executeQuery(sql2);
		if (rs2.next()) {
			cust = rs2.getString("OwnerName");
			vehcode = rs2.getString("VehCode");
			sql3 = "select * from t_onlinedata where VehicleCode='"
					+ vehcode + "'";
			rs3 = stmt3.executeQuery(sql3);
			while (rs3.next()) {
				lastdatadate = rs3.getString("TheDate");
			}
			//out.println(rs2.getString("OwnerName"));
		} else {
			sql7 = "select * from t_unitorder where Reqno='" + orderno1
					+ "' ";
			rs11 = stmt5.executeQuery(sql7);
			if (rs11.next()) {
				cust = rs11.getString("Cust");
			}
		}
		session.setAttribute("cust", cust);
		out.println(wmsn + "#");
		out.println(mobno + "#");
		out.println(simno + "#");
		out.println(cust + "#");
		sql4 = "select * from t_unitreplacement where NewUnitID='"
				+ getunid + "' order by InstDate desc limit 1";
		rs4 = stmt1.executeQuery(sql4);
		if (rs4.next()) {
			instdate = rs4.getString("InstDate");
		}
		sql5 = "select (TO_DAYS('" + curdate + "')-TO_DAYS('"
				+ instdate + "'))";
		rs5 = stmt1.executeQuery(sql5);
		if (rs5.next()) {
			int ww = rs5.getInt(1);
			if (ww < 365) {
				out.println("Yes  " + ww + " days remaining" + "#");
			} else {
				out.print("No" + "#");
			}
		} else {
			out.print("-");
		}

		sql6 = "select * from t_unitmasterhistory where  UnitID='"
				+ getunid
				+ "' and user <> 'null' order by EntDate asc limit 1";
		rs6 = stmt1.executeQuery(sql6);
		if (rs6.next()) {
			manufactby = rs6.getString("User");
		}
		out.println(utype + "#");
		out.println(lastdatadate + "#");
		out.println(manufactby + "#");

		str = "select VehicleRegNumber from t_vehicledetails where unitid="	+ getunid;
		System.out.println(str);
		ResultSet rsget = st.executeQuery(str);
		if (rsget.next()) {
			//System.out.println("inside if");
			String vehiclecode = rsget.getString("VehicleRegNumber");
			configured = "The Unit is Configured in " + vehiclecode;
			out.println(configured + "#");
		} else {
			sql7 = "select * from db_gps.t_unitmasterhistory where Status in ('Dispatched','Sent') and Unitid='"
					+ getunid + "'";
			rs9 = stmt3.executeQuery(sql7);
			if (rs9.next()) {
				if(!(Insttype.equals("New") && status.equals("-")))
				{
				sql7 = "select * from db_CustomerComplaints.t_unitreceived where Unitid='"
						+ getunid
						+ "' and Concat(Rdate,Rtime)>=(select concat(max(Dispdate),max(DispTime)) from db_gps.t_unitmasterhistory where Status in ('Dispatched','Sent') and Unitid='"
						+ getunid
						+ "' group by Dispdate order by Dispdate desc limit 1) and TypeValue='"
						+ typevalue
						+ "' and InTransit<>'Yes' group by Rdate order by Rdate desc limit 1";
				System.out.print("sql711111" + sql7);
				rs7 = stmt1.executeQuery(sql7);
				//rdate=rs2.getDate("Rdate");
				if (rs7.next()) {
					String message = "Received";
					out.println(message + "#");
				} else {
					String message = "Unit has not been received yet.";
					out.println(message + "#");
				}
				}
				else
				{
				String message="New Unit";   
					out.println(message+"#");
				}
			} else {
				String message = "Received";
				out.println(message + "#");
			}
		}
		String unitlife = "", IsWarranty = "";
		String sql66 = "select * from t_unitreplacement where OldUnitID='"
				+ getunid + "' order by InstDate DESC limit 1";
		ResultSet rs66 = stmt1.executeQuery(sql66);
		System.out.println(sql66);
		if (rs66.next()) {
			unitlife = rs66.getString("UnitLife");
			IsWarranty = rs66.getString("WasWarranty");
			out.print(unitlife + "#");
			out.print(IsWarranty + "#");
		} else {
			out.print("-" + "#");
			out.print("-" + "#");
		}
		String receivedate = "", gapDuration = "";
		String sql99 = "select * from db_CustomerComplaints.t_unitreceived where UnitID='"
				+ getunid + "' order by Rdate Desc limit 1";
		ResultSet rs99 = stmt1.executeQuery(sql99);
		//  System.out.println(sql99);
		if (rs99.next()) {
			java.util.Date d = new java.util.Date();
			java.util.Date datefrmdb11 = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss").parse(new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss").format(d));
			receivedate = rs99.getString("Rdate") + " "
					+ rs99.getString("Rtime");
			//	System.out.println(receivedate);
			long mili = datefrmdb11.getTime();
			//	System.out.println("mili-->"+mili+""+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(receivedate));
			long mili1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.parse(receivedate).getTime();
			//	System.out.println("mili1-->"+mili1);
			//mili=mili-mili1;
			long diff = mili - mili1;
			//	System.out.println(diff);
			long secdiff = diff / 1000;
			long mindiff = secdiff / 60;
			long hrdiff = secdiff / 60 / 60;
			mindiff = (secdiff / 60) - (hrdiff * 60);

			gapDuration = hrdiff + ":" + mindiff;
			//	System.out.println("gapDuration--->"+gapDuration);
			//datefrmdb.setTime(mili);
			//System.out.println("datetime----------->"+datefrmdb);
			//timediffrence=
			out.print(receivedate + "#");
			out.print(gapDuration + "#");
		} else {
			receivedate = "";
			gapDuration = "";
			out.print("-" + "#");
			out.print("-" + "#");
		}
		out.print(PSNo + "#");
		out.print(PCBNo + "#");
		out.print(BoxNo + "#");
		out.print(BatteryNo + "#");
		
		
		String cpwnsnno = "", cpmobno = "",cpsimno = "",cpcpimei = "",cppsno = "",cpBatteryNo="",cpBoxNo="",cpPCBNo="";
		String sqlcpHistory = "select * from db_gps.t_unitmasterhistory where UnitID='"+ getunid +"' and Mobno <> '-' and Simno <> '-'  order by EntDate desc limit 1";
		ResultSet rsCopy = stmt1.executeQuery(sqlcpHistory);
		if(rsCopy.next())
		{
			cpwnsnno = rsCopy.getString("WMSN");
			cpmobno = rsCopy.getString("MobNo");
			cpsimno = rsCopy.getString("SimNo");
			cpcpimei = rsCopy.getString("IMEINo");
			BatteryNo = rsCopy.getString("BatteryNo");
			cpBoxNo = rsCopy.getString("BoxNo");
			cpPCBNo = rsCopy.getString("PCBNo");
			cppsno = rsCopy.getString("PSNo");
		}
		out.print(cpwnsnno + "#");
		out.print(cpsimno + "#");
		out.print(cpmobno + "#");
		out.print(cppsno + "#");
		out.print(cpPCBNo + "#");
		out.print(cpBoxNo + "#");
		out.print(BatteryNo + "#");
		out.print(cpcpimei + "#");
	} catch (Exception e) {
		out.println(e);
	} finally {
		con1.close();
		con2.close();
	}
%>