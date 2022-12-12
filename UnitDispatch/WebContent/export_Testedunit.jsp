
<%@ page contentType="application/vnd.ms-excel; charset=gb2312" %>
<% response.setContentType("application/vnd.ms-excel");
Format formatterx = new SimpleDateFormat("dd-MMM-yyyy");
String showdatex = formatterx.format(new java.util.Date());

String filename=session.getAttribute("user").toString()+showdatex+"testview1.xls";
    response.addHeader("Content-Disposition", "attachment;filename="+filename);
%>
<%@ include file="Connections/conn.jsp" %>

<%!
Connection con1;
%>
<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con1.createStatement();
ResultSet rs1=null;
String sql1="";
String user1=session.getValue("user").toString();
//out.println(user);
%>

<table class="stat">
<tr ><td colspan="58"><font size="3"><b><div align="center" > Detail testing Report</font></div></td></tr>
<tr><td><div align="right">
Date : <%
Format fmt = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
String curdate = fmt.format(new java.util.Date());
String TheDate="";
 out.print(curdate); %></div>
</td></tr>
	<tr>
	<td class="hed"><b> RefNo. </td>
        <td class="hed"><b>Ent date </td>
        <td class="hed"><b> Transporter </td>
	 <td class="hed"><b> Unit ID </td>
        <td class="hed"><b> Type </td>
        <td class="hed"><b> AVL PCB Ver </td>
        <td class="hed"><b> Power Supply PCB </td>
        <td class="hed"><b> WMSN-No </td>
        <td class="hed"><b> Module type </td>
        <td class="hed"><b> Firmware </td>
        <td class="hed"><b> Mobile Presence </td>
	 <td class="hed"><b> Mobile from DB </td>
	 <td class="hed"><b> Mobile during tstng </td>
	 <td class="hed"><b> SIM Presence </td>
	 <td class="hed"><b> SIM From DB </td>
	 <td class="hed"><b> Sim during Testing </td>
	 <td class="hed"><b> RED LED </td>
	 <td class="hed"><b> Green LED </td>
	 <td class="hed"><b> Green LED Blink </td>
	 <td class="hed"><b> RED LED Conn </td>
	 <td class="hed"><b> Green LED Conn </td>
	 <td class="hed"><b> Other Conn </td>
	 <td class="hed"><b>  If No Expected Voltages at CN7-CN8, check for Input Voltage at Power Supply Input Pin </td>
	 <td class="hed"><b> GPS Antenna LED </td>
	 <td class="hed"><b> conn details </td>
	 <td class="hed"><b> pin1 </td>
	 <td class="hed"><b> pin3 </td>
	 <td class="hed"><b> pin2 </td>
	 <td class="hed"><b> If Voltage are in the range PIN1(3.4-4.2), PIN2(0), PIN3(3.4-4.2), then </td>
	 <td class="hed"><b> Fuse blown </td>	
	 <td class="hed"><b> Power sup failure </td>
	 <td class="hed"><b> pin9 </td>
	 <td class="hed"><b> pin40 </td>	
	 <td class="hed"><b>  Check the continuity between 2 points on Wavecom Module as per instructed by Wavecom </td>
	 <td class="hed"><b> SWATWOPEN1 </td>
	 <td class="hed"><b> SWATWOPEN0 </td>
	 <td class="hed"><b> SW ver </td>
	 <td class="hed"><b> sw memory corr </td>
	 <td class="hed"><b> sw CAN param </td>
	 <td class="hed"><b> GPS Data </td>
	 <td class="hed"><b> Firmware Version </td>
	 <td class="hed"><b> Mail Id </td>
	 <td class="hed"><b>  Is Unit Configured in Server DB </td>
	 <td class="hed"><b> If configured, is Unit Configured correctly? </td>
	 <td class="hed"><b> Dota </td>
	 <td class="hed"><b> App code ver </td>
	 <td class="hed"><b> Last Date Of Data </td>
	 <td class="hed"><b> Comment </td>
	 <td class="hed"><b> Debit Note </td>
	 <td class="hed"><b> User </td>
	<td class="hed"><b> Peripheral Type </td>
	<td class="hed"><b> Head Phone </td>
	<td class="hed"><b> BuzzerConnstatus </td>
	<td class="hed"><b> Keypad status </td>
	<td class="hed"><b> Call Status </td>
	<td class="hed"><b> Led </td>
	<td class="hed"><b> BuzzStatus </td>	
  </tr>
  <tr> 
<%
  int c1=1, i=1;
  sql1="select * from hwunittest where User='"+user1+"' order by Thedate desc ";
