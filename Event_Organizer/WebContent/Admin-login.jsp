<!DOCTYPE html>
<html lang="en">
<head>
<title>About</title>
<meta charset="utf-8">
<meta name = "format-detection" content = "telephone=no" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
 <link href="css/new.css" rel="stylesheet" type="text/css"> 
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/script.js"></script> 
<script src="js/superfish.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/tmStickUp.js"></script>
<script src="js/jquery.ui.totop.js"></script>

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
             <li class="current"><a href="Admin-login.jsp">Admin</a></li>
             <li><a href="Host-login.jsp">Host</a></li>
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
<div id="wrapper"> 

 

  <div id="page_content">

 
    <div class="left_side_bar"> 

    <%--@ include file="leftmenu.jsp" --%> 

   

    </div>

    <div class="right_section">
      <div class="common_content">
        <h2 >Admin Login Page</h2>
        <hr>
        <p>
        <form action="AdminLoginServlet" method="post">      
<table width="345" border="0" bgcolor="#99CC00">
 
    
 <%
    if(null!=request.getAttribute("errorMessage"))
    {
        out.println(request.getAttribute("errorMessage"));
    }
%>
<tr>
 
<th height="34">Enter your username</th>
 
<td><input type="text" name="username" required/></td>
 
</tr>
 
<tr>
 
<th height="33">Enter your passowrd</th>
 
<td><input type="password" name="password" required/></td>
 
</tr>
 
<tr>
 
<th height="39" colspan="2"><input type="submit" value="SignIn"/>
 

 
</tr>
 
</table>
        </form>
            
      
        </div>
      
    </div>

<!--==============================
              footer
=================================-->
<footer id="footer">
  <div class="container">
    <div class="row">
      <div class="grid_12"> 
        <div class="copyright"><a href="#" class="f_logo">
           
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

