<!-- 
  Module Name : Log in Page
  Creator : Azhar G B
  Date of Creation : 20/07/08
  Modifier :
  Date of Modification :
  Reason of Modification :
  Description : -->

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" import="java.util.*" import=" java.text.*" import="javax.swing.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
<head>
<title>Unit Dispatch </title>
<script language="javascript">

//JS function to check that all the fields are filled before request goes to next page

function validate()
{
   var v1,v2;
   v1=document.loginform.uname.value;
   v2=document.loginform.adpass.value;

   if(v1.length=="")
     {
       alert("Please enter User Name");
       return false;
     }

    
     if(v2.length=="")
     {
       alert("Please enter Password");
       return false;
     }

      return true;
}

</script>


<!-- Here I havent include headeradmin.jsp because in that header session is being set, which is not possible in this page before submit. So i have pasted some code of that header that doesnt include session -->

<link href="css/css.css" rel="StyleSheet" type="text/css">
<script src="elabel.js" type="text/javascript"></script>


<style type="text/css">@import url(jscalendar-1.0/calendar-win2k-1.css);</style>
<script type="text/javascript" src="jscalendar-1.0/calendar.js"></script>
<script type="text/javascript" src="jscalendar-1.0/lang/calendar-en.js"></script>
<script type="text/javascript" src="jscalendar-1.0/calendar-setup.js"></script>
</head>
<body bgcolor="white">

<P></P>
<table border="1" width="100%" align="center" bgcolor="#FFFAFA" class="solid">
<tr ><td valign="top"><table border="0" width="100%" bgcolor="#F8F8FF"><tr><td valign="top" rowspan="2" width="12%">
<a href="images/logo.jpg"><img src="images/logo.jpg" width="100px" height="100px" border="0"/></a></td><td colspan="2"><img src="images/ind11.jpg"><img src="images/foodlandveh.png" border="0" width="200px"><img src="images/Img6.gif" width="15%">
<%@ include file="imgrotate.html" %>

</td> 
</tr>
</table>

</td> 
</tr>
</table>

<!-- header end here-->


<p>
<form name="loginform" action="usrvalidtn1.jsp" onsubmit="return validate();">

<% 
String chkvalidity=request.getParameter("chkvalidity");
if(chkvalidity==null)
{
}
else
{ %>
  <table border="0" width="100%">
   <tr>
      <td> <div align="center"> <font color="maroon"> <b> You are not Authorized User. Please Contact your Manager! </b> </font> </div> 
      </td>
   </tr>
  <table> 
<% }
%>
<table style="width:300px; height:300px;" align="center">
<tr> <td> 
<table class="stats1">
  <tr> <td> <b>User Name </b></td>
       <td> 
            <input type="text" name="uname" size="10" class="formElement" />
       </td>
  </tr>

   <tr> <td><b> Password </b> </td>
       <td> <input type="password" name="adpass" size="10" class="formElement" > </input> </td>
  </tr>

   <tr>
       <td colspan="2" > <input type="submit" name="submit" value="Submit" class="formElement"> </td> </td>
  </tr>

</table>
</td>
</tr>
</table>



<table border="1" width="100%" >
<tr ><td bgcolor="white" class="copyright" width="100%">
<center>Copyright &copy; 2008 by Transworld 
                          Compressor Technologies Ltd. All Rights Reserved.</center>
</td></tr>
</table>


<P></P>

</form>
</body>
</html>


