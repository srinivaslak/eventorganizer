<!DOCTYPE html>
<%@page import="com.keyupdate.conn.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
             <li  ><a href="Host-profile.jsp">View-Profile</a></li>
             <li  class="current"><a href="Host-eventcreation.jsp">Create-Event</a></li>
             
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
          <h4 align="center">Welcome - <font color="red"><% out.print((String)session.getAttribute("nameofowner"));}} %></font> <br> </h2>
     <h4 align="center">Event Creation Page</h4>
   <center><h4><font color="green"><%
    if(null!=request.getAttribute("success"))
    {
        out.println(request.getAttribute("success"));
    }
%> </font>
 <font color="red"><%
    if(null!=request.getAttribute("errorMessage"))
    {
        out.println(request.getAttribute("errorMessage"));
    }
%></font>
</h4></center>
        <hr>
      
    
        
<form action="UploadFile" method="post" enctype="multipart/form-data">
     <center>   <table align="center" border="0">
            <tr>
                <td>Event Name:</td><td><Input type="text" name="eventname" required></td></tr>
                 <tr> <td>Event Place: </td><td> <Input type="text" name="eventplace" required></td></tr>
            <tr> <td>EventType: </td>
           <td> <select name="eventtype">
            <option value="marriage">Marriage</option>
            <option value="reception">Reception</option>
             <option value="birthday">Birthday</option>
            <option value="gettogether">GetToGether</option>
            </select></td>
           <tr>  
                <td> Price:</td><td><Input type="number" name="price" required></td></tr>
            
               <tr> <td>Event Date:</td><td><Input type="date" name="eventdate" required></td></tr>
            
                
                 <tr><td>VenueName:</td><td><!-- <Input type="text" name="hosteventname" required> -->
                 <%
                 Connection con=null;
                 Statement statement=null;
                 PreparedStatement pstmt=null;
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
//Connection connection = 
      //   DriverManager.getConnection
      DriverManager.registerDriver(new com.mysql.jdbc.Driver());
         //   ("jdbc:mysql://localhost/city?user=root&password=root");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root","root");
      // statement = connection.createStatement() ;
       pstmt = con.prepareStatement("select * from venue"); 
       ResultSet rs = pstmt.executeQuery();
     // Resultset resultset =statement.executeQuery("select * from venue") ;
%>
                
				 <select name="hosteventname">
        <%  while(rs.next()){ %>
            <option><%= rs.getString(2)%></option>
        <% } %>
        </select>
				
			</select>
                 
              <%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>

                 
                 
                 
                 
                 </td></tr>
            </table>
         
           </center>
         <center>   <table><tr><td><input type="submit" name="submit" value="AddEvent" >&nbsp;&nbsp;&nbsp;&nbsp;
                 <input type="reset" name="submit" value="Reset"></td></tr>
        <!--  <tr><td><button class="button button2"><a href="Host-login.jsp"> If u are registered please click here to Login</a></button></td> </tr>
        --> </table></center>
</form>
        


          
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

