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
import javax.servlet.http.Part;


@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class RegisterServlet extends HttpServlet {
     
    // database connection settings
   // private String dbURL = "jdbc:mysql://localhost:3306/AppDB";
  //  private String dbUser = "root";
  //  private String dbPass = "root";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
    		String uname=request.getParameter("uname");  
            String oname=request.getParameter("oname");  
             
            String email=request.getParameter("email"); 
            String pwd=request.getParameter("pwd"); 
            String mob=request.getParameter("mob");  
            String address=request.getParameter("address"); 
            
                  String dob=request.getParameter("dob");  
            String gender=request.getParameter("gender");  
            String uertype=request.getParameter("uertype"); 
            
      
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            
         conn= DBConnection.getDbConnection();
           // DriverManager.registerDriver(new com.mysql.jdbc.Driver());
          //  conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
           
         
         
         
         String sql = "INSERT INTO registration(firstname,lastname,email,password,mobile,address,dob,gender,usertype)  values (?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, uname);
            statement.setString(2, oname);
            statement.setString(4, pwd);
            statement.setString(3, email);
            statement.setString(5, mob);	   
            statement.setString(6, address);
            statement.setString(7, dob);
            statement.setString(8, gender);
            statement.setString(9, uertype);
            
            
           
             
            

            
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                
                           request.setAttribute("success", "Registration done successfully");
                  
                          if("host".equals(uertype))
                          {
                           
                           RequestDispatcher rd = request.getRequestDispatcher("/Host-login.jsp");
                          rd.forward(request, response); 
                          }
                          else
                          {
                            RequestDispatcher rd1 = request.getRequestDispatcher("/User-login.jsp");
                            rd1.forward(request, response); 
                          }
                          
                           
                        //   rd.forward(request, response); 
                
            }
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
    }
}