/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.keyupdate.Admin;

import com.keyupdate.conn.DBConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author IBN5
 */
public class AdminLoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String uname=request.getParameter("username");
            String pass=request.getParameter("password");
            
          Connection con= DBConnection.getDbConnection();
        
          Statement st=con.createStatement();
          ResultSet rt=st.executeQuery("select * from admin where username='"+uname+"' and password='"+pass+"'");
          if(rt.next()){
           
            HttpSession user=request.getSession(true);
               String loggeduser="admin";
                      user.setAttribute("loggedusrname", uname);
                       user.setAttribute("usertype", loggeduser);
                      response.sendRedirect("Admin-home.jsp");
                  }
                  else{
              
            //  String sql="select * from admin where username='"+uname+"' and password='"+pass+"'";
              
            //  out.print(sql);
            //  response.sendRedirect("adminlogin.jsp?msg=failure");
                 // out.println("Invalid Details");
              
              request.setAttribute("errorMessage", "Invalid user or password");
                    RequestDispatcher rd = request.getRequestDispatcher("/Admin-login.jsp");
                    rd.forward(request, response); 
              
              
              
                  }
              }
        catch(Exception e)
        {
            e.printStackTrace();
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
