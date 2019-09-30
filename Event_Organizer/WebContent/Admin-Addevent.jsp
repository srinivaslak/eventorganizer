<!DOCTYPE html>

<html lang="en">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,curd.*"%>
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
             <li   ><a href="Admin-home.jsp">Home</a></li>
             <li ><a href="View-host.jsp">View-Host</a></li>
             <li  ><a href="View-users.jsp">View-User</a></li>
             <li><a href="View-events.jsp">View-Events</a></li>
            <li><a href="Event-Bookings.jsp">EventBookings</a></li>
             <li class="current"><a href="Admin-Addevent.jsp">AddVenue</a></li>
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
 
  <center> <h3 class="panel-title">Adding Venue Details</h3><br>
	<h3>	<font color="red"><% 
		    if(null!=request.getAttribute("errorMessage"))
		    {
		        out.println(request.getAttribute("errorMessage"));
		    }
		%> </font></h3>
</center> 
		<div class="panel-body">
		<form action="SaveServlet" class="form-horizontal" method="post">
		<center>
		<table>
		<tr>
		<td><label for="email" class="control-label">Venue Name</label> </td>
		<td><input type="text" id="email" class="form-control" name="name" placeholder="ENTER Venue name" required="required">
		 </td>
		</tr>
		<tr>
		<td><label for="department" class="control-label">Venue Location</label> </td>
		<td>
			<select id="department" required="required" class="form-control" name="location">
				<option value="">Select</option>
				<option value="HYDERABAD">HYDERABAD</option>
				<option value="GUNTUR">GUNTUR</option>
				<option value="VIJAYAWADA">VIJAYAWADA</option>
				<option value="VISAKAPATTANAM">VISAKAPATTANAM</option>
			</select> </td>
		</tr>
		<tr>
		<td><label for="phone" class="control-label">Venue Capacity</label> </td>
		<td><input type="text" id="phone" class="form-control" name="capacity" placeholder="ENTER venue capacity" required="required">
	 </td>
		</tr>
		<tr>
		<td><label for="department" class="control-label">Venue Type</label> </td>
		<td><select id="department" required="required" class="form-control" name="type">
				<option value="">Select</option>
				<option value="AC">AC</option>
				<option value="NON-AC">NON-AC</option>
				
			</select> </td>
		</tr>
		<tr><td></td>
		<td><input type="submit" value="AddEvent"></td> 
		</tr>
		</table>
		</center>
		
		</form>
		</div>
		</div>
		</div>

		<% 
out.println("<h3 align='center'>Venue List</h3>");
		
		List<Emp> list=EmpDao.getAllEmployees();
		
		out.print("<center><table border='1' width='80%'>");
		out.print("<tr><th>Venue_ID</th><th>Venue_Name</th><th>Venue_Location</th><th>Venue_Capacity</th><th>Venue_Type</th><th>Edit</th><th>Delete</th></tr>");
		for(Emp e:list){
			out.print("<tr><td>"+e.getId()+"</td><td>"+e.getName()+"</td><td>"+e.getPassword()+"</td><td>"+e.getEmail()+"</td><td>"+e.getCountry()+"</td><td><a href='Edit.jsp?id="+e.getId()+"'>edit</a></td><td><a href='Delete.jsp?id="+e.getId()+"'>delete</a></td></tr>");
		}
		out.print("</center></table>");
		%>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.js"></script>
	</body> </div>
 
 </section>

<!--==============================
              footer
=================================-->
<footer id="footer">
  <div class="container">
    <div class="row">
      <div class="grid_12"> 
        
          <div class="sub_copyright">
            Website designed by <a href="" rel="nofollow">event_planner.com</a>
          </div>
        
      </div>
    </div>

  </div>  
</footer>
<a href="#" id="toTop" class="fa fa-chevron-up"></a>
</div>
</body>

</html>

