<%@ include file="Connections/conn.jsp" %> 

<%! Connection con1,con2;%>
<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2=  DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
Statement st=con2.createStatement(), stmt1=con1.createStatement(), stmt2=con2.createStatement();

String sql1="",sql2="",sql3="",chalan="",date="";

String user=session.getValue("typeval").toString();
out.print("user"+user);
String entby=session.getValue("user").toString();
out.print("entby"+entby);

java.util.Date d=new java.util.Date();
String dte= "" + (d.getYear()+1900) + "-" + (1+d.getMonth()) + "-" + d.getDate();
String time=new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());

   java.util.Date datefrmdb=new SimpleDateFormat("yyyy-MM-dd").parse(dte);
   Format formatter=new SimpleDateFormat("yyyy-MM-dd");
   String nwfrmtdte=formatter.format(datefrmdb);
   
   
String calender=request.getParameter("calender");
//out.print("calender"+calender);
String cur=request.getParameter("cur"); 
//out.print("cur"+cur);
String chalno=request.getParameter("chalno");
out.print("chalnol"+chalno);
 String reqno=request.getParameter("reqno");
 
 
 String Status="";
out.print("reqno"+reqno);
String comm=request.getParameter("comm");
out.print("comm"+comm);

//------------- get the Ordertype---------------------------------------
String ordertype="";
String que="select Ordertype from t_unitorder where Reqno='"+reqno+"'";
ResultSet rsget=st.executeQuery(que);
if(rsget.next())
{
	ordertype=rsget.getString("Ordertype");
}

if(ordertype.equals("Internal"))
{	
	Status="Sent";
}
else if(ordertype.equals("External"))
{
	Status="Dispatched";
}
else if(ordertype.equals("-"))
{
	Status="Dispatched";
}
//---------------------------------------------------------------------
 sql1="update t_unitmaster set DispDate='"+nwfrmtdte+"', ModeofDispatch='Courier', DisName='"+cur+"', CourierDate='"+nwfrmtdte+"', ChalanNo='"+chalno+"',Status='"+Status+"',DispTime='"+time+"',CommentForDispatch='"+comm+"' where ChalanNo='"+chalno+"' and OrderNo='"+reqno+"'";
        out.println(sql1);
   stmt1.executeUpdate(sql1);
   
   String abc=sql1.replace("'", "#");
   abc=abc.replace(",", "$");
   String str2="insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abc+"')";	
   stmt1.executeUpdate(str2);
   
   
 sql2="update t_unitmasterhistory set DispDate='"+nwfrmtdte+"', ModeofDispatch='Courier', DisName='"+cur+"', CourierDate='"+nwfrmtdte+"',Status='"+Status+"',ChalanNo='"+chalno+"',DispTime='"+time+"',CommentForDispatch='"+comm+"' where ChalanNo='"+chalno+"' and OrderNo='"+reqno+"' ";  
      out.println(sql2);
 stmt1.executeUpdate(sql2);
 
 String abc1=sql2.replace("'", "#");
 abc1=abc1.replace(",", "$");
 String str3="insert into db_gps.t_sqlquery(dbname,query)values('db_gps','"+abc1+"')";	
 stmt1.executeUpdate(str3);
 
 
 sql3="update t_unitorder set DisName='"+cur+"' where Reqno='"+reqno+"' ";
       out.println(sql2);
       stmt2.executeUpdate(sql3);
       
       String abc2=sql3.replace("'", "#");
       abc2=abc2.replace(",", "$");
       String str4="insert into db_gps.t_sqlquery(dbname,query)values('db_CustomerComplaints','"+abc2+"')";	
       stmt2.executeUpdate(str4);
       
       
response.sendRedirect("dispatchwaiting.jsp?inserted=yes");
 %>
 
 
 
 <%
} catch(Exception e) { out.println("Exception----->" +e); }

finally
{
con1.close();

}
%>
