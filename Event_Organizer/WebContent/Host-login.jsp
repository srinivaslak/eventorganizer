<!DOCTYPE html>
<html lang="en">
<head>
<title>About</title>
<meta charset="utf-8">
<meta name = "format-detection" content = "telephone=no" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
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
             <li><a href="index.html">Home</a></li>
             <li ><a href="Admin-login.jsp">Admin</a></li>
             <li class="current"><a href="Host-login.jsp">Host</a></li>
             <li><a href="User-login.jsp">User</a></li>
             <li><a href="Events.jsp">Events</a></li>
             
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
<section id="content"><div class="ic">by LVS 2019</div>
  <div class="container">
  <div class="row">
  <div class="offset-md-2 col-md-8">
   <h2 align="center">Host Login Page</h2>
        <hr>
        <p>
        
<form action="Ownerlogincheck" method="post">
      <center>  <table align="center" border="0">
            
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
%>
            
            <tr>
                <td> User Email:</td><td><Input type="text" name="username" required/></td></tr>
            <tr> <td>Password: </td><td> <Input type="password" name="password" required></td></tr></table>
           
            <table><tr><td><input type="submit" name="submit" value="Login" class="btn1">&nbsp;&nbsp;&nbsp;&nbsp;
                 <input type="reset" name="submit" value="Reset" class="btn2"></td></tr>
         <tr><td><button class="btn1"><a href="HRegister.jsp"> If u r not registered please click here to Register</a></button></td> </tr>
        </table></center>
        
</form>
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
            Website designed by <a href="" rel="nofollow">Master.com</a>
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

