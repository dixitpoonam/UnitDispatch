<html>
<head>
<!-----------  This code is to show the peripherals in pop up(drop down)----------- -->
<STYLE TYPE="text/css">
<!--
#dek {POSITION:absolute;VISIBILITY:hidden;Z-INDEX:200;}
//-->
</STYLE> 
</head>

<body>
<DIV ID="dek"></DIV>

<script language="javascript">


function datevalidate()
{
	var date1=document.getElementById("calender").value;
	var date2=document.getElementById("calender1").value;

	var dm1,dd1,dy1,dm2,dd2,dy2;
	dy1=date1.substring(0,4);
	dy2=date2.substring(0,4);
	dm1=date1.substring(5,7);
	dm2=date2.substring(5,7);
	dd1=date1.substring(8,10);
	dd2=date2.substring(8,10);

	var date=new Date();
	var month=date.getMonth()+1;
	var day=date.getDate();
	var year=date.getFullYear();
	
	if(dy1>year || dy2>year)
	{
		alert("Selected date should not be greater than Todays date (Year)");
		//document.getElementById("calender").value="";
		//document.getElementById("calender1").value="";
		//document.getElementById("calender").focus;

		return false;
	
	}
	else if(year==dy1 && year==dy2) 
	{
		if(dm1>month || dm2>month)
		{
			alert("Selected date should not be greater than Todays date (Month)");
			//document.getElementById("calender").value="";
			//document.getElementById("calender1").value="";
			//document.getElementById("calender").focus;

			return false;
		}
	}

	if(dm1==month)
	{
		if(dd1>day || dd2>day)
		{
			alert("Selected date should not be greater than Todays date (Day)");
			//document.getElementById("calender").value="";
			//document.getElementById("calender1").value="";
			//document.getElementById("calender").focus;
	
			return false;
	
		}
	}

	if(dy1>dy2)
	{
		alert("From date year should not be greater than To date year");
		//document.getElementById("data").value="";
		//document.getElementById("data1").value="";
		//document.getElementById("data").focus;
		return false;
	}
	
	else if(year==dy1 && year==dy2) 
	{
		if(dm1>dm2)
		{
			alert("From date month should not be greater than To date month");
			//document.getElementById("data").value="";
			//document.getElementById("data1").value="";
			//document.getElementById("data").focus;
			return false;
		}
	}
	
	if(dm1==dm2)
	 {
		if(dd1 > dd2)
		{
			alert("From date should not be greater than To date");
			//document.getElementById("data").value="";
			//document.getElementById("data1").value="";
			//document.getElementById("data").focus;
			return false;
		}
	}
	return true;
}



function newwindow(webadd)
{ 
  window.open(webadd,'jav','width=530,height=500,resizable=yes');
} 


Xoffset=-60;    // modify these values to ...
  Yoffset= 20;    // change the popup position.
 
 var old,skn,iex=(document.all),yyy=-1000;

  var ns4=document.layers
  var ns6=document.getElementById&&!document.all
  var ie4=document.all

  if (ns4)
  skn=document.dek
  else if (ns6)
  skn=document.getElementById("dek").style
  else if (ie4)
  skn=document.all.dek.style
  if(ns4)document.captureEvents(Event.MOUSEMOVE);
  else{
  skn.visibility="visible"
  skn.display="none"
  }
  document.onmousemove=get_mouse; 

    function show(fullaction)
    {
     
     var v=fullaction.value;  
     //alert(v); 
    popup(v,"pink"); 
      
    }
 
  function popup(msg,bak){
  var content="<TABLE  WIDTH=150 BORDER=1 BORDERCOLOR=black CELLPADDING=2 CELLSPACING=0 "+
"BGCOLOR="+bak+"><TD ALIGN=center><FONT COLOR=black SIZE=2>"+msg+"</FONT></TD></TABLE>";
  yyy=Yoffset;
   if(ns4){skn.document.write(content);skn.document.close();skn.visibility="visible"}
   if(ns6){document.getElementById("dek").innerHTML=content;skn.display=''}
   if(ie4){document.all("dek").innerHTML=content;skn.display=''}
  }

  function get_mouse(e){
  var x=(ns4||ns6)?e.pageX:event.x+document.body.scrollLeft;
  skn.left=x+Xoffset;
  var y=(ns4||ns6)?e.pageY:event.y+document.body.scrollTop;
  skn.top=y+yyy;
  }

  function kill(){
  yyy=-1000;
  if(ns4){skn.visibility="hidden";}
  else if (ns6||ie4)
  skn.display="none"
  }

</script>

<script src="sorttable.js"></script>

<%@ include file="menuheader.jsp" %>

