<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="https://www.javaguides.net" class="navbar-brand"> Manage Projects </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Projects</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${proj != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${proj == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${proj != null}">
            			Edit Details
            		</c:if>
						<c:if test="${proj == null}">
            			Add New Project
            		</c:if>
					</h2>
				</caption>

				<c:if test="${proj != null}">
					<input type="hidden" name="id" value="<c:out value='${proj.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Project Code</label> <input type="text"
						value="<c:out value='${proj.pcode}' />" class="form-control"
						name="code" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Image</label> <input type="text"
						value="<c:out value='${proj.img}' />" class="form-control"
						name="img">
				</fieldset>

				<fieldset class="form-group">
					<label>Project Name</label> <input type="text"
						value="<c:out value='${proj.pname}' />" class="form-control"
						name="name">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Project Category</label> <input type="text"
						value="<c:out value='${proj.category}' />" class="form-control"
						name="cate" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Description</label> <input type="text"
						value="<c:out value='${proj.description}' />" class="form-control"
						name="des" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Budget</label> <input type="number"						
						value="<c:out value='${proj.budget}' />" class="form-control"
						name="bud" required="required">
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>