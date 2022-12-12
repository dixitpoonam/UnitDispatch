<html>
<head>
<STYLE TYPE="text/css">
<!--
#dek {POSITION:absolute;VISIBILITY:hidden;Z-INDEX:200;}
//-->
</STYLE> 
</head>

<body>
<DIV ID="dek"></DIV>


<script language="javascript">
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

    function show(fullcomment)
    {
     
     var v=fullcomment.value;  
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


<%@ include file="headeradmin.jsp" %>

<%!
Connection con1,/* con2, */con3;
%>

<table border="0" width="100%">
  <tr>
      <td><div align="left"> <a href="javascript:history.go(-1)"> <img src="images/arrow.bmp" width="20px" height="20px" border="0" > <a> </div> </td>
   <td> <div align="center"> <font color="maroon" size="3"> <B> Tested Units</B></font> </div> </td>
      <td> <div align="right"> <a href="logoutadmin.jsp"> Log Out </a> </div> </td>
  </tr>
</table>

<form name="testedunitsform" action="insert1.jsp" onsubmit="return validate();">

<% String inserted=request.getParameter("inserted");
   if(inserted==null)
   {
   }
   else
   { %>
        <table border="0" width="100%">
          <tr>
              <td> <div align="center"> <font color="maroon"><B> Successfully Updated </B></font> </div></td>
          </tr>
        </table>
<% } %>

<% 
try {

Driver MM_driverUser = (Driver)Class.forName("org.gjt.mm.mysql.Driver").newInstance();

con1 = DriverManager.getConnection("jdbc:mysql://172.16.8.17/db_gps","fleetview","1@flv");
//con2 = DriverManager.getConnection("jdbc:mysql://172.16.8.17/db_gpsOm","fleetview","1@flv");
con3 = DriverManager.getConnection("jdbc:mysql://172.16.8.17/db_CustomerComplaints","fleetview","1@flv");

//con1 = DriverManager.getConnection("jdbc:mysql://172.16.8.171.55/db_gps","unit","1@utp");
//con2 = DriverManager.getConnection("jdbc:mysql://172.16.8.171.55/db_gpsOm","unit","1@utp");

Statement stmt1 = con1.createStatement(), stmt2 = con1.createStatement(), stmt3 = con1.createStatement(), /*stmt4 = con2.createStatement(),*/stmt5 = con3.createStatement();
ResultSet rs1=null, rs2=null, rs4=null, rs5=null,rs6=null;
String sql1="", sql2="", sql3="", sql4="", sql5="",sql6="";

//String user=session.getValue("user").toString();
  String user1=request.getParameter("manuf1");
  
sql6 = "select V_ID from db_CustomerComplaints.t_vendorMaster where V_Name = '"+user1+"'";
System.out.println("Name Of The User ----"+sql6);
rs6 = stmt5.executeQuery(sql6); 
String user ="";
  if(rs6.next())
  {
	  user = rs6.getString("V_ID"); 
  }

//out.println(user);
//out.println(user);
%>
<p>
<table class="stats">
  <tr>
      <th> Sr No. </th>
      <th> Entered On </th>
      <th> Latest Date </th>
      <th> Unit ID </th>
      <th> SIM No </th>
      <th> Mobile No </th>
      <th> WMSN No </th>
      <th> Module Type </th>
      <th> GPS No </th>
      <th> Unit Type </th>
      <th> Inst. Type </th> 
      <th> Peripherals </th>
   
  </tr>
<%
  int c1=1, i=1;

/* *****Only those units will be shown which are not dispatched and whose data is coming********** */

  sql1="select * from t_unitmaster a, allconnectedunits b where a.User='"+user+"' and a.Status <> 'Dispatched' and a.UnitID=b.UnitID order by a.EntDate desc";
  System.out.println(sql1);
  rs1=stmt1.executeQuery(sql1);
  while(rs1.next())
  {  
     String unid=rs1.getString("UnitID");
    
     
       String pvoice=rs1.getString("PVoice");
       String pjrmbuzz=rs1.getString("PJrmBuzz");
       String pbuzz=rs1.getString("PBuzzer");
       String ptemp1=rs1.getString("PTemp1");
       String ptemp2=rs1.getString("PTemp2");
       String pdoor1=rs1.getString("PDoor1");
       String pdoor2=rs1.getString("PDoor2");
       String phorn=rs1.getString("PHorn");
       String pscard=rs1.getString("PScard");
       String pflowsen1=rs1.getString("PFlowSen1");
       String pflowsen2=rs1.getString("PFlowSen2");
       String pplain=rs1.getString("Plain");
       String entdte=rs1.getString("EntDate");
       String ltstdte=rs1.getString("TheDate");

       String utype=rs1.getString("typeunit");
      
/* *************Checking for peripheral specification********************************* */ 
       String peripheral="";
       if(null==pvoice || pvoice.equals("null"))
       {
        peripheral="";
       }
       else
       {
         peripheral="Voice";
       }
  
     if(null==pjrmbuzz || pjrmbuzz.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+JRM+Buzzer";
       }
       else
       {
          peripheral=peripheral+"JRM+Buzzer";
       }
        
     }

     if(null==pbuzz || pbuzz.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+Buzzer Only";
       }
       else
       {
          peripheral=peripheral+"Buzzer Only";
       }
       
     } 

     if(null==ptemp1 || ptemp1.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+1 Temp";
       }
       else
       {
          peripheral=peripheral+"1 Temp";
       }
     } 

     if(null==ptemp2 || ptemp2.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+2 Temp";
       }
       else
       {
          peripheral=peripheral+"2 Temp";
       }
      
     } 

     if(null==pdoor1 || pdoor1.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+1 Door";
       }
       else
       {
          peripheral=peripheral+"1 Door";
       }
       
     } 

     if(null==pdoor2 || pdoor2.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+2 Door";
       }
       else
       {
          peripheral=peripheral+"2 Door";
       }
       
     }

     if(null==phorn || phorn.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+Horn";
       }
       else
       {
          peripheral=peripheral+"Horn";
       }
       
     }

     if(null==pscard || pscard.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+Smart Card";
       }
       else
       {
          peripheral=peripheral+"Smart Card";
       }
       
     }

     

     if(null==pflowsen1 || pflowsen1.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+1 Flow Sensor";
       }
       else
       {
          peripheral=peripheral+"1 Flow Sensor";
       }
      
     }

     if(null==pflowsen2 || pflowsen2.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+2 Flow Sensor";
       }
       else
       {
          peripheral=peripheral+"2 Flow Sensor";
       }
       
     }

     if(null==pplain || pplain.equals("null") )
     {
       peripheral=peripheral+"";
     }
     else
     {
       if(peripheral.length()>3)
       {
       peripheral=peripheral+"+Plain";
       }
       else
       {
          peripheral=peripheral+"Plain";
       }
       
     }
