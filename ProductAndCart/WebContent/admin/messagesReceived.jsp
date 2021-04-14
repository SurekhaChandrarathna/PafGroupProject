<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import = "Util.DBConnection"%>
<%@page import = "java.sql.*"%>
<%@include file="adminHeader.jsp" %>

<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
			integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
		
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: Black; text-align: center; font-size: 28px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
          </tr>
        </thead>
        <tbody>
       
       	<%
       		try{
       			Connection con=DBConnection.getCon();
    			Statement st = con.createStatement();
    			ResultSet rs= st.executeQuery("Select  *from message");
    			
    			while(rs.next())
    			{
    				
    	%>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
 <div class="card border-primary mb-3" style="max-width: 18rem;">         </tr>
 <div class="card border-info mb-3" style="max-width: 18rem;">
    <div class="card-header">ID :- <%=rs.getString(1) %> </div>
    <div class="card-header">Email :- <%=rs.getString(2) %> </div>
    <div class="card-body text-info">
    <h5 class="card-title">Subject :-<%=rs.getString(3) %></h5>
    <p class="card-text">Body :-<%=rs.getString(4) %></p>
  </div>
</div>

         
    		<% }
       			
       		}catch(Exception e)
     	  	{
       			
       			System.out.println(e);

   	    	}
       	
       	
        	%>
        </tbody>
      </table>
      <br>
      <br>
      <br>
<!-- bootstrap -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- bootstrap -->

</body>
</html>