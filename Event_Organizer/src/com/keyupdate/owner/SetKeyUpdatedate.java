package com.keyupdate.owner;

import com.keyupdate.conn.DBConnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class SetKeyUpdatedate extends HttpServlet {
     
    // database connection settings
   // private String dbURL = "jdbc:mysql://localhost:3306/AppDB";
  //  private String dbUser = "root";
  //  private String dbPass = "root";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        
        
        
       PrintWriter pw=response.getWriter();
       response.setContentType("text/html");
        
   String updatedate=request.getParameter("updatedate");  
           
   int  fileid=Integer.parseInt(request.getParameter("filename")); 
   
   
   //pw.print(fileid);
  // pw.print(updatedate);
          
   HttpSession session = request.getSession(true);
           
 //  int userid = (Integer) session.getAttribute("ownerid");
            

//pw.println(fileid);
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
   
         conn= DBConnection.getDbConnection();
           // DriverManager.registerDriver(new com.mysql.jdbc.Driver());
          //  conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
           
       String sql = "UPDATE uploadfile SET  uploaddate= ? "
				                  + " WHERE file_id = ?";
        // pw.print(sql); 
       System.out.println(sql);
        try {
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1, updatedate);
            ps.setInt(2, fileid);
           
            int res=ps.executeUpdate();
            if(res>0)
            {
              request.setAttribute("success", "Updation done successfully");
                    RequestDispatcher rd = request.getRequestDispatcher("/ownerkeyupdation.jsp");
                    rd.forward(request, response); 
            }
            
        }
        catch (SQLException ex) {
      ex.printStackTrace();
        }
       
       
       
       
       
      
    }
}