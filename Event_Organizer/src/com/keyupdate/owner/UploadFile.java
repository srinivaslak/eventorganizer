package com.keyupdate.owner;

import com.keyupdate.conn.DBConnection;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Random;
import javax.servlet.RequestDispatcher;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class UploadFile extends HttpServlet {
     
    // database connection settings
   // private String dbURL = "jdbc:mysql://localhost:3306/AppDB";
  //  private String dbUser = "root";
  //  private String dbPass = "root";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session=request.getSession();
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
   
 
 
 
 String sql = "INSERT INTO event(eventname,eventplace,eventtype,price,eventdate,venue_name,host_id,host_email) values (?,?,?,?,?,?,?,?)";
    PreparedStatement statement = conn.prepareStatement(sql);
    statement.setString(1, a);
    statement.setString(2, b);
    statement.setString(3, c);
    statement.setString(4, d);
    statement.setString(5, e);	   
    statement.setString(6, h);
    statement.setInt(7, f);
    statement.setString(8, g);
  
    
    // sends the statement to the database server
    int row = statement.executeUpdate();
    if (row > 0) {
        
                   request.setAttribute("success", "Event Created successfully");
          
                                   
                   RequestDispatcher rd = request.getRequestDispatcher("/Host-eventcreation.jsp");
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
