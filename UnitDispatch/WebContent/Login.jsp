<!-- 
  Module Name : Log in Page
  Creator : Shoaib F Bagwan
  Date of Creation : 20/07/08
  Modifier :
  Date of Modification :20/07/12
  Reason of Modification :
  Description : -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"><head><script type="text/javascript">var NREUMQ=NREUMQ||[];NREUMQ.push(["mark","firstbyte",new Date().getTime()]);</script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Unit Dispatch - Sign In</title>
		<link href="css/main.css" media="screen" rel="stylesheet" type="text/css">
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
    </head>
	<body>
		<div id="main-container">
			<div id="main">
				<h2>Unit Dispatch</h2>
<div id="form-oldschool">
<form action="usrvalidtn1.jsp" name = "loginform" class="gen-form" method="post" onsubmit="return validate()"><div style="margin:0;padding:0;display:inline"><input name="authenticity_token" value="BN7pJdccO8CCuZJreUhyqEq6XOweMj8h6wR7w2vWFAg=" type="hidden"></div>

<% 
String chkvalidity=request.getParameter("chkvalidity");
if(chkvalidity==null)
{
}
else
{ %>
      <td> <div align="center"> <font color="maroon"> <b> You are not Authorized User. Please Contact your Manager! </b> </font> </div> 
      </td>
<% }
%>
	
	<fieldset>
		<label for="login">Username </label>
		<input autocapitalize="off" autocorrect="off" class="text-input" id="uname" name="uname" tabindex="1" type="text">
	</fieldset>

	<fieldset>
		<label for="password">Password </label>
		<input class="text-input" id="adpass" name="adpass" tabindex="2" value="" type="password">
	</fieldset>

	<input class="button" value="Sign In" tabindex="3" type="submit">
	
	<div style="text-align: center;">
	<p>Copyright &copy; 2007-2012 by Transworld</p>
</div>
</form>
</div>

<div class="sign-connections">
	<a href="#" class="auth-twitter">About Unit Dispatch</a>
	<p>One-click sign in to Unit Dispatch. We'll walk you through Dispatched and Available units.</p>
</div>
			</div>
		</div>
<script src="new_files/jquery.js"></script>
<script src="new_files/jquery-ui-1.js" type="text/javascript"></script>
		<script>$("input:text:visible:first").focus();</script>
	<script type="text/javascript">if (!NREUMQ.f) { NREUMQ.f=function() {
NREUMQ.push(["load",new Date().getTime()]);
var e=document.createElement("script");
e.type="text/javascript";e.async=true;e.src="https://d1ros97qkrwjf5.cloudfront.net/39/eum/rum.js";
document.body.appendChild(e);
if(NREUMQ.a)NREUMQ.a();
};
NREUMQ.a=window.onload;window.onload=NREUMQ.f;
};
NREUMQ.push(["nrfj","beacon-1.newrelic.com","7840d0c136",108602,"Jg1bREUOClsARUpHBhYRXF9ZEklZAEA=",0,7,new Date().getTime(),"","","","",""])</script>
<script src="new_files/rum.js" async="" type="text/javascript"></script><script src="new_files/7840d0c136" type="text/javascript" id="nreum-send-beacon"></script></body></html>