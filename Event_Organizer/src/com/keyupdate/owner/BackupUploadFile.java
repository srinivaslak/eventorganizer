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


public class BackupUploadFile extends HttpServlet {
     
    // database connection settings
   // private String dbURL = "jdbc:mysql://localhost:3306/AppDB";
  //  private String dbUser = "root";
  //  private String dbPass = "root";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
         String filesize=null;
         String filetype=null;
   String fname=request.getParameter("fname");  
            String uploaddate=request.getParameter("uploaddate");  
       
            
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("myfile");
        if (filePart != null) {
            // prints out some information for debugging
          
            System.out.println("mallesh is..."+filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            
            String filename=filePart.getName();
            
           float filesizeis=filePart.getSize();
          filesize = String.valueOf(filesizeis);
           
            filetype=filePart.getContentType();
           
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            
         conn= DBConnection.getDbConnection();
           // DriverManager.registerDriver(new com.mysql.jdbc.Driver());
          //  conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
           

                 
 String sql = "INSERT INTO uploadfile (filename, filesize, filetype,filecontent,uploaddate,secretkey,filedate,owner_id,owner_email) values (?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, fname);
            statement.setString(2, filesize);
            
               statement.setString(3, filetype);
               
              if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(4, inputStream);
            } 
               
            statement.setString(5, uploaddate);
            
            Random rand = new Random();
int max=1000000;
int min=10;
int randomNum = rand.nextInt((max - min) + 1) + min;

String s=String.valueOf(randomNum);
String secretkey="B@ES" + s;
            
             statement.setString(6, secretkey); 
             
            // (2) create a java sql date object we want to insert
   // Calendar calendar = Calendar.getInstance();
   // java.sql.Date ourJavaDateObject = new java.sql.Date(calendar.getTime().getTime()); 
           
    
    // (2) create a java timestamp object that represents the current time (i.e., a "current timestamp")
    Calendar calendar = Calendar.getInstance();
    java.sql.Timestamp ourJavaDateObject = new java.sql.Timestamp(calendar.getTime().getTime());
   
  
                 statement.setTimestamp(7, ourJavaDateObject);
                 
             
                       
             HttpSession session = request.getSession(true);
             
                  int ownerId = (Integer) session.getAttribute("ownerid");
            // out.println("Owner ID is..."+userid);
           //out.print("email id is..."+(String)session.getAttribute("owneremail"));                   
          
                 String owneremail=(String)session.getAttribute("owneremail");
                 
       
          statement.setInt(8, ownerId);
            
    statement.setString(9, owneremail);
            
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                
                           request.setAttribute("success", "File Uploaded successfully");
                    RequestDispatcher rd = request.getRequestDispatcher("/ownerupload.jsp");
                    rd.forward(request, response); 
                
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