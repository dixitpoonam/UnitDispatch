`<script language="javascript">

var chk="No";
function validate()
{
  var v1=document.mainform.manuf.value;
  var v2=document.mainform.cust.value;
  var v3=document.mainform.typ.value;
  var v4=document.mainform.seladd.value;
  var v5=document.mainform.calender.value;
  var v6=document.mainform.noofunits.value;
  var v7=document.mainform.tech.value;
  var v9=document.mainform.simco.value;
  var v10=document.mainform.boxtype.value;
	   
  if(v1=="Select")
  {
    alert("Please select Manufacturer");
    return false;
  }

    if(v2=="Select")
  {
    alert("Please select Customer");
    return false;
  }

  if(v7=="Select")
  {  
	alert("Please select Technician from the list");
	return false;
  }

  if(v9=="Select")
{
  alert("Please select Sim Company");
  return false;
}
  if(v10=="Select")
  {
    alert("Please select Box Enclosure Type");
    return false;
  }
  if(document.mainform.ordertype[0].checked == false && document.mainform.ordertype[1].checked == false)
  {
	  alert("Please select Order Type")
	  return false;
   }
    if(v3=="Select")
  {
    alert("Please select Type of Unit");
    return false;
  }
 
  if(v6.length==0)
  {
    alert("Please enter No. of Units");
    return false;
  }

  if(document.mainform.insttype[0].checked == false  && document.mainform.insttype[1].checked == false &&     document.mainform.insttype[2].checked == false)
  {
      alert("Please select Inst. Type");
      return false;
  }

  if(document.mainform.voice.checked == false && document.mainform.jrm.checked == false && document.mainform.buz.checked == false && document.mainform.temp1.checked == false && document.mainform.temp2.checked == false && document.mainform.door1.checked == false && document.mainform.door2.checked == false && document.mainform.horn.checked == false && document.mainform.scard.checked == false && document.mainform.flow1.checked == false && document.mainform.flow2.checked == false && document.mainform.plain.checked == false && document.mainform.SMARTGRID.checked == false)
  {
    alert("Please select at least one option from the Peripherals");
    return false;
  }

    if(v4=="Select")
  {
    alert("Please select Address");
    return false;
  }

    if(v5.length==0)
  {
    alert("Please select Date of Dispatch");
    return false;
  }

  if(chk=="Yes")
  {
    
    var v7=document.mainform.othadd.value;
    var v8=document.mainform.othdetadd.value;
   // var v9=document.mainform.techn.value;
    if(v7.length==0)
    {
      alert("Please enter Other Destination place with Full Address");
      return false;
    }
  }
 
  return true;

  
}

function ChkSub(ind)
{
  if(ind==0)
  {
     document.form1.action="status1.jsp";
  }
  else
  {
    document.mainform.action="insert1.jsp";
  }
 
}

// This function will get called when Address will be selected. This will call 'Ajaxgetadd.jsp' and will get detailed address from DB
 
function GetAdd(dropdown)
{ 
 var vv1=dropdown.selectedIndex;
  var SelValue1 = dropdown.options[vv1].value;
  //alert(SelValue1);

  if(SelValue1=="Other")
  {
    chk="Yes";
    //alert(chk);
    document.mainform.othadd.style.visibility='visible';
    document.mainform.othdetadd.style.visibility='visible';
    //document.mainform.techn.style.visibility='visible';

    document.mainform.fulladd.value="";
    document.mainform.fulladd.style.visibility='hidden';
  }

  else
  {
    chk="No";
    //alert(chk);
    document.mainform.fulladd.style.visibility='visible';
    document.mainform.othadd.value="";
    document.mainform.othdetadd.value="";
    //document.mainform.techn.value="";

    document.mainform.othadd.style.visibility='hidden';
    document.mainform.othdetadd.style.visibility='hidden';
   // document.mainform.techn.style.visibility='hidden';

    
  var ajaxRequest;  // The variable that makes Ajax possible!

    try{
		// Opera 8.0+, Firefox, Safari
		ajaxRequest = new XMLHttpRequest();
	        }  
                catch (e)
                {
		        // Internet Explorer Browsers
		        try
                        {
			   ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
		        } 
                        catch (e)
                        {
			   try
                           {
			       ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			   } 
                           catch (e)
                           {
			      // Something went wrong
			      alert("Your browser broke!");
			      return false;
			   }
		        }
                }

                  // Create a function that will receive data sent from the server
            	   ajaxRequest.onreadystatechange = function()
                     {
     	 	   if(ajaxRequest.readyState == 4)
                        {
                           var reslt=ajaxRequest.responseText;
                           //alert(reslt);
  
             //var len=reslt.length;
             //alert(len);
                           var reslt=ajaxRequest.responseText;
                           
                           document.mainform.fulladd.value = reslt;
                           
		      } 
         	   }
               var queryString = "?loc=" +SelValue1;
 	      ajaxRequest.open("GET", "Ajaxgetadd.jsp" + queryString, true);
	     ajaxRequest.send(null); 
}

}


function OnChangeFunc2(dropdown)
  {
 var vv1=dropdown.selectedIndex;
 var SelValue1 = dropdown.options[vv1].value;
        if(SelValue1=="Other")
        {
             document.mainform.othman.style.visibility="visible";
        }      
        else
        { 
           document.mainform.othman.style.visibility="hidden";
           document.mainform.othman.value="";
        }
 }    



</script>

<%@ include file="menuheader.jsp" %>

<%!
Connection con1, con2;
%>


<%
String admin=session.getValue("user").toString();
%>
<!--<table border="1" width="100%">
  <tr>
      <td> <div align="center"> <font color="maroon" size="2"> <marquee> <B> Welcome <%=admin %> </B> </font> </div> </td>
  </tr>
</table> -->

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement(), stmt2=con2.createStatement(),st=con1.createStatement();
ResultSet rs1=null, rs2=null, rs3=null, rs4=null, rs5=null, rs6=null, rs7=null;
String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql7="";
String cnt="";


%>

<form name="form1" method="get" action="insert1.jsp" >

<br>
<table border="0" width="100%">
  <tr>
      
      <td> 
        <div align="right"> <font color="maroon">
Select Manufacturer to Check Stock </font>&nbsp;&nbsp;<select name="manuf1" class="formElement"> <option value="Select"> Select </option>
<% 
//sql4="select * from t_admin where URole='manufacturer' ";
sql4="select * from t_vendorMaster";
   rs4=stmt1.executeQuery(sql4);

 while(rs4.next())
       { %>
           <option value="<%=rs4.getString("V_Name") %>"> <%=rs4.getString("V_Name") %> </option>
  <%   } %>
 </select> &nbsp;&nbsp;
          <input type="submit" name="submit" value="Check" class="formElement" onClick="ChkSub(0)"; />
</div> </td>
      
  </tr> 
</table>
</form>
<form name="mainform" method="get" action="" onSubmit="return validate()";>
<%
  String changed=request.getParameter("changed");
  
  if(changed==null)
   {
   }
   else
   { 

  %>
        <table border="0" width="100%">
   <tr>
        <td> <div align="center"> <font color="maroon" size="2"> <b> <U> Password change successful  </U> </b></font> </div> </td>
   </tr>
</table>

<%  }


  String inserted=request.getParameter("inserted");
   if(inserted==null)
   {
   }
   else
   { 
    String ordno=request.getParameter("ordrrno");
  %>
        <table border="0" width="100%">
   <tr>
        <td> <div align="center"> <font color="maroon" size="2"> <b> <U> Successfully Inserted. Order no is <%=ordno %> </U> </b></font> </div> </td>
   </tr>
</table>

<%  }
%>

<table border="0" width="100%">
  <tr>
      <td> <div align="center"> <font color="maroon" size="2"> <B> Order Form <B> </font> </div> </td>
  </tr>
</table>  

<% 
   //sql1="select distinct(typevalue) from t_admin where URole='Manufacturer' ";
   sql1="select distinct(V_Name) from t_vendorMaster";
   //out.print(sql1);
   rs1=stmt1.executeQuery(sql1);
%>
<table border="1" width="100%">
<tr>
  <td> 
<center>  
<table border="1" width="80%">
  <tr>
      <td> <font color="maroon"> <B> Request to </B></font> </td>
      <td  colspan="4"> <div align="left"> <select name="manuf" class="formElement" onChange="OnChangeFunc2(this);"> <option value="Select"> Select </option>
   <%  while(rs1.next())
       { %>
           <option value="<%=rs1.getString("V_Name") %>"> <%=rs1.getString("V_Name") %> </option>
  <%   } %>
        <option value="Other"> Other</option>
 </select> &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="text" name="othman" class="formElement" style="visibility:hidden" /> </div> </td>
  </tr>
  
<%  sql3="select distinct(TypeValue) as TypeValue from t_security where TypeofUser in('Transporter','GROUP') order by TypeValue asc";
    rs3=stmt2.executeQuery(sql3);
    String str="Select name from t_vendordetails";
    ResultSet rsget=st.executeQuery(str);
    
%>
  <tr>
       <td> <font color="maroon"> <B> Dispatch to (Cust) </B></font> </td>
       <td  colspan="4"> <div align="left"> <select name="cust" class="formElement"> <option value="Select"> Select </option> 
   <% while(rs3.next())
      { %>
          <option value="<%=rs3.getString("TypeValue") %>"> <%=rs3.getString("TypeValue") %> </option>
  <%  } 
      while(rsget.next())
      {  %>
       <option value="<%=rsget.getString("name") %>"> <%=rsget.getString("name") %> </option>
    	  
     <% }
  %>
</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%
	sql7="select distinct(TechName) as techname from t_techlist where Available='Yes' order by TechName asc";
	rs7=stmt1.executeQuery(sql7);
%>
	<font color="maroon"> <B> Technician </B></font> 
		<select name="tech" class="formElement">
			<option value="Select">Select</option>	
<%
		while(rs7.next())
		{ %>
			<option value="<%=rs7.getString("techname")%>"><%=rs7.getString("techname")%></option>	
<%		} 
%>
				<%--<option value="None">None</option>--%>
		</select>
	</td>
  </tr>

<% sql2="select * from t_typeofunits order by typename asc";
   rs2=stmt1.executeQuery(sql2);
%>
 <tr> 
  <td> <font color="maroon"> <B> Type of Unit </B> </font> </td>
      <td colspan="4"> <div align="left"> <select name="typ" class="formElement"> <option value="Select"> Select </option> 
  <% while(rs2.next())
     { %>
          <option value="<%=rs2.getString("typename") %>"> <%=rs2.getString("typename") %> </option>
<%   } %>
</select> 
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <font color="maroon"> <B>Box Enclosure Type</B> </font> &nbsp;&nbsp;
         <select name="boxtype"  class="formElement">
      <option value="Select">Select</option>
       <option value="Any">Any</option>
    	<option value="Metal">Metal</option>
				<option value="Plastic">Plastic</option>
			 
      </select>
   
</div> </td>   
 </tr>

  <tr>
      <td> <font color="maroon"> <B> No. of Units </B></font> </td>
      <td colspan="4"> <div align="left"> <input type="text" name="noofunits" size="10" class="formElement" /> 
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;
       <font color="maroon"> <B> Inst. Type </B> </font> &nbsp;&nbsp;
                     <input type="radio" name="insttype" value="New" > New </input>
                     <input type="radio" name="insttype" value="Repaired" > Repaired </input>
                     <input type="radio" name="insttype" value="Faulty" > Faulty </input>
      </div> </td>
  </tr>
  <tr>
      <td> <font color="maroon"> <B>Sim Company</B></font> </td>
      <td colspan="4"> <div align="left"> 
      <select name="simco"  class="formElement">
      <option value="Select">Select</option>
       <option value="Any">Any</option>
      <option value="Idea">Idea</option>
      <option value="Airtel">Airtel</option>
      <option value="Vodafone">Vodafone</option>
     
      </select>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;
       <font color="maroon"> <B>Order Type </B> </font>&nbsp;
                     <input type="radio" name="ordertype" value="Internal" > Internal </input>
                     <input type="radio" name="ordertype" value="External" > External </input>
                     
      </div> </td>
  </tr> 
  <tr>
  <td> <font color="maroon"> <B> Peripherals </B></font> </td>
      <td colspan="4"> 
           <table border="0" width="100%">
            <tr>
             <td> <div align="left">   
                <input type="checkbox" name="voice" value="Voice" >Voice </input> </div>
            </td>
            <td> <div align="left"> 
                <input type="checkbox" name="jrm" value="JRM+Buzzer" >JRM + Buzzer </input>  </div>
            </td>
            <td> <div align="left"> 
                <input type="checkbox" name="buz" value="BuzzerOnly" >Buzzer Only</input>   </div>
            </td>
            <td><input type="checkbox" name="smartKey" value="smartKey"/>Smart Key</td>
            </tr>
            
            <tr>
           
           <td>   <div align="left">
           <input type="checkbox" name="temp1" value="1Temp" >1 Temp </input> </div> 
           </td>
           <td>  <div align="left">
           <input type="checkbox" name="temp2" value="2Temp" >2 Temp </input> </div>
           </td>
           <td>  <div align="left">
           <input type="checkbox" name="scard" value="SmartCard" >Smart Card </input>  </div>
            <td><input type="checkbox" name="battery" value="WithBattery">With Battery </td>
           </td>
           </tr>
           <tr>
           
           <td>  <div align="left">
              <input type="checkbox" name="door1" value="1Door" >1 Door </input>  </div>
           </td>
           <td>  <div align="left">
           <input type="checkbox" name="door2" value="2Door" >2 Door </input>  </div>
           </td>
           <td>  <div align="left">
           <input type="checkbox" name="horn" value="Horn" >Horn </input>  </div>
           </td>
              <td><input type="checkbox" name="battery950" value="With 950mAh Battery">With 950mAh Battery </td>
           
           </tr>
           <tr>
          
           <td>  <div align="left">
           <input type="checkbox" name="flow1" value="1FlowSensor" >1 Flow Sensor  </div>
           </td>
           <td>  <div align="left">
           <input type="checkbox" name="flow2" value="2FlowSensor" >2 Flow Sensor </input> </div>
           </td>
           <td>   <div align="left"><input type="checkbox" name="plain" value="plain" >Plain </input>  </div>
           </td>
           <td><input type="checkbox" name="battery1800" value="With 1800mAh Battery">With 1800mAh Battery </td>
        </tr>
        <tr>
				<td><input type="checkbox" name="battery1050" value="With 1050mAh Battery">With 1050mAh Battery </td>
                             <td><input type="checkbox" name="SMARTGRID" value="SMARTGRID">SMARTGRID </td>
                             <td><input type="checkbox" name="PanikKey" value="PANICKEY">PanicKey</td>
                   <td><input type="checkbox" name="Camera" value="With Camera">With Camera</td>
			 </tr>
			<tr>
			      <td><input type="checkbox" name="Humidity" value="Humidity">Humidity</td>
			 
			</tr>
			
			 
      </table>

     </td>
    </tr>

<% sql5="select * from t_dispatchaddress order by Location asc";
   rs5=stmt1.executeQuery(sql5);
%>
    <tr>
          <td rowspan="2"> <font color="maroon"> <B> Address </B></font> </td> 
          <td colspan="4"> <div align="left"> <select name="seladd" onChange="GetAdd(this);" class="formElement" > 
              <option value="Select"> Select</option> 
<% while(rs5.next())
   { %>
        <option value="<%=rs5.getString("Location") %>" > <%=rs5.getString("Location") %> </option> 
<% } %>
  <option value="Other"> Other </option>
</select> 
  &nbsp; &nbsp;&nbsp;&nbsp;
  <textarea name="fulladd" rows="2" cols="20" class="formElement" disabled="true"> </textarea>  
</div> </td> </tr>
         <tr>  <td> <div align="center"> <label for="placelabel" > Place </label>
 <input type="text" name="othadd" class="formElement" style="visibility:hidden" />  </div></td>
         
         <td> <div align="center"> <label for="fuladdlabel" >  Full Address </label> 
<textarea name="othdetadd" rows="2" cols="20" class="formElement" style="visibility:hidden"> </textarea>  </div>
         </td> 
</tr> 
    <tr>
         <td> <font color="maroon"> <B> Dispatch Date </B></font> </td>
         <td  colspan="4"> <div align="left"> <input type="text" id="calender" name="calender" size="13" class="formElement" value="" readonly/>
  
<!--<input type="image" src="images/FromDate.bmp" id="trigger"> --> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input type="button" name="trigger" id="trigger" value="Disp. Date" class="formElement">
             <script type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger"       // ID of the button
             }
                           );
             </script> </div> </td>
         
    </tr> 


  <tr>
       <td colspan="4"> <div align="center">  <input type="submit" name="submit" value="Submit" class="formElement" onClick="ChkSub(1)";/>
   </div> </td>
  </tr>
</table>


<% } catch(Exception e) { out.println("Exception----->" +e); }

finally
{
con1.close();

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