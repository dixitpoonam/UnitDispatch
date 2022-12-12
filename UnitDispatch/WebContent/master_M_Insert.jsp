<%@ page import="java.sql.*" import=" java.text.*" import=" java.util.*"
	errorPage="" import=" java.sql.Timestamp"%>
<%@ include file="headeradmin.jsp"%>
<%!Connection conn1;
	Statement st, st1;
	String QUERY1, QUERY2, QUERY3,QUERY4;
	int MAX_RNO;%>

<html>
<head>
<title>Master Page _Code Version</title>
</head>

<body>
<%
	try {
		System.out.println(",.,.,..11111111");
		
		Class.forName(MM_dbConn_DRIVER);
		
		conn1 = DriverManager.getConnection(MM_dbConn_STRING1,
				MM_dbConn_USERNAME, MM_dbConn_PASSWORD);
		st = conn1.createStatement();
		st1 = conn1.createStatement();
		
		String CODE_VER = request.getParameter("CODE_VER");
		String CODE_VER1=CODE_VER.trim();
		String selectval = request.getParameter("unitype");
		//String module = request.getParameter("module");
		//String software = request.getParameter("software");
		//String omf = request.getParameter("omf");
		//String peripheral = request.getParameter("peripheral");
		String USER_NAME = "",x="xyz",yes="";

		 String user=session.getAttribute("user").toString();
		 System.out.println("CODE_VER>>>>"+CODE_VER);
		 System.out.println("CODE_VER1>>>"+CODE_VER1);
		
		
		
		if(((CODE_VER.equals(" ") && CODE_VER.contains("")) || CODE_VER=="") ||  CODE_VER.contains("null") || CODE_VER==null || CODE_VER.equalsIgnoreCase("null")){
			
			System.out.println("inside if of alert..>>>>");
			response.sendRedirect("master.jsp?p= "+CODE_VER1+"&j="+x);	
		
			%>	
         	
		<% }
		
		System.out.println(",.,.,.22222222...");
		java.util.Date dte = new java.util.Date();
		Format formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss  ");
		String today = formatter.format(dte);
		System.out.println(">>>>CODE_VER1>>"+CODE_VER1);
		System.out.println("CODE_VER>>"+CODE_VER);
		//System.out.println(selectval);
		//System.out.println(module);
		//System.out.println(omf);
		//System.out.println(peripheral);
		System.out.println(selectval);
		
		if(selectval.equals("omnfcrtn") || selectval=="omnfcrtn" || selectval.equalsIgnoreCase("omnfcrtn") )
		{
			
			
			System.out.println("<<><>inside omf....omf");
			
			
			 QUERY1 = " SELECT MAX( RefNo ) AS Rno	FROM db_CustomerComplaints.hw_comment ";
				ResultSet rst = st.executeQuery(QUERY1);
				
				System.out.println(">>>>>> 66666666 ....");
				System.out.println(QUERY1);
				if (rst.next()) {
					MAX_RNO = rst.getInt("Rno") + 1;
				}
			
			
			
			
			
			

			QUERY3 = "select * from db_CustomerComplaints.hw_comment where Comment = '"
				+ CODE_VER1 + "'";
		ResultSet rst1 = st1.executeQuery(QUERY3);
		System.out.println(QUERY3);
		if (rst1.next()) {
			System.out.println("<<><>inside if....rst");
			
			yes="ak";
			
			response.sendRedirect("master.jsp?inserted="+yes);	
			%>
			
			
			
			
	<% 	}
	else {
			QUERY2 = "INSERT INTO db_CustomerComplaints.hw_comment (RefNo,CommentName,Comment,EntBy) VALUES(  " +
		
					" '"+MAX_RNO+"', '-' ,'"+ CODE_VER1+"' , '" + user + "')";
		System.out.println("****" + QUERY2);
		st1.executeUpdate(QUERY2);
		
		

		QUERY4 = "INSERT INTO db_CustomerComplaints.hw_commenthistory (RefNo,Comment,EntBy) VALUES(  " +
	
				" '"+MAX_RNO+"', '"+ CODE_VER1+"' , '" + user + "')";
	System.out.println("****" + QUERY4);
	st1.executeUpdate(QUERY4);
		
	yes="aks";
	response.sendRedirect("master.jsp?inserted1="+yes);	
	
	}
				
		}
        
	
		System.out.println(",.,.,..333333333...");
		
		
		 if(selectval.equals("perphl") || selectval=="perphl" || selectval.equalsIgnoreCase("perphl") ){
			
			
			
			System.out.println("<<><>inside perphl....perphl");
			
			
			QUERY3 = "select * from db_gps.t_peripherals   where peripherals = '"
				+ CODE_VER1 + "'";
		ResultSet rst1 = st1.executeQuery(QUERY3);
		System.out.println(QUERY3);
		if (rst1.next()) {
			System.out.println("<<><>inside if....rst");
			yes="ak";
			response.sendRedirect("master.jsp?inserted="+yes);	
			%>
			
			
	<% 	}
	else {   int i=1;
			QUERY2 = "INSERT INTO db_gps.t_peripherals (Peripherals,EntBy) VALUES("+
			"'"+ CODE_VER1+"' , '" + user + "')";
		System.out.println("****" + QUERY2);
		st1.executeUpdate(QUERY2);
		
		
		QUERY4 = "INSERT INTO db_gps.t_peripheralshistory (Peripherals,EntBy) VALUES("+
		"'"+ CODE_VER1+"' , '" + user + "')";
System.out.println("****" + QUERY4);
st1.executeUpdate(QUERY4);
yes="aks";
response.sendRedirect("master.jsp?inserted1="+yes);		
		
		
	}
		
		}
		
		 System.out.println(",.,.,..444444444......");
		
		 if(selectval.equals("sftvrsn")||selectval== "sftvrsn" || selectval.equalsIgnoreCase("sftvrsn") ||   selectval.contains("sftvrsn"))
		{
			
			
			System.out.println("software..<><><>");
			
			 QUERY1 = " SELECT MAX( Rno ) AS Rno	FROM db_CustomerComplaints.t_utcodever ";
				ResultSet rst = st.executeQuery(QUERY1);
				
				System.out.println(">>>>>> 66666666 ....");
				System.out.println(QUERY1);
				if (rst.next()) {
					MAX_RNO = rst.getInt("Rno") + 1;
				}
			
			
				QUERY3 = "SELECT codever FROM db_CustomerComplaints.t_utcodever where codever = '"
					+ CODE_VER1 + "'";
			ResultSet rst1 = st1.executeQuery(QUERY3);
			System.out.println(QUERY3);
			if (rst1.next()) {
				System.out.println("<<><>inside if....rst");
				yes="ak";
				response.sendRedirect("master.jsp?inserted="+yes);	
				%>
							
		<% 	}
		else {
				QUERY2 = "INSERT INTO db_CustomerComplaints.t_utcodever (Rno,codever,valid,peripheral,EntBy) VALUES("+
					" '"+MAX_RNO+"' ," +
					" '" +CODE_VER1+"' ," +
					" 'yes' , "+
					" '-' , "+
				" '" +user+ "')";
			System.out.println("****" + QUERY2);
			st1.executeUpdate(QUERY2);
			
			
			
			QUERY4 = "INSERT INTO db_CustomerComplaints.t_utcodeverhistry (codever,EntBy) VALUES("+
				" '" +CODE_VER1+"' ," +
				" '" +user+ "')";
		System.out.println("****" + QUERY4);
		st1.executeUpdate(QUERY4);
			
			
			
		yes="aks";
		response.sendRedirect("master.jsp?inserted1="+yes);	
			
		}
				
					
		}
			 
		 System.out.println(",.,.,..5555555555555......");
		
		
		 if(selectval==null)
		{
			
		}else
		{
			
		  if(selectval == "untyp"
			|| selectval.equalsIgnoreCase("untyp")){
			 
			System.out.println(">>>>>> 5555555 ....");
							
						QUERY1 = " SELECT MAX( id ) AS Rno	FROM db_gps.t_typeofunits ";
			ResultSet rst = st.executeQuery(QUERY1);
			
			System.out.println(">>>>>> 66666666 ....");
			System.out.println(QUERY1);
			if (rst.next()) {
				MAX_RNO = rst.getInt("Rno") + 1;
			}

			QUERY3 = "SELECT UnitType FROM db_gps.t_typeofunits where UnitType = '"
					+ CODE_VER1 + "'";
			ResultSet rst1 = st1.executeQuery(QUERY3);
			System.out.println(QUERY3);
			if (rst1.next()) {
				System.out.println("<<><>inside if....rst");
				yes="ak";
				
				response.sendRedirect("master.jsp?inserted="+yes);	
				
											
		 	}
		else {
				QUERY2 = "INSERT INTO db_gps.t_typeofunits (id,UnitType,EntBy) VALUES("+
					" '"+MAX_RNO+"' ,"+
					" '" +CODE_VER1+"' ," +
					" '" +user+ "')";
			System.out.println("****" + QUERY2);
			st1.executeUpdate(QUERY2);
			
			QUERY4 = "INSERT INTO db_gps.t_typeofunitshistory (id,UnitType,UpdatedBy) VALUES("+
			" '"+MAX_RNO+"' ,"+	
			" '" +CODE_VER1+"' ," +
			" '" +user+ "')";
	System.out.println("****" + QUERY4);
	st1.executeUpdate(QUERY4);
		
			
	yes="aks";
	response.sendRedirect("master.jsp?inserted1="+yes);	
			
		}
			 
		  }
		
			}
		
		 System.out.println(",.,.,..6666666666666.........");
		
		if (selectval == "modltyp"
				|| selectval.equalsIgnoreCase("modltyp")) {
			
			System.out.println("inside......modltyp..<><><>");
			
			
			
			QUERY3 = "select * from db_CustomerComplaints.t_utmodule   where module = '"
				+ CODE_VER1 + "'";
		ResultSet rst1 = st1.executeQuery(QUERY3);
		System.out.println(QUERY3);
		if (rst1.next()) {
			System.out.println("<<><>inside if....rst");
			yes="ak";
			response.sendRedirect("master.jsp?inserted="+yes);	
			%>
			
			
			
			
	<% 	}
	else {
			QUERY2 = "INSERT INTO db_CustomerComplaints.t_utmodule (module,EntBy) VALUES("+
				"'"+ CODE_VER1+"' , '" + user + "')";
		System.out.println("****" + QUERY2);
		st1.executeUpdate(QUERY2);
		
		
		
		QUERY4 = "INSERT INTO db_CustomerComplaints.t_utmoduleHistory (module,EntBy) VALUES("+
		"'"+ CODE_VER1+"' , '" + user + "')";
System.out.println("****" + QUERY4);
st1.executeUpdate(QUERY4);
yes="aks";
response.sendRedirect("master.jsp?inserted1="+yes);	
		
	}
			
			
					
		}
		System.out.println(",.,.,.777777777777..........");
		
		//response.sendRedirect("master.jsp?p= "+CODE_VER+"&j="+x+"&inserted=+yes");		
		
		System.out.println(",.,.,..8888888888............");
	
		
	//	response.sendRedirect("master.jsp");	

	
}catch (NullPointerException e)
	
	{
		   System.out.println("bar.couldReturnNull() returned null");
		} catch (IllegalStateException ise)
        {
            //Thrown if the current thread is not associated with a transaction.
            System.out.println("Illegal State Exception setting rollback only! " + ise.getMessage());
        } 
		finally {
	}
%>
</body>
</html>