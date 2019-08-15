<%@page import="java.util.List"%>
<%@page import="com.cts.dao.ActivityLookupDao"%>
<%@page import="com.cts.dao.ActivityLookupDaoFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String app = (String)session.getAttribute("AppData");

List<String> ranges = (List<String>)session.getAttribute("DateBreakup");//date range breakup of month

ActivityLookupDao ald = ActivityLookupDaoFactory.getActivityLookupDao();

List<String> activities = ald.getAllActivityById(app);//activity names of selected app

int datepicked =Integer.parseInt((String)session.getAttribute("Datedata")); //picked date
%>
<br><br>
<form action="SubmitTimesheetSrv" method="post">
<table align="center">

<tr> 
	<th>Non Ticketing Activity</th>
	<%
for(String range:ranges){
%>
<th><%=range %></th>

<%} %>
</tr>


<%
for(String activity:activities){
%>
<tr>
<td><%=activity %></td>
<%
for(String range:ranges){
	
	String arr[]=range.split("-");
	
	int start = Integer.parseInt(arr[0]);
	int end = Integer.parseInt(arr[1]);
	
	if(datepicked>=start){         //check to prevent future date entry
%>
<td><input type="number" name="<%=activity+range%>" required="required"></td>
<% 		
	}else{
%>
<td><input type="number" readonly="readonly"></td>
<% 		
	} 	
}
%>
</tr>
<% 
}
%>
</table>


<input type="submit" value="SUBMIT">
</form>
</body>
</html>


