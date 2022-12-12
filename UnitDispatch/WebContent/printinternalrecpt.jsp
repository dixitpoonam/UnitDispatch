<%@ include file="Connections/conn.jsp" %>

<html>
<head>
<title>Receipt </title>

<link href="css/css.css" rel="StyleSheet" type="text/css">
<script src="elabel.js" type="text/javascript"></script>


<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
</head>
<%!
Connection con1, con2;
%>

<% 
try {
	String unitid="", ordrqty="", ordrdte="", dispdte="", dispadd="", mode="", modename="-", chalanno="-", getdispid="", ordby="", dispby="", cust="", ordrno="";
	String dispqty="", dispid="";
	
	
	ordrno=request.getParameter("orderno");
	ordrqty=request.getParameter("orderqty");
	ordrdte=request.getParameter("orderdt");
	dispqty=request.getParameter("dispdtqty");
	dispdte=request.getParameter("dispdt");
	unitid=request.getParameter("unitdisp");
	dispadd=request.getParameter("dispadd");
	cust=request.getParameter("cust");
	mode=request.getParameter("modeofdisp");
	 modename=request.getParameter("dispname");
	chalanno=request.getParameter("chalanno");
	dispid=request.getParameter("dispid");
	ordby=request.getParameter("orderby");
	dispby=request.getParameter("dispby");
	
	%>
	
	<center>
	  <table border="1" width="50%">
	      <tr> <td> <B> Order No.</B> </td>
	           <td> <%=ordrno %> </td>
	      </tr>
	      <tr> <td> <B> Order Qty.</B> </td>
	           <td> <%=ordrqty %> </td>
	      </tr>
	      <tr> <td> <B> Order Date</B> </td>
	<%
	if(ordrdte==null || ordrdte.equals("null"))	
	{ %>
		<td> - </td>
<%	}	
	else
	{
                   java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(ordrdte);
 		   Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
		   String nwfrmtdte=formatter.format(datefrmdb);
 %>
	           <td> <%=nwfrmtdte %> </td>
<%	} %>
      </tr>
      <tr> <td> <B> Dispatched Qty.</B> </td>
           <td> <%=dispqty %> </td>
      </tr>
      <tr> <td> <B> Dispatched Date</B> </td>

<% 
	if(dispdte==null || dispdte.equals("null"))
	{ %>
		<td> - </td>
<%	} 	
	else
	{ 
                   java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(dispdte);
		   Format formatter1=new SimpleDateFormat("dd-MMM-yyyy");
		   String nwfrmtdte1=formatter1.format(datefrmdb1); 
%>
	           <td> <%=nwfrmtdte1 %> </td>
<%      } %>
      </tr>
      <tr> <td> <B> Units Dispatched</B> </td>
           <td> <%=unitid %> </td>
      </tr>
      <tr> <td> <B> Dispatch Add.</B> </td>
           <td> <%=dispadd %> </td>
      </tr>
       <tr> <td> <B> Cust.</B> </td>
            <td> <%=cust %> </td>
      </tr>
      
       <tr> <td> <B> Mode of Dispatch</B> </td>
           <td> <%=mode %> </td>
      </tr>
       <tr> <td> <B> Dispatch Name</B> </td>
           <td> <%=modename %> </td>
      </tr>
       <tr> <td> <B> Chalan No.</B> </td>
           <td> <%=chalanno %> </td>
      </tr>
      <tr> <td> <B> Dispatch Id</B> </td>
           <td> <%=dispid %> </td>
      </tr>
      <tr> <td> <B> Ordered by</B> </td>
           <td> <%=ordby %> </td>
      </tr>
       <tr> <td> <B> Dispatched by</B> </td>
           <td> <%=dispby %> </td>
      </tr>
      <tr>
            <td> <B> Signature </B> </td>
            <td> </td>
      </tr>
	</table>
	<table border=0 width="30%">
      <tr>
           <td>  <a href="#" onclick="javascript:window.print();"> Print</a> </td> 
           <td> <div align="center"> <a href="" onclick="self.close()"> Close </a> </div> </td> 
      </tr>
   </table>
<%} catch(Exception e) { out.println("Exception----->"+e); }

finally
{


}
%>
