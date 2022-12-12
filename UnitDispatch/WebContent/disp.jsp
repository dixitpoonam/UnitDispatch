<%@ include file="menuheader.jsp" %>

<html>
    <title>
        Dispatch details </title>
        <link href="css/css.css" rel="StyleSheet" type="text/css">
        <script src="elabel.js" type="text/javascript"></script>
        
        <style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
        <script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
        <script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
        <script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
   
    <body>
        <script language="javascript">
            function validate()
            {
                //alert("hi");
                var val=document.disatchdet.cur.value;
               var val1=document.disatchdet.data.value;
               val = val.replace(/^\s+|\s+$/g,"");//trim
               val1 = val1.replace(/^\s+|\s+$/g,"");//trim 
                if(val.length==0) 
                { 
                    alert(" Please Enter Courier or Docket no.");
                    return false; 
                }//if 
                
                if(val1.length==0)
                    {
                        alert("Please enter date cannot be left empty");
                        return false;
                    }
              return datevalidate();  
            }


     function datevalidate()
		 {
		 	var date1=document.getElementById("data").value;
			
			var dm1,dd1,dy1;
			dy1=date1.substring(0,4);
			
			dm1=date1.substring(5,7);
			
			dd1=date1.substring(8,10);
			
			var date=new Date();
			var month=date.getMonth()+1;
			var day=date.getDate();
			var year=date.getFullYear();
			if(dy1>year)
			{
				alert("selected date's year should not be greater than todays date");
				document.getElementById("data").value="";
				document.getElementById("data").focus;
				return false;
			}
			else if(year==dy1 )
			{
	  			if(dm1>month )
				{
					alert("selected date' month should not be greater than todays date");
					document.getElementById("data").value="";
					document.getElementById("data").focus;
					return false;
				}
			}
			if(dm1==month)
			{
				if(dd1>day)
				{
					alert("selected date's day should not be greater than todays date");
					document.getElementById("data").value="";
					document.getElementById("data").focus;
					return false;
				}
			}
			
			return true;
		}
    
          function closewin()
          {
              this.close();
          }
</script>
       
    <form name="disatchdet" method="post" action="updatedispatch.jsp" onSubmit="return validate();">
        <%!
        Connection con;
        
        %>
        <%try{
        Class.forName(MM_dbConn_DRIVER);
        con=DriverManager.getConnection(MM_dbConn_STRING,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);
          
        Statement stmt1=con.createStatement();
          ResultSet rs=null;
          String sql="";
         String dte=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
          String chalno=request.getParameter("chalno");
          String reqno=request.getParameter("reqno");
        %>
 

      
 <table border="1" cellpadding="1" cellspacing="2" align="center" width="100%">
     
             <tr>
                            <td><td><input type="hidden" name="chalno" id="chanlno" value=<%=chalno%>></td></td>
                            <td><td><input type="hidden" name="reqno" id="reqno" value=<%=reqno%>></td></td>
             </tr>
            <tr>
                <td>
                    <table border="1" cellpadding="3" cellspacing="3" align="center">
                        <tr>
                            
                            <th><label>Courier No/Docket No.</label></th>
                            <td><input type="text" id="cur" name="cur"></td>
                        </tr>
                        <tr align="center">
                            <th><label>Date</label></th>
                            <td align="center">
                            <input type="text" id="data" name="data" size="13" class="formElement" value="<%=dte%>" readonly style="visibility:visible"/>
                             <input type="button" name="trigger" id="trigger" value="Date" class="formElement"  style="visibility:visible">
                            <script type="text/javascript">
                             Calendar.setup(
                                {
                                     inputField  : "data",         // ID of the input field
                                    ifFormat    : "%Y-%m-%d",     // the date format
                                    button      : "trigger"       // ID of the button
                                }
                                            );
                            </script>
                        </td>
                        
                        </tr>
                        <tr>
                            <th><label>Comment</label></th>
                            <td align="center">
                                <textarea id="comm" name="comm"> </textarea>
                            </td>
                        </tr>
                           
                        <tr>
                            <td colspan="3" align="center"><input type="submit" value="Submit" onclick=""></td>
                        </tr>
                    </table>
                    <br>
                    <br>
                    <table border="1" width="100%" >
                        <tr ><td bgcolor="white" class="copyright" width="100%">
                             <center>Copyright &copy; 2008 by Transworld Compressor Technologies Ltd. All Rights Reserved.</center>
                        </td></tr>
                    </table>
                </td>
            </tr>
        </table>
        <%
        }
        catch(Exception e)
                {  out.println("Exception----->" +e); }
        finally
        {
            con.close();
            
        }
        %>
    </form>
    </body>
</html>