/* ************************************************************************** */
          
  %> 
     <td> <%=i %> </td>
<% if(entdte==null || entdte.equals("-"))
   { %>
     <td> - </td>
<% } 
   else
   { 
     java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(entdte);
     Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
     String nwfrmtdte=formatter.format(datefrmdb);
%>
     <td> <%=nwfrmtdte %></td> 
   
<% } %>

<%
     java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(ltstdte);
     Format formatter1=new SimpleDateFormat("dd-MMM-yyyy");
     String nwfrmtdte1=formatter1.format(datefrmdb1);
%>
     <td> <%=nwfrmtdte1 %> </td>

     <td> <%=rs1.getString("UnitID") %> </td>
     <td> <%=rs1.getString("SIMNo") %> </td>
     <td> <%=rs1.getString("MobNo") %> </td>
     <td> <%=rs1.getString("WMSN") %> </td>
     <td> <%=rs1.getString("Module") %> </td>
     <td> <%=rs1.getString("GPS") %> </td>

<% if(null==utype || utype.equals("null"))
   { %>
      <td> - </td>
<% }
   else
   { %>  
     <td> <%=utype %> </td>
<% }  %>
   
      <td> <%=rs1.getString("InstType") %> </td>  

 <%    int len1=peripheral.length();
        //out.println(len1);
   
   if(len1==0)
   { %>
       <td> - </td>
  <% } 
   else if(len1<=5)
   { %>
      <td> <%=peripheral %> </td>
<% } 

   else
   { 
     
     String halfp="";
     halfp=peripheral.substring(0,5);
%>
     <input type="hidden" id="fullp<%=c1 %>" name="fullp<%=c1 %>" value="<%=peripheral %>" > </input> 
    <td> <%=halfp %>.....<div id="sh<%=c1 %>" name="sh<%=c1 %>"><a href="#" ONMOUSEOVER="show(fullp<%=c1 %>)"; ONMOUSEOUT="kill()">Show </a> </div>
 
</td>
  <% 
   c1++;
    } %>
   
     
</tr>
<% 
  i++;
}  
%>

</table>

<%
} catch(Exception e) { out.println("Exception----->"+e); }

finally
{
con1.close();
con3.close();
//con2.close();
}
%>

<br>
<br>
<table border="1" width="100%" >
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>

</form>

