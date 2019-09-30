/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.keyupdate.owner;

import com.keyupdate.conn.DBConnection;
import com.oreilly.servlet.*;
import java.sql.*;
import java.lang.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
 import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;
 import java.sql.*;
 import java.security.*;
import javax.crypto.*;





import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mallesh
 */
@WebServlet(name = "NewFileUpload", urlPatterns = {"/NewFileUpload"})
@MultipartConfig
public class NewFileUpload extends HttpServlet {


   
        private String filePath;
   

        String fname=null;
    
        String uploaddate=null;
     
        String paramname=null;
   
   

    @Override
    public void init( ){
      // Get the file location where it would be stored.
      filePath = "D:\\upload";
            // getServletContext().getInitParameter("file-upload");
   } 
    
    
    
    
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
         MultipartRequest multi = new MultipartRequest(request, filePath,100 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				
				
				if(paramname.equalsIgnoreCase("fname"))
				{
					fname=multi.getParameter(paramname);
                                        System.out.println("fname:"+ fname);
				}
                                
                              if(paramname.equalsIgnoreCase("uploaddate"))
				{
					uploaddate=multi.getParameter(paramname);
                                        System.out.println("uploaddate:"+ uploaddate);
				}       
				
                        }
        
 
	
			
  HttpSession session55 = request.getSession(true);
             
                  int ownerId = (Integer) session55.getAttribute("ownerid");
                        
          
                 String owneremail=(String)session55.getAttribute("owneremail");
                 
                     Calendar calendar = Calendar.getInstance();
    java.sql.Timestamp ourJavaDateObject = new java.sql.Timestamp(calendar.getTime().getTime());
   
     
                 
                 
                 
                 

 String saveFile="";

String contentType = request.getContentType();
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while(totalBytesRead < formDataLength){
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
File ff = new File(saveFile);
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
String filesize=null;


FileInputStream fis;
File f = new File(saveFile);
String filename=f.getName();
fis = new FileInputStream(f);
double bytes = file.length();
filesize=Double.toString(bytes);
long llll = Math.round(bytes);
Connection con = null;
PreparedStatement ps = null;



                
 String query = "INSERT INTO uploadfile (filename, filesize, filetype,filecontent,uploaddate,secretkey,filedate,owner_id,owner_email,ownerfilename)"
 + " values (?,?,?,?,?,?,?,?,?,?)";




String extension = "";

int i = filename.lastIndexOf('.');
if (i > 0) {
    extension = filename.substring(i+1);
}
try{
con = DBConnection.getDbConnection();
ps  = con.prepareStatement(query);
ps.setString(1,filename);
ps.setString(2, llll+" Bytes");

ps.setString(3, extension);

ps.setBinaryStream(4, (InputStream)fis, (int)(f.length()));
  ps.setString(5, uploaddate);
  
  Random rand = new Random();
int max=1000000;
int min=10;
int randomNum = rand.nextInt((max - min) + 1) + min;

String s=String.valueOf(randomNum);
String secretkey="B@ES" + s;
            
  ps.setString(6, secretkey); 
  
     ps.setTimestamp(7, ourJavaDateObject);
        ps.setInt(8, ownerId);
            
    ps.setString(9, owneremail);
   ps.setString(10, fname);

int no = ps.executeUpdate();

if (no > 0) {
                
                           request.setAttribute("success", "File Uploaded successfully");
                    RequestDispatcher rd = request.getRequestDispatcher("/ownerupload.jsp");
                    rd.forward(request, response); 
                
            }
else{
request.setAttribute("success", "File Uploaded Failed");
                    RequestDispatcher rd = request.getRequestDispatcher("/ownerupload.jsp");
                    rd.forward(request, response); 
}
}catch(Exception e){
    System.out.println("Error:"+e.getMessage());
}
finally{
try{
ps.close();
con.close();
}catch(Exception e1){
System.out.println("Error while closing");
}
}
}
        
        
            
            
            
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
