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
             <li ><a href="Admin-home.jsp">Home</a></li>
             <li  class="current"><a href="View-host.jsp">View-Host</a></li>
             <li><a href="View-users.jsp">View-User</a></li>
             <li><a href="View-events.jsp">View-Events</a></li>
            <li><a href="Event-Bookings.jsp">EventBookings</a></li>
            <li><a href="Admin-Addevent.jsp">AddVenues</a></li>
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
   
       <h3 align="center">Agent/Host Details</h3>
        <hr>
<center><table style="width:60%" border="1">
  <tr>
  	<th>S.No</th>
    <th>FirstName</th>
    <th>LastName</th>		
    
    <th>Email</th>
    
    <th>Mobile</th>	
    	<th>Address</th>	
    <th>DOB</th>
      <th>Gender</th>
      <th>UserType</th>		

  </tr>
  
   <%  
        String email=(String)session.getAttribute("loggedusrname");  
   
Connection connection=null;
Statement statement=null;
PreparedStatement pstmt=null;
//ResultSet rs=null;
try{
connection=DBConnection.getDbConnection();
int userid = (Integer) session.getAttribute("ownerid");
//String query = "select * from registration where email="+em1;
//String query = "select * from registration where usertype=`host`";

      pstmt = connection.prepareStatement("select * from registration where usertype='host'"); // create a statement
     // pstmt.setInt(1, 1001); // set input parameter
     ResultSet rs = pstmt.executeQuery();
System.out.println("hai");
int i=1;
while(rs.next())
       {
	//String a=rs.getString("mobile");
	//System.out.println("The values are"+a);
	//System.out.println("select * from registration where email='"+email+"' and usertype='"+host+"'");
	
%>
  
  
  
  <tr>
  <td><%=rs.getInt("id") %></td>
    <td><%=rs.getString("firstname") %></td>
    <td><%=rs.getString("lastname") %></td>		
    <td><%=rs.getString("email") %></td>
      
    <td><%=rs.getString("mobile") %></td>
     <td><%=rs.getString("address") %></td>
      <td><%=rs.getString("dob") %></td>
    <td><%=rs.getString("gender") %></td>
      <td><%=rs.getString("usertype") %></td>
     

  </tr>
  <% } } catch(Exception e) { e.printStackTrace();}


%>
  
  
  
</table></center>
  
<a href="#" id="toTop" class="fa fa-chevron-up"></a>
</div>
</body>

</html>

