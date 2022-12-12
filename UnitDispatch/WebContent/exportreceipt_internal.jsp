<%@ page contentType="application/vnd.ms-excel;charset=gb2312" %>
<% response.setContentType("application/vnd.ms-excel");
	response.addHeader("Content-Disposition","attachment;filename=\"printreceipt_internal.xls\"");%>

<%@ include file="Connections/conn.jsp" %>


<%!
Connection con1, con2;
%>

<% 
try {
	Class.forName(MM_dbConn_DRIVER);
	con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
	con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);


	Statement stmt1 = con1.createStatement(), stmt2 = con2.createStatement(), stmt3 = con1.createStatement(), stmt4 = con1.createStatement();
	ResultSet rs1=null, rs2=null, rs3=null, rs4=null, rs5=null;
	String sql1="", sql2="", sql3="", sql4="", sql5="";

	int ordrno=0, dispid1=0;
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

	
	<table border="0" width="100%">
   <tr> 
        <td> <div align="center"> <font color="maroon" size="2"> <b> Print Receipts Internal (Dispatch Date between <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(sevdaybfre))%> to <%=new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(tdydte))%>) </b> </font> </div> </td>
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
	          

	         
	    </tr>

	  
	<%
	    if(ustyp.equals("administrator"))
	   { 
	      sql1="select distinct(OrderNo),OrderNo, DispDate from t_unitmasterhistory  where DispId <> '0' and Status='Sent' and testedunit='Yes' and DispDate between '"+sevdaybfre+"' and '"+tdydte+"' order by DispDate desc";
	      System.out.println(sql1);
	   }
	   else
	   {
	      sql1="select distinct(OrderNo),OrderNo DispDate from t_unitmasterhistory  where User='"+user+"' and Status='Sent' and testedunit='Yes' and DispId <> '0' and DispDate between '"+sevdaybfre+"' and '"+tdydte+"' order by DispDate desc";
	      System.out.println(sql1);
	   }
	int orderno=0;
	rs1=stmt1.executeQuery(sql1);
	while(rs1.next())
	{
	   orderno=rs1.getInt("OrderNo");
	   String ordrdte="", add="", status="", dispdte="", dispid="",totdispid="",totunitid="",ordqty="", dispdte1="", mode="", modename="", chalanno="",dispby="", ordby="",isnttype="" ; 
	/* *********************Getting details from DB order by Disp Id ********************** */
	 
	  if(ustyp.equals("administrator"))
	   { 
	  sql4="select * from t_unitmasterhistory where OrderNo='"+orderno+"' and DispId <> '0' and Status='Sent' and testedunit='Yes' and DispDate between '"+sevdaybfre+"' and '"+tdydte+"' order by DispDate desc";
	  //sql3="select * from t_unitmasterhistory where OrderNo='"+dispid+"' " ;
	   }
	   else
	   {	
	  sql4="select * from t_unitmasterhistory where OrderNo='"+orderno+"' and DispId <> '0' and Status='Sent' and testedunit='Yes' and DispDate between '"+sevdaybfre+"' and '"+tdydte+"' order by DispDate desc";
	  //sql3="select * from t_unitmasterhistory where DispId='"+dispid+"' and User='"+user+"' ";
	   } 
	  int dispqty=0;
	  String nwfrmtdte1="", unitid="",nwfrmtdte3="";
	  System.out.println(sql4);
	  rs4=stmt4.executeQuery(sql4);
	  while(rs4.next())
	  {
	    
	    
	   
	     ordrno=rs4.getInt("OrderNo");
	      isnttype=rs4.getString("InstType");
	      dispdte=rs4.getString("DispDate");
	      add=rs4.getString("DisAdd"); 

		  dispid=rs4.getString("DispId");
		  if(totdispid.contains(dispid))
		  {
			  
		  }
		  else
		  {
		  if(totdispid=="")
		  {
			  totdispid=dispid;
		  }
		  else
		  {
			  totdispid=totdispid+","+dispid; 
		  }
		  }
		
		unitid=rs4.getString("UnitId");
		if(totunitid.contains(unitid))
		{
			
		}
		else
		{
		if(totunitid=="")
		{
			totunitid=unitid;
			dispqty=1;
		}
		else
		{
			totunitid=totunitid+","+unitid;
			dispqty++;
		}
		}
	     	//dispdte1=rs4.getString("DispDate"); 
	        mode=rs4.getString("ModeofDispatch");  
	        modename=rs4.getString("DisName"); 
	        chalanno=rs4.getString("ChalanNo");  
	      //  dispid1=rs4.getInt("DispId");  
	        dispby=rs4.getString("User");  

	        java.util.Date datefrmdb1=new SimpleDateFormat("yyyy-MM-dd").parse(dispdte);
	        Format formatter1=new SimpleDateFormat("dd-MMM-yyyy");
	        nwfrmtdte1=formatter1.format(datefrmdb1); 

	    
	     


	   /*sql3="select * from t_unitmasterhistory where DispId='"+dispid+"'";
	     out.print(sql3);
	     rs3=stmt3.executeQuery(sql3);
	     while(rs3.next())
	     {
	    
	        dispqty++;
	        unitid=unitid+rs3.getString("UnitId")+",";
	        
	     }*/
	   
	     java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dispdte);
	     Format formatter=new SimpleDateFormat("dd-MMM-yyyy");
	     String nwfrmtdte=formatter.format(datefrmdb);


	}//end of while 
	  
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
	 nwfrmtdte3=formatter3.format(datefrmdb3); 
	%>
	<tr> <td> <%=orderno %> </td> 
			<td><%=isnttype %></td>
	     <td> <%=ordqty %> </td> 
	     
	     <td sorttable_customkey="dd-MMM-yyyy"> <%=nwfrmtdte3 %> </td> 
	     <td> <%=dispqty %> </td>
	     <td sorttable_customkey="dd-MMM-yyyy"> <%=nwfrmtdte1 %> </td> 

	      <td> <%=totunitid %> </td>
	
	    <td> <%=status %> </td>
	     <td> <%=add %> </td>
	<%
		if(cust==null || cust.equals("-"))	
		{
			cust="-";
		%>
			<td><%=cust %> </td>
	<%	}	
		else
		{ %>
	     <td> <%=cust %> </td>
	<% 	} %>

	

	    <td> <%=totdispid %></td> 
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

		
	   

	</tr>
	<%
		}
	%>
	</table>
	 
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