//out.print(sql1);
  rs1=stmt1.executeQuery(sql1);
  while(rs1.next())
   {  
    	String  refno =rs1.getString("RefNo");
	  TheDate =rs1.getString("TheDate");
	String  cust =rs1.getString("Cust");
	String  unitid =rs1.getString("UnitID");
	String  unittype =rs1.getString("UnitType");
	String  avlpcbver =rs1.getString("AVLPcbVer");
	String  powpcbver =rs1.getString("PowPcbVer");
	String  wmsn =rs1.getString("WMSN");
	String  module =rs1.getString("Module");
	String  firmware =rs1.getString("Firmware");
	String  mobpres =rs1.getString("MobPres");
	String  mobiledb =rs1.getString("MobileDB");
	String  mobileno =rs1.getString("MobileNo1");
	String  simpres =rs1.getString("SIMPres");
	String  simdb =rs1.getString("SIMDB");
	String  simno1 =rs1.getString("SIMNo1");
	String  rled =rs1.getString("RLED");
	String  gled =rs1.getString("GLED");
	String  gledblink =rs1.getString("GLEDBlink");
	String  rledconn =rs1.getString("RLEDConn");
	String  gledok =rs1.getString("GLEDOk");
	String  othconn =rs1.getString("OthConn");
	String  powersupppin =rs1.getString("PowerSuppPin");
	String  gpsant =rs1.getString("GPSAnt");
	String  gpsantled =rs1.getString("GPSAntLED");
	String  conndet =rs1.getString("ConnDet");
	String  volcnpin1 =rs1.getString("VolCN7Pin1");
	String  volcnpin3 =rs1.getString("VolCN7Pin3");
	String  volcnpin2 =rs1.getString("VolCN7Pin2");
	String  powerok =rs1.getString("PowerOk");
	String  fuseblownok =rs1.getString("FuseBlownOk");
	String  powersuppfail =rs1.getString("PowerSuppFail");
	String  pin9 =rs1.getString("Pin9");
	String  pin40 =rs1.getString("Pin40");
	String  wavcome=rs1.getString("Wavecom");
	String  swatwopen1 =rs1.getString("SWATWOPEN1");
	String  swatwopen =rs1.getString("SWATWOPEN0");
	String  swswver =rs1.getString("SWswver");
	String  swmemcorr =rs1.getString("SWMemCorr");
	String  swcanparam =rs1.getString("SWCANParam");
	String swpgsdata =rs1.getString("SWGpsdata");
	String swfirmver =rs1.getString("SWFirmVer");
	String swmailid =rs1.getString("SWMailid");
	String swunitconf =rs1.getString("SWUnitConf");
	String swuncorconf =rs1.getString("SWUnCorConf");
	String swdota =rs1.getString("SWDota");
	String swappcodever =rs1.getString("SWAppCodeVer");
	String SWLastDteofData =rs1.getString("SWLastDteofData");
	String swcomment =rs1.getString("SWComment");
	String swdebitnote =rs1.getString("SWDebitNote");
	String user =rs1.getString("User");
	 String Hpbrok=request.getParameter("Hpbrok");
        String Buzconon=request.getParameter("Buzconon");
        String Incomonly =request.getParameter("Incomonly");
        String leddglowin=request.getParameter("leddglowin");
        String Cutbdbuzzin=request.getParameter("Cutbdbuzzin");
        String Peritype=request.getParameter("Peritype");
	String Kpbrok=request.getParameter("Kpbrok");


	
 %>
    <td> <%=refno %>  </td>
     <% if(TheDate==null || TheDate.equals("-"))
   { %>
     <td> - </td>
<% } 
   else
   { 
     java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(TheDate);
     Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
     String nwfrmtdte=formatter.format(datefrmdb);
%>
     <td> <%=nwfrmtdte %></td>
  <% }%>

	<td> <%=cust%> </td>
     	<td> <%=unitid%>  </td>
     	<td> <%=unittype%>  </td>
     	<td> <%=avlpcbver%>  </td>
     	<td> <%=powpcbver%></td>
	<td> <%=wmsn%></td>
	<td><%=module%></td>	
	<td><%=firmware%></td>
	<td><%=mobpres %>  </td>
	<td> <%=mobiledb%> </td>
	<td> <%=mobileno%> </td>
	<td> <%=simpres%> </td>
	<td> <%=simdb%> </td>
	<td> <%=simno1%> </td>
	<td> <%=rled%> </td>
	<td> <%=gled%> </td>
	<td> <%=gledblink%> </td>
	<td> <%=rledconn%> </td>
	<td> <%=gledok%> </td>
	<td> <%=othconn%> </td>
	<td> <%=powersupppin%> </td>
	<td> <%=gpsant%> </td>
	<td> <%=gpsantled%> </td>
	<td> <%=conndet%> </td>
	<td> <%=volcnpin1%> </td>
	<td> <%=volcnpin3%> </td>
	<td> <%=powerok%> </td>
	<td> <%=fuseblownok %> </td>
	<td> <%=powersuppfail%> </td>
	<td> <%=pin9 %> </td>
	<td> <%=pin40%> </td>
	<td> <%=wavcome%> </td>
	<td> <%=swatwopen1%> </td>
	<td> <%=swatwopen%> </td>
	<td> <%=swswver%> </td>
	<td> <%=swmemcorr%> </td>
	<td> <%=swcanparam%> </td>
	<td> <%=swpgsdata %> </td>
	<td> <%=swfirmver %> </td>
	<td> <%=swmailid%> </td>
	<td> <%=swunitconf%> </td>
	<td> <%=swuncorconf%> </td>
	<td> <%=swdota%> </td>
	<td> <%=swappcodever%> </td>
	<td> <%=SWLastDteofData %> </td>
	<td> <%=swcomment%> </td>
	<td> <%=swdebitnote %> </td>
	<td> <%=user%> </td>
	<td> <%=Peritype%> </td>
	<td> <%=Hpbrok%> </td>
	<td> <%=Buzconon%> </td>
	<td> <%=Kpbrok%> </td>
	<td> <%=Incomonly%> </td>
	<td> <%=leddglowin%> </td>
	<td> <%=Cutbdbuzzin%> </td>
	
</tr>
<%
     i++;
     c1++;
    } %> 
</table>
<%
      } 
     catch(Exception e) { out.println("Exception----->"+e); }

finally
{
con1.close();
}
%>

