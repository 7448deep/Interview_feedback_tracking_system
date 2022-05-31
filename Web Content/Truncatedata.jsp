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
<body>
	<div class="container-fluid">
		<div class="col-4 offset-4">
			<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="m-4">
							<form action="truncatedata" method="post">
								<input type="submit" class="btn btn-primary" value="Truncate data">
								<br>
								This will Remove all data except users 
									
							</form>
						</div>
						<div class="m-4">
							<form action="truncateAll" method="post">
								
								<input type="submit"class="btn btn-primary" value="Truncate all data">
								<br>
								This will Remove all data including users
									
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>