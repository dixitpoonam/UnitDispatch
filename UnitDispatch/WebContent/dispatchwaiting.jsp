<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="menuheader.jsp" %> 
<script src="sorttable.js"></script>
<html>
<head>
<script src="sorttable.js"></script>
<title>Vehicle Tracking System</title>

</head>
<body>
<script language="javascript">
 			function validate()
  			{
                           var v1=document.unit.data.value;
                           var validChar='0123456789';   // legal chars
                           var   strlen=v1.length;       // test string length
                          
                           if(strlen==0||strlen>20)
                               {
                                   alert("Invalid Unit ID length" );
                                   return false;
                               }
                               
                               v1=v1.toUpperCase(); // case insensitive
                                                             

                           for(var ic=0;ic<strlen;ic++) //now scan for illegal characters
                                {
                                    
                                    if(validChar.indexOf(v1.charAt(ic))<0)
                                        {		
                                            alert("please enter a valid Unit ID!");
                                            return false;
                                        }
                                } // end scanning
                           return true;       
                        }

            
 /* 				
function newwindow(webadd)
{ 
  window.open(webadd,'jav','width=450,height=185,resizable=yes');
} 		
 */
 
</script>

<table border="2" cellspacing="3" cellpadding="3" width="100%" >
    <%!
Connection conn=null,conn1=null;
Statement st=null, st1=null, st2=null,st3=null,st4=null,stmt5=null;
String sql=null, sql1=null, sql2=null,sql3=null,data1=null,data2=null;

%>
<%
try{
		Class.forName(MM_dbConn_DRIVER);
        conn = DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
        conn1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
        st3=conn.createStatement();
        stmt5 = conn1.createStatement();
        String user=session.getAttribute("typeval").toString();    
%>
        <tr>
          <td>
               <% String inserted=request.getParameter("inserted");
 				 if(inserted==null)
 				 {
  					}
 				 else
 				 { %>
       <table border="0" width="100%">
  <tr>
       <td> <div align="center"> <font color="maroon">  Successfully inserted  </font> </div> </td>
  </tr>
  
</table>

<%}%> 
	<!-- body part come here -->
         	<table width="100%" align="center" class="stats">
                   
                           
			<tr>
			<td  class="sorttable_nosort">
			<div id="report_heding"><font color="brown" size="3">Units Waiting For Dispatch </font></div>
			
			</td>
			</tr>
			</table>
                         
			
                        <br>
                        
			<% 
                        //commit id :- 614,order no:- 160213
							System.out.println("User Of The System--"+user);			  
                          sql3="select * from t_unitmaster where Status='Waiting For Dispatch' "; //and user='"+user+"' group by ChalanNo order by DispDate asc";
                          System.out.print(sql3);
                          ResultSet rst4=st3.executeQuery(sql3);
                        int n=1;
                        
              %>
                        <table width="100%" border="1" align="center" class="stats">
                        <tr><th class="hed" colspan="13">Units Waiting For Dispatch</th></tr>
			<tr>
						<td > Sr.</td>
						<td> Unit ID</td>
                        <td > Dispatch Date</td>
                        <td > Dispatch Address</td>
                        <td > Order No</td>
                        <td > Mode of Dispatch</td>
                        <td > Dispatch Name</td>
                        <td > Courier Date</td>
                        <td > Chalan No.</td>
                        <td > Dispatch Id</td>
                        <td > User</td>
                        <td > Entry By</td>
                        <td > Cick Here To Dispatch </td>
                        </tr>
                       	
                         
                          <% while(rst4.next())
                         {
                        %>	
						<tr>
                        <td class="bodyText"><div align="left"><%=n%></div></td>
						<td class="bodyText"><div align="left"><%=rst4.getString("UnitId")%></div></td>
                    
                                               
                         <%
                        try{
                            %>
                        <td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst4.getDate("DispDate"))%></div></td>
                     
                        <%
                        }catch(Exception e)
                        {
	                    out.print("-");
                        }
                                %>
                        
                   
                        <td class="bodyText"><div align="left"><%=rst4.getString("DisAdd")%></div></td>
                        <td class="bodyText"><div align="left"><%=rst4.getInt("OrderNo")%></div></td>
						<td class="bodyText"><div align="left"><%=rst4.getString("ModeofDispatch")%></div></td>
						<td class="bodyText"><div align="left"><%=rst4.getString("DisName")%></div></td>
                        
                         <%
                        try
                         {
                            %>
                        <td class="bodyText"><div align="left"><%=new SimpleDateFormat("dd-MMM-yyyy").format(rst4.getDate("CourierDate"))%></div></td>
                     
                        <%
                        }
                        catch(Exception e)
                        {
	                    	out.print("-");
                        }
                                %>
                        
						<td class="bodyText"><div align="left"><%=rst4.getString("ChalanNo")%></div></td>
						<td class="bodyText"><div align="left"><%=rst4.getInt("DispId")%></div></td>
                        <%
                        String UserName = "";
                         String sqlV_ID = "Select * from t_vendorMaster where V_ID = '"+rst4.getString("User")+"'";
                         ResultSet rsV_ID = stmt5.executeQuery(sqlV_ID);
                         if(rsV_ID.next())
                         {
                        	 UserName = rsV_ID.getString("V_Name");
                         }
                        
                        %>
                        <td class="bodyText"><div align="left"><%=UserName%></div></td>
                        <td class="bodyText"><div align="left"><%=rst4.getString("EntBy")%></div></td>
                        <td> <a href="disp.jsp?chalno=<%=rst4.getString("ChalanNo")%>&reqno=<%=rst4.getInt("OrderNo")%>"> Dispatch</a> </td> 
                        </tr>	
			<%
                          n++;
                          }
                                
			%>
                        
			</table>
                       
			

			
			</td>

    
   
    
    </tr>
    <% 
                          }
                          catch(Exception e)
                          {
	                     		out.print("Exception -->" +e);
                          }
                          finally
                          {
	                    		conn.close();
	                    
                          }
                         %>	
    
    </table>
       
    </body>
</html>

