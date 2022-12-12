<script language="javascript">

var chk="No";
function validate()
{ 
  var v1=document.mainform.manuf.value;
  var v2=document.mainform.cust.value;
  var v3=document.mainform.typ.value;
  var v4=document.mainform.seladd.value;
  var v5=document.mainform.calender.value;
  var v6=0;
  v6=document.mainform.noofunits.value;
  var v7=0;
  v7=document.mainform.noofdis.value;
  var v8=parseInt(v6);
  var v9=parseInt(v7);

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

  if(document.mainform.voice.checked == false && document.mainform.jrm.checked == false && document.mainform.buz.checked == false && document.mainform.temp1.checked == false && document.mainform.temp2.checked == false && document.mainform.door1.checked == false && document.mainform.door2.checked == false && document.mainform.horn.checked == false && document.mainform.scard.checked == false && document.mainform.flow1.checked == false && document.mainform.flow2.checked == false && document.mainform.plain.checked == false )
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

  if(v8 < v9)
  {
     alert("No. of Units Ordered cannot be less then No. of Units Dispatched "); 
     return false;
  }
 
  return true;

  
}

/*function ChkSub(ind)
{
  if(ind==0)
  {
     document.form1.action="status.jsp";
  }
  else
  {
    document.mainform.action="insert.jsp";
  }
 
} */

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
} }

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


<%@ include file="headeradmin.jsp"%>

<%!
Connection con1, con2;
%>

<form name="mainform" method="get" action="updateorder.jsp"
	onSubmit="return validate()";>
<%
  String reqno=request.getParameter("reqno");
  //out.print(reqno);
%> <input type="hidden" name="reqnotext" value="<%=reqno %>" />
<table border="0" width="30%">
	<tr>
		<td>
		<div align="left"><a href="javascript:history.go(-1)"> <img
			src="images/arrow.bmp" width="20px" height="20px" border="0">
		</img> </a></div>
		</td>
	</tr>
</table>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);


Statement stmt1=con1.createStatement(), stmt2=con2.createStatement(),st=con1.createStatement();
ResultSet rs1=null, rs2=null, rs3=null, rs4=null, rs5=null, rs6=null, rs7=null, rs8=null, rs9=null;
String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql7="", sql8="", sql9="";
String manufac="", simco="",custmr="",ordertype="", boxtype="",type="", noofunits="", instphase="", periph="", dispadd="", dispdate="", detdispadd="", remainunits="";
String flagvoice="No", flagjrm="No", flagbuz="No", flag1temp="No", flag2temp="No", flagsmart="No", flag1door="No", flag2door="No", flaghorn="No", flag1flow="No", flag2flow="No", flagplain="No", fulloc="", disloc="",flagWithBattery="No";
int periphid=0, ordunitsint=0, remunitsint=0, dispunits=0;

