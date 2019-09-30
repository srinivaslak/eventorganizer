<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.keyupdate.conn.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
HttpSession session1=request.getSession();
int f1 = (Integer) session.getAttribute("ownerid");
int f = (Integer) session.getAttribute("ownerid");
String g=(String)session.getAttribute("loggedusrname");
	System.out.println(g);
	System.out.println(f);
	String a=request.getParameter("eventname");  
	String b=request.getParameter("eventplace");  

	String c=request.getParameter("eventtype"); 
	String d=request.getParameter("price"); 
	String e=request.getParameter("eventdate");  

	String h=request.getParameter("hosteventname");  




Connection conn = null; // connection to the database
String message = null;  // message will be sent back to client

try {
// connects to the database

conn= DBConnection.getDbConnection();
// DriverManager.registerDriver(new com.mysql.jdbc.Driver());
//  conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

// constructs SQL statement




String sql = "INSERT INTO event(eventname,eventplace,eventtype,price,eventdate,host_id,host_email,hosteventname) values (?,?,?,?,?,?,?,?)";
PreparedStatement statement = conn.prepareStatement(sql);
statement.setString(1, a);
statement.setString(2, b);
statement.setString(3, c);
statement.setString(4, d);
statement.setString(5, e);	   
statement.setInt(6, f);
statement.setString(7, g);
statement.setString(8, h);


// sends the statement to the database server
int row = statement.executeUpdate();
if (row > 0) {

           request.setAttribute("success", "Event Created successfully");
  
                           
           RequestDispatcher rd = request.getRequestDispatcher("/Host-eventcreation.jsp");
          rd.forward(request, response); 
         
                         }
          
           
        //   rd.forward(request, response); 


} catch (Exception ex) {
message = "ERROR: " + ex.getMessage();
ex.printStackTrace();
} finally {
if (conn != null) {
// closes the database connection
try {
    conn.close();
} catch (Exception ex) {
    ex.printStackTrace();
}
}
}
 
%>
<% 
		 HttpSession user=request.getSession(true);
		String sid=request.getParameter("id");
		int id=Integer.parseInt(sid);
		//EmpDao.delete(id);
		
out.println("<h3 align='center'>Venue List</h3>");
		
		//List<Emp> list=EmpDao.getAllEmployees();
		
		out.print("<center><table border='1' width='80%'>");
		out.print("<tr><th>Venue_ID</th><th>Venue_Name</th><th>Venue_Location</th><th>Venue_Capacity</th><th>Venue_Type</th><th>Edit</th><th>Delete</th></tr>");
		//for(Emp e:list){
			//out.print("<tr><td>"+e.getId()+"</td><td>"+e.getName()+"</td><td>"+e.getPassword()+"</td><td>"+e.getEmail()+"</td><td>"+e.getCountry()+"</td><td><a href='Edit.jsp?id="+e.getId()+"'>edit</a></td><td><a href='DeleteServlet?id="+e.getId()+"'>delete</a></td></tr>");
		//}
		out.print("</center></table>");
		request.setAttribute("errorMessage", "Event Deleted SuccessFully");
		response.sendRedirect("Admin-Addevent.jsp");
		%>
		