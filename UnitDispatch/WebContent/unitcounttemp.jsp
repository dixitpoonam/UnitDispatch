<%@ include file="menuheader.jsp" %>

<form name="mainpageform" action="" onsubmit="return validate();">


<%!
Connection con1, con2;
%>

<% 
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
con2 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD); 

Statement stmt1 = con1.createStatement(), stmt2 = con1.createStatement(), stmt3 = con1.createStatement(), stmt4 = con1.createStatement(),  stmt8 = con2.createStatement(), stmt9 = con2.createStatement();
ResultSet rs1=null, rs2=null, rs3=null, rs4=null, rs5=null, rs6=null;
String sql1="", sql2="", sql3="", sql4="", sql5="", sql6="", sql7="", sql8=""; 
String unitid=""; 
int i=0;

sql1="select * from t_unitmaster order by UnitId asc";
rs1=stmt1.executeQuery(sql1);
while(rs1.next())
{
     	
    unitid=rs1.getString("UnitId");
    String unitidwithcust="", cust="";

    sql2="select * from t_vehicledetails where UnitId='"+unitid+"' and Status <> 'Deleted' ";

    rs2=stmt2.executeQuery(sql2);
    while(rs2.next())
    {
        unitidwithcust=rs2.getString("UnitId");
        cust=rs2.getString("Ownername");
     

    sql3="update t_unitmaster set HoldBy='"+cust+"' where UnitId='"+unitidwithcust+"' ";
    i=stmt3.executeUpdate(sql3);
    
    String abc=sql3.replace("'", "#");
    abc=abc.replace(",", "$");
    String str2="insert into t_sqlquery(dbname,query)values('db_gps','"+abc+"')";	
    stmt3.executeUpdate(str2);
    
    }
}


String restunitid="";
sql4="select * from t_unitmaster where HoldBy='-' ";
rs4=stmt1.executeQuery(sql4);
while(rs4.next())
{
    restunitid=rs4.getString("UnitId");
    
    String date1="", recby="", date2="", dispto="", rescdispdec="";

    sql5="select * from t_unitreceived where UnitId='"+restunitid+"' ";
    rs5=stmt8.executeQuery(sql5);
    while(rs5.next())
    {
        date1=rs5.getString("Rdate");
        recby=rs5.getString("Name");
    }

    sql6="select * from t_unitdispatch where Unitid='"+restunitid+"' ";
    rs6=stmt9.executeQuery(sql6);
    while(rs6.next())
    {
       date2=rs6.getString("Ddate");
       dispto=rs6.getString("DName");
    }

    int days=0;
    sql3="select (TO_DAYS('"+date1+"')-TO_DAYS('"+date2+"'))";
    rs3=stmt3.executeQuery(sql3);
    if(rs3.next())
    {
        days=rs3.getInt(1);    
    }
  
    
    if(days>0)
    {
       rescdispdec="transworld";
    }
    else if(days<0)
    {
       rescdispdec=dispto;
    } 

    sql7="update t_unitmaster set HoldBy='"+rescdispdec+"' where UnitId='"+restunitid+"' ";
    i=stmt2.executeUpdate(sql7);
    
    String abc=sql7.replace("'", "#");
    abc=abc.replace(",", "$");
    String str2="insert into t_sqlquery(dbname,query)values('db_gps','"+abc+"')";	
    stmt2.executeUpdate(str2);
}

   sql8="update t_unitmaster set HoldBy='-' where HoldBy='' ";
   stmt1.executeUpdate(sql8); 

   String abc=sql8.replace("'", "#");
   abc=abc.replace(",", "$");
   String str2="insert into t_sqlquery(dbname,query)values('db_gps','"+abc+"')";	
   stmt1.executeUpdate(str2);
   
   
out.print("hi");

String restunitid1="";
sql4="select * from t_unitmaster where HoldBy='-' ";
rs4=stmt1.executeQuery(sql4);
while(rs4.next())
{
    String unitid2="", holdby="";
    restunitid1=rs4.getString("UnitId");

    sql5="select * from t_unitreceived where UnitId not in (select UnitId from t_unitdispatch) "; 
    rs5=stmt8.executeQuery(sql5);
    while(rs5.next())
    {
        unitid2=rs5.getString("UnitId");
        //holdby=rs5.getString("Name");

        sql6="update t_unitmaster set HoldBy='transworld' where UnitId='"+unitid2+"' ";
	stmt2.executeUpdate(sql6);
	
	   String abc1=sql6.replace("'", "#");
	   abc1=abc1.replace(",", "$");
	   String str3="insert into t_sqlquery(dbname,query)values('db_gps','"+abc1+"')";	
	   stmt2.executeUpdate(str3);
    }
}    


 sql5="select * from t_unitreceived where UnitId not in (select UnitId from t_unitdispatch) "; 
    rs5=stmt8.executeQuery(sql5);
    while(rs5.next())
    {
        String unitid2="", holdby="";
        unitid2=rs5.getString("UnitId");
        //holdby=rs5.getString("Name");

        sql6="update t_unitmaster set HoldBy='transworld' where UnitId='"+unitid2+"' and HoldBy='-' ";
	stmt2.executeUpdate(sql6);
	
	
	 String abc1=sql6.replace("'", "#");
	   abc1=abc1.replace(",", "$");
	   String str3="insert into t_sqlquery(dbname,query)values('db_gps','"+abc1+"')";	
	   stmt2.executeUpdate(str3);
    } 
out.print("Done");

    
    
 con1.close();
 con2.close();
  
} catch(Exception e) { out.println("Exception----->"+e); }

finally
{

}
%>
