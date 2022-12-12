<%@ include file="headeradmin.jsp" %>

<%!
Connection con1, con2;
%>

<%
Statement stmt1=null, stmt6=null, stmt7=null,  stmt2=null,stmt8=null,stmt9=null;
ResultSet rs2=null, rs4=null, rs5=null, rs6=null, rs9=null, rs11=null,rst8=null,rst9=null;

try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

 stmt1=con1.createStatement();
 stmt2=con2.createStatement();
 
String sql1="", sql2="", sql3="";
int maxid=0;

String unitid="", manufdate="", unittype="", accessories="", h_wversionPMF="", h_wversionNIP="",vendorname="", custname="", s_wver_PMFMain="", s_wver_PMFIR="", s_wver_NIPCPU1="", s_wver_NIPCPU2="", poweron="", temp2="";



int intmaxref=0, newref=0, refno=0, ref=0;

String uniddb="", simdb="", mobdb="", wmsndb="";
String user=session.getAttribute("typeval").toString();
String entby=session.getAttribute("user").toString();


/* ********************* get all the fileds from the form ******************* */
unitid=request.getParameter("unitid");
manufdate=request.getParameter("calender");
unittype=request.getParameter("unittype");
String access[]=request.getParameterValues("accessories");
System.out.println(access);
if(access==null)
{
	accessories="-";
}
else
{
for(int i=0;i<access.length;i++)
{
	if(i==0)
	{
		accessories=access[i];
		
		//corrinsrt=corr;
	}
	else
	{
		accessories=accessories+", "+access[i];
		//corrinsrt=corr;
	}
}
}
System.out.println("accessories"+accessories);
System.out.println("manufdate"+manufdate);

h_wversionPMF=request.getParameter("h/wversionPMF");
h_wversionNIP=request.getParameter("h/wversionNIP");
vendorname=request.getParameter("vendorname");
custname=request.getParameter("custname");
s_wver_PMFMain=request.getParameter("s/wver_PMFMain");
s_wver_PMFIR=request.getParameter("s/wver_PMFIR");
s_wver_NIPCPU1=request.getParameter("s/wver_NIPCPU1");
s_wver_NIPCPU2=request.getParameter("s/wver_NIPCPU2");
poweron=request.getParameter("txtpoweron");

String hardw_ver="",Softw_ver_CPU1="",Soft_ver_CPU2="";
	if(unittype.equalsIgnoreCase("PMF"))
	{
		hardw_ver=h_wversionPMF;
		Softw_ver_CPU1=s_wver_PMFMain;
		Soft_ver_CPU2=s_wver_PMFIR;
	}
	else if(unittype.equalsIgnoreCase("NIP"))
	{
		hardw_ver=h_wversionNIP;
		Softw_ver_CPU1=s_wver_NIPCPU1;
		Soft_ver_CPU2=s_wver_NIPCPU2;
	}
	String time=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());

	String manufdatetime=manufdate+" "+time;
   /*String manuf_datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new SimpleDateFormat(".parse(manufdate+" "+time);
   Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   String nwfrmtdte=formatter.format(datefrmdb);
  
*/   
 
    sql1="insert into t_PMFmaster(UnitID,Manuf_date,UnitType,Accessories,Hardw_version,sw_cpu1,sw_cpu2,vendor_name,cust_name,power_tested_by) values('"+unitid+"','"+manufdatetime+"','"+unittype+"','"+accessories+"','"+hardw_ver+"','"+Softw_ver_CPU1+"','"+Soft_ver_CPU2+"','"+vendorname+"','"+custname+"','"+poweron+"')";
    stmt2.executeUpdate(sql1);
    
    String abc1=sql1.replace("'", "#");
	abc1=abc1.replace(",", "$");
	String str1="insert into t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc1+"')";	
	stmt2.executeUpdate(str1);
	
    response.sendRedirect("PMFDetails.jsp?inserted=yes");
  
} catch(Exception e) { out.println("Exception----->" +e); }

finally
{

	try {
		if(rs6!=null)
			rs6.close();
		if(rs2!=null)
			rs2.close();
		if(rs9!=null)
			rs9.close();
		if(rs4!=null)
			rs4.close();
		if(rs5!=null)
			rs5.close();
		if(rs11!=null)
			rs11.close();
		if(rst8!=null)
			rst8.close();
		if(rst9!=null)
			rst9.close();
		if(stmt1!=null)
			stmt1.close();
		if(stmt6!=null)
			stmt6.close();
		if(stmt7!=null)
			stmt7.close();
		if(stmt8!=null)
			stmt8.close();
		if(stmt9!=null)
			stmt9.close();
		if(stmt2!=null)
			stmt2.close();
		if(con1!=null)
			con1.close();
		if(con2!=null)
			con2.close();
	} catch (SQLException e) {

		e.printStackTrace();
	}


}
%>
