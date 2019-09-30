/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.keyupdate.User;

import com.keyupdate.conn.DBConnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
public class DownloadServletFile extends HttpServlet {
    private int BUFFER_SIZE;

     public void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
      
         
    PrintWriter pw=response.getWriter();
    response.setContentType("text/html");
         // get upload id from URL's parameters
     String ureq=request.getParameter("ureq");
            String skey=request.getParameter("skey");
            
            
            pw.println(ureq);
           
    System.out.println(ureq+"...................................."+skey);
         
        try {
            // connects to the database
              Connection con= DBConnection.getDbConnection();
            // queries the database
            String sql = "SELECT * FROM uploadfile WHERE filename = ? AND secretkey = ?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, ureq);
  statement.setString(2, skey);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                
                System.out.println("come into rs.next()");
                // gets file name and file blob data
                String fileName = result.getString("filetype");
                Blob blob = result.getBlob("filecontent");
                InputStream inputStream = blob.getBinaryStream();
                int fileLength = inputStream.available();
                 
                System.out.println("fileLength = " + fileLength);
 
                ServletContext context = getServletContext();
 
                // sets MIME type for the file download
                String mimeType = context.getMimeType(fileName);
                if (mimeType == null) {        
                    mimeType = "application/octet-stream";
                }              
                 
                // set content properties and header attributes for the response
                response.setContentType(mimeType);
                response.setContentLength(fileLength);
                String headerKey = "Content-Disposition";
                String headerValue = String.format("attachment; filename=\"%s\"", fileName);
                response.setHeader(headerKey, headerValue);
 
                // writes the file to the client
                OutputStream outStream = response.getOutputStream();
                 
                byte[] buffer = new byte[BUFFER_SIZE];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }
                 
                inputStream.close();
                outStream.close();             
            } else {
                // no file found
                response.getWriter().print("File not found for the id: " +ureq );  
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.getWriter().print("SQL Error: " + ex.getMessage());
        } catch (IOException ex) {
            ex.printStackTrace();
            response.getWriter().print("IO Error: " + ex.getMessage());
        } finally {
                    
        }
    }
    
        
   }