String status=request.getParameter("stat");
session.setAttribute("stat",status);
if(status.equals("Dispatched") || status.equals("Cancelled") || status.equals("Received") || status.equals("Sent"))
   { %> <font color="maroon" size="2"> <B> You cannot edit
this Order as it is either Dispatched or Cancelled or Received </B></font> <% }
else
{
  sql6="select * from t_unitorder where Reqno='"+reqno+"' ";
  rs6=stmt1.executeQuery(sql6);
  while(rs6.next())
  {
    manufac=rs6.getString("Reqto");
    custmr=rs6.getString("Cust");
    type=rs6.getString("TypofUnit");
    noofunits=rs6.getString("NoofUnits");
    instphase=rs6.getString("InsType");
    periph=rs6.getString("Peripherals");
    dispadd=rs6.getString("DispatchAdd");
    dispdate=rs6.getString("DispDate");
    remainunits=rs6.getString("RemUnits");
    simco=rs6.getString("Sim_Co");
    ordertype=rs6.getString("Ordertype");
    boxtype=rs6.getString("Box_type");
  }
  if(type==null || type.equals("null"))
	{
		type="-";
	}
  if(custmr==null || custmr.equals("null"))
	{
	  custmr="N.A";
	}
  if(periph==null || periph.equals("null"))
	{
	  periph="N.A";
	}
  if(noofunits==null || noofunits.equals("-"))
  {
	  noofunits="0";
  }
  if(remainunits==null || remainunits.equals("-"))
  {
	  remainunits="0";
  }
  ordunitsint=Integer.parseInt(noofunits);
  remunitsint=Integer.parseInt(remainunits);
  dispunits=ordunitsint-remunitsint;

  sql7="select * from t_dispatchaddress where Location='"+dispadd+"' ";
  rs7=stmt1.executeQuery(sql7);
  if(rs7.next())
  {
    detdispadd=rs7.getString("Address");
  }

  sql4="select * from t_admin where URole='manufacturer' ";
  rs4=stmt1.executeQuery(sql4);
  
  String str="Select name from t_vendordetails";
  ResultSet rsget=st.executeQuery(str);
%>

<table border="0" width="100%">
	<tr>
		<td>
		<div align="center"><font color="maroon" size="2"> <B>
		Edit Order No. <%=reqno %><B></font></div>
		</td>
	</tr>
</table>
<table border="1" width="100%">
	<tr>
		<td>
		<center>
		<table border="1" width="80%">
			<tr>
				<td><font color="maroon"> <B> Request to </B></font></td>
				<% if(status.equals("Partially Dispatched") || status.equals("Partially Sent"))
   { %>
				<td colspan="4">
				<div align="left"><select name="manuf" class="formElement"
					onChange="OnChangeFunc2(this);" disabled>
					<option value="Select">Select</option>
					<%  while(rs4.next())
            { 
               String allmanuf=rs4.getString("Uname");
         %>
					<option value="<%=rs4.getString("Uname") %>"
						<% if(manufac.equalsIgnoreCase(allmanuf)) {  %> Selected <% } %>>
					<%=rs4.getString("Uname") %></option>
					<%  } %>
					<option value="Other">Other</option>
				</select> &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="othman"
					class="formElement" style="visibility: hidden" /></div>
				</td>
				<% }
   else
   { %>
				<td colspan="4">
				<div align="left"><select name="manuf" class="formElement"
					onChange="OnChangeFunc2(this);">
					<option value="Select">Select</option>
					<%  while(rs4.next())
            { 
               String allmanuf=rs4.getString("Uname");
         %>
					<option value="<%=rs4.getString("Uname") %>"
						<% if(manufac.equalsIgnoreCase(allmanuf)) {  %> Selected <% } %>>
					<%=rs4.getString("Uname") %></option>
					<%  } %>
					<option value="Other">Other</option>
				</select> &nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="othman"
					class="formElement" style="visibility: hidden" /></div>
				</td>
				<% } %>
			</tr>

			<%  sql3="select TypeValue from t_security where TypeofUser in('Transporter','GROUP') order by TypeValue asc";
         rs3=stmt2.executeQuery(sql3);
     %>
			<tr>
				<td><font color="maroon"> <B> Dispatch to (Cust) </B></font></td>
				<% if(status.equals("Partially Dispatched") || status.equals("Partially Sent"))
   { %>
				<td colspan="4">
				<div align="left"><select name="cust" class="formElement"
					disabled>
					<option value="Select">Select</option>
					<% while(rs3.next())
              {
                 String customer=rs3.getString("TypeValue");
           %>
					<option value="<%=rs3.getString("TypeValue") %>"
						<% if(custmr.equalsIgnoreCase(customer)) {  %> Selected <% } %>>
					<%=rs3.getString("TypeValue") %></option>
					<%  } %>
				</select>
				</td>
				<% }
   else
   { %>
				<td colspan="4">
				<div align="left"><select name="cust" class="formElement">
					<option value="Select">Select</option>
					<% while(rs3.next())
              {
                 String customer=rs3.getString("TypeValue");
           %>
					<option value="<%=rs3.getString("TypeValue") %>"
						<% if(custmr.equalsIgnoreCase(customer)) {  %> Selected <% } %>>
					<%=rs3.getString("TypeValue") %></option>
					<%  } 
           while(rsget.next())
      {  
      	String custm=rsget.getString("name");
      %>
					<option value="<%=rsget.getString("name") %>"
						<% if(custmr.equalsIgnoreCase(custm)) {  %> Selected <% } %>>
					<%=rsget.getString("name") %></option>

					<% }%>



				</select></div>
				</td>
				<% } %>
			</tr>

			<% sql2="select * from t_typeofunits order by typename asc";
         rs2=stmt1.executeQuery(sql2);
      %>
			<tr>
				<td><font color="maroon"> <B> Type of Unit </B> </font></td>
				<% if(status.equals("Partially Dispatched") || status.equals("Partially Sent"))
   { %>
				<td colspan="4">
				<div align="left"><select name="typ" class="formElement"
					disabled>
					<option value="Select">Select</option>
					<% while(rs2.next())
         {
            String typunit=rs2.getString("typename");
       %>
					<option value="<%=rs2.getString("typename") %>"
						<% if(type.equals(typunit)) {  %> Selected <% } %>><%=rs2.getString("typename") %>
					</option>
					<%  } %>
				</select>

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="maroon"> <B>Box
				Enclosure Type</B> </font> &nbsp;&nbsp; <select name="boxtype"
					class="formElement" disabled>
					<option value="Select" <% if(boxtype.equals("-")) {  %> Selected
						<% } %>>Select</option>
					<option value="Any" <% if(boxtype.equals("Any")) {  %> Selected
						<% } %>>Any</option>
					<option value="Metal" <% if(boxtype.equals("Metal")) {  %> Selected
						<% } %>>Metal</option>
					<option value="Plastic" <% if(boxtype.equals("Plastic")) {  %>
						Selected <% } %>>Plastic</option>

				</select></div>
				</td>
				<% }
   else
   { %>
				<td colspan="4">
				<div align="left"><select name="typ" class="formElement">
					<option value="Select">Select</option>
					<% while(rs2.next())
         {
            String typunit=rs2.getString("typename");
       %>
					<option value="<%=rs2.getString("typename") %>"
						<% if(type.equals(typunit)) {  %> Selected <% } %>><%=rs2.getString("typename") %>
					</option>
					<%  } %>
				</select>

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="maroon"> <B>Box
				Enclosure Type</B> </font> &nbsp;&nbsp; <select name="boxtype"
					class="formElement">
					<option value="Select" <% if(boxtype.equals("-")) {  %> Selected
						<% } %>>Select</option>
					<option value="Any" <% if(boxtype.equals("Any")) {  %> Selected
						<% } %>>Any</option>
					<option value="Metal" <% if(boxtype.equals("Metal")) {  %> Selected
						<% } %>>Metal</option>
					<option value="Plastic" <% if(boxtype.equals("Plastic")) {  %>
						Selected <% } %>>Plastic</option>

				</select></div>
				</td>

				<% } %>

			</tr>

			<tr>
				<td><font color="maroon"> <B> No. of Units Ordered</B></font></td>
				<td colspan="4">
				<div align="left"><input type="text" name="noofunits"
					size="10" class="formElement" value="<%=noofunits %>" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="maroon"> <B>
				No. of Units Dispatched</B></font> &nbsp;&nbsp; <input type="text"
					name="noofdis" size="10" class="formElement"
					value="<%=dispunits %>" readonly />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="maroon"> <B>
				Rem. Units</B></font> &nbsp;&nbsp; <input type="text" name="remunits" size="10"
					class="formElement" value="<%=remainunits %>" readonly />
				</td>
			</tr>
			<tr>
				<td><font color="maroon"> <B> Inst. Type </B> </font></td>
				<td colspan="4">
				<% if(status.equals("Partially Dispatched") || status.equals("Partially Sent"))
   {
       if(instphase.equals("New"))
       { %> <input type="radio" name="insttype" value="New" Checked
					disabled> New </input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
					type="radio" name="insttype" value="Repaired" disabled>
				Repaired </input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
					name="insttype" value="Faulty" disabled> Faulty </input> <%   }
       else if(instphase.equals("Repaired"))
       { %> <input type="radio" name="insttype" value="New" disabled>
				New </input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
					name="insttype" value="Repaired" Checked disabled> Repaired
				</input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="insttype"
					value="Faulty" disabled> Faulty </input> <%   }
       else
       { %> <input type="radio" name="insttype" value="New" disabled>
				New </input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
					name="insttype" value="Repaired" disabled> Repaired </input>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="insttype"
					value="Faulty" Checked disabled> Faulty </input> <%  } 
  }
  else
  { 
      if(instphase.equals("New"))
       { %> <input type="radio" name="insttype" value="New" Checked>
				New </input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
					name="insttype" value="Repaired"> Repaired </input>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="insttype"
					value="Faulty"> Faulty </input> <% }
     else if(instphase.equals("Repaired"))
     { %> <input type="radio" name="insttype" value="New"> New </input>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="insttype"
					value="Repaired" Checked> Repaired </input>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="insttype"
					value="Faulty"> Faulty </input> <% }
     else
     { %> <input type="radio" name="insttype" value="New"> New </input>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="insttype"
					value="Repaired"> Repaired </input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="insttype" value="Faulty" Checked>
				Faulty </input> <% }
 } %>

				</div>
				</td>
			</tr>

			<!-- ///////////////////Code by pradnya for sim, order type -->
			<tr rowspan=4>
				<td><font color="maroon"> <B> Sim company</B></font></td>
				<% if(status.equals("Partially Dispatched") || status.equals("Partially Sent"))
   { %>
				<td>
				<div align="left"><select name="simco" class="formElement"
					disabled>
					<option value="Select" <% if(simco.equals("-")) {  %> Selected
						<% } %>>Select</option>

					<option value="Any" <% if(simco.equals("Any")) {  %> Selected
						<% } %>>Any</option>
					<option value="Idea" <% if(simco.equals("Idea")) {  %> Selected
						<% } %>>Idea</option>
					<option value="Airtel" <% if(simco.equals("Airtel")) {  %> Selected
						<% } %>>Airtel</option>
					<option value="Vodafone" <% if(simco.equals("Vodafone")) {  %>
						Selected <% } %>>Vodafone</option>
				</td>
				<% }
   else
   { %>
				<td>
				<div align="left"><select name="simco" class="formElement">
					<option value="Select" <% if(simco.equals("-")) {  %> Selected
						<% } %>>Select</option>
					<option value="Any" <% if(simco.equals("Any")) {  %> Selected
						<% } %>>Any</option>
					<option value="Idea" <% if(simco.equals("Idea")) {  %> Selected
						<% } %>>Idea</option>
					<option value="Airtel" <% if(simco.equals("Airtel")) {  %> Selected
						<% } %>>Airtel</option>
					<option value="Vodafone" <% if(simco.equals("Vodafone")) {  %>
						Selected <% } %>>Vodafone</option>
				</td>
				<% } %>



				<td><font color="maroon"> <B> Order Type </B> </font> <% if(status.equals("Partially Dispatched") || status.equals("Partially Sent"))
   {
       if(ordertype.equals("Internal"))
       { %> <input type="radio" name="ordertype" value="Internal"
					Checked disabled> Internal </input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="ordertype" value="External" disabled>
				External </input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%   }
       else if(ordertype.equals("External"))
       { %> <input type="radio" name="ordertype" value="Internal"
					disabled> Internal </input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
					type="radio" name="ordertype" value="External" Checked disabled>
				External </input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%   }
       else if(ordertype.equals("-"))
       { %> <input type="radio" name="ordertype" value="Internal"
					disabled> Internal </input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
					type="radio" name="ordertype" value="External" disabled>
				External </input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%   }
  }
  else
  { 
      if(ordertype.equals("Internal"))
       { %> <input type="radio" name="ordertype" value="Internal"
					Checked> Internal </input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
					type="radio" name="ordertype" value="External"> External </input>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <% }
     else if(ordertype.equals("External"))
     { %> <input type="radio" name="ordertype" value="Internal">
				Internal </input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
					name="ordertype" value="External" Checked> External </input>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <% }
     else if(ordertype.equals("-"))
     { %> <input type="radio" name="ordertype" value="Internal">
				Internal </input> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
					name="ordertype" value="External"> External </input>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%   }
    
 } %>

				</div>
				</td>
			</tr>

			<% 
      String[] result = periph.split("\\+");
      /*for (int x=0; x<result.length; x++)
         out.print(result[x]); */
      //out.print(periph);

      /*sql8="select * from t_periphcomb where Combination='"+periph+"' ";
      rs8=stmt1.executeQuery(sql8);
      if(rs8.next())
      {
        periphid=rs8.getInt("id");
      }
      out.print(periphid); */
      
    %>
			<tr>
				<td><font color="maroon"> <B> Peripherals </B></font></td>
				<td colspan="4">
				<table border="0" width="100%">
					<tr>
						<td>
						<div align="left">
						<%
                   for (int y=0; y<result.length; y++)
                   {
                      if(result[y].equals("Voice"))
                      {
                         flagvoice="Yes";
                      }
                     
                      if(result[y].equals("JRM"))
                      {
                         flagjrm="Yes";
                      }
 
                      if(result[y].equals("Buzzer Only"))
                      {
                         flagbuz="Yes";
                      }

                        if(result[y].equals("1 Temp"))
                      {
                         flag1temp="Yes";
                      }

                      if(result[y].equals("2 Temp"))
                      { 
                         flag2temp="Yes";
                      }

                      if(result[y].equals("Smart Card"))
                      { 
                         flagsmart="Yes";
                      } 

                      if(result[y].equals("1 Door"))
                      { 
                         flag1door="Yes";
                      }

                      if(result[y].equals("2 Door"))
                      { 
                         flag2door="Yes";
                      }

                      if(result[y].equals("Horn"))
                      { 
                         flaghorn="Yes";
                      }

                      if(result[y].equals("1 Flow Sensor"))
                      {  
                         flag1flow="Yes";
                      }

                      if(result[y].equals("2 Flow Sensor"))
                      {
                         flag2flow="Yes";
                      }

                      if(result[y].equals("Plain"))
                      {
                         flagplain="Yes";
                      }
                      
                      if(result[y].equals("With Battery"))
                      {
                         flagWithBattery="Yes";
                      }
                      
                    
                   }
                   
      if(status.equals("Partially Dispatched") || status.equals("Partially Sent"))
      {
                  
                  if(flagvoice.equals("Yes"))
                  {
               %> <input type="checkbox" name="voice" value="Voice"
							Checked disabled>Voice </input> <%  } 
                  else
                  { %> <input type="checkbox" name="voice" value="Voice"
							disabled>Voice </input> <%  } %>
						</div>
						</td>
						<td>
						<div align="left">
						<%
               if(flagjrm.equals("Yes"))
               {
               %> <input type="checkbox" name="jrm" value="JRM+Buzzer"
							Checked disabled>JRM + Buzzer </input> <%   }
               else
               { %> <input type="checkbox" name="jrm" value="JRM+Buzzer"
							disabled>JRM + Buzzer </input> <%     } %>
						</div>
						</td>
						<td>
						<div align="left">
						<%
               if(flagbuz.equals("Yes"))
               {
               %> <input type="checkbox" name="buz" value="BuzzerOnly"
							Checked disabled>Buzzer Only</input> <%      }
               else
               { %> <input type="checkbox" name="buz" value="BuzzerOnly"
							disabled>Buzzer Only</input> <%       } %>
						</div>
						</td>

						<td>
						<div align="left">
						<%     
         if(flagWithBattery.equals("Yes"))
         { %> <input type="checkbox" name="withBattery"
							value="WithBattery" Checked disabled>With Battery </input> <%      }
         else
         { %> <input type="checkbox" name="withBattery"
							value="WithBattery" disabled>With Battery </input> <%      } %>
						</div>
					</tr>
					<tr>

						<td>
						<div align="left">
						<%
               if(flag1temp.equals("Yes"))
               {
               %> <input type="checkbox" name="temp1" value="1Temp"
							Checked disabled>1 Temp </input> <%     }
               else
               { %> <input type="checkbox" name="temp1" value="1Temp"
							disabled>1 Temp </input> <%     } %>
						</div>
						</td>
						<td>
						<div align="left">
						<%
               if(flag2temp.equals("Yes"))
               {
               %> <input type="checkbox" name="temp2" value="2Temp"
							Checked disabled>2 Temp </input> <%     }
               else
               { %> <input type="checkbox" name="temp2" value="2Temp"
							disabled>2 Temp </input> <%     } %>
						</div>
						</td>
						<td>
						<div align="left">
						<%
               if(flagsmart.equals("Yes"))
               {
               %> <input type="checkbox" name="scard" value="SmartCard"
							Checked disabled>Smart Card </input> <%     }
               else
               {  %> <input type="checkbox" name="scard"
							value="SmartCard" disabled>Smart Card </input> <%     } %>
						</div>

						</td>
					</tr>
					<tr>

						<td>
						<div align="left">
						<%
            if(flag1door.equals("Yes"))
            {
            %> <input type="checkbox" name="door1" value="1Door" Checked
							disabled>1 Door </input> <%         }
            else
            { %> <input type="checkbox" name="door1" value="1Door"
							disabled>1 Door </input> <%         } %>
						</div>
						</td>
						<td>
						<div align="left">
						<%
            if(flag2door.equals("Yes"))
            {
            %> <input type="checkbox" name="door2" value="2Door" Checked
							disabled>2 Door </input> <%         }
            else
            { %> <input type="checkbox" name="door2" value="2Door"
							disabled>2 Door </input> <%         } %>
						</div>
						</td>
						<td>
						<div align="left">
						<%
            if(flaghorn.equals("Yes"))
            {
            %> <input type="checkbox" name="horn" value="Horn" Checked
							disabled>Horn </input> <%         }
            else
            { %> <input type="checkbox" name="horn" value="Horn"
							disabled>Horn </input> <%         } %>
						</div>
						</td>


					</tr>
					<tr>

						<td>
						<div align="left">
						<%
            if(flag1flow.equals("Yes"))
            {
            %> <input type="checkbox" name="flow1" value="1FlowSensor"
							Checked disabled>1 Flow Sensor </input> <%         }
            else
            { %> <input type="checkbox" name="flow1" value="1FlowSensor"
							disabled>1 Flow Sensor </input> <%         } %>
						</div>
						</td>
						<td>
						<div align="left">
						<%
         if(flag2flow.equals("Yes"))
         { %> <input type="checkbox" name="flow2" value="2FlowSensor"
							Checked disabled>2 Flow Sensor </input> <%       }
         else
         { %> <input type="checkbox" name="flow2" value="2FlowSensor"
							disabled>2 Flow Sensor </input> <%       } %>
						</div>
						</td>
						<td>
						<div align="left">
						<%     
         if(flagplain.equals("Yes"))
         { %> <input type="checkbox" name="plain" value="plain" Checked
							disabled>Plain </input> <%      }
         else
         { %> <input type="checkbox" name="plain" value="plain" disabled>Plain
						</input> <%      } %>
						</div>
						</td>
						<% }
   else
   {
            
                  if(flagvoice.equals("Yes"))
                  {
               %>
						<input type="checkbox" name="voice" value="Voice" Checked>Voice</input>
						<%  } 
                  else
                  { %>
						<input type="checkbox" name="voice" value="Voice">Voice</input>
						<%  } %>

						</div>
						</td>
						<td>
						<div align="left">
						<%
               if(flagjrm.equals("Yes"))
               {
               %> <input type="checkbox" name="jrm" value="JRM+Buzzer"
							Checked>JRM + Buzzer </input> <%   }
               else
               { %> <input type="checkbox" name="jrm" value="JRM+Buzzer">JRM + Buzzer </input> <%     } %>
						</div>
						</td>
						<td>
						<div align="left">
						<%
               if(flagbuz.equals("Yes"))
               {
               %> <input type="checkbox" name="buz" value="BuzzerOnly"
							Checked>Buzzer Only</input> <%      }
               else
               { %> <input type="checkbox" name="buz" value="BuzzerOnly">Buzzer
						Only</input> <%       } %>
						</div>
						</td>

						<td>
						<div align="left">
						<%
               if(flagWithBattery.equals("Yes"))
               {
               %> <input type="checkbox" name="withBattery"
							value="withBattery" Checked>With Battery</input> <%      }
               else
               { %> <input type="checkbox" name="withBattery"
							value="withBattery">With Battery</input> <%       } %>
						</div>
						</td>

					</tr>
					<tr>

						<td>
						<div align="left">
						<%
               if(flag1temp.equals("Yes"))
               {
               %> <input type="checkbox" name="temp1" value="1Temp"
							Checked>1 Temp </input> <%     }
               else
               { %> <input type="checkbox" name="temp1" value="1Temp">1
						Temp </input> <%     } %>
						</div>
						</td>
						<td>
						<div align="left">
						<%
               if(flag2temp.equals("Yes"))
               {
               %> <input type="checkbox" name="temp2" value="2Temp"
							Checked>2 Temp </input> <%     }
               else
               { %> <input type="checkbox" name="temp2" value="2Temp">2
						Temp </input> <%     } %>
						</div>
						</td>
						<td>
						<div align="left">
						<%
               if(flagsmart.equals("Yes"))
               {
               %> <input type="checkbox" name="scard" value="SmartCard"
							Checked>Smart Card </input> <%     }
               else
               {  %> <input type="checkbox" name="scard"
							value="SmartCard">Smart Card </input> <%     } %>
						</div>

						</td>
					</tr>
					<tr>

						<td>
						<div align="left">
						<%
            if(flag1door.equals("Yes"))
            {
            %> <input type="checkbox" name="door1" value="1Door" Checked>1
						Door </input> <%         }
            else
            { %> <input type="checkbox" name="door1" value="1Door">1
						Door </input> <%         } %>
						</div>
						</td>
						<td>
						<div align="left">
						<%
            if(flag2door.equals("Yes"))
            {
            %> <input type="checkbox" name="door2" value="2Door" Checked>2
						Door </input> <%         }
            else
            { %> <input type="checkbox" name="door2" value="2Door">2
						Door </input> <%         } %>
						</div>
						</td>
						<td>
						<div align="left">
						<%
            if(flaghorn.equals("Yes"))
            {
            %> <input type="checkbox" name="horn" value="Horn" Checked>Horn
						</input> <%         }
            else
            { %> <input type="checkbox" name="horn" value="Horn">Horn
						</input> <%         } %>
						</div>
						</td>


					</tr>
					<tr>

						<td>
						<div align="left">
						<%
            if(flag1flow.equals("Yes"))
            {
            %> <input type="checkbox" name="flow1" value="1FlowSensor"
							Checked>1 Flow Sensor </input> <%         }
            else
            { %> <input type="checkbox" name="flow1" value="1FlowSensor">1
						Flow Sensor </input> <%         } %>
						</div>
						</td>
						<td>
						<div align="left">
						<%
         if(flag2flow.equals("Yes"))
         { %> <input type="checkbox" name="flow2" value="2FlowSensor"
							Checked>2 Flow Sensor </input> <%       }
         else
         { %> <input type="checkbox" name="flow2" value="2FlowSensor">2
						Flow Sensor </input> <%       } %>
						</div>
						</td>
						<td>
						<div align="left">
						<%     
         if(flagplain.equals("Yes"))
         { %> <input type="checkbox" name="plain" value="plain" Checked>Plain
						</input> <%      }
         else
         { %> <input type="checkbox" name="plain" value="plain">Plain
						</input> <%      } %>
						</div>
						</td>
						<% } %>

					</tr>
				</table>

				</td>
			</tr>

			<% sql5="select * from t_dispatchaddress order by Location asc";
     rs5=stmt1.executeQuery(sql5);
   
  %>
			<tr>
				<td rowspan="2"><font color="maroon"> <B> Address </B></font></td>

				<%    if(status.equals("Partially Dispatched") || status.equals("Partially Sent"))
      { %>
				<td colspan="4">
				<div align="left"><select name="seladd" class="formElement"
					onChange="GetAdd(this)" ; disabled>
					<option value="Select">Select</option>
					<% while(rs5.next())
     { 
        disloc=rs5.getString("Location");
  %>
					<option value="<%=rs5.getString("Location") %>"
						<% if(dispadd.equals(disloc)) {  %> Selected <% } %>><%=rs5.getString("Location") %>
					<% } %>
					<option value="Other">Other</option>
				</select> <% }
   else
   { %>
				<td colspan="4">
				<div align="left"><select name="seladd" class="formElement"
					onChange="GetAdd(this)";>
					<option value="Select">Select</option>
					<% while(rs5.next())
     { 
        disloc=rs5.getString("Location");
  %>
					<option value="<%=rs5.getString("Location") %>"
						<% if(dispadd.equals(disloc)) {  %> Selected <% } %>><%=rs5.getString("Location") %>
					<% } %>
					<option value="Other">Other</option>
				</select> <% } %> <%
     sql9="select * from t_dispatchaddress where Location='"+disloc+"' ";
     rs9=stmt1.executeQuery(sql9);
     if(rs9.next())
     {
        fulloc=rs9.getString("Address");
     }
%> &nbsp; &nbsp;&nbsp;&nbsp; <input type="text" name="fulladd" size="60"
					size="60" class="formElement" readonly value="<%=fulloc %>" /> <!-- <textarea name="fulladd" rows="2" cols="20" class="formElement" disabled="true"> </textarea>  -->
				</div>
				</td>
			</tr>
			<tr>
				<td>
				<div align="center"><label for="placelabel"> Place </label> <input
					type="text" name="othadd" class="formElement"
					style="visibility: hidden" /></div>
				</td>

				<td>
				<div align="center"><label for="fuladdlabel"> Full
				Address </label> <textarea name="othdetadd" rows="2" cols="20"
					class="formElement" style="visibility: hidden"> </textarea></div>
				</td>
			</tr>
			<tr>
				<td><font color="maroon"> <B> Dispatch Date </B></font></td>
				<td colspan="4">
				<div align="left"><input type="text" id="calender"
					name="calender" size="13" class="formElement"
					value="<%=dispdate %>" readonly /> <!--<input type="image" src="images/FromDate.bmp" id="trigger"> -->
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" name="trigger"
					id="trigger" value="Disp. Date" class="formElement"> <script
					type="text/javascript">
             Calendar.setup(
             {
                 inputField  : "calender",         // ID of the input field
                 ifFormat    : "%Y-%m-%d",     // the date format
                 button      : "trigger"       // ID of the button
             }
                           );
             </script></div>
				</td>

			</tr>


			<tr>
				<td colspan="4">
				<div align="center"><input type="submit" name="submit"
					value="Update" class="formElement" /> <% if(status.equals("Open"))
   { %> <input type="submit" name="submit" value="Cancel"
					class="formElement" /> <% } %>
				</div>
				</td>
			</tr>
		</table>


		<% 
  } //close of else 
} catch(Exception e) { 
	System.out.println("Exception----->" +e);
	out.println("Exception----->" +e); }

finally
{
con1.close();
con2.close();

}
%> <br>
		<br>
		<table border="0" width="100%">
			<tr>
				<td bgcolor="white" class="copyright" width="100%">
				<center>Copyright &copy; 2008 by Transworld Compressor
				Technologies Ltd. All Rights Reserved.</center>
				</td>
			</tr>
		</table>