<html>
<head>
<script language="javascript">

function validate()
{ 
   v1=document.changepass.curpass.value;
   v2=document.changepass.newpass.value;
   v3=document.changepass.confpass.value;
   v4=document.changepass.curpasschk.value;
//	alert(v1+"--------------"+v4);
   if(v1.length==0)
   {
      alert("Please enter your current password");
      return false;
   }
   if(v1!=v4)
   {
      alert("Entered current Password doesn't match with our records ");
      return false;
   }
   
   if(v2.length==0)
   {
      alert("Please enter new password");
      return false;
   }

   if(v3.length==0)
   {
      alert("Please confirm your password");
      return false;
   }
 
   if(v2!=v3)
   {
      alert("Text in New password and confirm password doesn't match");
      return false;
   }
      return true;
}

</script>
</head>
<body>

<%!
Connection con1;

%>
<%@ include file="headeradmin.jsp" %>

<form name="changepass" method="get" action="editpass.jsp" onSubmit="return validate()">



<table border="0" width="30%">
  <tr>
      <td>
             <div align="left"> <a href="javascript:history.go(-1)"> <img src="images/arrow.bmp" width="20px" height="20px" border="0" > </img> </a> </div>
     </td> 
  </tr>
</table> 
<br>
<br>
<br>
<center>
<table border="0" width="30%">
  <tr>
      <td> <div align="center">  <font color="maroon" size="3"> <B> Change Password </B> </font> </div> </td>
  </tr>
</table>

<%
try {
Class.forName(MM_dbConn_DRIVER);
con1 = DriverManager.getConnection(MM_dbConn_STRING1,MM_dbConn_USERNAME,MM_dbConn_PASSWORD);

Statement stmt1=con1.createStatement();
ResultSet rs1=null;
String sql1="";
String user="";
String curpass="";

user=session.getValue("user").toString();
String urole=session.getValue("urole").toString();
sql1="select * from t_admin where UName='"+user+"' and URole='"+urole+"' ";
System.out.println(sql1);
rs1=stmt1.executeQuery(sql1);
while(rs1.next())
{
  curpass=rs1.getString("pass");
}
%>

<input type="hidden" name="curpasschk" value="<%=curpass %>" />
<table border="1" width="30%">
  <tr>
       <td> <font color="maroon"> <B> Current Password </B> </font> </td>
       <td> <input type="password" name="curpass" class="formElement" /> </td>
  </tr>
  <tr>
       <td> <font color="maroon"> <B> New Password </B> </font> </td>
       <td> <input type="password" name="newpass" class="formElement" /> </td>
  </tr>
  <tr>      
       <td> <font color="maroon"> <B> Confirm Password </B> </font> </td>
       <td> <input type="password" name="confpass" class="formElement" /> </td>
  </tr>
  <tr>
       <td colspan="2"> <div align="center"> <input type="submit" name="submit" value="Submit" class="formElement" /> </div> </td> 
  </tr>
</table>
</center>

<%
} catch(Exception e) { out.println("Exception----->" +e); }

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
</body>
</html>
