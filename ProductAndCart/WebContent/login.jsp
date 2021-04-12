
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     
    <form action ="loginAction.jsp"  method= "post">
		
			Email <input type ="text" name = "email"  required><br><br>
			Password <input type ="text" name = "password"  required><br><br>
		
	
		<button><i>login</i></button>	
		</form>

   	<%
		String msg = request.getParameter("msg");
		if("notexist".equals(msg))
		{
	
		%>
			<h1> incorrect username or password!</h1>
	
		<%  } %>
	
		<%
			if("invalid".equals(msg))
			{

		%>
			<h1> UnSuccessful! </h1>
	
		<%  } %>
  </div>
</div>

</body>
</html>