<!DOCTYPE html>
<%@page import="com.keyupdate.conn.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
<title>Contacts</title>
<meta charset="utf-8">
<meta name = "format-detection" content = "telephone=no" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/contact-form.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/script.js"></script> 
<script src="js/superfish.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/tmStickUp.js"></script>
<script src="js/TMForm.js"></script>
<script src="js/modal.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<link href="css/new.css" rel="stylesheet" type="text/css">
<script>
  $(window).load(function(){
    $().UItoTop({ easingType: 'easeOutQuart' });
  }); 
</script>

</head>

<body>
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
             <li  ><a href="Host-home.jsp">Home</a></li>
             <li   class="current"><a href="Host-profile.jsp">View-Profile</a></li>
             <li ><a href="Host-eventcreation.jsp">Create-Event</a></li>
             
             <li><a href="Host-Viewevents.jsp">View-Events</a></li>
            <li><a href="Host-bookingstatus.jsp">EventBooking-Status</a></li>
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
<section id="content"><div class="ic">More Website Templates @ TemplateMonster.com - July 14, 2014!</div>
  <div class="container">
    <div class="row">
      <div class="grid_12"> 
     <%  if (session.getAttribute("usertype") == "host")
{
if (session.getAttribute("loggedusrname") != null) { %> 
          <h4 align="center">Welcome - <font color="red"><% out.print((String)session.getAttribute("nameofowner")); %></font> <br> </h2>
     <h4 align="center">Profile Details</h4>
        <hr>
<center><table style="width:60%" border="1">
  <tr>
  	<th>S.No</th>
    <th>FirstName</th>
    <th>LastName</th>		
    
    <th>Email</th>
    <th>Password</th>
    <th>Mobile</th>	
    	<th>Address</th>	
    <th>DOB</th>
      <th>Gender</th>
      <th>UserType</th>		

  </tr>
  
   <%  
        String email=(String)session.getAttribute("loggedusrname");  
   String em1="vasu@gmail.com";
   		String host="host";
Connection connection=null;
Statement statement=null;
PreparedStatement pstmt=null;
//ResultSet rs=null;
try{
connection=DBConnection.getDbConnection();
int userid = (Integer) session.getAttribute("ownerid");
//String query = "select * from registration where email="+em1;
String query = "select * from registration where id="+userid;

      pstmt = connection.prepareStatement(query); // create a statement
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
       <td><%=rs.getString("password") %></td>
    <td><%=rs.getString("mobile") %></td>
     <td><%=rs.getString("address") %></td>
      <td><%=rs.getString("dob") %></td>
    <td><%=rs.getString("gender") %></td>
      <td><%=rs.getString("usertype") %></td>
     

  </tr>
  <% } } catch(Exception e) { e.printStackTrace();}


}}%>
  
  
  
</table></center>
        


          
          <!-- <figure class="">
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d24214.807650104907!2d-73.94846048422478!3d40.65521573400813!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sus!4v1395650655094" style="border:0"></iframe>
          </figure>-->
        </div>
      </div>
      
      
    </div>
  </div>
</section>

<!--==============================
              footer
=================================-->

<a href="#" id="toTop" class="fa fa-chevron-up"></a>
</div>
</body>

</html>

