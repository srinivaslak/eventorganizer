package com.keyupdate.owner;

import com.keyupdate.conn.DBConnection;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class EventCreation
 */
@WebServlet(name = "EventCreation", urlPatterns = {"/EventCreation"})

public class EventCreation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String f = (String) session.getAttribute("ownerid");
		String g=(String)session.getAttribute("loggedusrname");
	String a=request.getParameter("eventname");  
    String b=request.getParameter("eventplace");  
     
    String c=request.getParameter("eventtype"); 
    String d=request.getParameter("price"); 
    String e=request.getParameter("eventdate");  
   // String f=request.getParameter("address"); 
    String h=request.getParameter("hosteventname");  
       //   String dob=request.getParameter("dob");  
   // String gender=request.getParameter("gender");  
  //  String uertype=request.getParameter("uertype"); 
    

 
Connection conn = null; // connection to the database
String message = null;  // message will be sent back to client
 
try {
    // connects to the database
    
 conn= DBConnection.getDbConnection();
   // DriverManager.registerDriver(new com.mysql.jdbc.Driver());
  //  conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

    // constructs SQL statement
   
 
 
 
 String sql = "INSERT INTO event values (?,?,?,?,?,?,?,?)";
    PreparedStatement statement = conn.prepareStatement(sql);
    statement.setString(1, a);
    statement.setString(2, b);
    statement.setString(3, c);
    statement.setString(4, d);
    statement.setString(5, e);	   
    statement.setString(6, f);
    statement.setString(7, g);
    statement.setString(8, h);
   // statement.setString(9, i);
    
    // sends the statement to the database server
    int row = statement.executeUpdate();
    if (row > 0) {
        
                   request.setAttribute("success", "Event Created successfully successfully");
          
                                   
                   RequestDispatcher rd = request.getRequestDispatcher("/Host-Viewevents.jsp");
                  rd.forward(request, response); 
                 
                                 }
                  
                   
                //   rd.forward(request, response); 
        
    
} catch (SQLException ex) {
    message = "ERROR: " + ex.getMessage();
    ex.printStackTrace();
} finally {
    if (conn != null) {
        // closes the database connection
        try {
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
       }

}}
