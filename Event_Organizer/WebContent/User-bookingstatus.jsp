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
             <li ><a href="User-Eventbookings.jsp">Book-Event</a></li>
             
             <li><a href="User-Viewevents.jsp">View-PreviousEvents</a></li>
            <li class="current"><a href="User-bookingstatus.jsp">EventBooking-Status</a></li>
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
           <div class="map">
          <figure class="">
          <h3 align="center">Welcome - <font color="red"><% out.print((String)session.getAttribute("nameofowner")); }}%></font>  </h4>
        <center>	<font color="red">
          
           </figure>
            <% 
		    if(null!=request.getAttribute("success"))
		    {
		        out.println(request.getAttribute("success"));
		    }
		%> 
          <% 
		    if(null!=request.getAttribute("errorMessage"))
		    {
		        out.println(request.getAttribute("errorMessage"));
		    }
		%> </font></center>
		<% 
out.println("<h4 align='center'>Previous EventBookings</h4>");
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
				String query1="select * from event where eventtype="+search;

				      pstmt = connection.prepareStatement("select * from userrequest where req_by=?"); // create a statement
				      pstmt.setInt(1, userid); // set input parameter
				     rs = pstmt.executeQuery();
				System.out.println("hai");
				int i=1;
				while(rs.next())
				       {
					//String a=rs.getString("mobile");
					//System.out.println("The values are"+a);
					//System.out.println("select * from registration where email='"+email+"' and usertype='"+host+"'");
					
		//List<Emp> list=EmpDao.getAllEmployees();
		
		out.print("<center><table border='1' width='80%'>");
		
		out.print("<tr><th>Booking_ID</th><th>Event_ID</th><th>Event_Name</th><th>Event_Type</th><th>Event_Place</th><th>HostID</th><th>UserID</th> <th>NumberOfPeople</th> <th>Advance Paid</th> <th>Toala price</th><th>Request status</th><th>Cancle Status</th><th>Cancle</th></tr>");
		//for(Emp e:list){
			//out.print("<tr><td>"+e.getId()+"</td><td>"+e.getName()+"</td><td>"+e.getPassword()+"</td><td>"+e.getEmail()+"</td><td>"+e.getCountry()+"</td><td><a href='Edit.jsp?id="+e.getId()+"'>edit</a></td><td><a href='Delete.jsp?id="+e.getId()+"'>delete</a></td></tr>");
		int eid1=rs.getInt("req_id");
		//String eid=String.parseString(eid1);
		String eid=String.valueOf(eid1);
		%>
		
		<tr>
		<td><%=rs.getInt("req_id") %></td>
		  <td><%=rs.getInt("reg_eventid") %></td>
		    <td><%=rs.getString("req_event") %></td>
		    <td><%=rs.getString("event_type") %></td>		
		    <td><%=rs.getString("event_place") %></td>
		       <td><%=rs.getInt("host_id") %></td>
		    <td><%=rs.getInt("req_by") %></td>
		     <td><%=rs.getString("no_ofpeople") %></td>
		      <td><%=rs.getInt("aprice") %></td>
		      <td><%=rs.getInt("tprice") %></td>
		    <td><%=rs.getString("req_status") %></td>
		    <td><%=rs.getString("cancel_status") %></td>
		    <td><a href="cancle.jsp?id=<%=eid%>">Cancel</a></td>
	<%	i++;  out.print("</center></table>");  }}  catch(Exception e) { e.printStackTrace();}


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

