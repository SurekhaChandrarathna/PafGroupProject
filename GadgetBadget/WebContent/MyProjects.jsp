<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "gadgetbudget";
String userId = "root";
String password = "";


try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>    

<!DOCTYPE html>
<html>
<head>

	<link rel="stylesheet" href="Home.css">
	<!-- bootstrap -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
			integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
	
	
		
	<!-- bootstrap -->
<title>GadgetBadget</title>
</head>
<body>

<input type="hidden" name="UserEmail" value="surekha@GB.com">
<%String UserEmail=request.getParameter("UserEmail"); %>

<!-- navigation bar -->

  <nav  class="navbar fixed-top navbar-white bg-white">
		<div class= "container">
			<a class="navbar-brand" href="#">
     			 <img src="images/Capture.PNG" alt="logo" width="220" height="78" float="left">
   			</a>
   			<br>
   			<div class="topnav" id="myTopnav">
			  <a href="CustomerResHome.jsp" >Home</a>
			  <a href="#">Products</a>
			  <a href="#" class="active">Projects</a>
			  <a href="CustomerFundingDesk.jsp">Funding HelpDesk</a>
			  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
			    <i class="fa fa-bars"></i>
			  </a>
			
			</div>
			
			<button class="btn"><i class="fa fa-shopping-cart" style="font-size:24px"></i></button>
      
			<div class="dropdown">
			   <img src="images/avatar.png" class="img-fluid" alt="avatar1" width="50" height="80" >
			  <div class="dropdown-content">
			    <a href="#">Profile</a>
			    <a href="Home.jsp">Log Out</a>
			  </div>
			</div>			
		</div>	
	</nav>
	
<!-- navigation bar -->
	<br>
  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="images/cable.jpg" alt="First slide" height="500px">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="images/hard.jpg" alt="Second slide" height="500px">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="images/pen.jpg" alt="Third slide" height="500px">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
  <br><br><br>
  
  
  <center><h3> Welcome to GadgetBadget </h3></center>
 <br><br>


<!-- <table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>Proid</b></td>
<td><b>Procode</b></td>
<td><b>NAme</b></td>
<td><b>image</b></td>
<td><b>description</b></td>
<td><b>budget</b></td>
<td><b>Category</b></td>
</tr>
 
 
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM projects ";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getInt("ProjectId") %></td>
<td><%=resultSet.getString("ProjectCode") %></td>
<td><%=resultSet.getString("ProjectName") %></td>
<td><img src="<%=resultSet.getBlob("Image") %>"/></td>
<td><%=resultSet.getString("Description") %></td>
<td><%=resultSet.getString("Budget") %></td>
<td><%=resultSet.getString("Category") %></td>
</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>-->

<center><h2>My projects</h2></center>
	
	
<div class="card mb-3">
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM projects where UserEmail like 'surekha@GB.com' ";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
  <img class="card-img-top" src="<%=resultSet.getBlob("Image") %>" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title"><%=resultSet.getString("ProjectName") %></h5>
    <h6><%=resultSet.getString("ProjectCode") %></h6>
    <h6><%=resultSet.getString("Budget") %></h6>
    <p class="card-text"><%=resultSet.getString("Description") %></p>
    <p class="card-text"><small class="text-muted"><%=resultSet.getString("Category") %></small></p>
  </div>
  
  <% 
  }

  } catch (Exception e) {
  e.printStackTrace();
  }
  %> 
</div><br><br>


<!-- Footer -->
<footer class="page-footer font-small color-dark" style="background-color:#1f3a93">

  <div style="background-color: #59abe3;">
    <div class="container">

      <!-- Grid row-->
      <div class="row py-4 d-flex align-items-center">

        <!-- Grid column -->
        <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
          <h6 class="mb-0" style="color:white">Get connected with us on social networks!</h6>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-6 col-lg-7 text-center text-md-right">

          <!-- Facebook -->
          <a class="fa fa-facebook"></a>
          <!-- Twitter -->
          <a class="fa fa-twitter "></a>
          <!-- Google +-->
          <a class="fa fa-google-plus-g"></a>
          <!--Linkedin -->
          <a class="fa fa-linkedin"></a>
          <!--Instagram-->
          <a class="fa fa-instagram "> </a>

        </div>
        <!-- Grid column -->

      </div>
      <!-- Grid row-->

    </div>
  </div>

  <!-- Footer Links -->
  <div class="container text-center text-md-left mt-5">

    <!-- Grid row -->
    <div class="row mt-3">

      <!-- Grid column -->
      <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">

        <!-- Content -->
        <h6 class="text-uppercase font-weight-bold" >GadgetBadget Company</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p style="color:white">Best funding company for young researchers....</p>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Products</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
          <a href="#!" style="color:white">pen Drives</a>
        </p>
        <p>
          <a href="#!" style="color:white">Hard Disks</a>
        </p>
        <p>
          <a href="#!" style="color:white">T shirts</a>
        </p>
        <p>
          <a href="#!" style="color:white">Cables</a>
        </p>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Contact</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p style="color:white">
          <i class="fa fa-home mr-3"></i> Colombo, SriLanka</p>
        <p style="color:white">
          <i class="fa fa-envelope mr-3" style="color:white"></i> info@example.com</p>
        <p style="color:white">
          <i class="fa fa-phone mr-3" style="color:white"></i> + 01 234 567 88</p>
        <p style="color:white">
          <i class="fa fa-print mr-3" style="color:white"></i> + 01 234 567 89</p>

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3" style="color:white">� 2020 Copyright:
    <a href="https://mdbootstrap.com/" style="color:white"> GadgetBadget Company</a>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->



<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>



 <!-- bootstrap -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



</body>
</html>