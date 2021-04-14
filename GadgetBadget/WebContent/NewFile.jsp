<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


							
	
	
	<div class="card" style="width: 18rem;">
	
		<c:forEach var = "project" items = "${Showprojects}">
					<c:set var= "ProjectId" value = "${project.ProjectId}"/>
					<c:set var= "ProjectCode" value = "${project.ProjectCode }"/>
					<c:set var= "ProjectName" value = "${project.ProjectName }"/>
					<c:set var= "image" value = "${project.image }"/>
					<c:set var= "Description" value = "${project.Description }"/>
					<c:set var= "Budget" value = "${project.Budget }"/>
					<c:set var= "Category" value = "${project.Category }"/>
					


	  <img class="card-img-top" src="${project.image}" alt="Card image cap">
	  <div class="card-body">
	    <h5 class="card-title">${project.ProjectName }</h5>
	    <p class="card-text">${project.Description }</p>
	    <a href="#" class="btn btn-primary">Go somewhere</a>
	  </div>
	  
	  
	  </c:forEach>
	</div>
	
	
	
	<table >
				<tr>
					<th>Subject Code</th>
					<th>Subject </th>
					<th>Register</th>
					<th>Register</th>
					<th>Register</th>
					<th>Register</th>
					<th>Register</th>
					
				</tr>
				
				<c:forEach var = "project" items = "${Showprojects}">
					<c:set var= "ProjectId" value = "${project.ProjectId}"/>
					<c:set var= "ProjectCode" value = "${project.ProjectCode }"/>
					<c:set var= "ProjectName" value = "${project.ProjectName }"/>
					<c:set var= "image" value = "${project.image }"/>
					<c:set var= "Description" value = "${project.Description }"/>
					<c:set var= "Budget" value = "${project.Budget }"/>
					<c:set var= "Category" value = "${project.Category }"/>
					
					
				
				<tr>
					<td>${project.ProjectId}</td>
					<td>${project.ProjectCode }</td>
					<td>${project.ProjectName }</td>
					<td>${project.image }</td>
					<td>${project.Description }</td>
					<td>${project.Budget }</td>
					<td>${project.Category }</td>
					<td>
					<a class="btn btn-success btn-medium"  href="#" role ="button">Register</a>
					</td>
				</tr>
					
				</c:forEach>
	</table>
	

</body>
</html>