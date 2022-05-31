<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

</head>
<body style="background-color: #f0f0f0">
	<div class="container-fluid">
		<div class="row p-5">
			<div class="col-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<form  action="mainLogin" method="post" >

							<h2 class="text-center text-success">Main Login</h2>
							
							<div class="mb-3">
								<label for="inputusername" class="form-label">User Name: </label>
								 <input name="username" id="username" type="text" class="form-control" autocomplete="off">
							</div>

							<div class="mb-3">
								<label for="inputPassword" class="form-label">Password</label>
								 <input name="password" id="password" type="password" class="form-control" autocomplete="off"> 
							</div>

							<div class="text-center">
								<input class="btn btn-primary" id="submit" type="submit" value="Login">
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>