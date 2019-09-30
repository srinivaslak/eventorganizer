<!DOCTYPE html>
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
    <div class="row">
      <div class="page1_block">
        <div class="grid_6">
          <img src="images/page1_img1.jpg"  alt="">
        </div>
        <div class="grid_6">
          <h4 align="center">Welcome Admin <br> </h2>
          <div class="row">
            <div class="grid_3">
              <img src="images/page1_img2.jpg" alt="">
            </div>
            <div class="grid_3">
              <img src="images/page1_img3.jpg" alt="">
            </div>
          </div>
        </div>
      </div>
      <div class="clear"></div>
      <div class="grid_10 preffix_1">
        <div class="block1">
          <div class="block1_title">
           <span> Online EVENT Planning System IS a web based project which act AS a bridge BETWEEN users AND EVENT planners. AS people spend lots of money AND TIME FOR booking EVENTS, Parties AND Weddings AND ANY other functions.

BY this application the TIME of the USER reduces because they can access ANY information related TO EVENT Address/venue/Hall. FROM the remote place.

So that we are trying TO make a web project that includes ALL the planning’s FOR the food, venues, invitation cards, Photography AND ALL EVENT related things can be done ON time. This project IS developed TO make the users comfortable TO enjoy EACH AND EVERY FUNCTION along WITH their family, friends,relatives AND colleagues..</span>
          </div>
          <a href="#" class="btn">View Portfolio</a>
        </div>
      </div>
      
    </div>
  </div>
 
 </section>

<!--==============================
              footer
=================================-->
<footer id="footer">
  <div class="container">
    <div class="row">
      <div class="grid_12"> 
        <div class="copyright"><a href="#" class="f_logo"><img src="images/f_logo.png" alt=""></a> &copy; <span id="copyright-year"></span> | <a href="#">Privacy Policy</a>
          <div class="sub_copyright">
            Website designed by <a href="" rel="nofollow">event_planner.com</a>
          </div>
        </div>
      </div>
    </div>

  </div>  
</footer>
<a href="#" id="toTop" class="fa fa-chevron-up"></a>
</div>
</body>

</html>

