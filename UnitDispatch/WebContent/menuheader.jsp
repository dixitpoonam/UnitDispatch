<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import=" java.text.*" import=" java.util.*" errorPage="" %>
<%@ include file="menu.html" %>
<%@ include file="headeradmin.jsp" %>
<%!
	Connection con100,con101;
	String user, ustyp,typevalue;
%>
<%
Statement stmt100=null,stmt101=null,stmt102=null;
ResultSet rs100=null,rs101=null;
try {
	Class.forName(MM_dbConn_DRIVER);
	con101=DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con100 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	 stmt100=con100.createStatement();
	 stmt101=con101.createStatement();
	 stmt102=con100.createStatement();
	String sql100="";
	String cnt100="",cnt101=null;
	user=session.getAttribute("user").toString();
	ustyp=session.getAttribute("urole").toString();
	typevalue=session.getAttribute("typeval").toString();
	  String vendorType = "Select V_Role from t_vendorMaster where V_ID = '"+typevalue+"'";
	  System.out.println("query--"+vendorType);
	  ResultSet rsV_Role = stmt102.executeQuery(vendorType);
	  String vrole = "";
	  if(rsV_Role.next())
	  {
		  vrole = rsV_Role.getString("V_Role");
	  }
	  System.out.println("t_admin--"+ustyp);
	  System.out.println("t_vendorMaster---"+vrole);
	
	if(ustyp.equals("administrator") && vrole.equals("administrator"))
   	{   
		sql100="select count(*) from t_unitorder where Status in('Open', 'Partially Dispatched') ";
      		rs100=stmt100.executeQuery(sql100);
     		 if(rs100.next())
      		{
       		  cnt100=rs100.getString(1);
      		}
     	
     		sql100="select count(*) from t_unitmaster where Status='Waiting For Dispatch' ";
     	    rs101=stmt101.executeQuery(sql100);
     	    if( rs101.next())
     	    {
     	    	cnt101=rs101.getString(1);
     	    }
     	    System.out.println("t_unitorder -- count--"+cnt100);
     	   System.out.println("t_unitmaster -- count--"+cnt101);
%>
 <div class="cssmenu">
<ul>
   <li class='active '><a href="testedunits.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu2, '100px')" onMouseout="delayhidemenu()" title="View Units"><span> View Unit/s </span></a></li>
   <li><a href="mainpage.jsp"> <span>Order Unit/s </span></a></li>
   <li><a href="" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu1, '100px')" onMouseout="delayhidemenu()" title="For Admin only"> <span> For Admin Only </span></a></li>
   <li><a href="showreq.jsp" ><span> Order Request/s = <%=cnt100 %> </span></a></li>
   <li><a href="dispatchwaiting.jsp" ><span>Waiting Dispatch = <%=cnt101%></span></a></li>
   <li><a href="printreceipts.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu5, '100px')" onMouseout="delayhidemenu()" title="PrintReceipt"> <span>Print Receipts</span></a></li>
   <li><a href="unitliferep.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu6, '100px')" onMouseout="delayhidemenu()" title="Reports"> <span>Reports</span> </a></li>
   <li><a href="newpassword.jsp" > <span>Change Password</span></a></li>
   <li><a href="logoutadmin.jsp" ><span>Log Out</span></a></li>  
</ul>
</div>
<div style="clear:both; margin: 0 0 30px 0;">&nbsp;</div>
<% 
  } //close of if
  else if(ustyp.equals("administrator") && vrole.equals("manufacturer"))
  { 
	sql100="select count(*) from t_unitorder where Reqto='"+typevalue+"' and Status in('Open', 'Partially Dispatched')  ";
      		rs100=stmt100.executeQuery(sql100);
     		 if(rs100.next())
      		{
       		  cnt100=rs100.getString(1);
      		}
    sql100="select count(*) from t_unitmaster where  user like '"+typevalue+"' and Status like 'Waiting For Dispatch' and EntBy = '"+user+"'";
    rs101=stmt101.executeQuery(sql100);
    if( rs101.next())
    {
    	cnt101=rs101.getString(1);
    }
%>


<div class="cssmenu">
<ul>
<li class= 'active'> <a href="testedunits.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu2, '100px')" onMouseout="delayhidemenu()" title="View Units"> <span>View Unit/s </span></a> </li>
<li><a href="showsentunits.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu3, '100px')" onMouseout="delayhidemenu()" title="Internal Transfer"> <span>Internal Transfer </span></a></li>
<li><a href="showreq.jsp" ><span> Order Request/s = <%=cnt100 %> </span></a></li>
<li><a href="dispatchwaiting.jsp" ><span>Waiting Dispatch=<%=cnt101%></span></a></li>
<li><a href="printreceipts.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu5, '100px')" onMouseout="delayhidemenu()" title="Print Receipts"> <span>Print Receipts</span></a></li>
 	    	<li> <a href="unitliferep.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu4, '100px')" onMouseout="delayhidemenu()" title="Reports"><span> Reports </span></a></li>
 	    	<li> <a href="newpassword.jsp" > <span>Change Password</span></a> </li> 
 	    	<li><a href="logoutadmin.jsp" ><span>Log Out</span></a> </li>
</ul>
</div>
<div>
<table align="center">
	 <tr align="center">
		<td colspan="7" align="center">  <B> Welcome <%=user%>! </B>  </td>
  	</tr>
  	</table>
</div>	
		
<%  }
  else
  {
	  
		sql100="select count(*) from t_unitorder where Reqto='"+typevalue+"' and  Status in('Open', 'Partially Dispatched') ";
	      		rs100=stmt100.executeQuery(sql100);
	     		 if(rs100.next())
	      		{
	       		  cnt100=rs100.getString(1);
	      		}
	    sql100="select count(*) from t_unitmaster where  user like '"+typevalue+"' and Status like 'Waiting For Dispatch' and EntBy = '"+user+"'";
	    rs101=stmt101.executeQuery(sql100);
	    if( rs101.next())
	    {
	    	cnt101=rs101.getString(1);
	    }
	%>
	<div class="cssmenu">
	<ul>
	<li class= 'active'> <a href="testedunits.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu2, '100px')" onMouseout="delayhidemenu()" title="View Units"> <span>View Unit/s </span></a> </li>
	<li><a href="showsentunits.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu3, '100px')" onMouseout="delayhidemenu()" title="Internal Transfer"> <span>Internal Transfer </span></a></li>
	<li><a href="showreq.jsp" ><span> Order Request/s = <%=cnt100 %> </span></a></li>
	<li><a href="dispatchwaiting.jsp" ><span>Waiting Dispatch=<%=cnt101%></span></a></li>
	<li><a href="printreceipts.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu5, '100px')" onMouseout="delayhidemenu()" title="Print Receipts"> <span>Print Receipts</span></a></li>
	<%if(ustyp.equals("administrator") || typevalue.equalsIgnoreCase("Transworld") ) 
	 	    			{
	 	    			%>
	 	    	<li> <a href="unitliferep.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu6, '100px')" onMouseout="delayhidemenu()" title="Reports"><span> Reports </span></a> </li> 
	 	    	<% }else{
	 	    	%>
	 	    	<li> <a href="unitliferep.jsp" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, menu4, '100px')" onMouseout="delayhidemenu()" title="Reports"><span> Reports </span></a></li>
	 	    	<%} %>
	 	    	<li> <a href="newpassword.jsp" > <span>Change Password</span></a> </li> 
	 	    	<li><a href="logoutadmin.jsp" ><span>Log Out</span></a> </li>
	</ul>
	</div>
	<div>
	<table align="center">
		 <tr align="center">
			<td colspan="7" align="center">  <B> Welcome <%=user%>! </B>  </td>
	  	</tr>
	  	</table>
	</div>	
			
	<%  
  }
 } catch(Exception e) { out.println("Exception----->" +e); }

finally
{
try {
	if(rs101!=null)
		rs101.close();
	if(rs100!=null)
		rs100.close();
	if(stmt101!=null)
		stmt101.close();
	if(stmt100!=null)
		stmt100.close();
	if(con100!=null)
		con100.close();
	if(con101!=null)
		con101.close();
} catch (SQLException e) {

	e.printStackTrace();
}
}
%>