<%!
Connection con1, con2;
%>
<form name="printrec" method="get" action="" onSubmit="return datevalidate();"> 

<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);


Statement stmt1 = con1.createStatement(), stmt2 = con2.createStatement(), stmt3 = con1.createStatement(), stmt4 = con1.createStatement();
ResultSet rs1=null, rs2=null, rs3=null, rs4=null, rs5=null;
String sql1="", sql2="", sql3="", sql4="", sql5="";
String ordrdte="", add="", status="", dispdte="", ordqty="", dispdte1="", mode="", modename="", chalanno="",dispby="", ordby="",isnttype="" ;
int dispid=0, ordrno=0, dispid1=0;
int c=1;
String cnt="", cust="";
String user=session.getAttribute("typeval").toString();
String ustyp=session.getAttribute("urole").toString();

	java.util.Date d = new java.util.Date();
	Format formatter2 = new SimpleDateFormat("yyyy-MM-dd");
	String tdydte=formatter2.format(d);
	//out.print(tdydte);

	java.util.Date tdydte1 = new java.util.Date();
	long ms=d.getTime();
	ms=ms-1000 * 60 * 60 * 24* 7;
	tdydte1.setTime(ms);

	String sevdaybfre = formatter2.format(tdydte1);

String date1=request.getParameter("calender");	
String date2=request.getParameter("calender1");	

if(date1!=null)
{
	sevdaybfre=date1;
	tdydte=date2;
}
%>

<table border="0" width="100%" >
  <tr>
     
	<td align="right"> 
	<input type="text" id="calender" name="calender" size="13" class="formElement" value="<%=sevdaybfre %>" readonly/>
        <input type="button" name="trigger" id="trigger" value="From Date" class="formElement">
        	<script type="text/javascript">
        	 Calendar.setup(
            		 {
             			inputField  : "calender",         // ID of the input field
               			ifFormat    : "%Y-%m-%d",     // the date format
		                button      : "trigger"       // ID of the button
             		 }
                         		);
        	</script> &nbsp;&nbsp;&nbsp;
	<input type="text" id="calender1" name="calender1" size="13" class="formElement" value="<%=tdydte %>" readonly/>
        <input type="button" name="trigger1" id="trigger1" value="To Date" class="formElement">
        	<script type="text/javascript">
            		 Calendar.setup(
            		 {
             			inputField  : "calender1",         // ID of the input field
               			ifFormat    : "%Y-%m-%d",     // the date format
		                button      : "trigger1"       // ID of the button
             		 }
                         		);
        	</script> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

	<input type="submit" name="submit" value="Submit" class="formElement" />
   </td> 
  </tr>
</table>


<table border="0" width="100%">
   <tr> 
        <td> <div align="center"> <font color="maroon" size="2"> <b> Print Receipts External(Dispatch Date between <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(sevdaybfre))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(tdydte))%>) </b> </font> </div> </td>
	<td align="right"> <a href="exportreceipts.jsp?calender=<%=sevdaybfre%>&calender1=<%=tdydte%>"> <img src="images/excel.jpg" width="15px" height="15px" border="0"/></a></u> &nbsp;&nbsp;&nbsp;
    <a href="#" onclick="javascript:window.print();"><img src="images/print.jpg" width="20px" height="20px" border="0"/> 
   </tr>
</table> 
  <table border="1" width="100%" class="sortable">
     <tr> <th>  Order No.</th> 
          <th>Inst Type</th>
          <th> Order Qty.</th>  
          <th> Order Date </th> 
          <th> Dispatched Qty.</th> 
          <th> Dispatch Date</th> 
          <th> Unit/s Dispatched</th> 
          <th> Status </th> 
          <th> Dispatch Add. </th> 
          <th> Cust. </th> 
          <th> Dispatch Id</th> 
          <th> Mode of Dispatch </th> 
          <th> Dispatch Name </th> 
          <th> Chalan No. </th> 
          <th> Ordered by </th> 
          

          <th class="sorttable_nosort"> </th> 
    </tr>

  
<%
    if(ustyp.equals("administrator"))
   { 
      sql1="select distinct(DispId), OrderNo, DispDate from t_unitmasterhistory  where DispId <> '0' and Status='Dispatched' and DispDate between '"+sevdaybfre+"' and '"+tdydte+"' order by DispDate desc";
      
   }
   else
   {
      sql1="select distinct(DispId), OrderNo, DispDate from t_unitmasterhistory  where User='"+user+"' and Status='Dispatched' and DispId <> '0' and DispDate between '"+sevdaybfre+"' and '"+tdydte+"' order by DispDate desc";
      System.out.println(sql1);
   }

