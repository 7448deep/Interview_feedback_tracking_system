<%@page import="com.dao.EmployeeDao"%>
<%@page import="com.model.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Of Interviewers</title>
<link rel="shortcut icon" href="images/sparlogo.jpg" type="image/x-icon">
<style>
.interviewer_list {
	height: 650px;
	overflow-x: hidden;
	overflow-y: auto;
	text-align: justify;
}
</style>

</head>
<body style="background-color: #f0f0f0">

	<%@include file="DesignCdnLinks/allCdn.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<div class="col-md-2">
				<%@include file="SideNavbar.jsp"%>
			</div>
			<div class="col-md-8 offset-md-1">

				<div class="card p-3" style="background-color: #e3f4fc">
					<div class="card-body">
						<div class="interviewer_list">
							<h3>Interviewer List</h3>
							<%
							ArrayList<Employee> list = EmployeeDao.getEmployeeList();
							%>
							<table class="table">
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>Username</th>
									<th>Email Id</th>
									<th>Action</th>
								</tr>
								<%
								for (int i = 0; i < list.size(); i++)
								{
									Employee employee = list.get(i);
								%>
								<tr>
									<td><%=i + 1%></td>
									<td><%=employee.getEmployee_name()%></td>
									<td><%=employee.getEmployee_username()%></td>
									<td><%=employee.getEmployee_emailid()%></td>
									
									<td>
										<form action="gotoeditemployee" method="post">
											<input type="hidden" name="employee_id" value="<%=employee.getEmployee_id()%>"> <input class="btn btn-primary" type="submit" value="Edit">
										</form>
									</td>
								</tr>
								<%
								}
								%>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>