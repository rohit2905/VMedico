<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.vmedico.model.DoctorAppointment" %>
<%@ page import="com.example.vmedico.model.Doctor" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Status |VMedico</title>
<style>

#status {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  margin-left:auto; 
    margin-right:auto;
}

#status td, #status th {
  border: 1px solid #ddd;
  padding: 8px;
}

#status tr:nth-child(even){background-color: #f2f2f2;}

#status tr:hover {background-color: #ddd;}

#status th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #cc0000;
  color: white;
}
</style>

</head>
<body>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires", "0");

if(session.getAttribute("patientmail") == null){
	response.sendRedirect("home.jsp");
}
%>
<jsp:include page="patientstab.jsp"/>

<table id = "status">

<tr>
<th>Doctor Name </th>
<th>Hospital Name </th>
<th>Specialization </th>
<th> Appointment date </th>
<th> Appointment time </th>
<th> Status </th>
</tr>
<%
@SuppressWarnings("unchecked")
ArrayList<DoctorAppointment> al = (ArrayList<DoctorAppointment>) request.getAttribute("statusappointmentlist");
@SuppressWarnings("unchecked")
ArrayList<Doctor> dl = (ArrayList<Doctor>) request.getAttribute("statusdoctordetails"); 


for(int i=0;i< al.size() ;i++){
	%>
	<tr>
	<td> <%= dl.get(i).getFirstname() %> </td>
	<td> <%= dl.get(i).getHospitalname() %> </td>
	<td> <%= dl.get(i).getSpecialization() %> </td>
	<td> <%= al.get(i).getAppointmentdate() %> </td>
	<td> <%= al.get(i).getAppointmenttime() %> </td>
	<td> <%= al.get(i).getStatus() %></td>
	</tr>
<% 	
}
	
%>
</table>
</body>
</html>