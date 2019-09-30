<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,curd.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name = "format-detection" content = "telephone=no" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/touchTouch.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/script.js"></script> 
<script src="js/superfish.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/tmStickUp.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/touchTouch.jquery.js"></script>
<script src="js/jquery.shuffle-images.js"></script>
<link href="css/new.css" rel="stylesheet" type="text/css">

<script>
  $(window).load(function(){
    $().UItoTop({ easingType: 'easeOutQuart' });
    $('.gallery .info').touchTouch();
  }); 

   $(document).ready(function(){
       $(".shuffle-me").shuffleImages({
         target: ".images > img"
       });
    });
</script>

</head>

<body class="page1" id="top">
  <div class="main">
<!--==============================
              header
=================================-->
<header>
  <div class="container">
    <div class="row">
      <div class="grid_12">
        <h1>
          <a href="index.html">
            <img src="images/logo.png" alt="Logo alt">
          </a>
        </h1>
        <div class="socials">
          <a href="#" class="fa fa-twitter"></a>
          <a href="#" class="fa fa-facebook"></a>
          <a href="#" class="fa fa-google-plus"></a>
        </div>
        <div class="navigation ">
         <nav>
            <ul class="sf-menu">
             <li   class="current"><a href="Admin-home.jsp">Home</a></li>
             <li ><a href="View-host.jsp">View-Host</a></li>
             <li  ><a href="View-users.jsp">View-User</a></li>
             <li><a href="View-events.jsp">View-Events</a></li>
            <li><a href="Event-Bookings.jsp">EventBookings</a></li>
             <li><a href="Admin-Addevent.jsp">AddEvents</a></li>
              <li><a href="Logout.jsp">Logout.jsp</a></li>
           </ul>
          </nav>
          <div class="clear"></div>
        </div>       
      </div>
    </div>
  </div>
</header>
<!--=====================
          Content
======================-->
<section id="content"><div class="ic">@ event_planner.com - , 2019!</div>
  <div class="container">
   <%  
   HttpSession user=request.getSession(true);
   String sid=request.getParameter("id");
	int id=Integer.parseInt(sid);
	
	Emp e=EmpDao.getEmployeeById(id);
%>
       <h3 align="center">Update Employee</h3>
        <hr>
        <form action='EditServlet2' method='post'>
<center>
		<table>
		<tr><td>ID</td><td><input type="text" name='id' value="<%=e.getId() %>" readonly/></td></tr>
		<tr><td><label for="email" class="control-label">Venue Name</label></td><td><input type='text' name='name' value="<%=e.getName() %>"/></td></tr>
		<tr><td><label for="department" class="control-label">Venue Location</label></td><td><!--<input type='text' name='password' value="<%//=e.getPassword() %>"/>  -->
		<select id="department" required="required" class="form-control" name="password">
				<option value="">Select</option>
				<option value="HYDERABAD">HYDERABAD</option>
				<option value="GUNTUR">GUNTUR</option>
				<option value="VIJAYAWADA">VIJAYAWADA</option>
				<option value="VISAKAPATTANAM">VISAKAPATTANAM</option>
			</select> </td>
		
		</td></tr>
		<tr><td><label for="department" class="control-label">Venue Capacity</label></td><td><input type='text' name='email' value="<%=e.getEmail() %>"/></td></tr>
		<tr><td><label for="phone" class="control-label">Venue Type</label></td><!--<td><input type='text' name='country' value="<%//=e.getCountry() %>"/></td></tr>  -->
		<td><select name='country' style='width:150px'>"
		<option value="AC">AC</option>
		<<option value="NON-AC">NON-AC</option>
		
		</select>
		</td></tr>
		<tr><td colspan='2'><input type='submit' value='Edit &amp; Save '/></td></tr>
		</table></center>
		</form>
		
		<% out.close(); %>
  

  
<a href="#" id="toTop" class="fa fa-chevron-up"></a>
</div>
</body>

</html>


</html>