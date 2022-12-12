

<script src="sorttable.js"></script>


<html>
<head>
<STYLE TYPE="text/css">
<!--
#dek {POSITION:absolute;VISIBILITY:hidden;Z-INDEX:200;}
//-->
</STYLE>
<DIV ID="dek"></DIV>
<body onLoad="JavaScript:loadSearchHighlight();" bgcolor="#FFE4E1">

<script src="searchhi.js" type="text/javascript" language="JavaScript"></script>
<script language="JavaScript"><!--
    function loadSearchHighlight()
    {
      SearchHighlight();
      document.searchhi.h.value = searchhi_string;
      if( location.hash.length > 1 ) location.hash = location.hash;
    }
    // -->
  </script>

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
   if(ns4){skn.document.write(content);skn.document.close();skn.visibility="visible";}
   if(ns6){document.getElementById("dek").innerHTML=content;skn.display='';}
   if(ie4){document.all("dek").innerHTML=content;skn.display='';}
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
  skn.display="none";
  }

</script>
<style>
.popup {
visibility:hidden;
}
</style>
<%@ include file="menuheader.jsp" %>

<form name="unitholding" method="get" action="" >

<%!
Connection con1, con2;
%>

<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1 = con1.createStatement(), stmt2 = con2.createStatement(), stmt3 = con2.createStatement();
ResultSet rs1=null, rs2=null, rs3=null, rs4=null, rs5=null, rs6=null;
String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="";
int totmanufcnt=0, tottechcnt=0, totcustcnt=0;
String manufname=request.getParameter("name");
%>

	<table border="1" width="100%">
		<tr>
			<td align="center"> <font color="blue" size="2"> <B> Unit Holding Details </B> </font> </td>
		</tr>
	</table>

	<table border="1" width="100%" class="sortable">
		<tr>
			<td align="center" colspan="14"> <font color="maroon" size="2"> <B> With Manufacturer / WareHouse </B> </font> </td>
		</tr>
	
		<tr>
				<th>Sr No.</th>
				<th>Entered On</th>
				<th>Unit ID</th>
				<th>SIM No</th>
				<th>SIM Company</th>
				<th>Mobile No</th>
				<th>WMSN No</th>
				<th>Module Type</th>
				<th>Peripherals</th>
				<th>Software Version</th>
				<th>GPS No</th>
				<th>Unit Type</th>
				<th>Inst. Type</th>
				<th>Status</th>
	</tr>

<%int c1=1, i=1;
	
	sql1="select * from t_unitmaster where HoldBy='"+manufname+"'";
	rs1=stmt2.executeQuery(sql1);
	while(rs1.next())
	{
		
		     String unid=rs1.getString("UnitID");
		     String entdte=rs1.getString("EntDate");
		     String swver=rs1.getString("SwVer");
		     String manufby=rs1.getString("User");
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
		     String insttyp=rs1.getString("InstType");
		     String simco=rs1.getString("SimCompany");
		     String sim=rs1.getString("SIMNo");
		     String mobno=rs1.getString("MobNo");
		     String wmsn=rs1.getString("WMSN");
		     String module=rs1.getString("Module");
		     String Status =rs1.getString("status") ;
		     String time=rs1.getString("EntTime");
		     String gps =rs1.getString("GPS") ;
		     if(gps==null||gps.equalsIgnoreCase("null")||gps.trim().length()<=0)
		     {
		    	 gps="-";
		     }
		    
		     String peripheral="";
		     if(time==null)
		     {
		    	 time="00:00:00";
		     }
		     String utype=rs1.getString("typeunit");


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

%>
			
		<tr>	
				<td><%=i %></td>
				<% if(entdte==null || entdte.equals("-"))
   { %>
				<td>-</td>
				<% } 
   else
   { 
     java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(entdte);
     Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
     String nwfrmtdte=formatter.format(datefrmdb);
%>
				<td sorttable_customkey="dd-MMM-yyyy"><%=nwfrmtdte+" "+time %></td>
				<% } %>

				<td><%=unid %></td>
				<td><%=sim %></td>
				<td><%=simco %></td>
				<td><%=mobno %></td>
				<td><%=wmsn %></td>
				<td><%=module%></td>
			<%	  int len1=peripheral.length();
        //out.println(len1);
   
   if(len1==0)
   { %>
				<td>-</td>
				<% } 
   else if(len1<=5)
   { %>
				<td><%=peripheral %></td>
	<% }			else
   { 
     
     String halfp="";
     halfp=peripheral.substring(0,5);
%>
				<input type="hidden" id="fullp<%=c1 %>" name="fullp<%=c1 %>" value="<%=peripheral %>" />
				<td><%=halfp %>.....
				<div id="sh<%=c1 %>" name="sh<%=c1 %>"><a href="#"
					ONMOUSEOVER="show(fullp<%=c1 %>)" ; ONMOUSEOUT="kill()">Show </a></div>

				</td>
				<% 
   c1++;
    } %>
				
				<td><%=swver %></td>
				<td><%=gps %></td>
					<% if(null==utype || utype.equals("null"))
   { %>
				<td>-</td>
				<% }
   else
   { %>
				<td><%=utype %></td>
				<% } %>
				<td><%=insttyp %></td>
				<td><%=Status %></td>
		</tr>
			<% i++;
			} %>
	
	</table>
<br>



<% 

  
} catch(Exception e) { out.println("Exception----->"+e); }

finally
{
	 con1.close();
	 con2.close();
}
%>
     
<br>
<br>
<table border="0" width="100%" >
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>

</form>