rs1=stmt1.executeQuery(sql1);
while(rs1.next())
{
   dispid=rs1.getInt("DispId");
       
/* *********************Getting details from DB order by Disp Id ********************** */
 
  if(ustyp.equals("administrator"))
   { 
  sql4="select * from t_unitmasterhistory where DispId='"+dispid+"' " ;	
  sql3="select * from t_unitmasterhistory where DispId='"+dispid+"' " ;
   }
   else
   {	
  sql4="select * from t_unitmasterhistory where DispId='"+dispid+"' and User='"+user+"' " ;
  sql3="select * from t_unitmasterhistory where DispId='"+dispid+"' and User='"+user+"' ";
   } 
   //out.print(sql4);
  rs4=stmt4.executeQuery(sql4);
  if(rs4.next())
  {
     int dispqty=0;
     String nwfrmtdte1="", unitid="";
   
      ordrno=rs4.getInt("OrderNo");
      isnttype=rs4.getString("InstType");
     dispdte=rs4.getString("DispDate");
     add=rs4.getString("DisAdd"); 


     	dispdte1=rs4.getString("DispDate"); 
        mode=rs4.getString("ModeofDispatch");  
        modename=rs4.getString("DisName"); 
        chalanno=rs4.getString("ChalanNo");  
        dispid1=rs4.getInt("DispId");  
        dispby=rs4.getString("User");  

        java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(dispdte1);
        Format formatter1=new SimpleDateFormat("dd-MMM-yyyy");
        nwfrmtdte1=formatter1.format(datefrmdb1); 

     sql2="select * from t_unitorder where Reqno='"+ordrno+"' "; 
     rs2=stmt2.executeQuery(sql2);
     if(rs2.next())
     {
        ordqty=rs2.getString("NoofUnits");
        ordby=rs2.getString("ReqBy");
        ordrdte=rs2.getString("ReqDate");
        status=rs2.getString("Status");
        cust=rs2.getString("Cust");
     }
       java.util.Date datefrmdb3=new SimpleDateFormat("yyyy-MM-dd").parse(ordrdte);
        Format formatter3=new SimpleDateFormat("dd-MMM-yyyy");
        String nwfrmtdte3=formatter3.format(datefrmdb3); 


   //  sql3="select * from t_unitmasterhistory where DispId='"+dispid+"' and User='"+user+"' ";
     //out.print(sql3);
     rs3=stmt3.executeQuery(sql3);
     while(rs3.next())
     {
    
        dispqty++;
        unitid=unitid+rs3.getString("UnitId")+",";
        
     }
   
     java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dispdte);
     Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
     String nwfrmtdte=formatter.format(datefrmdb);

%>
   <tr> <td> <%=ordrno %> </td> 
   		<td><%=isnttype %></td>
        <td> <%=ordqty %> </td> 
        
        <td sorttable_customkey="dd-MMM-yyyy"> <%=nwfrmtdte3 %> </td> 
        <td> <%=dispqty %> </td>
        <td sorttable_customkey="dd-MMM-yyyy"> <%=nwfrmtdte1 %> </td> 

<% 
      
      int len=unitid.length();
      //out.println(len);

       if(len<=5)
      { %>
         <td> <%=unitid %> </td>
<%    } 
      else
      { 
         String acthalf="";
         acthalf=unitid.substring(0,5);
%>
    <input type="hidden" id="fullaction<%=c %>" name="fullaction<%=c %>" value="<%=unitid %>" > </input>  
   <td> <%=acthalf %>.....<div id="sh<%=c %>" name="sh<%=c %>"><a href="#" ONMOUSEOVER="show(fullaction<%=c %>)"; ONMOUSEOUT="kill()">Show </a> </div> </td> 

<%  c=c+1;  
    }

%>
       <td> <%=status %> </td>
        <td> <%=add %> </td>
<%
	if(cust==null || cust.equals("-"))	
	{ %>
		<td> - </td>
<%	}	
	else
	{ %>
        <td> <%=cust %> </td>
<% 	} %>

        <td> <%=dispid1 %></td>
        <td> <%=mode %> </td>
        <td> <%=modename %> </td>
	<td> <%=chalanno %>  </td>

	

<%
	if(ordby==null || ordby.equals("-"))
	{ %>
		<td> - </td>
<%	}
	else
	{ %>
		<td> <%=ordby %> </td>
<%	} %>

	
      <td> <a href="" onClick="newwindow('printrecpt.jsp?dispid=<%=dispid %>&status=<%=status %>');return false" target="_parent"> Print</a> </td> 

   </tr>
<% } }
%>
</table>
  </form>
<%

} catch(Exception e) { out.println("Exception----->"+e); }

finally
{
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
