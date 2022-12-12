
<html>
<head>
<title>Sortable HTML table :: Demo</title>
<script language="JavaScript" type="text/JavaScript">
<!--
/**
* Make modifications to the sort column and sort order.
*/
function reSortData( sortColumn ) {
if ( sortColumn == document.form_searchSort_report.hd_sortCol.value ) {
// The same column was selected. Toggle the sort order.
if ( document.form_searchSort_report.hd_sortOrd.value == 'ASC' ) {
document.form_searchSort_report.hd_sortOrd.value = 'DESC';
} else {
document.form_searchSort_report.hd_sortOrd.value = 'ASC';
}
} else {
// A different column was selected.
document.form_searchSort_report.hd_sortCol.value = sortColumn;
document.form_searchSort_report.hd_sortOrd.value = 'ASC';
}
// Submit the form.
document.form_searchSort_report.submit();
}
-->
</script>
</head>

<body>
<%
%>
<form name="form_searchSort_report" method="POST" action="sortableDemo.jsp">
<%-- These are hidden inputs that will be populated by the reSortData() JavaScript function. --%>
<input type="hidden" name="hd_sortCol" value="<%=request.getParameter("hd_sortCol")%>">
<input type="hidden" name="hd_sortOrd" value="<%=request.getParameter("hd_sortOrd")%>">

<p>
<a href="#" onClick="reSortData('userID');">User ID</a>
<a href="#" onClick="reSortData('userName');">User Name</a>
</p>
</form>
</body>
</html>
