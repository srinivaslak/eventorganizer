<!DOCTYPE html>
<%@page import="com.keyupdate.conn.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
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
             <li   ><a href="User-home.jsp">Home</a></li>
             <li  ><a href="User-profile.jsp">View-Profile</a></li>
             <li class="current"><a href="User-Eventbookings.jsp">Book-Event</a></li>
             
             <li><a href="User-Viewevents.jsp">View-PreviousEvents</a></li>
            <li><a href="User-bookingstatus.jsp">EventBooking-Status</a></li>
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
    <div class="row">
     <div class="offset-md-3 col-md-6">
          <%  if (session.getAttribute("usertype") == "user")
{
          if (session.getAttribute("loggedusrname") != null) { %> 
          	<h4>	<font color="red">
                 
          <% 
		    if(null!=request.getAttribute("errorMessage"))
		    {
		        out.println(request.getAttribute("errorMessage"));
		    }
		%> </font></h4>
           
          
          <h3 align="center">Welcome - <font color="red"><% out.print((String)session.getAttribute("nameofowner"));
          String uname=(String)session.getAttribute("nameofowner");
          
          %></font>  </h4>
       				<% 
		String sid=request.getParameter("id");
out.println("<h4 align='center'>Booking An Event</h4>");
				 String email=(String)session.getAttribute("loggedusrname");  
				 String search=request.getParameter("search");
				 
				  // String em1="vasu@gmail.com";
				   		String host="host";
				Connection connection=null;
				Statement statement=null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				try{
				connection=DBConnection.getDbConnection();
				int userid = (Integer) session.getAttribute("ownerid");
				//String query = "select * from registration where email="+em1;
				//String query = "select * from registration where id="+userid;
				//String query1="select * from event where event_id="+search;

				      pstmt = connection.prepareStatement("select * from event where event_id=?"); // create a statement
				      pstmt.setString(1, sid); // set input parameter
				     rs = pstmt.executeQuery();
				System.out.println("hai");
				int i=1;
				while(rs.next())
				       {
						%>
		 <form action='EditServlet3' method='post'>
<center>
		<table>
		<tr><td>Requested EventID</td><td><input type="text" name='eid' value="<%=rs.getInt(1) %>" readonly/></td></tr>
		<tr><td><label for="email" class="control-label">Requested Event Name</label></td><td><input type='text' name='ename' value="<%=rs.getString(2) %>" readonly/></td></tr>
		<tr><td><label for="department" class="control-label">Requested Event Type</label></td><td><input type='text' name='etype' value="<%=rs.getString(4) %>" readonly/></td></tr>
		<tr><td><label for="department" class="control-label">Event Place</label></td><td><input type='text' name='eplace' value="<%=rs.getString(3) %>" readonly/></td></tr>
		<tr><td><label for="phone" class="control-label">Host ID</label></td><td><input type='text' name='hid' value="<%=rs.getInt(8) %>" readonly/></td></tr>
		<tr><td><label for="phone" class="control-label">User ID</label></td><td><input type='text' name='uid' value="<%=userid %>" readonly/></td></tr>
		<tr><td><label for="phone" class="control-label">User Name</label></td><td><input type='text' name='uname' value="<%=uname %>" readonly/></td></tr>
		<tr><td><label for="phone" class="control-label">Number Peoples</label></td><td><input type='text' name='npep' required/></td></tr>
		<tr><td><label for="phone" class="control-label">Advance Paid</label></td><td><input type='number' name='apaid' required /></td></tr>
		<tr><td><label for="phone" class="control-label">Total Price</label></td><td><input type='number' name='tprice' value="<%=rs.getInt(5) %>" /></td></tr>
		</select>
		</td></tr>
		<tr><td colspan='2'><input type='submit' value='Edit &amp; Save '/></td></tr>
		</table></center>
		</form>
		
	<%	    }}  catch(Exception e) { e.printStackTrace();}


				}}%>
  
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

